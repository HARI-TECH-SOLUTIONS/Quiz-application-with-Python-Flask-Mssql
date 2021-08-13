
--This is the connection string and import statements in db file
--_______________________________________________________________________


--from sqlalchemy import create_engine, MetaData
--from sqlalchemy.orm import scoped_session, sessionmaker
--import urllib

--params = urllib.parse.quote_plus("DRIVER={ODBC Driver 17 for SQL Server};"
--                                 "SERVER=HARIBABU;"
--                                 "DATABASE=QUIZ;"
--                                 "Trusted_Connection=yes;")

--engine = create_engine("mssql+pyodbc:///?odbc_connect={}".format(params))

--metadata = MetaData()

--metadata.reflect(engine)

--courseadd = metadata.tables["course"]

--usersData = metadata.tables["Users"]


--questions = metadata.tables['t_questions']

--answers =  metadata.tables['t_answers']

--quiznames = metadata.tables['QuizNames']

--studentcourses = metadata.tables['student_interest']


--Sessionlocal = scoped_session(
--    sessionmaker(
--        bind=engine,
--        autocommit=False,
--        autoflush=False))

--______________________________________________________________________________________

--				From here all the queries for creating tables
--_______________________________________________________________________________________


create database QUIZ


--______________________________________________________________________________________


USE [QUIZ]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 7/19/2021 4:49:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](20) NOT NULL,
	[LName] [varchar](20) NOT NULL,
	[UName] [varchar](20) NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[Password] [varchar](max) NULL,
	[role] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



--_________________________________________________________________________________________________


USE [QUIZ]
GO

/****** Object:  Table [dbo].[course]    Script Date: 7/19/2021 4:46:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[course] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--_____________________________________________________________________________________________________________________________


USE [QUIZ]
GO

/****** Object:  Table [dbo].[QuizNames]    Script Date: 7/19/2021 4:47:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[QuizNames](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_name] [varchar](50) NOT NULL,
	[course_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[QuizNames]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([ID])
GO

ALTER TABLE [dbo].[QuizNames]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([Id])
GO

--_________________________________________________________________________________________________________________________________


USE [QUIZ]
GO

/****** Object:  Table [dbo].[student_interest]    Script Date: 7/19/2021 4:47:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[student_interest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[student_interest] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[student_interest]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([Id])
GO

--_____________________________________________________________________________________________________________


USE [QUIZ]
GO

/****** Object:  Table [dbo].[t_answers]    Script Date: 7/19/2021 4:48:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_answers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[answer] [varchar](100) NULL,
	[correct_ans] [bit] NULL,
	[q_id] [int] NULL,
	[quiz_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_answers]  WITH CHECK ADD FOREIGN KEY([q_id])
REFERENCES [dbo].[t_questions] ([id])
GO

ALTER TABLE [dbo].[t_answers]  WITH CHECK ADD FOREIGN KEY([quiz_id])
REFERENCES [dbo].[QuizNames] ([id])
GO

ALTER TABLE [dbo].[t_answers]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([Id])
GO

--__________________________________________________________________________________________


USE [QUIZ]
GO

/****** Object:  Table [dbo].[t_questions]    Script Date: 7/19/2021 4:48:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](100) NULL,
	[course_id] [int] NULL,
	[quiz_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_questions]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([ID])
GO

ALTER TABLE [dbo].[t_questions]  WITH CHECK ADD FOREIGN KEY([quiz_id])
REFERENCES [dbo].[QuizNames] ([id])
GO

ALTER TABLE [dbo].[t_questions]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([Id])
GO

--_______________________________________________________________________________________________________


