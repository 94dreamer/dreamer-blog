/**
 * Created by zhouzhen on 2018/4/16.
 */
const Koa = require('koa');
// const fs = require('fs');
const router = require('./router');
const middleware = require('./middleware');

const app = new Koa();

middleware(app);
router(app);

app.listen(3000, () => {
    console.log('server is starting at port 3000');
});

