import { getServerSession } from "next-auth/next"
import { authOptions } from "../auth/[...nextauth]"
import { prisma } from "@/lib/prisma"
import type { NextApiRequest, NextApiResponse } from 'next'

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

  if (!id || !quarter || typeof id !== 'string' || typeof quarter !== 'string') {
    return res.status(400).json({ error: "Course ID and quarter are required and must be strings" })
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

    // Cast the JSON courses to our expected type
    const currentCourses = user.courses as { id: string; quarter: string }[]
    
    // Check if course already exists for this quarter
    if (currentCourses.some(course => course.id === id && course.quarter === quarter)) {
      return res.status(400).json({ error: "Course already exists in this quarter" })
    }

    // Add the new course
    const updatedCourses = [...currentCourses, { id, quarter }]

    // Update the user's courses
    const updatedUser = await prisma.user.update({
      where: { id: session.user.id },
      data: {
        courses: updatedCourses
      },
      select: {
        courses: true
      }
    })

    res.json({ courses: updatedUser.courses as { id: string; quarter: string }[] })
  } catch (error) {
    console.error('Error adding course:', error)
    res.status(500).json({ error: "Failed to add course" })
  }
}
