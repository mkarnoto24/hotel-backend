'use strict'
const conn = require('../../db')
const response = require('./res')

exports.showById = (req, res) => {
    const idRoom = req.params.id
    conn.query(`SELECT r.*,rt.name,rt.img FROM room as r LEFT JOIN room_type as rt 
                ON r.id_room_type=rt.id WHERE r.id='${idRoom}'`, function (err, rows, fields) {
        if (err) {
            console.log(err)
        }
        else {
            response.ok(rows, res)
        }
    })
}
exports.createOrders = (req, res) => {
    const { order_date, payment_deadline, room_id, jml_order_room, id_customer, check_in, check_out, total_bayar } = req.body

    conn.query(
        `INSERT INTO orders (order_date,payment_deadline,room_id,jml_order_room,id_customer,check_in,check_out,total_bayar,status) VALUES ('${order_date}','${payment_deadline}','${room_id}','${jml_order_room}','${id_customer}','${check_in}','${check_out}','${total_bayar}','pending')`, (err) => {
            if (err) throw err
        })
    res.send({
        success: true,
        data: req.body
    })

}
exports.update = (req, res) => {
    conn.query(`UPDATE orders SET status='confirmed' WHERE id='${req.params.id}'`, (err) => {
        if (err) throw err
    })

    res.send({
        success: true,
        data: req.body
    })
}