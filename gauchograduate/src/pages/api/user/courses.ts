import { getServerSession } from "next-auth/next"
import { authOptions } from "../auth/[...nextauth]"
import { prisma } from "@/lib/prisma"
import type { NextApiRequest, NextApiResponse } from 'next'
import { UserCourses, MajorOverride } from "@/types/next-auth"

type ResponseData = {
  error?: string
  firstQuarter?: string
  courses?: {
    id: string;
    quarter: string;
  }[]
  overrides?: MajorOverride[]
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<ResponseData>
) {
  if (req.method !== 'GET') {
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const session = await getServerSession(req, res, authOptions)
  
  if (!session?.user?.id) {
    return res.status(401).json({ error: "Not authenticated" })
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

    // Cast to unknown first, then to UserCourses to avoid the type error
    const userCourses = user.courses as unknown as UserCourses
    res.json(userCourses)
  } catch (error) {
    console.error('Error fetching user courses:', error)
    res.status(500).json({ error: "Failed to fetch user courses" })
  }
}
