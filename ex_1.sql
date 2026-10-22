-- Insira 5 usuários:
-- quando eu utilizo somente 1 tabela não tem necessidade de usar 'alias'
-- tbm poderia ter gerado o 'password_hash' com 'round(rand())'
-- no 'DBeaver' se eu já tiver com uma coluna ordenada ele não ordena outra (primeiro eu tenho que desfazer a que já estava ordenada)
insert into users (first_name, last_name, email, password_hash) values
("Vanessa", "Gonçalves", "vg@email.com", "vg_hash"),
("Van", "Gon", "vag@email.com", "vag_hash"),
("Vane", "Gonç", "vaneg@email.com", "vaneg_hash"),
("Nessa", "Alves", "na@email.com", "na_hash"),
("Mário", "Gomes", "mg@email.com", "mg_hash");

-- tenho que fazer o 'update' da coluna 'salary' com valores aleatórios para todos os novos registros:
-- essa coluna 'salary' poderia ter sido inserida junto lá em cima mas o professor esqueceu
-- quando esquecer assim de incluir alguma coluna no 'insert' a forma mais simples é fazer um 'update'
-- geralmente pra atualizar convém colocar 'id = ' aqui estou tentando atualizar muitos 'id' ao mesmo tempo
update users set salary = round(rand() * 10000, 2) where id in (110, 111, 112, 113, 114);

-- inserir 5 perfis para os usuários inseridos:
-- vamos inserir valores em uma tabela e precisamos de valores de outra tabela 
-- ou faço pelos 'id' pegando cada 1 deles ou faço uma subquery pegando alguma coluna de valor único como referência
-- nesse caso vamos fazer usando a coluna do 'email', o email é único, cada um tem o seu, não pode repetir
-- lembrando que aqui não estou fazendo 'insert-select' pois estou mandando os 'values'
-- se eu quiser posso mandar o valor do 'id' diretamente mas o prof vai mostrar coisas novas
insert into profiles (bio, description, user_id) values 
('Uma Bio', 'Uma description', (select id from users where email = 'vg@email.com')),
('Uma Bio', 'Uma description', (select id from users where email = 'vag@email.com')),
('Uma Bio', 'Uma description', (select id from users where email = 'vaneg@email.com')),
('Uma Bio', 'Uma description', (select id from users where email = 'na@email.com')),
('Uma Bio', 'Uma description', (select id from users where email = 'mg@email.com'));
-- subquery: para cada registro 1 query será executada
-- então foi 1 consulta para inserir dados + 5 select (não é a melhr forma de fazer, foi só um exemplo)
-- como eu vou ter o 'id' do usuário em algum lugar é mais indicado mandar esse 'id'
-- pra deixar a consulta com o mínimo de complexidade possível, os valores que eu já tiver é pra já mandar 

-- inserir permissões (roles) para os usuários inseridos:
insert into users_roles (user_id, role_id) values
(
	(select id from users where email = 'vg@email.com'),
	(select id from roles where name = 'PUT')
),
(
	(select id from users where email = 'vag@email.com'),
	(select id from roles where name = 'PUT')
),
(
	(select id from users where email = 'vaneg@email.com'),
	(select id from roles where name = 'PUT')
),
(
	(select id from users where email = 'na@email.com'),
	(select id from roles where name = 'PUT')
),
(
	(select id from users where email = 'mg@email.com'),
	(select id from roles where name = 'PUT')
),
(
	(select id from users where email = 'mg@email.com'),
	(select id from roles where name = 'POST')
),
(
	(select id from users where email = 'mg@email.com'),
	(select id from roles where name = 'GET')
);

-- (110, 4), (111, 2) poderia ir fazendo assim (seria o mais recomendavel, mas o prof vai dar exemplos mais complexos)
-- o mais complexo seria tentar selecionar novamente os usuários como fizemos acima (atravéz do email). Como será feito
-- primeiro eu seleciono o 'id' através do 'email' e depois eu selecono a 'role' atravéz do 'nome'
-- será inserido 2 presmissões a mais pro último usuário (a consulta vai ficando enorme e isso não é bom em termos de desempenho)

-- Selecione os últimos 5 usuários por ordem decrescente:
select * from users order by id desc limit 5;

-- Atualizar o último usuário inserido:
-- não esquecer do 'where'
update users set first_name = 'Mário', last_name = 'Atualizado' where id = 114;

-- Remover uma permissão de algum usuário:
-- eu poderia mandar logo o 'user_id' mas será feito com um outro exemplo
-- lembrando que eu só preciso apagar 1 permissão e não todas as permissões que estarão no id com o email selecionado
-- nesse caso a permissão que eu quero apagar virá depois do 'and'
-- se eu tiver mto na dúvida eu coloco antes um 'select *' e depois posso comentá-lo e colocar no lugar o 'delete' se estiver certo
delete from users_roles where
user_id = (select id from users where email = 'mg@email.com') and 
role_id = (select id from roles where name = 'POST');

-- Remover 1 usuário que tenha a permissão 'PUT':
-- pode ser qualquer usuário que eu quiser pois não está especificado
-- para conferir primeiro eu seleciono todos que tenham a permissão 'PUT'
-- depois do 'and' eu venho com o usuário específico (com essa permissão) que eu quero deletar 
-- para 'delete' com 'joins' eu tenho que especificar de qual tabela eu quero remover (nesse caso será da tabela 'users')
-- lembrando que o 'cascade' tbm vai deletar os registros interligados nas outras tabelas
-- depois de confeiri se está certo eu só comento o 'select' e coloco o 'delete' no lugar 
-- select u.id as uid, u.first_name as ufn, r.name 
delete u
from users as u
inner join users_roles as ur on u.id = ur.user_id 
inner join roles as r on ur.role_id = r.id
where r.name = 'PUT' and u.id = 114;

-- Selecionar usuários com perfis e permissões obrigatórios:
-- como é obrigatório em todos os 'joins' eu faço 'inner join'
-- não vai aparecer nada nulo nessa consulta 
select u.id as uid, u.first_name as ufn, r.name, p.bio 
from users as u
inner join users_roles as ur on u.id = ur.user_id 
inner join roles as r on ur.role_id = r.id
inner join profiles as p on p.user_id = u.id;

-- Selecionar usuários com perfis e permissões opcionais:
-- nesse caso posso mudar tudo pra 'left join'
-- quer dizer que eu estou preocupado com a tabela 'users'
-- agora aparecem usuários com perfis nulos tbm
select u.id as uid, u.first_name as ufn, r.name, p.bio 
from users as u
left join users_roles as ur on u.id = ur.user_id 
left join roles as r on ur.role_id = r.id
left join profiles as p on p.user_id = u.id;

-- Selecionar usuários com perfis e permissões ordenando por salário:
-- não há especificações se é obrigatório ou não
-- pegar o valor antes do 'from' é só mesmo pra ser possível ver, não há necessidade
select u.id as uid, u.first_name as ufn, r.name, p.bio, u.salary 
from users as u
left join users_roles as ur on u.id = ur.user_id 
left join roles as r on ur.role_id = r.id
left join profiles as p on p.user_id = u.id
order by u.salary desc;



