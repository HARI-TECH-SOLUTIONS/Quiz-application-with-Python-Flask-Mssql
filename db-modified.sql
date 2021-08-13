create table t_questions(
id int primary key identity(1,1),
question varchar(100)
)

create table t_answers(
id int primary key identity(1,1),
answer varchar(100)
)


select * from t_questions
select * from t_answers

alter table t_questions add course_id int

alter table t_answers add correct_ans bit 

alter table t_answers add q_id int foreign key references t_questions(id)

declare @question varchar(100) = 'what is a texxt';

insert into t_questions values(
@question)

declare @q_id int ;

set @q_id = (select id from t_questions where question = @question);

insert into t_answers values ('hypertext transfer', 1, @q_id)
insert into t_answers values ('programming language', 0, @q_id)
insert into t_answers values ('social studies', 0, @q_id)
insert into t_answers values ('Biology', 0, @q_id)


select * from course
select * from Questions
select * from options


select * from t_questions
select * from t_answers