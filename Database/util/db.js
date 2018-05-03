import { resolve } from 'dns';

const mysql = require('mysql');
const dbConfig = require('../config/db.config');

const pool = mysql.createPool({
    // ...dbConfig,
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'dreamer_blog',
});

const query = (sql, values) => new Promise((reslove, reject) => {
    pool.getConnection((err, connection) => {
        if (err) {
            reject(err);
        } else {
            // 使用连接执行查询
            connection.query(sql, values, (err, rows) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(rows);
                }

                // 连接不再使用，返回到连接池
                connection.release();
            });
        }
    });
});

module.exports = {
    query,
};
