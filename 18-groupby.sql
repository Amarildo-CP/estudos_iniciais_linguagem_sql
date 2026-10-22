-- quando eu tenho registros repetidos eu posso agrupar esses registros 
-- e utilizar uma função de agregação pra contar esses valores

-- select id, first_name from users as u 
-- group by first_name 
-- order by first_name asc;

-- não posso agrupar valores iguais com 'id'/campo diferentes por exemplo, gera erro

-- no 'select' eu tenho que ter mesmo somente os valores que serão agrupados
-- tenho que tirar os campos com valores diferentes 
select first_name from users as u 
group by first_name 
order by first_name asc;
-- ele agrupa todos os 'first_name' que tem valores iguais mas não da pra ver
-- porque não usamos uma função de agregação
select first_name, count(id) as total from users as u 
group by first_name 
order by total desc;
-- vai retornar o número de repetições de cada registro salvos em uma 'nova coluna'

select u.first_name, count(u.id) as total from users u 
left join profiles as p on p.user_id = u.id
where u.id in (31, 33)
group by first_name
order by total desc
limit 5;
-- lembrando que apesar de estarmos fazendo um 'group by' só existe 1 'id' pra cada registro