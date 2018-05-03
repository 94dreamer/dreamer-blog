const allConfig = require('../config');
const mysql = require('mysql');

const config = allConfig.database;

const pool = mysql.createPool({
    host: config.HOST,
    user: config.USERNAME,
    password: config.PASSWORD,
    database: config.DATABASE,
});

const query = (sql, values) => new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
        if (err) { resolve(err); } else {
            connection.query(sql, values, (err, rows) => {
                if (err)reject(err);
                else resolve(rows);

                connection.release();
            });
        }
    });
});


module.exports = {
    query,
};
