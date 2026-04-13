create database teste_trigger_120;

use teste_trigger_120;

create table funcionario(
idfuncionario int primary key auto_increment,
nomefunc varchar(50) not null,
sobrenomefunc varchar(50) not null,
profissao varchar(50) not null,
salario decimal(7,2) not null

);


delimiter $$

create procedure p_inserirfunc (nfunc varchar(50), sfunc varchar(50), prof varchar(50), sal decimal(7,2))
begin
insert into funcionario values(null, nfunc, sfunc, prof, sal);
select * from funcionario;


end$$

delimiter ;

call p_inserirfunc("Jorge", "Sousa","DBA", 15000);


delimiter $$
create procedure p_excluirfunci(id int)
begin
delete from funcionario
where idfuncionario = id;

select * from funcionario;
end $$


DELIMITER ;

CALL p_excluirfunci(2);

-- criar trigger de inserir -- 

create table tg_tbinserirfunc(
idtg_tbinserirfunc int primary key auto_increment,
idfuncionario int,
nomefunc varchar(50) not null,
sobrenomefunc varchar(50) not null,
profissao varchar(50) not null,
salario decimal(7,2) not null

);

delimiter $$
create trigger tg_inserir after insert
on funcionario
for each row
begin 
insert into tg_tbinserirfunc values(null, new.idfuncionario, new.nomefunc, new.sobrenomefunc, new.profissao, new.salario);

end $$
delimiter ;

select * from tg_tbinserirfunc;
select *from funcionario;



-- criar tabela para funcionarios excluidos -- 
create table funcexcluidos(
idfuncexcluido int primary key auto_increment,
idfuncionario int,
nomefunc varchar(50) not null,
sobrenomefunc varchar(50) not null,
usuario varchar(50) not null,
data datetime not null

);

-- criar a trigger de excluir funcionarios -- 
delimiter $$
create trigger tg_excluirfunc
on
for each row
begin



end$$




delimiter ;


