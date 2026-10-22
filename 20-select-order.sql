-- tudo o que foi visto até aqui:
select id, first_name, email as uemail from users where id between 20 and 35
order by id asc, first_name  desc;
-- ordenar pela coluna 'created_at' de forma crescente
-- se eu não tivesse selecionado o 'id' lá em cima ele funcionaria da mesma forma
-- só não retornaria o valor do 'id'. Mas iria ordená-lo do mesmo jeito
-- posso ordenar mais de uma coluna em ordens diferentes ao mesmo tempo
-- a primeira coluna que vem será a principal, por isso a ordem que eu colocar na seleção afeta o resultado
-- quando der conflito ele vai priorizar a primeira coluna que eu enviei para ordenar 
-- na maioria dos casos vou utilizar somente 1 coluna para ordenar 