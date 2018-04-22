/**
 * Created by zhouzhen on 2018/4/16.
 */
const Koa = require('koa');
const fs = require('fs');

const app = new Koa();

/**
 * 根据页面读取文件
 */

const render = page => new Promise((resolve, reject) => {
    const viewUrl = `./view/${page}`;
    fs.readFile(viewUrl, 'binary', (err, data) => {
        if (err)reject(err);
        else resolve(data);
    });
});

async function route(url) {
    let view;
    switch (url) {
        case '/':
            view = 'index.html';
            break;
        case '/404':
            view = '404.html';
            break;
        default:
            view = '404.html';
    }
    const html = await render(view);
    return html;
}


app.use(async (ctx) => {
    const { url } = ctx;
    const html = await route(url);
    ctx.body = html;
});

app.listen(3000);

console.log('[demo] start-quick is starting at port 3000');

