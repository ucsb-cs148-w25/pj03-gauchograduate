import { createMocks } from 'node-mocks-http';
import majorHandler from '../[id]';
import allMajorsHandler from '../all';
import { prisma } from '@/lib/prisma';

const mockMajor = {
  id: 1,
  name: 'Computer Science',
  college: 'CoE',
  requirements: [1, 2, 3, 4] // Course IDs
};

// Update jest.setup.js mock to include major operations
jest.mock('@/lib/prisma', () => ({
  prisma: {
    major: {
      findUnique: jest.fn(),
      findMany: jest.fn(),
    },
  },
}));

describe('Major API', () => {
  describe('GET /api/major/[id]', () => {
    it('should return a major by id', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: { id: '1' },
      });

      (prisma.major.findUnique as jest.Mock).mockResolvedValueOnce(mockMajor);

      await majorHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      const jsonResponse = JSON.parse(res._getData());
      expect(jsonResponse.major).toEqual(mockMajor);
    });

    it('should return 404 for non-existent major', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: { id: '999' },
      });

      (prisma.major.findUnique as jest.Mock).mockResolvedValueOnce(null);

      await majorHandler(req, res);

      expect(res._getStatusCode()).toBe(404);
      expect(JSON.parse(res._getData())).toEqual({ error: 'Major not found' });
    });

    it('should return 400 for non-numeric id', async () => {
      const { req, res } = createMocks({
        method: 'GET',
        query: { id: 'extreme' },
      });

      await majorHandler(req, res);

      expect(res._getStatusCode()).toBe(400);
      expect(JSON.parse(res._getData())).toEqual({ error: 'Major ID must be a number' });
    });
  });

  describe('GET /api/major/all', () => {
    it('should return all majors', async () => {
      const { req, res } = createMocks({
        method: 'GET',
      });

      const mockMajors = [
        { id: 1, name: 'Computer Science', college: 'College of Engineering' },
        { id: 2, name: 'Chemical Engineering', college: 'College of Engineering' }
      ];

      (prisma.major.findMany as jest.Mock).mockResolvedValueOnce(mockMajors);

      await allMajorsHandler(req, res);

      expect(res._getStatusCode()).toBe(200);
      const jsonResponse = JSON.parse(res._getData());
      expect(jsonResponse.majors).toEqual(mockMajors);
    });

    it('should handle database errors gracefully', async () => {
      const { req, res } = createMocks({
        method: 'GET',
      });

      (prisma.major.findMany as jest.Mock).mockRejectedValueOnce(new Error('Database error'));

      await allMajorsHandler(req, res);

      expect(res._getStatusCode()).toBe(500);
      expect(JSON.parse(res._getData())).toEqual({ error: 'Failed to fetch majors' });
    });

    it('should return 405 for non-GET requests', async () => {
      const { req, res } = createMocks({
        method: 'POST',
      });

      await allMajorsHandler(req, res);

      expect(res._getStatusCode()).toBe(405);
      expect(JSON.parse(res._getData())).toEqual({ error: 'Method not allowed' });
    });
  });
});
