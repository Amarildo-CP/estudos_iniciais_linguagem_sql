-- selecionar elementos entre os valores enviados 

-- nesse caso vai trazer os 3 'id'
-- escrever assim se for um array de 'id' mto grande pode ser mto complexo
-- select * from users where id= 15 or id= 20 or id= 25;

-- nesse caso podemos usar o operador 'in'
-- a consulta tem que estar entre os números que estou buscando 
-- não precisa necessariamente ter todos, mas os que existirem vão aparecer
-- select * from users where id in (15, 20, 25, 1000, 1200);

-- posso combinar com operadores lógicos tbm:
select * from users where id in (15, 20, 25, 1000, 1200) and first_name  in ('Benjamin', 'Shana');
