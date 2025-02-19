// Mock @auth/prisma-adapter
jest.mock('@auth/prisma-adapter', () => ({
  PrismaAdapter: jest.fn()
}));

// Mock next-auth
jest.mock('next-auth', () => {
  const originalModule = jest.requireActual('next-auth');
  const nextAuth = jest.fn(() => Promise.resolve({ status: 200 }));
  return {
    __esModule: true,
    ...originalModule,
    default: nextAuth
  };
});

jest.mock('next-auth/next', () => ({
  getServerSession: jest.fn()
}));

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
    user: {
      findUnique: jest.fn().mockImplementation(() => ({
        courses: {
          firstQuarter: "20241",
          courses: []
        }
      })),
      update: jest.fn().mockImplementation((args) => ({
        ...args.data,
        id: '123'
      })),
    },
  },
}));

// Suppress console.error during tests
global.console.error = jest.fn();

// Reset all mocks before each test
beforeEach(() => {
  jest.clearAllMocks();
});
