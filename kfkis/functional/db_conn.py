import psycopg2
def connect_data_base(atr_name:str, table_name:str):
    conn = psycopg2.connect(dbname="kfkis", user="postgres", password="1111", host="127.0.0.1")
    cursor = conn.cursor()
    cursor.execute(str("SELECT " + atr_name + " FROM " + table_name))
    for person in cursor.fetchall():
        print(f"{person[1]}")
    cursor.close()
    conn.close() 


 
