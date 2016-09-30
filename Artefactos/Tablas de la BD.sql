create table "user"(
  id SERIAL primary key,
  first_name varchar,
  last_name varchar,
  email varchar,
  account varchar,
  user_type INTEGER,
  "password" varchar
)

insert into "user"(first_name,last_name,email,account,user_type,"password") values('javier','marin','algo@gmail.com','paracelso',2,'contraceña')
insert into "user"(first_name,last_name,email,account,user_type,"password") values('francisco','marin','algo@gmail.com','froznar',1,'contraceña')

select * from "proveedor";
drop table "proveedor";

create table "proveedor"(
  id_proveedor SERIAL primary key,
  name_proveedor varchar
)

insert into "proveedor"(name_proveedor) values('juan');