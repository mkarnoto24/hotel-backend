const conn = require('../../db')

exports.showById = (req, res) => {
    conn.query(`SELECT id,no_hp,email,alamat FROM customer WHERE id='${req.params.id}'`, (err, rows) => {
        if (err)
            throw err
        res.send(rows)
    })
}