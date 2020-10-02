# StoreDatabase
A database for a store created in postgresql using the basics and advanced features




### Run a sql script 

Inside the shell:

```
postgres=# 
```

In the command line (bash/zsh):

```
$ psql -h <host> -p <port> -U <user> -d <database> -a -f <file>
```

### Export to csv file

Copy all the fields:

```
postgres=# COPY <table> TO '<path_to_csv.csv>' DELIMITER '<delimiter>' CSV HEADER; 
```

Copy some fields:

```
postgres=# COPY <table> (field1, field2, ..., fieldN) TO '<path_to_csv.csv>' DELIMITER '<delimiter>' CSV HEADER;
```

Copy command (must have privileges). This commands runs the same COPY statement and transfers data from the server to the local filesystem.

```
postgres=# \copy <query> TO <path_to_csv.csv> WITH csv; 
```


### Import from csv file



### Tools I used to build this

[Mockaroo](https://mockaroo.com/)
[dbdiagram](https://dbdiagram.io/home)
