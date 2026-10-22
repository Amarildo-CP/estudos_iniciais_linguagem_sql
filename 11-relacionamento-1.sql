-- selecionar valores de 2 tabelas diferentes

-- select * from users as u, profiles as p;
-- se eu executar essa consulta vai me trazer todos os campos de todas as tabelas selecionadas
-- nesse caso daria problemas na linguagem de programação porque me retornaria uma grande tabela com 
-- 2 colunas 'id' o que não pode acontecer

-- agora vou selecionar somente as colunas 'id' dessas 2 tabelas
-- para visualizar um comportamento estranho se fizermos a junção dessa forma
-- select u.id, p.id from users as u, profiles as p;
-- dessa forma continuo tendo 2 colunas com nomes iguais (não pode ser assim)

-- para corrigir o erro acima temos que selecionar mudando o nome das colunas:
-- select u.id as uid, p.id as pid from users as u, profiles as p;
-- dessa forma a base de dados faz um produto carteziano sobre os dados 
-- para cada perfil a tabela vai mostrar todos os usuários
-- dessa forma teríamos dados incorretos (todos os usuários tem relacionamento com todos os perfis)

-- temos que pensar em qual a relação REAL entre as 2 tabelas (users e profile)
-- essa relação está na 'fk'
-- select u.id as uid, p.id as pid from users as u, profiles as p where u.id = p.user_id ;
-- para deixar os dados consistentes colocamos essa relação do 'fk' em um 'where'

-- podemos selecionar mais coisas
select u.id as uid, p.id as pid, p.bio, u.first_name from users as u, profiles as p where u.id = p.user_id ;