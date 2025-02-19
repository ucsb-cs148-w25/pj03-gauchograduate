import { createMocks } from 'node-mocks-http';
import courseHandler from '../[id]';
import queryHandler from '../query';
import { prisma } from '@/lib/prisma';

const mockCourse = {
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
};

describe('Course API', () => {
  describe('GET /api/course/[id]', () => {
    it('should return a course by id', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: { id: '1' },
      });

      // Mock the prisma client response
      (prisma.course.findUnique as jest.Mock).mockResolvedValueOnce(mockCourse);

      await courseHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      const jsonResponse = JSON.parse(res._getData());
      expect(jsonResponse.course).toEqual(mockCourse);
    });

    it('should return 404 for non-existent course', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: { id: '999' },
      });

      (prisma.course.findUnique as jest.Mock).mockResolvedValueOnce(null);

      await courseHandler(req, res);

      expect(res._getStatusCode()).toBe(404);
      expect(JSON.parse(res._getData())).toEqual({ error: 'Course not found' });
    });

    it('should return 400 for invalid id', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: { id: 'invalid' },
      });

      await courseHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({ error: 'Course ID must be a number' });
    });
  });

  describe('GET /api/course/query', () => {
    it('should return courses filtered by quarter', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: { quarter: '20241' },
      });

      (prisma.course.findMany as jest.Mock).mockResolvedValueOnce([mockCourse]);

      await queryHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      const jsonResponse = JSON.parse(res._getData());
      expect(jsonResponse.courses).toEqual([mockCourse]);
    });

    it('should return 400 if no filter parameters provided', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: {},
      });

      await queryHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({ 
        error: 'At least one of quarter or subject is a required query parameter' 
      });
    });

    it('should validate quarter format', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: { quarter: 'invalid' },
      });

      await queryHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({ 
        error: 'Quarter must be in YYYYQ format (e.g. 20241)' 
      });
    });
  });
});
