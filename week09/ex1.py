import geopy
from geopy.geocoders import Nominatim
import psycopg2

con = psycopg2.connect(
        host="127.0.0.1",
        database="dvdrental",
        user="postgres",
        password="5msjails"
    )  

cur = con.cursor()
cur.execute(
    '''
    ALTER TABLE address
    ADD COLUMN IF NOT EXISTS longitude float8,
    ADD COLUMN IF NOT EXISTS latitude float8;
    '''
)

con.commit()
cur.callproc('get_address')
rows = cur.fetchall()
geolocator = Nominatim(user_agent="con")


for row in rows:
    latitude, longitude = 0.0, 0.0
    try:
        location = geolocator.geocode(row[0], timeout=200)
        if location is not None:
            latitude = location.latitude
            longitude = location.longitude

        print(row[0], latitude, longitude)
    
    except:
        print(row[0], "error")
        cur.execute(
            '''
            UPDATE address
            SET latitude = %s,
                longitude = %s
            WHERE address.address = %s;
            ''',
            (latitude, longitude, row[0])
    )
    con.commit()

cur.close()
con.close()
