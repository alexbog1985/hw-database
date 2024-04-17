import sqlalchemy as sq
from sqlalchemy.orm import sessionmaker

from add_data import add_data
from models import create_tables, Publisher, Book, Shop, Stock, Sale


DSN = 'postgresql://netology:netology@localhost:54320/netology_db'
engine = sq.create_engine(DSN)

create_tables(engine)

Session = sessionmaker(bind=engine)
session = Session()
add_data(session)


def get_shops(publ):
    q = session.query(
        Book,
        Publisher,
        Shop,
        Stock,
        Sale
    ).select_from(Shop).\
        join(Stock).\
        join(Book).\
        join(Publisher).\
        join(Sale)
    if publ.isdigit():
        result = q.filter(Publisher.id == int(publ))
    else:
        result = q.filter(Publisher.name == publ)
    for b, p, s, st, sa in result:
        print(f'{b.title: <40} | {s.name: <10} | {str(sa.price): <8} | {sa.date_sale.strftime("%d-%m-%Y")}')


session.close()

if __name__ == '__main__':
    publisher = input('Введите имя автора, например O\'Reilly: ')  # O’Reilly
    get_shops(publisher)
