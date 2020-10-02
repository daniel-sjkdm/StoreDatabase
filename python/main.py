from PGConn import PGConn
import click



@click.group()
@click.pass_context
def main(ctx):
    ctx.ensure_object(dict)


@main.command()
@click.option(
    "-t",
    "--table",
    help="Insert a row to the given table",
    required=True,
)
@click.argument(
    "data",
    nargs=-1,
    required=True
)
@click.pass_context
def insert(ctx, table, data):
    """
        Insert a row to the database
    """
    pgpy = ctx.obj.get("pgpy")
    if table == "customer":
        print(data)
        pgpy.insert_customer_sp(data)
        
    else:
        pgpy.insert_row("store", data)



@main.command()
@click.option(
    "-t",
    "--table",
    help="Table to display from database",
   required=True 
)
@click.pass_context
# WORKS
def display(ctx, table):
    """
        Display the data of the given table
    """
    pgpy = ctx.obj.get("pgpy")
    rows = pgpy.get_table_rows(table)
    for row in rows:
        print(row)


@main.command()
@click.argument(
    "query",
    nargs=1,
    required=True
)
@click.pass_context
# WORKS
def exec(ctx, query):
    """
        Execute the query written (must be quoted \"\")
    """
    pgpy = ctx.obj.get("pgpy")
    pgpy.exec_query(query)
    

if __name__ == "__main__":
    main(obj={
        "pgpy": PGConn()
    })
