const puppeteer = require("puppeteer");

module.exports = async (context, req) => {
  const browser = await puppeteer.launch({
    args: ["--no-sandbox", "--disable-setuid-sandbox"]
  });

  const page = await browser.newPage();
  await page.goto("https://chuvash.eu");
  const pageTitle = await page.title();
  await browser.close();

  context.res = {
    // status: 200, /* Defaults to 200 */
    body: `Page title: ${pageTitle}`
  };
};
