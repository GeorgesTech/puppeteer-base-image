const puppeteer = require('puppeteer');

(async () => {
    try {
        const browser = await puppeteer.launch({ executablePath: '/usr/bin/google-chrome', args: ['--no-sandbox', '--disable-setuid-sandbox'] });
        const page = await browser.newPage();
        await page.goto('https://google.fr');
        await page.screenshot({ path: '/app/test/screenshot/google.png' });

        await browser.close()
    } catch (err) {
        console.error(err)
        process.exit(1)
    }
})()
