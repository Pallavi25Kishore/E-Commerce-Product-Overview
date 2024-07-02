CREATE TABLE IF NOT EXISTS product (
  id SERIAL,
  name VARCHAR(100),
  slogan VARCHAR(250),
  description VARCHAR(1000),
  category VARCHAR(250),
  default_price NUMERIC,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS features (
  id SERIAL,
  product_id INTEGER, /*please see addition of foreign key notes below*/
  feature VARCHAR(250),
  value VARCHAR(250) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS styles (
  style_id SERIAL,
  product_id INTEGER, /*please see addition of foreign key notes below*/
  name VARCHAR(250),
  sale_price NUMERIC NULL,
  original_price NUMERIC,
  "default?" BOOLEAN NOT NULL,
  PRIMARY KEY (style_id)
);

CREATE TABLE IF NOT EXISTS photos (
  id SERIAL,
  style_id INTEGER, /*please see addition of foreign key notes below*/
  url VARCHAR(1000),
  thumbnail_url VARCHAR(1500),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS skus (
  id SERIAL,
  style_id INTEGER, /*please see addition of foreign key notes below*/
  size VARCHAR(50),
  quantity NUMERIC,
  PRIMARY KEY (id)
);

/* NOTES on TABLE CREATION

In order to create tables using psql shell:
1. connect to psql database using : psql -h <hostname> -U <username> -d <database name>
2. run this .sql script to create tables : \i <filepath to .sql file>
3. to list the tables: \dt
4. to view column names: \d <tablename>*/

/* NOTES ON ETL PROCESS

To LOAD DATA from csv files into the tables i ran the following commmands from psql shell:

1.  COPY product(id, name, slogan, description, category, default_price) FROM '...../product.csv' DELIMITER ',' CSV HEADER;
    - output received - COPY 1000011
    - SELECT COUNT(*) FROM product;
       output:  count
        ---------
        1000011
      - wc -l product.csv
      output: 1000011 - number matches and is not one less than number of rows despite csv file having a header becuase, the last line in csv file dosen't end with \n which is what the wc -l command looks for

2. COPY features(id, product_id, feature, value) FROM '..../features.csv' DELIMITER ',' CSV HEADER;
    -output received - COPY 2219279
    -SELECT COUNT(*) FROM features;
      count
    ---------
    2219279
  - wc -l features.csv
      output: 2219279

3. COPY styles(style_id, product_id, name, sale_price, original_price, "default?") FROM '..../styles.csv' DELIMITER ',' CSV HEADER NULL 'null';
    -output received - COPY 1958102
    - SELECT COUNT(*) FROM styles;
      count
    ---------
    1958102
    - wc -l styles.csv
     output: 1958102

4. split -l 3000000 photos.csv

COPY photos(id, style_id, url, thumbnail_url) FROM '..../xaa' DELIMITER ',' CSV HEADER NULL 'null';

COPY photos(id, style_id, url, thumbnail_url) FROM '..../xab' DELIMITER ',' CSV NULL 'null';

    SELECT COUNT(*) FROM photos;
      count
    ---------
    5655656
    -wc -l photos.csv
    output: 5655656

5. COPY skus(id, style_id, size, quantity) FROM '..../skus.csv' DELIMITER ',' CSV HEADER NULL 'null';
output received - COPY 11323917
- wc -l skus.csv
output: 11323917 */


/*ADDITION OF FOREIGN KEY CONSTRAINTS using CLI, POST ETL PROCESS:

1. ALTER TABLE features
ADD CONSTRAINT fk_features
FOREIGN KEY (product_id)
REFERENCES product (id);

2. ALTER TABLE styles
ADD CONSTRAINT fk_styles
FOREIGN KEY (product_id)
REFERENCES product (id);

3. ALTER TABLE photos
ADD CONSTRAINT fk_photos
FOREIGN KEY (style_id)
REFERENCES styles (style_id);

4. ALTER TABLE skus
ADD CONSTRAINT fk_skus
FOREIGN KEY (style_id)
REFERENCES styles (style_id);

*/

/* indexing

1. CREATE INDEX features_sk ON features(product_id);
2. CREATE INDEX styles_sk ON styles(product_id);
3. CREATE INDEX photos_sk ON photos(style_id);
4. CREATE INDEX skus_sk ON skus(style_id);

*/










