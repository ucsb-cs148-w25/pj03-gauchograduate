import { NextApiRequest, NextApiResponse } from 'next'
import { prisma } from '@/lib/prisma'

type ResponseData = {
  error?: string
  courses?: {
    id: number
    gold_id: string
    title: string
    description: string
    subject_area: string
    units: number | null
    general_ed: string[]
    prerequisites: number[]
    unlocks: number[]
  }[]
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<ResponseData>
) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' })
  }

  try {
    const { courseIds } = req.body

    if (!courseIds || !Array.isArray(courseIds) || courseIds.length === 0) {
      return res.status(400).json({ error: 'Request must include a non-empty array of courseIds' })
    }

    // Validate that all IDs are numbers
    const validIds = courseIds.every(id => typeof id === 'number' || (typeof id === 'string' && /^\d+$/.test(id)))
    if (!validIds) {
      return res.status(400).json({ error: 'All course IDs must be numbers' })
    }

    // Convert string IDs to numbers if needed
    const numericIds = courseIds.map(id => typeof id === 'string' ? parseInt(id, 10) : id)

    const courses = await prisma.course.findMany({
      where: {
        id: {
          in: numericIds
        }
      },
      orderBy: {
        id: 'asc'
      }
    })

    const formattedCourses = courses.map(course => ({
      ...course,
      general_ed: Array.isArray(course.general_ed) ? course.general_ed as string[] : [],
      prerequisites: Array.isArray(course.prerequisites) ? course.prerequisites as number[] : [],
      unlocks: Array.isArray(course.unlocks) ? course.unlocks as number[] : [],
    }))

    res.json({ courses: formattedCourses })
  } catch (error) {
    console.error('Error fetching courses in batch:', error)
    res.status(500).json({ error: 'Failed to fetch courses' })
  }
}
