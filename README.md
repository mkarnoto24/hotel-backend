# hotel-backend
 
 
## Installation
- Clone or download then extract, open the project on your code editor. Open the terminal in your code editor and type npm install then   enter. Here I use the Visual Code Editor 
- For database settings, type http://localhost/phpmyadmin/ in your browser. create the db_si_hotel database and import the database in     the project folder. I use Mysql
- The final step is to type npm start in your project terminal.

## Built With

- [Express JS](https://expressjs.com) - Back-end
- [MySQL](https://www.mysql.com) - Database
- [istanbul nyc](https://www.istanbul.js.org) - Code coverage
 
## Endpoint
 
 ### `Get all Room Types`
Method GET<br /> 
http://localhost:7000/api/v1/room_categories

 ### `Get Room Info`
Method GET<br /> 
http://localhost:7000/api/v1/rooms

 ### `Get Room Info By ID Room`
Method GET<br /> 
http://localhost:7000/api/v1/room/:id<br />
example : http://localhost:7000/api/v1/room/1

 ### `Get User By ID User`
Method GET<br /> 
http://localhost:7000/api/v1/user/:id <br />
example : http://localhost:7000/api/v1/user/1

### `Get Reservation data By ID User`
Method GET<br /> 
http://localhost:7000/api/v1/order/:id/user <br />
example : http://localhost:7000/api/v1/order/1/user

### `Post payment for hotels that have been booked by the user`
Method POST<br /> 
http://localhost:7000/api/v1/order/payment <br />
example for request body : <br />
{ <br />
  "order_id":"1",<br />
  "id_customer":"1",<br />
  "jml_bayar":"500000",<br />
  "nm_bank":"Mandiri",<br />
  "no_rek":"121212121",<br />
  "attachment":"bukti_pembayaran.png" <br />
}<br />
example for output response body : <br />
{<br />
    "success": true,<br />
    "data": {<br />
        "order_id": "1",<br />
        "id_customer": "1",<br />
        "jml_bayar": "500000",<br />
        "nm_bank": "Mandiri",<br />
        "no_rek": "121212121",<br />
        "attachment": "bukti_pembayaran.png"<br />
    }<br />
}

### `Create hotel booking data from user`
Method POST<br /> 
http://localhost:7000/api/v1/orders<br />
example for request body :<br />
{<br />
	"order_date":"2020-02-12 14:00:00",<br />
	"payment_deadline":"2020-02-12 14:30:00",<br />
	"room_id":"2",<br />
	"jml_order_room":"1",<br />
	"id_customer":"1",<br />
	"check_in":"2020-02-12 14:00:00",<br />
	"check_out":"2020-02-13 14:00:00",<br />
	"total_bayar":"1000000"<br />
}<br />
example for output response body :<br />
{<br />
    "success": true,<br />
    "data": {<br />
        "order_date": "2020-02-12 14:00:00",<br />
        "payment_deadline": "2020-02-12 14:30:00",<br />
        "room_id": "2",<br />
        "jml_order_room": "1",<br />
        "id_customer": "1",<br />
        "check_in": "2020-02-12 14:00:00",<br />
        "check_out": "2020-02-13 14:00:00",<br />
        "total_bayar": "1000000"<br />
    }<br />
}

### `Payment confirmation status update`
Method PUT<br /> 
http://localhost:7000/api/v1/order/:id<br />
example : http://localhost:7000/api/v1/order/2

### `Get financial statements`
Method GET<br /> 
http://localhost:7000/api/v1/report
