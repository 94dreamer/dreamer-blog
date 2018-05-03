// const articleAPI = require('./article');
const fs = require('fs');
const homeService = require('../../service/home');

const INDEX_TEMPLATE = './client/home/index.html';
/**
 * 渲染单页面模版,增加了调试处理
 * @param ctx
 */
async function renderIndexTemplate(ctx) {
    ctx.type = 'html';
    ctx.body = fs.createReadStream(INDEX_TEMPLATE);
}

module.exports = {
    index: renderIndexTemplate,
    articleList: async (ctx, next) => {
        const result = {};
        const articleList = await homeService.articleList();
        result.articleList = articleList;
        ctx.body = result;
    },
    // ...articleAPI,

};

