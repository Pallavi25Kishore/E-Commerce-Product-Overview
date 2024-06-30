const client = require('../db/db.js');



exports.getProducts = (req, res) => {
  const page = parseInt(req.query.page) || 1;
  const count = parseInt(req.query.count) || 5;
  const offsetValue = (page - 1) * count;
  const currentValue = offsetValue + count;

  const queryString = "SELECT * FROM product WHERE id > $1 AND id <= $2";
  const paramsArr = [offsetValue, currentValue];

  client.query(queryString, paramsArr)
    .then((data) => {
      res.send(data.rows);
    })
    .catch((err) => {
      console.log(err);
      res.sendStatus(400);
    });
};


exports.getFeatures = (req, res) => {
  const productId = req.params.product_id;
  const queryString = "SELECT \
    p.id, \
    p.name, \
    p.slogan, \
    p.description, \
    p.category, \
    p.default_price, \
    COALESCE(json_agg(jsonb_build_object('feature', f.feature, 'value', f.value)), '[]') AS features \
    FROM product p LEFT JOIN features f ON p.id=f.product_id WHERE p.id=$1 \
    GROUP BY p.id";

  const paramsArr = [productId];

  client.query(queryString, paramsArr)
    .then((data) => {
      res.send(data.rows[0]);
    })
    .catch((err) => {
      console.log(err);
      res.sendStatus(400);
    });
};


exports.getStyles = (req, res) => {
  const productId = req.params.product_id;
  const queryString = "SELECT \
    styles.style_id, \
    styles.name, \
    styles.original_price, \
    styles.sale_price, \
    styles.\"default?\", \
    COALESCE(json_agg(jsonb_build_object('thumbnail_url', photos.thumbnail_url, 'url', photos.url)), '[]') AS photos, \
    COALESCE( jsonb_object_agg(skus.id, jsonb_build_object('quantity', skus.quantity, 'size', skus.size)) FILTER (WHERE skus.id IS NOT NULL) , '{}') AS skus \
    FROM \
    styles \
    LEFT JOIN \
    photos \
    ON \
    styles.style_id = photos.style_id \
    LEFT JOIN \
    skus \
    ON \
    styles.style_id= skus.style_id \
    WHERE styles.product_id=$1 \
    GROUP BY styles.style_id";

    const paramsArr = [productId];

    client.query(queryString, paramsArr)
    .then((data) => {
      const result = {
        product_id : productId,
        results: data.rows
      };
      res.send(result);
    })
    .catch((err) => {
      console.log(err);
      res.sendStatus(400);
    });
};