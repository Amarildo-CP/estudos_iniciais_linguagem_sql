-- limit: limita a quantidade de valores
-- mostraria mto mais registros mas eu limitei pra mostrar somente 5
-- select id, first_name, email as uemail from users 
-- where id between 15 and 35 order by first_name desc limit 5 offset 0;

-- para ficar mais fácil de entender o 'offset':
-- como está zero ele vai me entregar os 2 primeiros valores 
-- select id, first_name, email as uemail from users 
-- where id between 15 and 35 order by id asc limit 2 offset 0;

-- Abaixo ele vai me entregar os 2 próximos valores a partir do segundo valor:
-- desloca o cursor 
-- select id, first_name, email as uemail from users 
-- where id between 15 and 35 order by id asc limit 2 offset 2;

-- tbm poddem vir juntos separados por ',':
-- só que é invertido, primeiro o 'offset' depois o 'limit'
select id, first_name, email as uemail from users 
where id between 15 and 35 order by id asc limit 6,3;