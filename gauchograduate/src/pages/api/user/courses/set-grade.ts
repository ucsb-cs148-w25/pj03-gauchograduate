import { getServerSession } from "next-auth/next"
import { authOptions } from "../../auth/[...nextauth]"
import { prisma } from "@/lib/prisma"
import type { NextApiRequest, NextApiResponse } from 'next'
import { MajorOverride } from "@/types/next-auth"

type ResponseData = {
  error?: string
  success?: boolean
  courses?: {
    id: number;
    quarter: string;
    grade?: string;
  }[]
}

// Valid grade values
const VALID_GRADES = [
  "A+", "A", "A-", 
  "B+", "B", "B-", 
  "C+", "C", "C-", 
  "D+", "D", "D-", 
  "F", "P", "NP"
];

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

  const { id, quarter, grade } = req.body

  if (!id || !quarter || typeof id !== 'number' || typeof quarter !== 'string') {
    return res.status(400).json({ error: "Course ID (number) and quarter (string) are required" })
  }

  if (grade && !VALID_GRADES.includes(grade)) {
    return res.status(400).json({ error: `Invalid grade. Valid grades are: ${VALID_GRADES.join(', ')}` })
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
      courses: { id: number; quarter: string; grade?: string }[];
      overrides?: MajorOverride[];
    }
    
    // Find the course to update
    const courseIndex = userCourses.courses.findIndex(
      course => course.id === id && course.quarter === quarter
    );
    
    if (courseIndex === -1) {
      return res.status(404).json({ error: "Course not found in user's course list" })
    }

    // Update the grade
    if (grade) {
      userCourses.courses[courseIndex].grade = grade;
    } else {
      // If grade is null or undefined, remove the grade property
      delete userCourses.courses[courseIndex].grade;
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

    const updatedCourses = (updatedUser.courses as unknown as { 
      courses: { id: number; quarter: string; grade?: string }[];
    }).courses;

    res.json({ 
      success: true,
      courses: updatedCourses
    })
  } catch (error) {
    console.error('Error setting course grade:', error)
    res.status(500).json({ error: "Failed to set course grade" })
  }
}
