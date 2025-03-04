import { NextApiRequest, NextApiResponse } from 'next'
import { prisma } from '@/lib/prisma'
import { Prerequisites } from '@/app/components/coursetypes'

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
    prerequisites: Prerequisites
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
    return res.status(400).json({ error: 'At least one of quarter or subject is a required query parameter' })
  }

  // Build where clause based on provided parameters
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const whereClause: any = {}
  
  if (quarter && typeof quarter === 'string') {
    // Quarter format is YYYYQ where Q is the quarter number
    if (quarter.length !== 5) {
      return res.status(400).json({ error: 'Quarter must be in YYYYQ format (e.g. 20241)' });
    }

    const year = quarter.slice(0, 4);
    const quarterNum = quarter.slice(4);

    // Find courses that have offerings in the specified quarter and year
    return await prisma.course.findMany({
      where: {
        offerings: {
          some: {
            quarter: quarterNum,
            year: year
          }
        },
        ...(subject && typeof subject === 'string' ? { subject_area: subject } : {})
      },
      orderBy: {
        id: 'asc'
      }
    }).then(data => {
      const courses = data.map(course => ({
        ...course,
        general_ed: Array.isArray(course.general_ed) ? course.general_ed as string[] : [],
        prerequisites: course.prerequisites as unknown as Prerequisites,
        unlocks: Array.isArray(course.unlocks) ? course.unlocks as number[] : [],
      }));
      res.json({ courses });
    }).catch(error => {
      console.error('Error querying courses:', error);
      res.status(500).json({ error: 'Failed to query courses' });
    });
  }
  
  if (subject && typeof subject === 'string') {
    whereClause.subject_area = subject
  }

  try {
    const data = await prisma.course.findMany({
      where: whereClause,
      orderBy: {
        id: 'asc'
      }
    })

    const courses = data.map(course => ({
      ...course,
      general_ed: Array.isArray(course.general_ed) ? course.general_ed as string[] : [],
      prerequisites: course.prerequisites as unknown as Prerequisites,
      unlocks: Array.isArray(course.unlocks) ? course.unlocks as number[] : [],
    }));

    res.json({ courses })
  } catch (error) {
    console.error('Error querying courses:', error)
    res.status(500).json({ error: 'Failed to query courses' })
  }
}
