--1
--a
create function inc(val integer) returns integer
    language plpgsql
as
$$
BEGIN RETURN val + 1; END;
$$;

SELECT * FROM inc(5);

--b
create function sum(val integer,val2 integer) returns integer
    language plpgsql
as
$$
BEGIN RETURN val + val2; END;
$$;

SELECT * FROM sum(5,6);
--c

create function check_divas(num numeric) returns BOOLEAN
    language plpgsql
as
$$
BEGIN
    IF ( num%2=0)

        then return true;
    else
        return false;
     END IF;

END;
$$;

SELECT * FROM check_divas(7);

--d
create function check_pass(pass text) returns BOOLEAN
    language plpgsql
as
$$
BEGIN
    IF (length(pass) > 10)

        then return true;
    else
        return false;
     END IF;

END;
$$;

SELECT * FROM check_pass('qwertyuioqq');

--e
create or replace function splitting(text varchar(30)) returns record
    language plpgsql
as
$$
declare text1 record;
begin
    select split_part(text, ',', 1) ,
           split_part(text, ',', 2)
           into text1;
    return text1;
end;
$$;
select * from splitting('')


--2
--a
create table change_time(
    times timestamp
);
create table queries(
    operation varchar
);
create or replace function curr_time() returns trigger
   as $$
   begin
       insert into change_time values(now());
       return new;
   end;
   $$ language plpgsql;
create trigger process_time before insert or update or delete on queries
    for each statement execute procedure curr_time();

insert into queries values('insert');
update queries set operation = 'update' where operation='insert';
select * from change_time;
--b
create table persons(
    name varchar,
    year_birth integer
);
create table ages(
    name varchar,
    age integer
);
create or replace function solve() returns trigger
 as $$
   begin

       insert into ages values(new.name,2021-new.year_birth);
       return new;
   end;
   $$ language plpgsql;
create trigger tr_pers after insert on persons
    for each row execute procedure solve();

insert into persons values ('Talik',2002);
insert into persons values ('Alan',1997);
insert into persons values ('Rauar',2001);
insert into persons values ('Baur',1999);
select * from ages;

-- c
CREATE table foods(
    id integer primary key,
    name varchar(80),
    price integer
);

create or replace FUNCTION total()
returns trigger
    language plpgsql
    as

    $$
        BEGIN
            update foods
            set price=price+0.12*price
            where id = new.id;
            return new;
        end;
    $$;


create trigger cost after insert on foods
    for each row execute procedure total();
insert into foods(id, name,price) values (1, 'wood', 50);
insert into foods(id,name,price) values (3, 'stone', 25);

-- d
create or replace function reset() returns trigger language plpgsql
    as $$
    begin
        insert into foods(id,name,price) values(old.id,old.name,old.price);
        return old;
    end;
    $$;

create trigger back
    after delete
    on foods
    for each row
    execute procedure reset();
delete from foods where id=2;
select * from foods;

--3
-- The function must return a value but in Stored Procedure it is optional. Even a procedure can return zero or n values.
--
-- Functions can have only input parameters for it whereas Procedures can have input or output parameters.
--
-- Functions can be called from Procedure whereas Procedures cannot be called from a Function.

--4
Create table employee(
    id int primary key,
    name varchar(120),
    date_of_birth date,
    age int,
    salary int,
    workexperience int,
    discount int);


CREATE or replace procedure salary()
language plpgsql
    as
$$
    Begin
        update employee
        set salary = ( workexperience/2)*0.1*salary+salary,
            discount = ( workexperience/2)*0.1*employee.discount + employee.discount,
            discount = ( workexperience/5)*0.01 * employee.discount + employee.discount;
        commit;
    end;
    $$;


-- b
create or replace procedure sal()
language plpgsql
as
    $$
        BEGIN
            update employee
            set salary = salary*1.15
            where age > 40;
            update employee
            set salary = salary*1.15*( workexperience/8);
            update employee
            set discount = 20 where  workexperience > 8;
            commit;
        end;
    $$;


