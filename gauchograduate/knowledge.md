## What is this
This is the root directory for the next.js webapp GauchoGraduate.
Because the project is built on typescript, all code changes should run the typescript compiler to ensure they did not break any type rules. They should also run `npm run lint`

The idea of a project is as follows: A user (UCSB Student) logs in and provides their Major. The Webapp then shows them their graduation requirements in a progress bar component on the right of the screen.

On the left of the screen is a catalog of all courses available. They are able to drag and drop the courses into their 4 year planner which is in the center. As they drop the courses, the progress bar updates to show them what percentage of their classes have been planned.

They can also remove courses by pressing the trash icon that appears on the bottom right of the course when hovering over it. Once again, the progress bar updates live.

They see 4 columns in the planner, with a dropdown menu to select their year. There are 4 years, with 4 quarters per year.

## College Codes
- College of Engineering (CoE) is represented as "ENGR" in the API responses
- This mapping is needed when checking GE requirements against course.generalEd[].geCollege

## Testing
- When running tests with `npm run test`, make sure the `.next` directory is excluded in the Jest configuration
- The test configuration is in `jest.config.js` and should include `.next/` in the `testPathIgnorePatterns` array
- This prevents Jest from trying to run tests on Next.js build output files

## E2E Testing
- When using Playwright selectors, use specific selectors like `getByRole()` instead of generic `getByText()` when elements might appear multiple times
- Always use `.first()` or other specific qualifiers when there might be duplicate elements on the page
- For text inputs, prefer `getByRole('textbox', { name: 'Label Text' })` over `getByPlaceholder()`
- For headings, use `getByRole('heading', { name: 'Heading Text' })` instead of `getByText()`