## Our Testing Framework
We use Playwright for end-to-end testing our application.
We use Jest for unit testing our typescript.
We use ESLint to ensure our code is formatted correctly.
We use the TS compiler to ensure our code is typed correctly.

## Unit Tests

### Jest Setup
- Tests are written in TypeScript and run with ts-jest
- Test files are located next to the code they test in `__tests__` directories
- Tests can be run with `npm test`
- Mock data and dependencies using Jest's mocking capabilities
- API tests use node-mocks-http to simulate Next.js API requests

### Unit Testing Guidelines
- Write tests for all API endpoints
- Mock external dependencies (e.g. database calls)
- Test both success and error cases
- Validate input parameters
- Keep tests focused and isolated
- Don't be alarmed by console.error logs in tests when testing error handling - these are expected

## End-To-End Tests

We use Playwright for end-to-end testing our application. Our E2E tests cover critical user flows:

1. Authentication Flow
   - Tests that unauthenticated users are redirected to sign in
   - Verifies Google OAuth integration (mocked in tests)

2. Course Catalog Functionality
   - Tests course loading and display after authentication
   - Verifies search and filtering capabilities
   - Ensures proper data display in the UI

3. Component/Integration/E2E Testing Coverage
   - Unit Tests: Jest for API endpoints and utility functions
   - Integration Tests: Jest for testing API integrations with database
   - End-to-End Tests: Playwright for full user flows
     - Authentication and session handling
     - Course catalog interactions
     - Profile updates and form validation
   This satisfies the testing pyramid approach with coverage at all levels.

4. Future Testing Plans
   - Continue expanding E2E test coverage for critical flows
   - Focus on user-centric scenarios rather than exhaustive UI testing
   - Keep using Playwright for E2E tests because:
     - Strong TypeScript support matches our stack
     - Built-in waiting mechanisms reduce flakiness
     - Good debugging tools (trace viewer, headed mode)
     - Fast parallel execution
   - Areas to add tests:
     - Drag and drop course planning
     - Progress tracking updates
     - Major requirement validation

Our testing strategy emphasizes reliable automation of core user journeys while avoiding brittle UI tests. We mock external dependencies (OAuth, API calls) to focus on application behavior.
### End-to-End Testing commands
Run playwright tests with `npm run test:e2e`. For headed mode, use `npm run test:e2e:headed`

## Continuous Integration
We use GitHub Actions for continuous integration with four workflows:
1. Build Check: Ensures the project builds successfully
2. Tests: Runs all Jest tests
3. Lint: Checks code style with ESLint
4. End-To-End Tests: Runs all Playwright Tests

These checks run automatically on:
- All pull requests to main
- All pushes to main

The CI pipeline requires:
- Node.js 20
- All dependencies installed with `npm ci`
