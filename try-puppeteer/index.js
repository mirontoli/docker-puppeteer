//import puppeteer from 'puppeteer';
//import { puppeteer } from 'puppeteer';
const puppeteer = require('puppeteer');
(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.goto('https://chuvash.eu/');
    await page.setViewport({width:1080,height:1024});
    const pageTitle = await page.title();
    console.log(pageTitle);
    await browser.close();
})();