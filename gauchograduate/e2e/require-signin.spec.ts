import { test, expect } from '@playwright/test';

test.describe('Authentication flow', () => {
  test('should redirect to sign in page when not authenticated', async ({ page }) => {
    // Navigate to home page
    await page.goto('/');

    // Should redirect to sign in page
    await expect(page).toHaveURL('/signin', { timeout: 10000 });

    // Sign in button should be visible
    const signInButton = await page.getByRole('button', { name: /Sign in with Google/i });
    await expect(signInButton).toBeVisible();
  });
});
