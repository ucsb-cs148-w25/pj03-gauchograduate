import { NextApiRequest, NextApiResponse } from 'next'
import { prisma } from '@/lib/prisma'

type ResponseData = {
  error?: string
  course?: {
    id: number
    gold_id: string
    title: string
    description: string
    subject_area: string
    units: number | null
    general_ed: string[]
    prerequisites: number[]
    unlocks: number[]
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
    return res.status(400).json({ error: 'Invalid course ID' })
  }

  try {
    const courseId = parseInt(id)
    if (isNaN(courseId)) {
      return res.status(400).json({ error: 'Course ID must be a number' })
    }

    const data = await prisma.course.findUnique({
      where: { id: courseId }
    })

    if (!data) {
      return res.status(404).json({ error: 'Course not found' })
    }

    const course = {
      ...data,
      general_ed: Array.isArray(data.general_ed) ? data.general_ed as string[] : [],
      prerequisites: Array.isArray(data.prerequisites) ? data.prerequisites as number[] : [],
      unlocks: Array.isArray(data.unlocks) ? data.unlocks as number[] : [],
    }

    res.json({ course })
  } catch (error) {
    console.error('Error fetching course:', error)
    res.status(500).json({ error: 'Failed to fetch course' })
  }
}
