require("dotenv").config();
const express = require('express');
const app = express();
const controllers = require('./controllers.js');
// const path = require("path"); uncomment to integrate with front-end on local

// app.use(express.static(path.join(__dirname, '../../rfp2404-fec/client/dist'))); uncomment to integrate with front-end on local

app.use(express.json());

app.get('/products', controllers.getProducts);
app.get('/products/:product_id', controllers.getFeatures);
app.get('/products/:product_id/styles', controllers.getStyles);

app.listen(process.env.PORT);
console.log(`Listening at http://localhost:${process.env.PORT}`);

