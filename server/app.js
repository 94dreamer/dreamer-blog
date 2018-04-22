/**
 * Created by zhouzhen on 2018/4/16.
 */
const Koa = require('koa');
const fs = require('fs');
const bodyParse = require('koa-bodyparser');

const app = new Koa();

app.use(bodyParse());

/**
 * 根据页面读取文件
 */

const router = require('./router');

router(app);

app.listen(3000, () => {
    console.log('server is starting at port 3000');
});

