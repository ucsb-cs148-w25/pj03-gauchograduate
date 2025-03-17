import { getServerSession } from "next-auth/next"
import { authOptions } from "../auth/[...nextauth]"
import { prisma } from "@/lib/prisma"
import { Prisma } from "@prisma/client"
import type { NextApiRequest, NextApiResponse } from 'next'
import { UserCourses } from "@/types/next-auth"

type ResponseData = {
  error?: string
  success?: boolean
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

  const { selectedYear } = req.body

  if (typeof selectedYear !== 'string') {
    return res.status(400).json({ error: "Selected year is required and must be a string" })
  }

  try {
    // First get the current user to preserve their existing courses data
    const currentUser = await prisma.user.findUnique({
      where: { id: session.user.id },
      select: { courses: true }
    });

    if (!currentUser) {
      return res.status(404).json({ error: "User not found" });
    }

    // Parse the existing courses JSON and validate its structure
    const coursesData = currentUser.courses as unknown as UserCourses;
    
    // Update the courses data with the new selected year
    const updatedCoursesData: UserCourses = {
      ...coursesData,
      selectedYear
    };
    
    // Save the updated courses data
    await prisma.user.update({
      where: { id: session.user.id },
      data: { 
        courses: updatedCoursesData as unknown as Prisma.JsonObject
      }
    });
    
    res.json({ success: true });
  } catch (error) {
    console.error('Error saving selected year:', error);
    res.status(500).json({ error: "Failed to save selected year" });
  }
}
