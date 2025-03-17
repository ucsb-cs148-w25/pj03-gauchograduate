import { test, expect } from '@playwright/test';

test.describe('Course catalog functionality', () => {
  test('should load courses after authentication', async ({ page }) => {
    // Mock session data
    await page.route('**/api/auth/session', async (route) => {
      await route.fulfill({
        status: 200,
        headers: {
          'Set-Cookie': 'next-auth.session-token=fake-token; Path=/; HttpOnly',
        },
        body: JSON.stringify({
          user: {
            name: 'Test User',
            email: 'test@ucsb.edu',
            image: null,
            id: '123',
          },
          expires: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString(),
        }),
      });
    });

    // Mock course data - updated to use quarter parameter instead of all=true
    await page.route('**/api/course/query**', async (route) => {
      await route.fulfill({
        status: 200,
        body: JSON.stringify({
          courses: [
            {
              gold_id: 'CMPSC 148',
              id: 1,
              title: 'Computer Science Project',
              description: 'A course about software engineering',
              subject_area: 'CMPSC',
              units: 4,
              general_ed: [],
              prerequisites: [],
              unlocks: [],
            },
            {
              gold_id: 'CMPSC 156',
              id: 2,
              title: 'Advanced Applications Programming',
              description: 'Advanced topics in software engineering',
              subject_area: 'CMPSC',
              units: 4,
              general_ed: [],
              prerequisites: [],
              unlocks: [],
            },
          ],
        }),
      });
    });

    // Navigate to home page
    await page.goto('/');

    // Verify we're on the main page (not redirected to signin)
    await expect(page).toHaveURL('/');

    // Verify user name is displayed in navbar
    await expect(page.getByText('Logged in as Test')).toBeVisible();

    // Verify course catalog is visible - use a more specific selector
    await expect(page.getByRole('heading', { name: 'Course Catalog' }).first()).toBeVisible();

    // Verify courses are loaded and displayed - use more specific selectors
    await expect(page.getByRole('heading', { name: 'CMPSC 148' }).first()).toBeVisible();
    await expect(page.getByRole('heading', { name: 'CMPSC 156' }).first()).toBeVisible();

    // Test search functionality - use a more specific selector for the search input
    const searchInput = page.getByRole('textbox', { name: 'Search courses...' }).first();
    await searchInput.fill('148');
    
    // Should show CMPSC 148 but not 156 - use more specific selectors
    await expect(page.getByRole('heading', { name: 'CMPSC 148' }).first()).toBeVisible();
    await expect(page.getByRole('heading', { name: 'CMPSC 156' }).first()).not.toBeVisible();
  });
});
