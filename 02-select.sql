-- Como selecionar colunas de uma tabela
-- para selecionar todas as colunas de uma tabela
-- não é mto comum pq normalmente queremos ser específicos
-- se eu não vou usar o valor de uma coluna eu não quero o registro dela 
-- podemos usar tbm apelidos para tebelas (nesse caso 'u') fica mais simples 
-- o DBeaver pode colocar esse apelido de forma automática
-- select * from users u;

-- posso selecionar tbm a coluna específica usando o nome dessa coluna:
-- vem na ordem que eu colocar aqui na seleção e não na ordem que está lá na tabela
-- select email, id, first_name from users as u;

-- tbm posso chamar as colunas pelos apelidos:
-- a forma curta disso é sem o 'as' só colocando mesmo o apelido na frente
-- se o apelido for uma palavra tem que vir entre "apelido palavra" (não é recomendável)
-- select email as e, id as i, first_name as fn from users as u;

-- normalmente quando eu tenho 'join' (mais de uma tabela no mesmo select) eu posso ter colunas iguais
-- nesse caso é preciso especificar de qual tabela eu estou buscando determinada coluna
-- nesse caso usar os apelidos torna tudo mais simplificado
-- select users.email, users.id, users.first_name from users;

-- tbm posso mudar o nome de uma coluna para não colidir com o nome de outra coluna de outra tabela
-- depois tenho que lembrar os nomes que troquei
-- isso tbm vai mudar lá na linguagem de programação que eu estiver fazendo os códigos
-- vou ter que buscar por esses novos nomes que eu troquei
select users.email uemail, users.id uid, users.first_name ufirst_name from users;