-- Display the item's name and their respective category (many2many)
SELECT item.name AS item_name, category.name as category_name 
FROM item 
JOIN is_category ON item.id=is_category.id_item 
JOIN category ON is_category.id_category=category.id;

-- Display the items (movies) whose category is Documentary
SELECT item.name AS item_name, category.name as category_name 
FROM item 
JOIN is_category ON item.id=is_category.id_item 
JOIN category ON is_category.id_category=category.id
WHERE category.name = 'Documentary';

-- Count the items (movies) whose category is not Documentary or Drama
SELECT COUNT(*) AS not_documentary_nor_drama
FROM item 
JOIN is_category ON item.id=is_category.id_item 
JOIN category ON is_category.id_category=category.id
WHERE category.name<>'Documentary' 
    AND category.name<>'Drama';


-- Display the item name, its price, the inventory and the quantity 
-- in which they are available
SELECT item.name AS "Item name", item.price AS "Item price", inventory.name
AS "Inventory", inventory.quantity as "Quantity"
FROM item 
JOIN has_item ON has_item.item_id=item.id 
JOIN inventory ON has_item.inventory.id=inventory.id;


-- Display the customers that have added items to the shopping cart (with its elements)
SELECT customer.first_name, customer.age, item.name, item.price 
FROM customer
JOIN shopping_cart ON shopping_cart.id_customer = customer.id
JOIN shopping_cart_items ON shopping_cart_items.id_shopping_cart=shopping_cart.id
JOIN item ON shopping_cart_items.id_item = item.id;


-- Display customers first and last name with their payment method and account number
SELECT customer.first_name, customer.last_name, payment.method, payment.card_number
FROM customer
JOIN payment ON customer.id = payment.id_customer;


-- Count the number of customers that use a credit card as payment method
SELECT COUNT(*) 
FROM customer
JOIN payment ON customer.id = payment.id_customer 
WHERE payment.method = 'Credit Card';


-- Display the items inside a customer's shopping cart, only if the items are > 0
SELECT customer.first_name, item.name, item.price
FROM customer 
JOIN shopping_cart ON shopping_cart.id_customer = customer.id
JOIN shopping_cart_items ON shopping_cart_items.id_shopping_cart = shopping_cart.id
JOIN item ON item.id = shopping_cart_items.id_item;