const articleAPI = require('./article');

module.exports = {
    index: async (ctx, next) => {
        ctx.body = 'index page';
    },
    ...articleAPI,

};

