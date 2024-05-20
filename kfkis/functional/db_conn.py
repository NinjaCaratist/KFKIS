import psycopg2
import pandas as pd

def connect_data_base(querry:str):
    conn = psycopg2.connect(dbname="postgres", user="postgres", password="5555", host="localhost")
    df = pd.read_sql(querry, conn)
    print(df)
    conn.close()
    return df 

connect_data_base(" SELECT * FROM events")
connect_data_base(" select sport_name from sports")
connect_data_base(" select place_name from places")
connect_data_base(""" 
                  select e.last_name, e.first_name, e.middle_name, p.position_name from employees e
inner join positions p
on p.position_id = e.position_id
""")

 
