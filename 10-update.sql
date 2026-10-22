-- atualizar dados na base de dados 
-- update users set first_name = 'Luiz', last_name = 'Miranda' where id = 38;

-- conferir se é realmente o registro que eu quero alterar 
-- sempre bom primeiro selecionar os registros 
-- select * from users where id = 38;


-- se eu mandar um 'where' assim pro 'update' eu vou atualizar 3 registros de uma só vez
-- com os mesmos valores
select * from users where id between 50 and 80;