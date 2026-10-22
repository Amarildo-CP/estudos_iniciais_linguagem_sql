-- select between
-- selecionar por exemplo um intervalo entre datas
-- select * from users where created_at >= '2020-02-11 13:43:09' and created_at <= '2020-03-15 04:05:58';

-- uma outra forma de fazer essa mesma seleção é usando 'between':
-- select * from users where created_at between '2020-02-11 13:43:09' and '2020-03-15 04:05:58';

-- ainda é possível ser mais específico com relação à hora:
-- pode fazer diferença nos registros que entram ou saem
-- select * from users where created_at between '2020-02-11 00:00:00' and '2020-03-15 23:59:59';

-- tbm podemos selecionar pelo 'id':
select * from users where created_at between '2020-02-11 00:00:00' and '2020-03-15 23:59:59' and id between 40 and 64;
