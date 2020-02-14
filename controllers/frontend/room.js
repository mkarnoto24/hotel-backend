'use strict'
const conn = require('../../db')
const response = require('./res')

exports.index = (req, res) => {
    conn.query(`SELECT r.*,rt.name,rt.img FROM room as r LEFT JOIN room_type as rt 
    ON r.id_room_type=rt.id`, function (err, rows, fields) {
        if (err) {
            console.log(err);
        }
        else {
            response.ok(rows, res)
        }
    })
}
exports.showById = (req, res) => {
    const idRoom = req.params.id;
    conn.query(`SELECT r.*,rt.name,rt.img FROM room as r LEFT JOIN room_type as rt 
                ON r.id_room_type=rt.id WHERE r.id='${idRoom}'`, function (err, rows, fields) {
        if (err) {
            console.log(err);
        }
        else {
            response.ok(rows, res);
        }
    })
}