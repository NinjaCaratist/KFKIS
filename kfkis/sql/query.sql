-- вывести виды спорта
select sport_name from sports

-- вывести ответственных
select e.last_name, e.first_name, e.middle_name, p.position_name from employees e
inner join positions p
on p.position_id = e.position_id

-- вывести организаторов
select o.name from organaizers o

-- вывести места проведения
select place_name from places

-- вывести должности
select position_name from positions

-- вывести звания
select rank_name from ranks