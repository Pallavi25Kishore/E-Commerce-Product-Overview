require("dotenv").config();
const express = require('express');
const app = express();
const controllers = require('./controllers.js');

app.use(express.json());

app.get('/products', controllers.getProducts);
app.get('/products/:product_id', controllers.getFeatures);
app.get('/products/:product_id/styles', controllers.getStyles);

app.listen(process.env.PORT);
console.log(`Listening at http://localhost:${process.env.PORT}`);

