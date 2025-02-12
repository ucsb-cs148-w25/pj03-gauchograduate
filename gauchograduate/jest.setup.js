// Mock the prisma client
jest.mock('@/lib/prisma', () => ({
  prisma: {
    course: {
      findUnique: jest.fn(),
      findMany: jest.fn(),
    },
    major: {
      findUnique: jest.fn(),
      findMany: jest.fn(),
    },
  },
}));
