
CREATE DATABASE School

CREATE TABLE Events
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20),
	Description NVARCHAR(50),
	Address NVARCHAR(20),
	StartDate DATE,
	StartTime TIME,
	EndTime TIME,
)

CREATE TABLE Speakers
(
	Id INT PRIMARY KEY IDENTITY,
	FullName NVARCHAR(30),
	Position NVARCHAR(30),
	Company NVARCHAR(30),
	ImageUrl NVARCHAR(200)
)


CREATE TABLE EventSpeakers
(
	SpeakrsId INT FOREIGN KEY REFERENCES Speakers(Id),
	EventsId INT FOREIGN KEY REFERENCES Events(Id)
)


select * from Events