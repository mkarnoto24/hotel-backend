//initiate express module
const express = require('express');

// init body parser 
const bodyParser = require('body-parser')
require('express-group-routes')

//use express in app variable
const app = express();

const port = 7000;

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
})

app.use(bodyParser.json())

const roomTypeControllers = require('./controllers/frontend/roomType')
const roomsControllers = require('./controllers/frontend/room')
const usersControllers = require('./controllers/frontend/user')
const reservationControllers = require('./controllers/frontend/reservationData')
const ordersControllers = require('./controllers/frontend/Orders')

const repoertControllers = require('./controllers/backend/report');


app.group("/api/v1", (router) => {
    router.get('/room_categories', roomTypeControllers.index)
})
app.group("/api/v1", (router) => {
    router.get('/rooms', roomsControllers.index)
    router.get('/room/:id', roomsControllers.showById)
})
app.group("/api/v1", (router) => {
    router.get('/user/:id', usersControllers.showById)
})
app.group("/api/v1", (router) => {
    router.get('/order/:id/user', reservationControllers.showById)
    router.post('/order/payment', reservationControllers.payment)
})
app.group("/api/v1", (router) => {
    router.post('/orders', ordersControllers.createOrders)
    router.put('/order/:id', ordersControllers.update)
})

app.group("/api/v1", (router) => {
    router.get('/report', repoertControllers.report)
})

app.listen(port, () => console.log(`Listening on port ${port}`))