-- a forma mais segura de usar o 'delete' é utilizando a 'pk' da tabela:
-- delete from users where id = 101;
-- vou deletar um 'id' que está entre o range abaixo selecionado

-- selecionar um 'range' de 'id': 
-- select * from users where id between 90 and 105; 
-- o que eu vejo aqui no select é o que será apagado

select * from users where id = 104;
delete from users where id = 104;
-- eu movo o 'where' do 'select' para o 'where' do 'delete'
-- esse valor é o que será apagado

-- se eu voltar com o 'between' anterior esse 'id' tbm não vai mais existir nesse 'range'
select * from users where id between 90 and 105; 
-- se eu pegar esse 'between' inteiro e mover para o 'delete' todos os registros desse range serão deletados 
delete from users where id between 90 and 105;

-- se eu voltar com o select não terá mais registros 
select * from users where id between 90 and 105; 

-- usar select para garantir que estou apagando os valores corretos