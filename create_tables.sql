-- Store 
INSERT INTO store ( name, address ) VALUES ( 'Aeon', 'Soap Street' );
INSERT INTO store ( name, address ) VALUES ( 'Krypto', 'L.A, California' );
INSERT INTO store ( name, address ) VALUES ( 'Kronos', 'Oklahoma' );


-- Inventory 
INSERT INTO inventory ( id_store, name ) VALUES ( 1, 'AEO1010' );
INSERT INTO inventory ( id_store, name ) VALUES ( 2, 'KRY1178' );
INSERT INTO inventory ( id_store, name ) VALUES ( 3, 'KRO8932' );


-- Item
INSERT INTO item ( name, brand, price ) VALUES ( 'Laptop Gamer i7 16GB RAM', 'HP', 400.57 );
INSERT INTO item ( name, brand, price ) VALUES ( 'Laptop Gamer i5 12GB RAM', 'HP', 300.57 );
INSERT INTO item ( name, brand, price ) VALUES ( 'Laptop Gamer i3 16GB RAM', 'HP', 230.57 );
INSERT INTO item ( name, brand, price ) VALUES ( 'Bluetooth Speaker', 'AIWA', 98.34 );
INSERT INTO item ( name, brand, price ) VALUES ( 'Smarthphone U73S', 'Huawei', 14.34 );


-- Has item
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 1, 1, 5 );
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 1, 2, 3 );
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 1, 3, 2 );
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 1, 4, 0 );
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 1, 5, 1 );
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 2, 4, 10 );
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 3, 4, 1 );
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 2, 1, 2 );
INSERT INTO has_item ( id_inventory, id_item, quantity ) VALUES ( 3, 5, 3 );



-- Category
INSERT INTO category ( name ) VALUES ( 'computer' );
INSERT INTO category ( name ) VALUES ( 'sound' );
INSERT INTO category ( name ) VALUES ( 'phone' );


-- Is category
INSERT INTO is_category ( id_item, id_category) VALUES ( 1, 1 );
INSERT INTO is_category ( id_item, id_category) VALUES ( 2, 1 );
INSERT INTO is_category ( id_item, id_category) VALUES ( 3, 1 );
INSERT INTO is_category ( id_item, id_category) VALUES ( 4, 2 );
INSERT INTO is_category ( id_item, id_category) VALUES ( 5, 3 );



-- Customer
INSERT INTO customer ( first_name, last_name, age, gender, email ) VALUES ( 
    'Tyler', 
    'Durden',
    33, 
    'Male',
    'tyler@gmail.com'
);
INSERT INTO customer ( first_name, last_name, age, gender, email ) VALUES ( 
    'Kratos', 
    'Kronos',
    54, 
    'Male',
    'kkrathos@gmail.com'
);
INSERT INTO customer ( first_name, last_name, age, gender, email ) VALUES ( 
    'Morrigan', 
    'Sucubus',
    24, 
    'Female',
    'morrigansucubus@gmail.com'
);
INSERT INTO customer ( first_name, last_name, age, gender, email ) VALUES ( 
    'Irene', 
    'Kleent',
    22, 
    'Female',
    'irekleent@gmail.com'
);


-- Payment
INSERT INTO payment ( id_customer, method, card_number ) VALUES ( 1, 'Credit Card', '9302939302');
INSERT INTO payment ( id_customer, method, card_number ) VALUES ( 1, 'Debit Card',  '3949393932');
INSERT INTO payment ( id_customer, method, card_number ) VALUES ( 2, 'Debit Card',  '9838483784');
INSERT INTO payment ( id_customer, method, card_number ) VALUES ( 3, 'Credit Card', '3288738738');
INSERT INTO payment ( id_customer, method, card_number ) VALUES ( 4, 'Etherium',    '32387791002');



-- Shopping cart
-- Create a trigger: when a customer is created,
-- an entry in this tabled is created automatically
INSERT INTO shopping_cart ( id_customer, number_items ) VALUES ( 1, 3);
INSERT INTO shopping_cart ( id_customer, number_items ) VALUES ( 2, 0 );
INSERT INTO shopping_cart ( id_customer, number_items ) VALUES ( 3, 1 );
INSERT INTO shopping_cart ( id_customer, number_items ) VALUES ( 4, 2 );


-- Shopping cart items
-- Make a trigger: when a customer checks out, the item 
-- counter is set to 0 in the shopping_cart table
-- and are deleted from this table
INSERT INTO shopping_cart_items ( id_shopping_cart, id_item ) VALUES ( 1, 1 );
INSERT INTO shopping_cart_items ( id_shopping_cart, id_item ) VALUES ( 1, 2 );
INSERT INTO shopping_cart_items ( id_shopping_cart, id_item ) VALUES ( 1, 3 );
INSERT INTO shopping_cart_items ( id_shopping_cart, id_item ) VALUES ( 3, 4 );
INSERT INTO shopping_cart_items ( id_shopping_cart, id_item ) VALUES ( 4, 5 );