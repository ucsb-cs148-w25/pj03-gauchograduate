import { getServerSession } from "next-auth/next"
import { authOptions } from "../auth/[...nextauth]"
import { prisma } from "@/lib/prisma"
import type { NextApiRequest, NextApiResponse } from 'next'
import { MajorOverride } from "@/types/next-auth"

type ResponseData = {
  error?: string
  overrides?: MajorOverride[]
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<ResponseData>
) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const session = await getServerSession(req, res, authOptions)
  
  if (!session?.user?.id) {
    return res.status(401).json({ error: "Not authenticated" })
  }

  const override = req.body.override as MajorOverride

  if (!override || typeof override !== 'object') {
    return res.status(400).json({ error: "Override object is required" })
  }

  if (!override.type || !override.requirement) {
    return res.status(400).json({ error: "Override must include 'type' and 'requirement' fields" })
  }

  if (override.type !== 'major' && override.type !== 'ge' && override.type !== 'unit') {
    return res.status(400).json({ error: "Override type must be 'major' or 'ge' or 'unit'" })
  }

  if (override.type === 'major' && 
      override.requirement === 'specific-course' && 
      (override.courseId === undefined || typeof override.courseId !== 'number')) {
    return res.status(400).json({ error: "courseId is required for specific-course requirements" })
  }

  try {
    const user = await prisma.user.findUnique({
      where: { id: session.user.id },
      select: {
        courses: true
      }
    })
    
    if (!user) {
      return res.status(404).json({ error: "User not found" })
    }

    const userCourses = user.courses as unknown as { 
      firstQuarter: string; 
      courses: { id: number; quarter: string }[];
      overrides?: MajorOverride[] 
    }
    
    if (!userCourses.overrides) {
      userCourses.overrides = []
    }
    
    const isDuplicate = userCourses.overrides.some(existing => {
      if (existing.type !== override.type) return false;
      if (existing.requirement !== override.requirement) return false;
      
      if (override.courseId !== undefined && existing.courseId !== undefined) {
        return existing.courseId === override.courseId;
      } else if (override.courseId === undefined && existing.courseId === undefined) {
        return true;
      }
      
      return false;
    });
    
    if (isDuplicate) {
      return res.status(400).json({ error: "This override already exists" })
    }
    
    userCourses.overrides.push(override)

    const updatedUser = await prisma.user.update({
      where: { id: session.user.id },
      data: {
        courses: JSON.parse(JSON.stringify(userCourses))
      },
      select: {
        courses: true
      }
    })

    const updatedCourses = updatedUser.courses as unknown as { 
      firstQuarter: string; 
      courses: { id: number; quarter: string }[];
      overrides: MajorOverride[] 
    }

    res.json({ overrides: updatedCourses.overrides })
  } catch (error) {
    console.error('Error adding override:', error)
    res.status(500).json({ error: "Failed to add override" })
  }
}
