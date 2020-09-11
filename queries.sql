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
