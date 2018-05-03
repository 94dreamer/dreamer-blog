// const path = require('path');
const bodyParser = require('koa-bodyparser');
const miSend = require('./mi-send');
// 引入日志中间件
const miLog = require('./mi-log');
const koaStatic = require('koa-static');

// 静态资源目录的路径
const staticPath = './public';

module.exports = (app) => {
    // 注册中间件
    app.use(miLog());
    app.use(bodyParser());
    app.use(miSend());
    app.use(koaStatic(staticPath));
};

