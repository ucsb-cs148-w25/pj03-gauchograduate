import { NextApiRequest, NextApiResponse } from 'next'
import { prisma } from '@/lib/prisma'

type ResponseData = {
  error?: string
  courses?: {
    id: number
    quarter: string
    course_id: string
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
  if (req.method !== 'GET') {
    return res.status(405).json({ error: 'Method not allowed' })
  }

  const { quarter, subject } = req.query

  // We want to prevent large blank queries that will slow down the database
  if (!quarter && !subject) {
    return res.status(400).json({ error: 'At least one of quarter or subject is required' })
  }

  // Build where clause based on provided parameters
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const whereClause: any = {}
  
  if (quarter && typeof quarter === 'string') {
    whereClause.quarter = quarter
  }
  
  if (subject && typeof subject === 'string') {
    whereClause.subject_area = subject
  }

  try {
    const data = await prisma.course.findMany({
      where: whereClause,
      orderBy: {
        course_id: 'asc'
      }
    })

    const courses = data.map(course => ({
      ...course,
      general_ed: Array.isArray(course.general_ed) ? course.general_ed as string[] : [],
      prerequisites: Array.isArray(course.prerequisites) ? course.prerequisites as number[] : [],
      unlocks: Array.isArray(course.unlocks) ? course.unlocks as number[] : [],
    }));

    res.json({ courses })
  } catch (error) {
    console.error('Error querying courses:', error)
    res.status(500).json({ error: 'Failed to query courses' })
  }
}
