-- agregação:
-- imagine que eu queira saber qual o maior/menor/média/soma salário de uma tabela
-- lembrando que o 'count(salary)' vai retornar o número de registros que existe na tabela
-- podemos analisar por exemplo os 3 últimos meses de salários de um funcionário e fazer uma média salarial 
select 
max(salary) as max_salary, 
min(salary) as min_salary,
avg(salary) as average_salary,
sum(salary) as sum_salary,
count(salary) as count_salary
from users
where first_name = 'Luiz';
-- o 'where' vai indicar exatamente o registro que eu quero analisar, toda o restante da consulta fica em função desse 'where'


-- essas funções tbm seriam possíveis de serem utilizadas quando eu tenho um 'group by' com mais de 1 registro
-- só conseguimos fazer essa agregação de mais de 1 registro por causa do 'group by'
-- lembrando que só vai dar certo se todas as colunas selecionadas puderem ser agregadas
-- a coluna de 'id' por exemplo não pode ser agregada porque é único para cada registro
select 
u.first_name,
max(u.salary) as max_salary, 
min(u.salary) as min_salary,
avg(u.salary) as average_salary,
sum(u.salary) as sum_salary,
count(u.id) as total
from users u 
left join profiles as p on p.user_id = u.id
where u.id in (31, 33)
group by first_name
order by total desc
limit 5;


-- se tirar o 'where' e o 'limit' conseguimos ver esses resultados de toda a tabela
-- lembrando que os que tem somente 1 registro não faz mto sentido essa consulta
select 
u.first_name,
max(u.salary) as max_salary, 
min(u.salary) as min_salary,
avg(u.salary) as average_salary,
sum(u.salary) as sum_salary,
count(u.id) as total
from users u 
left join profiles as p on p.user_id = u.id
group by first_name
order by total desc;
