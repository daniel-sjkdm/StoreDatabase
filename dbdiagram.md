# Database diagram 
The following code is compiled at the page dbdiagram.io:

```
Table store as S {
      id smallserial pk
        name varchar(100)
          address varchar(200)
}


Table inventory as Inv {
      id smallserial pk
        id_store int [ref: > S.id]
          name varchar(50)
}


Table item as I {
      id smallserial pk
        name varchar(300)
          price decimal(10, 2)
}


Table has_item as HI {
      id_inventory int [ref: < Inv.id]
        id_item int [ref: < I.id]
}

Table customer as C {
      id smallserial pk
        first_name varchar(50)
          last_name varchar(50)
            age int 
              gender varchar(5)
                email varchar(50)
}


Table payment as P {
      id smallserial pk
        id_customer int [ref: > C.id]
          method varchar(50)
            card_number varchar(50)
}


Table shopping_cart as SC {
      id smallserial pk
        id_customer int [ref: > C.id]
          number_items int 
}


Table shopping_cart_items as SCI {
      id_shopping_cart int [ref: > SC.id]
        id_item int [ref: > I.id]
}


Table category as CA {
      id smallserial pk
        name varchar(50)
}


Table is_category as ICA {
      id smallserial pk 
        id_item int [ref: > I.id]
          id_category int [ref: > CA.id]
}
```
