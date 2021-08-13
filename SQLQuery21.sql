select * from t_questions
select * from t_answers
select * from course
select * from Users
select * from QuizNames

create table QuizNames(
id int primary key identity(1,1),
quiz_name varchar(50) not null,
course_id int foreign key references course(ID),
user_id int foreign key references Users(Id)
)



