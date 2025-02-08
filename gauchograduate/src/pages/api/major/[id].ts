import { NextApiRequest, NextApiResponse } from 'next'
import { prisma } from '@/lib/prisma'

type ResponseData = {
  error?: string
  major?: {
    id: number
    name: string
    college: string
    requirements: number[]
  }
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<ResponseData>
) {
  if (req.method !== 'GET') {
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const { id } = req.query

  if (!id || Array.isArray(id)) {
    return res.status(400).json({ error: 'Invalid major ID' })
  }

  try {
    const major = await prisma.major.findUnique({
      where: {
        id: parseInt(id)
      }
    })
    
    if (!major) {
      return res.status(404).json({ error: 'Major not found' })
    }

    res.json({ major })
  } catch (error) {
    console.error('Error fetching major:', error)
    res.status(500).json({ error: 'Failed to fetch major' })
  }
}
