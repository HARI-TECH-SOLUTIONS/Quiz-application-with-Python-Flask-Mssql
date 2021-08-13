select * from t_questions
select * from t_answers
select * from QuizNames
select * from course
select * from Users


--alter table t_questions add quiz_id int foreign key references QuizNames(id);

--alter table t_answers add quiz_id int foreign key references QuizNames(id);

--alter table course 
--drop column role

--alter table t_questions add user_id int foreign key references Users(id);
--alter table t_answers add user_id int foreign key references Users(id);





UPDATE t_answers
SET user_id = '1'
WHERE quiz_id = 12;