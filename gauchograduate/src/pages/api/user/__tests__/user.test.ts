import { createMocks } from 'node-mocks-http';
import { getServerSession } from "next-auth/next";
import coursesHandler from '../courses';
import addCourseHandler from '../add-course';
import removeCourseHandler from '../remove-course';
import updateProfileHandler from '../update-profile';
import majorHandler from '../major';
import { prisma } from '@/lib/prisma';

jest.mock('next-auth/next', () => ({
  getServerSession: jest.fn()
}));

describe('User API Endpoints', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe('GET /api/user/courses', () => {
    it('should return 401 if not authenticated', async () => {
      const { req, res } = createMocks({
        method: 'GET',
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce(null);

      await coursesHandler(req, res);

      expect(res._getStatusCode()).toBe(401);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Not authenticated"
      });
    });

    it('should return user courses if authenticated', async () => {
      const { req, res } = createMocks({
        method: 'GET',
      });

      const mockCourses = {
        firstQuarter: "20241",
        courses: [{ id: "CMPSC 16", quarter: "20241" }]
      };

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: mockCourses
      });

      await coursesHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual(mockCourses);
    });
  });

  describe('POST /api/user/add-course', () => {
    it('should return 401 if not authenticated', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: "CMPSC 16",
          quarter: "20241"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce(null);

      await addCourseHandler(req, res);

      expect(res._getStatusCode()).toBe(401);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Not authenticated"
      });
    });

    it('should add a course successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: 1,
          quarter: "20241"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: []
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: [{ id: 1, quarter: "20241" }]
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await addCourseHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        courses: updatedCourses
      });
    });
  });

  describe('POST /api/user/remove-course', () => {
    it('should return 401 if not authenticated', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: 1,
          quarter: "20241"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce(null);

      await removeCourseHandler(req, res);

      expect(res._getStatusCode()).toBe(401);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Not authenticated"
      });
    });

    it('should remove a course successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: 1,
          quarter: "20241"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [{ id: 1, quarter: "20241" }]
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: []
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await removeCourseHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        courses: {
          courses: [],
          firstQuarter: "20241"
        }
      });
    });
  });

  describe('POST /api/user/update-profile', () => {
    it('should return 401 if not authenticated', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          majorId: 1,
          firstQuarter: "20241"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce(null);

      await updateProfileHandler(req, res);

      expect(res._getStatusCode()).toBe(401);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Not authenticated"
      });
    });

    it('should update profile successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          majorId: 1,
          firstQuarter: "20241"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      (prisma.major.findUnique as jest.Mock).mockResolvedValueOnce({
        id: 1,
        name: "Computer Science"
      });

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: { firstQuarter: "20241", courses: [] }
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        id: '123',
        majorId: 1
      });

      await updateProfileHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        user: {
          id: '123',
          majorId: 1
        }
      });
    });
  });

  describe('GET /api/user/major', () => {
    it('should return 401 if not authenticated', async () => {
      const { req, res } = createMocks({
        method: 'GET',
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce(null);

      await majorHandler(req, res);

      expect(res._getStatusCode()).toBe(401);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Not authenticated"
      });
    });

    it('should return user major if authenticated', async () => {
      const { req, res } = createMocks({
        method: 'GET',
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const mockMajor = {
        id: 1,
        name: "Computer Science",
        college: "ENGR",
        requirements: [1, 2, 3]
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        majorId: 1,
        major: mockMajor
      });

      await majorHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        major: mockMajor
      });
    });
  });
});
