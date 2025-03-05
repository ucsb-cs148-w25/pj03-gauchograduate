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

  if (!override || typeof override !== 'object' || !override.type || !override.requirement) {
    return res.status(400).json({ error: "Valid override object is required with type and requirement fields" })
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
    
    // Check if overrides array exists
    if (!userCourses.overrides || !Array.isArray(userCourses.overrides)) {
      userCourses.overrides = []
      return res.status(400).json({ error: "No overrides found" })
    }
    
    // Find the override to remove by matching all properties
    const initialLength = userCourses.overrides.length;
    let removed = false;
    userCourses.overrides = userCourses.overrides.filter(existingOverride => {
      // If we've already removed one, don't remove any others.
      if (removed) return true;

      // Check if all properties match
      if (existingOverride.type !== override.type) return true;
      if (existingOverride.requirement !== override.requirement) return true;
      
      // For courseId, only compare if both have it or neither has it
      if (override.courseId !== undefined && existingOverride.courseId !== undefined) {
        if (!(existingOverride.courseId !== override.courseId)) removed = true;
        return !removed;
      } else if (override.courseId === undefined && existingOverride.courseId === undefined) {
        removed = true;
        return false; // They match (both don't have courseId)
      }
      
      return true; // Keep this override (no match)
    });
    
    // Check if any override was removed
    if (userCourses.overrides.length === initialLength) {
      return res.status(404).json({ error: "No matching override found" })
    }
    // Only ever allow for one removal per request
    if (initialLength - userCourses.overrides.length != 1) {
      return res.status(500).json({ error: "Only one override can be removed per request, but multiple were. Removal cancelled." })
    }

    // Update the user's courses - convert to JSON string and then parse to ensure proper format
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
    console.error('Error removing override:', error)
    res.status(500).json({ error: "Failed to remove override" })
  }
}
