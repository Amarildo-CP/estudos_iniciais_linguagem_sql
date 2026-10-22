-- seleciona valores parecidos com o que eu enviar
-- não é possível usar nenhum operador de comparação 
-- por isso usamos 'like' que vai selecionar um trecho do texto
-- eu não me importo com nenhum caractere que vem ANTES do que eu especificar
-- no caso abaixo ele vai selecionar tudo o que tiver 'qualquer coisa' e que termine com 'a'
-- select * from users where first_name like '%a';

-- tbm posso selecionar não me preocupando com o que virá DEPOIS do que for selecionado
-- basicamente serão nomes que comecem com 'h' nesse caso
-- select * from users where first_name like 'h%';

-- posso selecionar letras de início e de fim tendo qualquer coisa no meio da palavra
-- select * from users where first_name like 'he%a';

-- é possível selecionar se no meio da palavra tem o que eu quero
-- dessa forma eu não me importo com nada que venha no começo e nem no final da palavra
-- select * from users where first_name like '%mo%';

-- 'qualquer coisa' tbm pode representar 'nada' 

-- o '_' pode ser utilizado como referência a apenas 1 caractere
-- a cada '_' que eu colocar ele substitui 1 caractere
-- select * from users where first_name like 'j_co_';
-- aqui ele vai encontrar palavras que tenham exatamente 5 caracteres
-- select * from users where first_name like '_____';
select * from users where first_name like '%ma%_';