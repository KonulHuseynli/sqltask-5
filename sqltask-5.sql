use Moviesapps
Create DATABASE Moviesapps

CREATE TABLE Directorsss(
Id int PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
Surname VARCHAR(50)
)
CREATE TABLE Languagessss(
Id int PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
)

CREATE TABLE Moviesss (
Id INT PRIMARY KEY Identity,
Name VARCHAR(70),
Description VARCHAR(80),
CoverPhoto Bit,
DirectorId Int FOREIGN KEY REFERENCES Directorsss(Id),
LanguageId INT FOREIGN KEY REFERENCES Languagessss(Id)
)

CREATE TABLE Genresss(
Id int PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
)

CREATE TABLE Actorsss(
Id int PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
Surname VARCHAR(50)
)

CREATE TABLE MovieWithActorsss(
Id int PRIMARY KEY IDENTITY,
MovieId INT FOREIGN KEY REFERENCES Moviesss(Id),
ActorId INT FOREIGN KEY REFERENCES Actorsss(Id)
)

CREATE TABLE MovieWithGenresss(
Id int PRIMARY KEY IDENTITY,
MovieId INT FOREIGN KEY  REFERENCES Moviesss(Id),
GenreId INT FOREIGN KEY REFERENCES Genresss(Id)
)

SELECT*FROM Actorsss
SELECT*FROM Genresss
SELECT*FROM Moviesss
SELECT*FROM Languagessss
SELECT*FROM MovieWithActorsss
SELECT*FROM MovieWithGenresss
SELECT*FROM Directorsss

INSERT INTO Directorsss
VALUES('Robert','Schwentke'),
('Scott','Thomson'),
('M.Night','Shyamalan'),
('joe','johnson')

INSERT INTO Languagessss
VALUES('Aze'),
('Eng'),
('Ru'),
('China')

INSERT INTO Moviesss
VALUES('Red','Red follows Frank Moses (Willis) t.. ',1,1,1),
('Fast & Furios','media franchise centered on..',1,2,2),
('Split','Three girls are kidnapped by a man.. ',1,3,2),
('Jumanji','The story revealed the jungle..',0,null,4)

INSERT INTO Genresss
VALUES('Adventure'),
('Action'),
('horror'),
('comedy')

INSERT INTO Actorsss
VALUES('Bruce','Willis'),
('Morgan','Freeman'),
('Dvayne','Johnson'),
('Karen','Gillen'),
('James','Mcavoy')

INSERT INTO MovieWithActorsss
VALUES(1,2),
(1,1),
(2,3),
(2,4),
(3,5),
(4,3)

INSERT INTO MovieWithGenresss
VALUES(1,2),
(2,1),
(2,2),
(3,3),
(4,1)

CREATE OR ALTER PROCEDURE usp_GetAllFilmsLanguage @directorId  int
AS
SELECT M.Name AS MOVIENAEM, L.Name AS LANGUAGENAME FROM Moviesss AS M
INNER JOIN Languagessss AS L
On M.LanguageId=L.Id 
WHERE M.DirectorId=@directorId
EXEC usp_GetAllFilmsLanguage @directorId = 1

