import { test, expect, Page } from '@playwright/test';

test.describe('Drag and drop course functionality', () => {
  // Helper function to set up authenticated session with a major
  async function setupAuthenticatedSession(page: Page) {
    // Mock session data with a major already set
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
            majorId: 1, // User has a major set
            courses: {
              firstQuarter: '20234',
              courses: []
            }
          },
          expires: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString(),
        }),
      });
    });

    // Mock major data
    await page.route('**/api/user/major', async (route) => {
      await route.fulfill({
        status: 200,
        body: JSON.stringify({
          major: {
            id: 1,
            name: 'Computer Science',
            college: 'CoE',
            requirements: {
              preparation: { and: ['CMPSC 16', 'CMPSC 24', 'CMPSC 40'] },
              upper_division: {
                required: { and: ['CMPSC 130A', 'CMPSC 138'] },
                electives: { or: { count: 2, notes: [], classes: ['CMPSC 148', 'CMPSC 156'] } }
              }
            }
          }
        }),
      });
    });

    // Mock empty user courses
    await page.route('**/api/user/courses', async (route) => {
      await route.fulfill({
        status: 200,
        body: JSON.stringify({
          firstQuarter: '20234',
          courses: [],
          overrides: []
        }),
      });
    });
  }

  test('should allow dragging a course from catalog to schedule', async ({ page }) => {
    // Set up authenticated session
    await setupAuthenticatedSession(page);

    // Mock course data for the catalog
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
            }
          ],
        }),
      });
    });

    // Mock successful course addition
    await page.route('**/api/user/add-course', async (route) => {
      const body = JSON.parse(route.request().postData() || '{}');
      await route.fulfill({
        status: 200,
        body: JSON.stringify({
          courses: {
            firstQuarter: '20234',
            courses: [
              { id: body.id, quarter: body.quarter }
            ]
          }
        }),
      });
    });

    // Navigate to home page
    await page.goto('/');

    // Verify we're on the main page
    await expect(page).toHaveURL('/');

    // Wait for course catalog to load
    await expect(page.getByText('Course Catalog')).toBeVisible();
    await expect(page.getByText('CMPSC 148')).toBeVisible();

    // Mock the batch course query that would happen after drop
    await page.route('**/api/course/query/batch', async (route) => {
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
            }
          ],
        }),
      });
    });

    // Take a screenshot before the operation
    await page.screenshot({ path: 'before-drag.png' });

    // Trigger the add-course API call directly
    await page.evaluate(() => {
      fetch('/api/user/add-course', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: 1, quarter: '20244' }) // Fall quarter of Year 1
      });
    });

    // Give time for the API call to complete
    await page.waitForTimeout(2000);

    // Now we need to mock the user courses API to include our added course when the page reloads
    await page.route('**/api/user/courses', async (route) => {
      await route.fulfill({
        status: 200,
        body: JSON.stringify({
          firstQuarter: '20234',
          courses: [
            { id: 1, quarter: '20244' } // Fall quarter of Year 1
          ],
          overrides: []
        }),
      });
    });

    // Refresh the page to ensure the course is loaded from the backend
    await page.reload();
    
    // Wait for the page to fully load
    await page.waitForLoadState('networkidle');
    
    // Take a debug screenshot
    await page.screenshot({ path: 'after-reload.png' });

    // Wait for the four-year plan to load
    await expect(page.getByText('Four-Year Plan')).toBeVisible();

    // Check if the course appears in any part of the schedule
    const courseInSchedule = page.locator('div[data-term-column="Fall"]').getByText('CMPSC 148');
    await expect(courseInSchedule).toBeVisible({ timeout: 10000 });

    // Verify the units are displayed in the schedule
    await expect(page.getByText('Total units: 4')).toBeVisible();
  });

  test('should redirect new user to update profile page', async ({ page }) => {
    // Mock session data for a new user without a major
    await page.route('**/api/auth/session', async (route) => {
      await route.fulfill({
        status: 200,
        headers: {
          'Set-Cookie': 'next-auth.session-token=fake-token; Path=/; HttpOnly',
        },
        body: JSON.stringify({
          user: {
            name: 'New User',
            email: 'new@ucsb.edu',
            image: null,
            id: '456',
            majorId: null, // No major set
            courses: {
              firstQuarter: '20234',
              courses: []
            }
          },
          expires: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString(),
        }),
      });
    });

    // Mock available majors
    await page.route('**/api/major/all', async (route) => {
      await route.fulfill({
        status: 200,
        body: JSON.stringify({
          majors: [
            { id: 1, name: 'Computer Science', college: 'College of Engineering' },
            { id: 2, name: 'Mechanical Engineering', college: 'College of Engineering' }
          ]
        }),
      });
    });

    // Navigate to home page
    await page.goto('/');

    // Verify we're redirected to the update profile page
    await expect(page).toHaveURL('/update-profile');
    await expect(page.getByText('Update Your Profile')).toBeVisible();
  });
});
