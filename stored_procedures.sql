-- Procedures 
-- Definition:
-- A set of commands executed in sequential order
-- 
-- A procedure doesn't return a value
-- Transaction: 
-- 
-- Inside a procedure a transaction can be commited 
-- or rolled back 
-- Calling: To run a stored procedure you use the CALL reserved keyword
-- Display existing stored procedures
-- CALL <stored_procedure_name>



-- Create a customer
CREATE OR REPLACE PROCEDURE create_customer (
    "first_name" VARCHAR(50), 
    "last_name" VARCHAR(50), 
    "age" INTEGER,
    "gender" PERSON_GENDER,
    "email" VARCHAR(50)
)
LANGUAGE plpgsql
AS 
$$
    BEGIN 
        INSERT INTO customer (first_name, last_name, age, gender, email) 
        VALUES ("first_name", "last_name", "age", "gender", "email");
        RAISE NOTICE 'A new customer with name % was added at %', "first_name", now();
    END 
$$;


-- Creating a customer 
-- CALL create_customer('Wong', 'Dojo', 77, 'Male', 'wongdoj@gmail.com');
-- CALL create_customer('Yukihiro', 'Nakamoto', 33, 'Male', 'nakamoto@gmail.com');


-- Display Items with for loop
CREATE OR REPLACE PROCEDURE list_items ()
LANGUAGE plpgsql 
AS 
$$
    DECLARE 
        item_record RECORD;
    BEGIN
        FOR item_record IN (SELECT id, name, brand, price FROM item ORDER BY price) 
            LOOP
                RAISE NOTICE 'ID: %, Name: %, Brand: %, Price: %', item_record.id, item_record.name, item_record.brand, item_record.price;
            END LOOP;
    END
$$;