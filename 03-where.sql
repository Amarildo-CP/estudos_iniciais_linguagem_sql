-- where para filtrar registros/valores:
-- como exemplo será usado o 'select' mas tbm serve para 'update' e 'delete'
-- quando são números podem ser mandados fora de aspas

-- vamos filtrar pelo id:
-- select * from users where id=1;

-- filtrar pelo first_name:
-- como é 'str' tem que vir entre aspas
-- select * from users where first_name= "Luis";

-- tbm posso usar operadores já conhecidos na linguagem de programação
-- nesse caso vamos selecionar pelo 'id' maior que...
-- select * from users where id > 7;

-- tbm podemos filtrar datas, todas são selecionáveis:
-- select * from users where created_at > '2026-09-21 05:30:53';

-- tbm é possível combinar coisas:
-- para isso temos que utilizar operadores lógicos (and, or)
select * from users where created_at > '2026-09-21 05:30:53' and first_name = "Maria" and password_hash = "c_hash";

-- o select é interessante pra que eu veja os registros antes de fazer algo que não tenha retorno