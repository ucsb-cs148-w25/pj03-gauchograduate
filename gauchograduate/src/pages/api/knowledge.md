## API Endpoints

### Type Safety
Because we are using typescript, we want to make sure that endpoints follow type rules. Make sure to note the types in app/components/coursetypes.ts as well as the types in types/next-auth.d.ts.

### Testing
- Use Jest for testing API endpoints
- Tests are located in `__tests__` directories next to the files they test
- Mock Prisma client and next-auth in jest.setup.js
- Use node-mocks-http to simulate Next.js API requests
- Test both success and error cases for each endpoint
- Verify authentication checks
- Check response status codes and data structure

### User Course Endpoints
Response formats:
- GET /api/user/courses: Returns `{ firstQuarter: string, courses: Array<{id: string, quarter: string}> }`
- POST /api/user/add-course: Returns `{ courses: { firstQuarter: string, courses: Array<{id: string, quarter: string}> } }`
- POST /api/user/remove-course: Returns `{ courses: Array<{id: string, quarter: string}> }`