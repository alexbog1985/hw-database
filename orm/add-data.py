import json
import sqlalchemy
from sqlalchemy.orm import sessionmaker


import secret
from models import Publisher, Shop, Book, Stock, Sale

DSN = secret.DSN
engine = sqlalchemy.create_engine(DSN)

Session = sessionmaker(bind=engine)
session = Session()

with open('fixtures/tests_data.json', 'r') as f:
    data = json.load(f)

for record in data:
    model = {
        'publisher': Publisher,
        'shop': Shop,
        'book': Book,
        'stock': Stock,
        'sale': Sale,
    }[record.get('model')]
    session.add(model(id=record.get('pk'), **record.get('fields')))
session.commit()
