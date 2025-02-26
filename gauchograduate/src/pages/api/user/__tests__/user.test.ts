import { createMocks } from 'node-mocks-http';
import { getServerSession } from "next-auth/next";
import coursesHandler from '../courses';
import addCourseHandler from '../add-course';
import removeCourseHandler from '../remove-course';
import updateProfileHandler from '../update-profile';
import majorHandler from '../major';
import addOverrideHandler from '../add-override';
import removeOverrideHandler from '../remove-override';
import setGradeHandler from '../courses/set-grade';
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

  describe('POST /api/user/add-override', () => {
    it('should return 401 if not authenticated', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major', requirement: 'specific-course', courseId: 1 }
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce(null);

      await addOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(401);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Not authenticated"
      });
    });

    it('should add a major specific-course override successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major', requirement: 'specific-course', courseId: 1 }
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: []
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: [{ type: 'major', requirement: 'specific-course', courseId: 1 }]
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await addOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        overrides: updatedCourses.overrides
      });
    });

    it('should add a ge override successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'ge', requirement: 'WRT' }
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: []
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: [{ type: 'ge', requirement: 'WRT' }]
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await addOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        overrides: updatedCourses.overrides
      });
    });

    it('should add a major elective override successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major', requirement: 'elective' }
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: []
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: [{ type: 'major', requirement: 'elective' }]
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await addOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        overrides: updatedCourses.overrides
      });
    });

    it('should initialize overrides array if it does not exist', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major', requirement: 'specific-course', courseId: 1 }
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
        courses: [],
        overrides: [{ type: 'major', requirement: 'specific-course', courseId: 1 }]
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await addOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        overrides: updatedCourses.overrides
      });
    });

    it('should return 400 if override is missing required fields', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major' } // Missing requirement field
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      await addOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Override must include 'type' and 'requirement' fields"
      });
    });

    it('should return 400 if specific-course override is missing courseId', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major', requirement: 'specific-course' } // Missing courseId
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      await addOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({
        error: "courseId is required for specific-course requirements"
      });
    });
  });

  describe('POST /api/user/remove-override', () => {
    it('should return 401 if not authenticated', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major', requirement: 'specific-course', courseId: 1 }
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce(null);

      await removeOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(401);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Not authenticated"
      });
    });

    it('should remove a major specific-course override successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major', requirement: 'specific-course', courseId: 1 }
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: [{ type: 'major', requirement: 'specific-course', courseId: 1 }]
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: []
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await removeOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        overrides: updatedCourses.overrides
      });
    });

    it('should remove a ge override successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'ge', requirement: 'WRT' }
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: [{ type: 'ge', requirement: 'WRT' }]
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: []
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await removeOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        overrides: updatedCourses.overrides
      });
    });

    it('should return 404 if no matching override is found', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major', requirement: 'elective' }
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [],
        overrides: [{ type: 'ge', requirement: 'WRT' }] // Different override
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      await removeOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(404);
      expect(JSON.parse(res._getData())).toEqual({
        error: "No matching override found"
      });
    });

    it('should return 400 if override is missing required fields', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          override: { type: 'major' } // Missing requirement field
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      await removeOverrideHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Valid override object is required with type and requirement fields"
      });
    });
  });

  describe('POST /api/user/courses/set-grade', () => {
    it('should return 401 if not authenticated', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: 1,
          quarter: "20241",
          grade: "A"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce(null);

      await setGradeHandler(req, res);

      expect(res._getStatusCode()).toBe(401);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Not authenticated"
      });
    });

    it('should set a grade successfully', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: 1,
          quarter: "20241",
          grade: "A"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [{ id: 1, quarter: "20241" }],
        overrides: []
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: [{ id: 1, quarter: "20241", grade: "A" }],
        overrides: []
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await setGradeHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        success: true,
        courses: updatedCourses.courses
      });
    });

    it('should remove a grade when grade is null', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: 1,
          quarter: "20241",
          grade: null
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [{ id: 1, quarter: "20241", grade: "A" }],
        overrides: []
      };

      const updatedCourses = {
        firstQuarter: "20241",
        courses: [{ id: 1, quarter: "20241" }],
        overrides: []
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      (prisma.user.update as jest.Mock).mockResolvedValueOnce({
        courses: updatedCourses
      });

      await setGradeHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      expect(JSON.parse(res._getData())).toEqual({
        success: true,
        courses: updatedCourses.courses
      });
    });

    it('should return 400 for invalid grade', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: 1,
          quarter: "20241",
          grade: "Z" // Invalid grade
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      await setGradeHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({
        error: expect.stringContaining("Invalid grade")
      });
    });

    it('should return 404 if course not found', async () => {
      const { req, res } = createMocks({
        method: 'POST',
        body: {
          id: 999, // Non-existent course
          quarter: "20241",
          grade: "A"
        },
      });

      (getServerSession as jest.Mock).mockResolvedValueOnce({
        user: { id: '123' }
      });

      const existingCourses = {
        firstQuarter: "20241",
        courses: [{ id: 1, quarter: "20241" }],
        overrides: []
      };

      (prisma.user.findUnique as jest.Mock).mockResolvedValueOnce({
        courses: existingCourses
      });

      await setGradeHandler(req, res);

      expect(res._getStatusCode()).toBe(404);
      expect(JSON.parse(res._getData())).toEqual({
        error: "Course not found in user's course list"
      });
    });
  });
});
