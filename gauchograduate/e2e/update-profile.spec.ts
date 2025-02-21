import { test, expect } from '@playwright/test';

test.describe('Update profile functionality', () => {
  test('should handle profile updates correctly', async ({ page }) => {
    // Mock initial session with no major
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
            id: '123',
            majorId: null,
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

    // Navigate to update profile page
    await page.goto('/update-profile');

    // Verify initial state
    await expect(page.getByText('Update Your Profile')).toBeVisible();
    await expect(page.getByRole('combobox', { name: 'First Quarter at UCSB' })).toHaveValue('20234');

    // Try invalid major
    const majorInput = page.getByRole('textbox', { name: 'Major' });
    await majorInput.fill('Invalid Major');
    await page.getByRole('button', { name: 'Update Profile' }).click();
    await expect(page.getByText('Please select a valid major from the list')).toBeVisible();

    // Select valid major and update quarter
    await majorInput.fill('Computer Science');
    await page.getByText('Computer Science - College of Engineering').click();
    await page.getByRole('combobox', { name: 'First Quarter at UCSB' }).selectOption('20244');

    // Mock successful update
    await page.route('**/api/user/update-profile', async (route) => {
      const body = JSON.parse(route.request().postData() || '{}');
      if (body.majorId !== 1 || body.firstQuarter !== '20244') {
        return route.fulfill({ status: 400, body: JSON.stringify({ error: 'Invalid data' }) });
      }
      await route.fulfill({
        status: 200,
        body: JSON.stringify({
          user: { id: '123', majorId: 1 }
        }),
      });
    });

    // Submit update
    await page.getByRole('button', { name: 'Update Profile' }).click();
    await expect(page.getByText('Profile updated successfully!')).toBeVisible();

    // Navigate away and back to verify persistence
    await page.goto('/');
    await page.goto('/update-profile');

    // Mock updated session data
    await page.unroute('**/api/auth/session');
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
            id: '123',
            majorId: 1,
            courses: {
              firstQuarter: '20244',
              courses: []
            }
          },
          expires: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString(),
        }),
      });
    });

    // Verify updated values persist
    await expect(majorInput).toHaveValue('Computer Science');
    await expect(page.getByRole('combobox', { name: 'First Quarter at UCSB' })).toHaveValue('20244');
  });
});
