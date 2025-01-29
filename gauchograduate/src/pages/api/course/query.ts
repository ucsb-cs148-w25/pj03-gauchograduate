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
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    general_ed: any
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    prerequisites: any
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    unlocks: any
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
    const courses = await prisma.course.findMany({
      where: whereClause,
      orderBy: {
        course_id: 'asc'
      }
    })

    res.json({ courses })
  } catch (error) {
    console.error('Error querying courses:', error)
    res.status(500).json({ error: 'Failed to query courses' })
  }
}
