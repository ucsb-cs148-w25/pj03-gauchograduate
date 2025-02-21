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

    // Mock course data
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

    // Verify course catalog is visible
    await expect(page.getByText('Course Catalog')).toBeVisible();

    // Verify courses are loaded and displayed
    await expect(page.getByText('CMPSC 148')).toBeVisible();
    await expect(page.getByText('CMPSC 156')).toBeVisible();

    // Test search functionality
    const searchInput = page.getByPlaceholder('Search courses...');
    await searchInput.fill('148');
    
    // Should show CMPSC 148 but not 156
    await expect(page.getByText('CMPSC 148')).toBeVisible();
    await expect(page.getByText('CMPSC 156')).not.toBeVisible();
  });
});
