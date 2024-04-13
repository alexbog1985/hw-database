import sqlalchemy as sq
from sqlalchemy.orm import sessionmaker

import secret
from models import create_tables, Publisher, Book, Shop, Stock, Sale

DSN = secret.DSN
engine = sq.create_engine(DSN)

create_tables(engine)

Session = sessionmaker(bind=engine)
session = Session()

session.close()
