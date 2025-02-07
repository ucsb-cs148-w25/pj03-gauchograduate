import { getServerSession } from "next-auth/next"
import { authOptions } from "../auth/[...nextauth]"
import { prisma } from "@/lib/prisma"
import type { NextApiRequest, NextApiResponse } from 'next'

type ResponseData = {
  error?: string
  user?: {
    id: string
    major: string | null
  }
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

  const { major, firstQuarter } = req.body

  if (!major || typeof major !== 'string') {
    return res.status(400).json({ error: "Major is required and must be a string" })
  }

  if (!firstQuarter || typeof firstQuarter !== 'string' || !/^\d{5}$/.test(firstQuarter)) {
    return res.status(400).json({ error: "First quarter must be a valid quarter code" })
  }

  try {
    const updatedUser = await prisma.user.update({
      where: { id: session.user.id },
      data: { 
        major,
        courses: {
          firstQuarter,
          courses: []
        }
      },
      select: {
        id: true,
        major: true
      }
    })
    res.json({ user: updatedUser })
  } catch (error) {
    console.error('Error updating user profile:', error)
    res.status(500).json({ error: "Failed to update user profile" })
  }
}
