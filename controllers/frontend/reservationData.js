'use strict'
const conn = require('../../db')
const response = require('./res')

exports.showById = (req, res) => {
    const idUser = req.params.id
    conn.query(`SELECT o.*,r.id,r.price,r.id_room_type,c.id,c.fullname,c.no_hp,c.email,c.alamat,rt.img FROM orders as o LEFT JOIN room as r
                ON o.room_id=r.id JOIN customer as c 
                ON c.id=o.id_customer 
                JOIN  room_type as rt ON rt.id=r.id
                WHERE c.id='${idUser}'`, function (err, rows, fields) {
        if (err) {
            console.log(err)
        }
        else {
            response.ok(rows, res)
        }
    })
}
exports.payment = (req, res) => {
    const { order_id, id_customer, jml_bayar, nm_bank, no_rek, nm_rek, attachment } = req.body

    conn.query(
        `INSERT INTO pembayaran (order_id,id_customer,jml_bayar,nm_bank,no_rek,nm_rek,attachment) VALUES ('${order_id}','${id_customer}','${jml_bayar}','${nm_bank}','${no_rek}','${nm_rek}','${attachment}')`, (err) => {
            if (err) throw err
        })
    res.send({
        success: true,
        data: req.body
    })
}