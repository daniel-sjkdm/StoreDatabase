-- CREATE DATABASE store ENCODING TF8;

CREATE TYPE PERSON_GENDER AS ENUM (
    'Male',
    'Female'
); 

CREATE TYPE PAYMENT_METHOD AS ENUM (
    'Credit Card',
    'Debit Card',
    'Cryptocurrency'
);


CREATE TABLE IF NOT EXISTS store (
    id SMALLSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL 
);


CREATE TABLE IF NOT EXISTS inventory (
    id SMALLSERIAL PRIMARY KEY,
    id_store INTEGER REFERENCES store (id),
    name VARCHAR(50) NOT NULL,
    CONSTRAINT valid_name CHECK (name <> '')
);

CREATE TABLE IF NOT EXISTS item (
    id SMALLSERIAL PRIMARY KEY,
    name VARCHAR(300) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    CONSTRAINT valid_name CHECK (name <> ''),
    CONSTRAINT valid_price CHECK (price > 0)
);

CREATE TABLE IF NOT EXISTS has_item (
    id_inventory INTEGER REFERENCES inventory (id),    
    id_item INTEGER REFERENCES item (id),
    quantity INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(id_inventory, id_item),
    CONSTRAINT valid_quantity CHECK (quantity >= 0)
);

CREATE TABLE IF NOT EXISTS category (
    id SMALLSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT name_not_empty CHECK (name <> '')
);

CREATE TABLE IF NOT EXISTS is_category (
    id_item INTEGER REFERENCES item (id),
    id_category INTEGER REFERENCES category (id),
    PRIMARY KEY (id_item, id_category)
);

CREATE TABLE IF NOT EXISTS customer (
    id SMALLSERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL NOT NULL,
    gender PERSON_GENDER NOT NULL,
    email VARCHAR(50) NULL,
    CONSTRAINT valid_fname CHECK (first_name <> ''),
    CONSTRAINT valid_lname CHECK (last_name <> ''),
    CONSTRAINT valid_age CHECK (age > 0)
);

CREATE TABLE IF NOT EXISTS payment (
    id SMALLSERIAL PRIMARY KEY, 
    id_customer INTEGER REFERENCES customer (id),
    method VARCHAR(50) NOT NULL,
    card_number VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS shopping_cart (
    id SMALLSERIAL PRIMARY KEY,
    id_customer INTEGER REFERENCES customer (id) UNIQUE,
    number_items INTEGER NOT NULL,
    CONSTRAINT valid_number_items CHECK (number_items > 0)
);

CREATE TABLE IF NOT EXISTS shopping_cart_items (
    id_shopping_cart INTEGER REFERENCES shopping_cart (id),
    id_item INTEGER REFERENCES item (id),
    PRIMARY KEY (id_shopping_cart, id_item)
);