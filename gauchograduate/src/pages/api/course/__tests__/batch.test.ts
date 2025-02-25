import { createMocks } from 'node-mocks-http';
import batchHandler from '../query/batch';
import { prisma } from '@/lib/prisma';

const mockCourses = [
  {
    id: 1,
    gold_id: 'CMPSC 16',
    title: 'Problem Solving with Computers I',
    description: 'Fundamental building blocks for solving problems using computers.',
    subject_area: 'CMPSC',
    units: 4,
    general_ed: [],
    prerequisites: [],
    unlocks: [],
    offerings: []
  },
  {
    id: 2,
    gold_id: 'CMPSC 24',
    title: 'Problem Solving with Computers II',
    description: 'Advanced problem solving.',
    subject_area: 'CMPSC',
    units: 4,
    general_ed: [],
    prerequisites: [],
    unlocks: [],
    offerings: []
  }
];

describe('Course Batch API', () => {
  describe('POST /api/course/query/batch', () => {
    it('should return multiple courses by ids', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: { courseIds: [1, 2] },
      });

      // Mock the prisma client response
      (prisma.course.findMany as jest.Mock).mockResolvedValueOnce(mockCourses);

      await batchHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      const jsonResponse = JSON.parse(res._getData());
      expect(jsonResponse.courses).toEqual(mockCourses);
    });

    it('should handle string IDs', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: { courseIds: ['1', '2'] },
      });

      (prisma.course.findMany as jest.Mock).mockResolvedValueOnce(mockCourses);

      await batchHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      const jsonResponse = JSON.parse(res._getData());
      expect(jsonResponse.courses).toEqual(mockCourses);
    });

    it('should return 400 for empty course IDs array', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: { courseIds: [] },
      });

      await batchHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({ 
        error: 'Request must include a non-empty array of courseIds' 
      });
    });

    it('should return 400 for invalid course IDs', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: { courseIds: [1, 'invalid'] },
      });

      await batchHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({ 
        error: 'All course IDs must be numbers' 
      });
    });

    it('should return 405 for non-POST methods', async () => {
      const { req, res } = createMocks({
        method: 'GET',
      });

      await batchHandler(req, res);

      expect(res._getStatusCode()).toBe(405);
      expect(JSON.parse(res._getData())).toEqual({ 
        error: 'Method not allowed' 
      });
    });
  });
});
