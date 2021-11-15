//authors
//drop before firsttime init
//db.authors.drop()
db.authors.insertMany([
    {name: "Брайан Керниган"},
    {name: "Деннис Ритчи"},
    {name: "Уилсон Редмонд"},
    {name: "Josiah L Carlson"},
]);
//db.authors.find()

//books
//drop before firsttime init
//db.books.drop()
db.books.insertMany([
    {name: "Язык программирования Go", authors: [{name: "Брайан Керниган"}]},
    {name: "Язык программирования С", authors: [{name: "Брайан Керниган"},{name: "Деннис Ритчи"}]},
    {name: "Семь баз данных за семь недель", authors: [{name: "Уилсон Редмонд"}]},
    {name: "Распределенные системы", authors: [{name: "Эндрю Таненбаум"}]},
    {name: "Redis in Action", authors: [{name: "Josiah L Carlson"}]},
]);
//db.books.find()


//store
//drop before firsttime init
//db.store.drop()
db.store.insertMany([
    {book: {name: "Язык программирования Go", authors: [{name: "Брайан Керниган"}]}, count:2, received: new Date("2021-10-23")},
    {book: {name: "Язык программирования С", authors: [{name: "Брайан Керниган"},{name: "Деннис Ритчи"}]},count:10, received: new Date("2021-10-24")},
    {book: {name: "Семь баз данных за семь недель", authors: [{name: "Уилсон Редмонд"}]},count:1, received: new Date("2021-10-25")},
    {book: {name: "Распределенные системы", authors: [{name: "Эндрю Таненбаум"}]},count:100, received: new Date("2021-10-26")},
    {book: {name: "Redis in Action", authors: [{name: "Josiah L Carlson"}]},count:50, received: new Date("2021-10-27")},
    {book: {name: "Распределенные системы", authors: [{name: "Эндрю Таненбаум"}]},count:12, received: new Date("2021-10-26")},
    {book: {name: "Redis in Action", authors: [{name: "Josiah L Carlson"}]},count:23, received: new Date("2021-10-26")},
    {book: {name: "Язык программирования Go", authors: [{name: "Брайан Керниган"}]}, count:1000, received: new Date("2021-10-23")},
]);
//db.store.find()


//store
//drop before firsttime init
//db.sales.drop()
db.sales.insertMany([
    {book: {name: "Язык программирования Go", authors: [{name: "Брайан Керниган"}]}, count:6, ordered: new Date("2021-12-30")},
    {book: {name: "Язык программирования С", authors: [{name: "Брайан Керниган"},{name: "Деннис Ритчи"}]},count:8, ordered: new Date("2021-12-30")},
    {book: {name: "Redis in Action", authors: [{name: "Josiah L Carlson"}]},count:10, ordered: new Date("2021-12-31")},
]);
//db.sales.find()