const express = require("express");
const config = require("./config");
const mysql = require("mysql");
const pool = mysql.createPool(config.database);

function getConnection() {
    return new Promise(function (resolve, reject) {
        pool.getConnection(function (err, conn) {
            if (err) {
                reject(err);
            } else {
                resolve(conn);
            }
        });
    });
}

function executeQuery(conn, query) {
    try {
        return new Promise(function (resolve, reject) {
            conn.query(query, function (err, res) {
                if (err) {
                    reject(err);
                    console.log(err);
                } else {
                    resolve(res);
                }
            });
        });
    } catch (e) {
        console.log(e);
    }
}
module.exports = { getConnection: getConnection, executeQuery: executeQuery };
