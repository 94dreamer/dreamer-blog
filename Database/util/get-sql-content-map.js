const fs = require('fs');

const getSqlMap = require('./get-sql-map');

const sqlContentMap = {};

/**
 * 读取sql文件内容
 * @param {string} fileName 文件名称
 * @param {string} path 文件所在路径
 */
function getSqlContent(fileName, path) {
    const content = fs.readFileSync(path, 'binary');
    sqlContentMap[fileName] = content;
}

/**
 * 封装所有sql文件脚本内容
 */
function getSqlContentMap() {
    const sqlMap = getSqlMap();
    for (const key in sqlMap) {
        getSqlContent(key, sqlMap[key]);
    }
    return sqlContentMap;
}

module.exports = getSqlContentMap;
