# Лабораторная работа №3
> Цель работы: знакомство MapReduce.

## Задание 0
> Проверка полигона

1. Открыть презентацию по ``HIVE`` и повторить команды со слайдов про ``Mapreduce\YARN``
2. Выполнить пример расчёта ``pi`` с числом сэмплов 1М.
3. Записать в отчёт полученное значение

## Задание 1
> Выполнить MR задачу с записью данных в HDFS

1. Прочитайте описание примера  [wordcount](https://hadoop.apache.org/docs/stable/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html)
2. Подготовьте тестовые папки в HDFS для запуска задачи и положите в папку input любой текстовый файл для анализа  
2.1. ``hadoop fs -mkdir -p /user/hadoop/wordcount/input``  
2.2. ``hadoop fs -mkdir -p /user/hadoop/wordcount/output``  
2.3. ``hadoop fs -put ВАШ_ФАЙЛ /user/hadoop/wordcount/input``  
3. Запустите пример ``wordcount`` по аналогии с примером выше.  
4. После завершения просмотрите результаты в папке output и в отчёт включите несколько первых строк 
из файла результата (обычно называется part-r-00000)  




## Полезные ссылки
https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/FileSystemShell.html#mkdir
https://hadoop.apache.org/docs/stable/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html
https://www.bigdataschool.ru/wiki/mapreduce