import os
import click
import psycopg2
from psycopg2 import sql
from pprint import pprint
from dotenv import load_dotenv
from get_creds import creds


class PGConn:
    def __init__(self):
        self.config = creds()
        self.conn = psycopg2.connect(
            dbname = self.config.get("PGDATABASE"),
            user = self.config.get("PGUSER"),
            password = self.config.get("PGPASSWORD"),
            port = self.config.get("PGPORT"),
            host = self.config.get("PGHOST")
        )
        self.cur = self.conn.cursor()


    def get_table_rows(self, table):
        try:
            self.cur.execute(
                sql.SQL("SELECT * FROM {};").format(sql.Identifier(table)))
            rows = self.cur.fetchall()
            return rows
        except psycopg2.errors.UndefinedTable:
            click.secho("The table {} does not exist".format(table), fg="red")


    def insert_customer(self, first_name, last_name, age, gender, email):
        """
            Insert a customer with INSERT INTO statement
        """
        self.cur.execute("""
            INSERT INTO customer (first_name, last_name, age, gender, email) VALUES (%s, %s, %s, %s, %s)
        """, (first_name, last_name, age, gender, email))
        self.conn.commit()


    def insert_customer_sp(self, values):
        """
            Insert a customer to the table using
            a stored procedure
        """
        self.cur.execute("CALL create_customer(%s, %s, %s, %s, %s);", (tuple(values)))
        self.conn.commit()


    def insert_row(self, table, data):
        try:
            print(data)
            print(type(data))
            sql_query = sql.SQL("INSERT INTO {} VALUES ({})".format(sql.Identifier(table), ("%s,"*len(data)).rstrip(",")), ["test", "test"])
            print(sql_query)
            self.cur.execute(sql_query)
            self.conn.commit()
        except:
            click.secho("Invalid table/data", fg="red")

    
    def exec_query(self, query):
        """
            Execute the given query
        """
        try:
            self.cur.execute(query)
            try:
                rows = self.cur.fetchall()
                pprint(rows)
            except:
                pass
        except:
            click.secho("Invalid query!", fg="red")


    def kill(self):
        self.cur.close()
        self.conn.close()
