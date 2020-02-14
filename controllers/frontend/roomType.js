const conn = require('../../db')

exports.index = (req, res) => {
    conn.query('SELECT * FROM room_type', (err, rows) => {
        if (err)
            throw err
        res.send(rows)
    })
}