select * from Users

select * from course

create table course(
ID int not null primary key identity(1,1),
userId int not null,
course varchar(100) not null,
role varchar(20) not null)


