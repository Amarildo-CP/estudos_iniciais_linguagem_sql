-- selecionar mtas tabelas diferentes ao mesmo tempo:
-- select * from users as u;
select u.id as uid, u.first_name, p.bio, r.name as role_name from users as u
left join profiles as p on u.id = p.user_id
inner join users_roles as ur on u.id = ur.user_id
inner join roles as r on ur.role_id = r.id
where u.id = 9
order by uid asc;
-- como eu tenho certeza de que nenhuma dessas outras tabelas tem a coluna 'first_name'
-- não peciso ser tão especifico usando o 'alias' dessa coluna
-- a coluna 'bio' tbm não existe em outra tabela dessas que estamos trabalhando
-- a partir do momento em que eu começo a usar 'alias' eu posso usá-lo em outros locais da consulta (facilita)
-- essa consulta já funciona mas fica parecendo que temos mtos valores repetidos (mas não é isso)

-- depois de ter feito isso eu posso selecionar um registro específico da tabela 'users_roles'
-- vou usar a coluna 'role_id' da tabela 'users_roles' pegando a coluna 'nome' da tabela 'roles'

-- agora quero ordernar os registros pelo 'id' do usuário
-- o que parecer repetir quer dizer que o mesmo usuário pode ter mais de uma permissão

-- na linguagem de programação vou ter que fazer essa junção de valores no meu objeto final
-- vou mapear esse tipo de resultado pra algum objeto na programação

-- depois de ter feito tudo isso eu posso ir selecionando registros específicos para consultar (where, limit, set...)