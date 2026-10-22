-- insere valores em uma tabela usando outra 
-- se fizer somente assim já funciona, ele seleciona um valor 
-- select 1;

-- para selecionar um valor como coluna:
-- select 1 as coluna;

-- agora posso mandar valores aleatórios para o 'select':
-- isso vai gerando uma tabela com valores aleatórios que vou mandando 1 a 1
-- select 1 as coluna, 'qualquer' as col2;

-- vamos usar isso como base para inserir esse valores:
-- o 'id' da tabela 'profiles' não preciso inserir pq é auto-increment
-- a diferença é que agora o que vem depois do insert não será o 'VALUES' mas sim o 'SELECT'
-- vou fazer um 'insert' baseado em um 'select'
-- vamos inserir valores aleatórios somente pra testar e exemplificar 
-- insert into profiles (bio, description, user_id)
-- select 1, 2, 103;
-- delete from profiles;
-- para deletar os valores da tabela que foram usados para exemplo:
-- por isso vamos fazer um 'delete' sem 'where', o que no dia a dia deve ser evitado
-- apaga tudo o que estava na tabela mas não zera os 'id'
-- nunca executar isso em uma tabela realmente em produção

-- agora vamos fazer o mesmo insert selecionando valores reais da tabela 'users':
-- insert into profiles (bio, description, user_id)
-- select 'bio', 'description', id from users;
-- delete from profiles;
-- esse 'insert' fará como se fosse um 'for' na tabela 'users'
-- para todos os usuários ele vai inserir 'bio', 'description', id
-- o 'id' fica no 'user_id' o que não há conexão somente reescreve

-- vamos fazer agora uma concatenção pra completar os valores que faltam:
insert into profiles (bio, description, user_id)
select concat('Bio de ', first_name), concat('Description de ', first_name), id from users;
