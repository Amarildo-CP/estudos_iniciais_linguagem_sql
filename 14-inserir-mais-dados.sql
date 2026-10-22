-- inserir dados na coluna 'roles': 

-- insert into roles (name) values ('POST'), ('PUT'), ('DELETE'), ('GET');

-- o usuário que tiver a role 'POST' poderá criar coisas na api por exemplo
-- o que tiver a permissão 'PUT' poderá atualizar coisas 
-- o que tiver 'DELETE' poderá deletar 
-- o que tiver 'GET' poderá ler coisas 

-- a tabela 'users' estará atrelada a essa tabela 'roles' onde estarão essas diferentes permissões


-- agora vamos inserir dados na tabela 'users_roles':
-- normalmente eu já teria o perfil do usuário em que estou manipulando
-- a ideia é escolher um 'id' da tabela 'users' e adicionar uma função a ele através
-- de um 'id ' da tabela 'roles'

-- nesse exemplo vamos inserir os valores manualmente (facilita o entendimento da ideia)

-- insert into users_roles (user_id, role_id) values (15, 2);

-- lembrando que isso tudo foi feito pelas 'pk' de cada tabela

-- para selecionar as colunas dessa tabela 'users_roles':
-- select user_id, role_id from users_roles where user_id = 15 and role_id = 2;

-- cuidado ao selecionar somente 1 valor para a coluna porque pode ser que o mesmo usuário tenha mais de 1 permissão
-- o ideal é mesmo selecionar as 2 colunas (usuário + permissão)
-- mesmo que eu queira manipular os dados somente em 1 coluna

-- agora vamos inserir automaticamente todos os usuários dentro da tabela 'users_roles'
-- porém não tem como fazer isso sem inserir junto as 'roles' isso pq é uma 'pk' COMPOSTA
-- gera erro dizendo que se mandar o usuário sozinho não vai formar a 'pk'

-- fica um pouco mais complexa. Primeiro vamos fazer com o 'select' pra depois ver de fato com o 'insert'
-- select id from users;
-- select 1;
-- junto com o select eu posso fazer ao mesmo tempo várias coisas, até mesmo criar uma coluna
-- select id, (select 1) from users;
-- vai retornar o 'id' normal do usuário e a 'nova coluna' '(select 1)'
-- mudar o nome dessa nova coluna:
-- select id, (select 1) as qualquer from users;
-- é a criação de uma nova coluna dinâmicamente
-- nesse sentido eu quero selecionar todos os 'id' de 'users' e nesses ()
-- eu vou selecionar de forma aleatória uma 'role' qualquer
-- nesses parênteses tem que retornar somente 1 valor senão vai gerar erro

-- select id, (select id from roles) as qualquer from users;

-- o que está dentro dos () é uma 'subquery'
-- se for selecionado assim vai gerar erro de retornar mais de 1 valor (tem que estabelecer um limite de 1)
-- select id, (select id from roles limit 1) as qualquer from users;
-- todos os usuários pegam o valor que foi retornado pela subquery
-- o próximo passo é fazer com que isso seja aleatório (que a subquery retorne aleatoriamente os 'id' das 'roles')

-- select id, (select id from roles order by rand() limit 1) as qualquer from users;
-- se o 'rand()' for colocado assim (junto com o 'order by') ele vai selecionar um campo aleatoriamente dentro da tabela 'roles'
-- é só um 'select' mas dentro dele eu faço outro select

-- agora eu preciso fazer um 'insert-select'
insert into users_roles (user_id, role_id)
select id, (select id from roles order by rand() limit 1) as qualquer from users;
-- vai inserir na tabela o que o retorno desse 'select' mandar
-- lembrando que o que já tinhamos dado permissão manualmente fica com 2 permissões
-- isso caracteriza a relação de muitos para muitos
-- como essa é uma relação de muitos para muitos se eu executar mais de 1 vez mtos usuários passarão a ter mtas permissões
-- lembrando que pode gerar erro pq a 'pk' tem que ser única na base de dados e na tabela 'users_roles' são 2 valores (composta)


-- queremos ter 1 usuário com mais de 1 permissão
-- vamos pedir que o 'sql' ignore qualquer erro que ocorrer em uma consulta (só pecisa colocar o 'ignore')
insert ignore into users_roles (user_id, role_id)
select id, (select id from roles order by rand() limit 1) as qualquer from users order by rand() limit 5;
-- coloquei um limite pq não quero ter todos os usuários com o mesmo número de permissões
-- se adicionar menos que 50 quer dizer que esses registros que não entraram deram erro 
-- eu posso ir alterando o limite e executando. Dessa forma no final mtos usuários terão todas as permissões


