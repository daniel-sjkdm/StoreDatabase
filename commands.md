# Commands for postgresql 

### Login to psql

When there's no password set
```bash
$ sudo -i -u postgres
```

Using password
```bash
$ psql -h <host> -p <port> -U <user> -d <database>
```


### Set a password (existing user)

To set a password to the postgres user
```sql
postgres=# ALTER USER postgres PASSWORD '<password>'; 
```



### Create a user 

```sql
postgres=# CREATE USER <name> WITH ENCRYPTED PASSWORD '<password>';
```


### Run commands form a file 

Inside psql
```sql
postgres=#
```

Outside psql 
```bash
$ psql -h <host> -p <port> -U <user> -d <database> -a -q -f <path_to_file>
```

Where the _path_ can be relative to the directory where _psql_ was called or absolute.
