## API Endpoints

### Type Safety
Because we are using typescript, we want to make sure that endpoints follow type rules. Make sure to note the types in app/components/coursetypes.ts as well as the types in types/next-auth.d.ts.

### JSON Handling in Prisma
When working with JSON fields in Prisma:
- Always cast JSON data from Prisma as `unknown` first, then to your expected type: `data as unknown as YourType`
- When updating JSON fields, use `JSON.parse(JSON.stringify(data))` to ensure proper serialization
- This prevents type errors when working with complex nested objects in JSON fields
- When modifying nested JSON data, always preserve all existing fields (like overrides and firstQuarter) to avoid data loss

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
- POST /api/user/add-override: Returns `{ overrides: Array<any> }`
- POST /api/user/remove-override: Returns `{ overrides: Array<any> }`

### Override Endpoints
- POST /api/user/add-override: Adds a major requirement override to the user's courses
  - Request body: `{ override: object }` - The override object to add
  - Response: `{ overrides: Array<any> }` - The updated array of overrides
- POST /api/user/remove-override: Removes a major requirement override from the user's courses
  - Request body: `{ override: object }` - The override object to remove
  - Response: `{ overrides: Array<any> }` - The updated array of overrides

### E2E Testing with Playwright
- When testing OAuth flows, avoid simulating the full OAuth redirect flow
- Instead, mock the session directly using route.fulfill() with a fake session token
- Mock API responses before triggering UI interactions
- Test the main user flows: authentication, data loading, and core functionality
- Set up route mocks before navigating to pages that will use them
- Use Promise.all with waitForURL when expecting navigation after a click
- Add explicit timeouts for visibility checks in dynamic content areas
- For local development, run the dev server separately from the tests for better reliability
- Set session cookie with Set-Cookie header in route.fulfill() response
- Check cookie presence in request headers to conditionally return authenticated session
- NEXTAUTH_URL warning in tests can be ignored - it's expected in test environment
- Mock minimal data in API responses - just enough fields to make the test pass
- Use SLOMO=1 environment variable to slow down test execution for debugging (adds 2s delay between actions)
- Run `npm run test:e2e:headed` to debug tests visually with browser window and slow motion