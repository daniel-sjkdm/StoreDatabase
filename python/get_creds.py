import os
from dotenv import load_dotenv



def creds():
    load_dotenv()
    PGDATABASE = os.getenv("PGDATABASE")
    PGHOST = os.getenv("PGHOST")
    PGPORT = os.getenv("PGPORT")
    PGUSER = os.getenv("PGUSER")
    PGPASSWORD = os.getenv("PGPASSWORD")
    return { 
            "PGDATABASE": PGDATABASE,
            "PGHOST": PGHOST,
            "PGPORT": PGPORT, 
            "PGUSER": PGUSER,
            "PGPASSWORD": PGPASSWORD
    }
