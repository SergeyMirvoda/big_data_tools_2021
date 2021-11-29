create table if not exists author
(
	name text,
	id integer primary key
);

create table if not exists book
(
	id integer primary key,
	name text
);

create table if not exists books_by_authors
(
    id integer primary key,
	bid integer references book,
	aid integer references author
);

create table store
(
	id int primary key,
	bookId int references book,
	qty int,
	received timestamp
);

create table sales
(
	id int primary key,
	bookId int references book,
	qty int,
	ordered timestamp
);

--Заполение данными
insert into author values (1, 'Брайан Керниган'),
                          (2,'Деннис Ритчи'),
                          (3,'Уилсон Редмонд'),
                          (4,'Эндрю Таненбаум'),
                          (5,'Josiah L Carlson');
--book
insert into book values (10, 'Язык программирования Go'),
                        (20,'Язык программирования С'),
                        (30,'Семь баз данных за семь недель'),
                        (40,'Распределенные системы'),
                        (50,'Redis in Action');
--авторство
insert into books_by_authors(id, bid, aid) values (1000,10,1), (2000,20,1),(3000,20,2),(4000,30,3),(5000,40, 4),(6000,50, 5);

--склад и продажи
insert into store(id, bookId, qty, received) values (1,10,2,'2021-10-23'),(2, 20, 10, '2021-10-23');
insert into sales(id, bookId, qty, ordered) values  (1,10,6,'2021-12-30'),(2, 20, 8, '2021-12-30'),(3, 50, 10, '2021-12-31');

--выборка книги
select b.name as bokname,count(a.name), string_agg(a.name,',') --, a.name as authorname
from books_by_authors ab
join author a on ab.aid = a.id
join book b on ab.bid = b.id
group by b.name;

--выборка склада
select b.name, qty, received from store
join book b on bookId = b.id;

--выборка продаж
select b.name, qty, ordered from sales
join book b on bookId = b.id;

show search_path

select b.name, t.qty as input, s.qty as output
from store t
left join sales s on s.bookId = t.bookid
left join book b on b.id = s.bookid