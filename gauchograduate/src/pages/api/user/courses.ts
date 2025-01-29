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

    res.json({ courses: user.courses as { id: string; quarter: string }[] })
  } catch (error) {
    console.error('Error fetching user courses:', error)
    res.status(500).json({ error: "Failed to fetch user courses" })
  }
}
