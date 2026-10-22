-- a partir do mesmo tipo de 'select' da aula passada em que eu precise checar mais de uma tabela
-- agora quero fazer um 'delete' (tbm utilizando um 'join')
select u.first_name, p.bio from users as u 
join profiles as p on p.user_id = u.id
where u.first_name = 'Katelyn';

-- depois de fazer essa consulta preciso mudar poucas coisas pra fazer o 'delete'
-- o que eu estiver vendo a partir do 'select' é o que será apagado
-- nesse caso tenho que redobrar a atenção porque tenho a junção de 2 tabelas
delete p from users as u 
join profiles as p on p.user_id = u.id
where u.first_name = 'Katelyn';

-- se eu voltar com o 'select' ele retorna vazio (o registro foi apagado)
-- vou fazer a consulta com 'left join' pra mostrar que na tabela 'profiles' o registro vem 'null'
-- mas na tabela 'users' o registro continua lá
select u.first_name, p.bio from users as u 
left join profiles as p on p.user_id = u.id
where u.first_name = 'Katelyn';