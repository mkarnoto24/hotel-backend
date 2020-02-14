'use strict'
const conn = require('../../db')
const response = require('./res')

exports.report = (req, res) => {

    conn.query(
        `SELECT p.*,o.order_date,o.jml_order_room,o.check_in,o.check_out,o.total_bayar,rt.name,c.fullname FROM pembayaran as p join orders as o 
        ON p.order_id=o.id JOIN room_type as rt
        ON rt.id=o.room_id JOIN customer as c 
        ON c.id=p.id_customer`, function (err, rows, fields) {
        if (err) {
            console.log(err)
        }
        else {
            response.ok(rows, res)
        }
    });
}

