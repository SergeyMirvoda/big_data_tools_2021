#authors
#
HSET authors:1 name "Брайан Керниган"
HSET authors:2 name "Деннис Ритчи"
HSET authors:3 name "Уилсон Редмонд"
HSET authors:4 name "Josiah L Carlson"
// SCAN 0 MATCH "authors:?" COUNT 100

HSET books:1 name "Язык программирования Go"
SADD books:1:authors authors:1
HSET books:2 name "Язык программирования C"
SADD books:2:authors authors:1
SADD books:2:authors authors:2
#SMEMBERS books:2:authors HGETALL "authors:1"

