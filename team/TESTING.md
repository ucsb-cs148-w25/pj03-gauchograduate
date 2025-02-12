## Our Testing Framework
We use Jest for unit testing our typescript.
We use ESLint to ensure our code is formatted correctly.
We use the TS compiler to ensure our code is typed correctly.

### Jest Setup
- Tests are written in TypeScript and run with ts-jest
- Test files are located next to the code they test in `__tests__` directories
- Tests can be run with `npm test`
- Mock data and dependencies using Jest's mocking capabilities
- API tests use node-mocks-http to simulate Next.js API requests

### Testing Guidelines
- Write tests for all API endpoints
- Mock external dependencies (e.g. database calls)
- Test both success and error cases
- Validate input parameters
- Keep tests focused and isolated
- Don't be alarmed by console.error logs in tests when testing error handling - these are expected

### Common Testing Commands
```bash
npm test              # Run all tests
npm test -- --watch  # Watch mode: rerun tests on file changes
npm test -- -t "pattern"  # Run tests matching pattern
```