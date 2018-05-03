const dbUtils = require('../util/db-util');

const homeService = {
    articleList: async () => {
        const _sql = `
        SELECT * FROM blog_article
        where status = 0
        limit 1`;
        const result = await dbUtils.query(_sql);
        return result;
    },
};

module.exports = homeService;

