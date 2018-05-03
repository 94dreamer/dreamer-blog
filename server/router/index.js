const router = require('koa-router')();
const HomeController = require('../controller/home');
const AdminController = require('../controller/admin');

module.exports = (app) => {
    router.get('/', HomeController.index);

    // router.get('/admin', AdminController.index);

    router.get('/articleList', HomeController.articleList);

    app.use(router.routes())
        .use(router.allowedMethods());
};
