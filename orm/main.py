import sqlalchemy as sq
from sqlalchemy.orm import sessionmaker

import secret
from models import create_tables, Publisher, Book, Shop, Stock, Sale


DSN = secret.DSN
engine = sq.create_engine(DSN)

create_tables(engine)

Session = sessionmaker(bind=engine)
session = Session()


class FindData:
    publisher = input('Введите имя автора, например O\'Reilly: ')  # O’Reilly
    q = (session.query(Book, Publisher, Shop, Stock, Sale)
         .join(Book, Book.id_publisher == Publisher.id)
         .join(Stock, Stock.id_book == Book.id)
         .join(Shop, Shop.id == Stock.id_shop)
         .join(Sale, Sale.id_stock == Stock.id)
         .filter(Publisher.name == publisher)
    )

    for b, p, s, st, sa in q.all():
        print(f'{b.title.ljust(40)} | {s.name.ljust(15)} | {str(sa.price).ljust(8)} | {sa.date_sale.strftime("%d-%m-%Y")}')


FindData()
session.close()