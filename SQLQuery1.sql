CREATE DATABASE Course3


CREATE TABLE Groups
(
	Id INT PRIMARY KEY IDENTITY,
	GroupNo NVARCHAR(30),
	StartDate DATETIME2
)



CREATE TABLE Students
(
	Id INT PRIMARY KEY IDENTITY,
	FullName NVARCHAR(30),
	GroupId INT FOREIGN KEY REFERENCES Groups(Id)

)



CREATE TABLE Quiz
(
	Id iNT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20),
	StartDate DATETIME2
)


CREATE TABLE StudentQuiz
(
	StudentId INT FOREIGN KEY REFERENCES Students(Id),
	QuizId INT FOREIGN KEY REFERENCES Quiz(Id),
	Point TINYINT

)


SELECT*FROM Groups
INSERT INTO Groups
VALUES
('PB302','2024-4-3'),
('P402','2024-6-2'),
('D302','2024-3-25')



SELECT*FROM Students
INSERT INTO Students
VALUES
('Umman Memmeedov',1),
('Elmar Qarayev',2),
('Davud Eliyev',3),
('Farid Abdullayev',1)



SELECT*FROM Quiz
INSERT INTO Quiz
VALUES
('SQL','2024-4-4'),
('Backend','2024-3-26'),
('SQL','2024-4-10')


SELECT*FROM StudentQuiz
INSERT INTO StudentQuiz
VALUES
(1,2,50),
(2,2,60),
(1,1,10),
(3,3,25),
(4,1,33)






--SELECT *,(Select COUNT(*) FROM Students AS S WHERE S.GroupId = G.Id) As StudentCount FROM Groups AS G

--SELECT MAX(Point) FROM StudentQuiz WHERE StudentId = 1




SELECT G.GroupNo,G.StartDate,COUNT(s.Id) AS StudentsCount FROM Groups AS G 
JOIN Students AS S ON G.Id = S.GroupId 
GROUP BY  G.GroupNo,G.StartDate



SELECT S.FullName ,MAX(Point) AS MaxQuiz FROM StudentQuiz AS SQ 
JOIN Students AS S ON SQ.StudentId = S.Id WHERE StudentId = 1
GROUP BY S.FullName


SELECT *,(SELECT AVG(Point) FROM StudentQuiz WHERE StudentId = Students.Id) From Students


--BUTUN TELEBELRIN YANINDA QRUP NOMRESI ILE SELECT EDEN QUERY

SELECT S.FullName,G.GroupNo FROM Students AS S 
JOIN Groups AS G ON S.GroupId = G.Id 
GROUP BY S.FullName,G.GroupNo


--BUTUN QRUPLARI YANINDA O QURUPUN ORTALAMA BALI ILE SELECT EDEN QUERY

SELECT G.GroupNo,G.StartDate,AVG(SQ.Point) AS AVGPOINT FROM Groups AS G
LEFT JOIN Students AS S ON S.GroupId = G.Id 
LEFT JOIN StudentQuiz AS SQ ON SQ.StudentId = S.Id
GROUP BY G.GroupNo,G.StartDate


--GELECEKDE OLACAQ QUYZILERIN SEELCT EDEN QUERY
SELECT * FROM Quiz WHERE Quiz.StartDate > GETDATE()

--HEC BIR QUIZDE ISTIRAK ETMEMEIS STUDENT
SELECT Q.Id,Q.StartDate FROM Quiz AS Q
LEFT JOIN StudentQuiz AS SQ ON SQ.QuizId = Q.Id WHERE StudentId IS NULL






 













