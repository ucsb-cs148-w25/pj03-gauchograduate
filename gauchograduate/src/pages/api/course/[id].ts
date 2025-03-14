import { NextApiRequest, NextApiResponse } from 'next'
import { prisma } from '@/lib/prisma'
import { PrerequisiteNode } from '@/app/components/coursetypes'

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
    prerequisites: PrerequisiteNode
    unlocks: number[]
    offerings: CourseOffering[]
  }
}

type CourseOffering = {
  id: number
  courseId: number
  quarter: string
  year: string
  professor?: string | null
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
      where: { id: courseId },
      include: {
        offerings: true
      }
    })

    if (!data) {
      return res.status(404).json({ error: 'Course not found' })
    }

    let prerequisites = data.prerequisites;
    if (prerequisites === null) {
      prerequisites = null;
    }

    const course = {
      id: courseId,
      gold_id: data.gold_id,
      title: data.title,
      description: data.description,
      subject_area: data.subject_area,
      units: data.units,
      general_ed: Array.isArray(data.general_ed) ? data.general_ed as string[] : [],
      prerequisites: prerequisites as unknown as PrerequisiteNode,
      unlocks: Array.isArray(data.unlocks) ? data.unlocks as number[] : [],
      offerings: data.offerings || []
    }

    res.json({ course })
  } catch (error) {
    console.error('Error fetching course:', error)
    res.status(500).json({ error: 'Failed to fetch course' })
  }
}
