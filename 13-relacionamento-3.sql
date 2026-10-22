-- left join:
-- vou considerar TODOS os registros que estão na tabela da esquerda
-- nesse caso será a tabela 'users'
-- select u.id as uid, p.id as pid, p.bio, u.first_name from users as u left join profiles p on u.id = p.user_id;


-- right join:
-- TODOS os registros da tabela 'profiles' mesmo que n exista uma relação com a tabela 'users'
-- seria necessário apagar a 'fk' que está na tabela 'profiles' pra fazer alguma diferença nos valores retornados
-- mas eu não quis apagar
-- select u.id as uid, p.id as pid, p.bio, u.first_name from users as u right join profiles p on u.id = p.user_id;


-- rand e round:
-- select rand();
-- posso multiplicar esse 'rand()' para chegar nos valores que eu quero
-- select rand() * 10000;
-- podemos tbm limitar o número de casas decimais para não ficar números mto grandes
-- select round(rand() * 10000, 2);
-- nesse caso teremos 2 casas decimais

-- vamos fazer um 'update' sem o 'where' para atualizar todos os registros da tabela 'users'
-- completando assim os salários de cada registro
update users set salary = round(rand() * 10000, 2);

-- agora com a coluna 'salary' tbm podemos selecionar coisas baseadas em valores numéricos
select salary from users where salary between 1000 and 1500 order by salary asc;