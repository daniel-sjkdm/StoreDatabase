-- Here goes some triggers:
-- If there's an item that is out of stock, create a new table requesting more of that items


CREATE OR REPLACE FUNCTION on_add_to_shopping_cart()
    RETURNS TRIGGER
    AS 
    $$
        BEGIN
            IF inventory
        END
    $$
    LANGUAGE plpgsql;


CREATE TRIGGER add_to_shopping_car 
    BEFORE INSERT
        ON shopping_cart
            FOR EACH ROW
                EXECUTE PROCEDURE on_add_to_shopping_cart



-- When an item is deleted from the shopping_cart_items, decrement 
-- by one the counter from the shopping_cart customer's item
