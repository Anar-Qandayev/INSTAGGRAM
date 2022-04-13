CREATE DATABASE INSTAGRAM
USE INSTAGRAM

CREATE TABLE Posts
(
Id INT IDENTITY(1,1) PRIMARY KEY,
Content nvarchar(255),
SharedTime date , 
UserId int references [Users](Id),
LikeCount int,
IsDeleted BIT
)

INSERT INTO Posts(Content,SharedTime,UserId,LikeCount,IsDeleted)
VALUES('STUDENT','2022-04-12' ,1,1000,0)
INSERT INTO Posts(Content,SharedTime,UserId,LikeCount)
VALUES('SINGER','2022-03-05' ,2,500)
SELECT*FROM Posts

CREATE VIEW dbo.uv_Posts

AS

 SELECT LikeCount

 FROM dbo.Posts

 WHERE IsDeleted = 0


CREATE TABLE [Users]
(
Id INT IDENTITY(1,1) PRIMARY KEY,
[Login] NVARCHAR(60),
[Password] NVARCHAR(50),
Mail NVARCHAR(60)
)

INSERT INTO [Users](Login,Password,Mail)
VALUES('anar_ilqaroglu','anar123','anar@gmail.com')
INSERT INTO [Users](Login,Password,Mail)
VALUES('vasif_fereczadeh','vasif123','vasif@gmail.com')
SELECT*FROM [Users]

CREATE TABLE Comments
(
Id INT IDENTITY(1,1) PRIMARY KEY,
UserId int references [Users](Id),
PostId int references Posts(Id),
LikeComent int ,
IsDeleted bit
)

INSERT INTO Comments(UserId,PostId,LikeComent,IsDeleted)
VALUES(1,1,200,0)
SELECT*FROM Comments

CREATE VIEW dbo.uv_Comments

AS

 SELECT LikeComent

 FROM dbo.Comments

 WHERE IsDeleted = 0

CREATE TABLE People
(
Id INT IDENTITY(1,1) PRIMARY KEY,
 Name nvarchar(50),
 SurName nvarchar(50),
 Age int
)

INSERT INTO People(Name,SurName,Age)
VALUES('Elvin', 'Mirzeyev',21)
SELECT*FROM People


--Query 1

SELECT COUNT(LikeCount) FROM Posts 

--Query 2

CREATE VIEW GetFullPostInfo
AS
SELECT u.[Login],c.LikeComent,e.Name as 'People'
FROM Posts AS p
JOIN [Users] AS u
ON p.UserId=u.Id
JOIN Comments as c
On p.Id=c.Id
JOIN People as e
On p.Id=e.Id

SELECT*FROM GetFullPostInfo

--Query 3
--SUM(p.LikeCount) + SUM(c.LikeComent)
SELECT SUM(p.LikeCount) FROM Posts as p
JOIN Comment as c
ON p.Id = c.Id

--Query 4
SELECT*FROM [Users]
UNION
SELECT*FROM People

