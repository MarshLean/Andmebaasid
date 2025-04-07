-- SQL Server Management Stuudio
-- Login

-- (localdb)\MSSQLLocalDB

--Authentification: Windows Auth - Admini Õigused LocalHostis

--Authentification: SQL Server Auth - Varem Loodud Kasutajad

--New Query

CREATE DATABASE gerskevitsTITpv23;
--OBJECT EXPLORER ON VAJA PIDEVALT UUENDADA KÄASITI

USE gerskevitsTITpv23;
--TABELI LOOMINE

CREATE TABLE Opilane(
OpilaneID int Primary Key identity(1,1),
Eesnimi varchar(25),
Perenimi varchar(30) Unique,
Synicalaeg date,
Aadress TEXT,
Opilaskodu bit
);
SELECT * FROM Opilane;
--TABELI KUSTUMINE

DROP table Opilane;
--ANDMETE LISAMINE TABELISSE

INSERT INTO Opilane(Eesnimi, Perenimi, Synicalaeg, Aadress, Opilaskodu)
VALUES ('Mark', 'Levin', '2000-12-5', 'Tallinn', 1),
('Andrei', 'Astora', '897-3-6', 'DarkSouls', 0),
('Mati', 'Kask', '2005-11-2', 'Tartu', 0);
