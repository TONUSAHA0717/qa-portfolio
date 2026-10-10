const { test, expect } = require('@playwright/test');

// Starter template only. Set BASE_URL to an authorized demo application.
// This sample was not executed while creating the portfolio.
test('demo application displays its main page', async ({ page }) => {
  const baseURL = process.env.BASE_URL;
  test.skip(!baseURL, 'Set BASE_URL before running.');
  await page.goto(baseURL);
  await expect(page).toHaveTitle(/.+/);
});
