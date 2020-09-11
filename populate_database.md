# Populating the database

To add records to the database I used Mockaroo page to download random data in CSV format. You can add different fields with data types
the page provide.

The following commands were run to insert:

```sql
postgres=# \c store;
postgres=# \copy customer from data/customer.csv csv header;
postgres=# \copy store from data/store.csv csv header;
postgres=# \copy item from data/item.csv csv header;
postgres=# \copy inventory from data/inventory.csv csv header;
postgres=# \copy payment from data/inventory.csv csv header;
-- Add this manually
postgres=# \copy has_item from data/has_item.csv csv header;
postgres=# \copy shopping_cart from data/shopping_cart.csv csv header;
postgres=# \copy shopping_cart_items from data/shopping_cart_items.csv csv header;
```

Tables: 
- [X] customer
- [X] store
- [X] item
- [X] inventory
- [X] payment
- [ ] has\_item
- [ ] shopping\_cart
- [ ] shopping\_cart\_items
- [x] is\_category
- [X] category
