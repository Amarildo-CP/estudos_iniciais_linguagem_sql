-- imaginar uma situação em que eu precisaria fazer esse join:

-- select u.first_name from users u where u.first_name = 'Katelyn';

-- imagine que eu tenha que atualizar o perfil de uma pessoa que tenha esse nome
-- se na tabela 'profiles' a pessoa não tiver escrito o nome em nenhuma coluna não será possível fazer essa consulta assim
-- eu precisaria fazer um 'join' com outra tabela pra conseguir atualizar esses dados por exemplo

-- select u.first_name, p.bio from users u 
-- join profiles p on p.user_id = u.id
-- where u.first_name = 'Katelyn';

-- essa consulta ficou mais complexa propositalmente porque estou em busca do nome do usuário

-- agora sabendo disso eu posso mudar a consulta (de 'select' para 'update'):
-- garantindo que esse 'where' acima esteja funcionando perfeitamente não será preciso alterar mtas coisas na consulta
-- select u.first_name, p.bio from users u 
update users as u
join profiles as p on p.user_id = u.id
set p.bio = concat(p.bio, ' atualizado')
where u.first_name = 'Katelyn';
-- todas as vezes que eu executar isso vou ter uma atualização diferente nessa palavra

-- posso voltar com o 'select' para conferir se a atualização deu certo
select u.first_name, p.bio from users u 
join profiles p on p.user_id = u.id
where u.first_name = 'Katelyn';


-- tenho o mesmo perfil que tinha anteriormente mais a palavra 'atualizado'
