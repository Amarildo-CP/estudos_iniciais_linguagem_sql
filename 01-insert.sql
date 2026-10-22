-- quando não está definida uma base de dados padrão eu tenho que por o nome da bdd que eu quero
use base_de_dados;
-- para ver as tabelas que existem na minha base de dados:
show tables;
-- para saber as descrições de uma tabela específica (campos, nomes de colunas...)
describe users;
-- inserir registros na bdd:
-- seleciona a tabela e entre () informa as colunas que eu quero mandar valores e manda os valores de cada coluna entre ""
-- se inverter a ordem das colunas que estão na tabela tbm tem que inverter os valores que serão inseridos
insert into users (first_name, last_name, email, password_hash) values ("Luiz", "Miranda", "luis@email.com", "b_hash" ),
("Maria", "Miranda", "maria@email.com", "c_hash" ),
("Helena", "Mi", "hel@email.com", "d_hash" );
-- para criar vários registros de uma só vez temos que colocar uma ',' e reperitr os valores 
-- posso mandar quantas vezes eu quiser de uma só vez