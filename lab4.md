# Лабораторная работа №4
> Цель работы: знакомство с базой данных HIVE.

## Задание 0
> Задача подготовить полигон

1. Установить на свой кластер hadoop 3.3 СУБД ``HIVE 3.1.2`` согласно [инструкции](https://cwiki.apache.org/confluence/display/Hive/GettingStarted#GettingStarted-InstallationandConfiguration) и [примеру](http://www.mtitek.com/tutorials/bigdata/hive/install.php)  
2. Войти под пользователем ``hive`` и запустить консольную утилиту ``hive``  
3. Выполнить команду ``select version();`` 
4. Записать в отчёт полученный ответ

## Задание 1
> Задача познакомиться с базовыми командами HIVE

1. Воспроизведите примеры из лекции и сохраните скрипт в свой репозиторий  
2. Воспроизведите примеры из [справки](https://cwiki.apache.org/confluence/display/Hive/GettingStarted#GettingStarted-CreatingHiveTables) раздел DDL Operations и сохраните скрипты в свой репозиторий  

## Задание 2
> Загрузка данных в HIVE 

1. Загрузите тестовый массив данных в текущую папку (файл большой и в облаке, может качаться долго). 
```
wget http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-complete.csv
```
2. С помощью команд ``head`` и ``wc -l`` изучите его содержимое  
3. Сравните содержимое файла с [описанием](https://www.gov.uk/guidance/about-the-price-paid-data) массива данных и подберите необходимые типы данных для колонок таблицы, перечень поддерживаемых типов данных приведён в [справке](https://cwiki.apache.org/confluence/display/hive/languagemanual+types)   
4. С помощью команды ``head -n`` сделайте 3 файла содержащие 100к, 1М и 10М строк.
5. Создайте тестовую таблицу при помощи кода в примере 1 и загрузите в неё данные записав в отчёт скорость записи каждого файла (для каждого следующего файла таблицу можно удалять или создавать новую с другим именем), количество строк и скорость выполнения запроса ``count(*)``.


## Задание 3
> Типизация данных в HIVE 

4. Дополнив оставшимися колонками пример ниже загрузите данные в таблицы ``HIVE``, замерьте время загрузки и запишите в отчёт  
5. В итоговой таблице должно содержаться ``16`` колонок и 26_541_204 строк.
6. Напишите запросы к загруженным данным, выполните их и запишите в отчёт: текст запроса, результат выполнения, время выполнения:  
6.1. Количество загруженных строк данных  
6.2. Средняя цена за год  
6.3 Средняя цена за год в Городе 
6.4 Самые дорогие районы  


> При выборке данных можно заметить, что загруженные данные содержат кавычки из-за этого не выполнится типизация при загрузке и при выборке будут возвращаться NULL'ы. Решить эту проблему можно любым удобным вам способом. Стандартным способом является создание таблиц с указанным [SerDe](https://cwiki.apache.org/confluence/display/hive/serde)


## Полезные ссылки
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL
https://cwiki.apache.org/confluence/display/hive/languagemanual+dml#LanguageManualDML-Loadingfilesintotables
https://cwiki.apache.org/confluence/display/Hive/Managed+vs.+External+Tables



```
----------
--пример 1
----------

--создание таблицы
CREATE TABLE price_paid (id STRING, price STRING, dt STRING) row format delimited fields terminated by ",";

--загрузка данных
LOAD DATA LOCAL INPATH 'pp-100k.csv' OVERWRITE INTO TABLE price_paid;

--выборка
SELECT count(*) FROM price_paid;

--удаление таблицы
DROP TABLE price_paid;
```


```
----------
--пример 2 (указание SerDe)
----------
CREATE TABLE price_paid2 (id STRING, price INT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar"="\"", "escapeChar"="\\")
STORED AS TEXTFILE;
```