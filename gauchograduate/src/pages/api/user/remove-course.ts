import { getServerSession } from "next-auth/next"
import { authOptions } from "../auth/[...nextauth]"
import { prisma } from "@/lib/prisma"
import type { NextApiRequest, NextApiResponse } from 'next'
import { MajorOverride } from "@/types/next-auth"

type ResponseData = {
  error?: string
  courses?: {
    id: string;
    quarter: string;
  }[]
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

  const { id, quarter } = req.body

  if (!id || !quarter || typeof id !== 'number' || typeof quarter !== 'string') {
    return res.status(400).json({ error: "Course ID (number) and quarter (string) are required and must be of the appropriate type" })
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
      overrides?: MajorOverride[];
    }
    
    // Check if course exists in the user's list
    const courseExists = userCourses.courses.some(course => course.id === id && course.quarter === quarter)
    
    if (!courseExists) {
      return res.status(400).json({ error: "Course not found in user's course list" })
    }

    // Remove the course while preserving overrides
    const updatedCourses = {
      firstQuarter: userCourses.firstQuarter,
      courses: userCourses.courses.filter(
        course => !(course.id === id && course.quarter === quarter)
      ),
      overrides: userCourses.overrides || [] // Preserve existing overrides
    }

    // Update the user's courses - convert to JSON string and then parse to ensure proper format
    const updatedUser = await prisma.user.update({
      where: { id: session.user.id },
      data: {
        courses: JSON.parse(JSON.stringify(updatedCourses))
      },
      select: {
        courses: true
      }
    })

    res.json({ courses: updatedUser.courses as unknown as { id: string; quarter: string }[] })
  } catch (error) {
    console.error('Error removing course:', error)
    res.status(500).json({ error: "Failed to remove course" })
  }
}
