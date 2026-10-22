-- a relação da aula passada é um 'inner join'
-- delete from profiles where id between 268 and 270;
-- esse registros que foram apagados não vão mais aparecer nessa consulta 'inner join'
-- select u.id as uid, p.id as pid, p.bio, u.first_name from users as u, profiles as p where u.id = p.user_id ;

-- vamos fazer agora uma outra consulta
-- no 'select' os campos ficarão iguais 
-- 'on' pra falar qual campo é que faz essa relação
-- select u.id as uid, p.id as pid, p.bio, u.first_name from users as u inner join profiles p on u.id = p.user_id;
-- é a mesma coisa feita na aula passada porém escrito de maneira diferente 
-- se for executado não muda nada de uma consulta para a outra 

-- tbm posso utilizar junto com o 'inner join' tudo o que foi visto nas aulas anteriores
select u.id as uid, p.id as pid, p.bio, u.first_name from users as u inner join profiles p on u.id = p.user_id
where u.first_name like '%a' order by u.first_name desc limit 10;
-- nesse caso só vai retornar os que terminam com 'a' ordenados de forma decrescente limitando 10 registros