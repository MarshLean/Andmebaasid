CREATE DATABASE gerskevitsTITpv23;

USE gerskevitsTITpv23;

CREATE TABLE linnad(
linnID int PRIMARY KEY identity(1,1),
linnNimi varchar(30) unique,
elanikeArv int not null,
maakond varchar(25)
);

--Protseduur, mis lisab (INSERT)tabelisse andmed ja kohe näitab (SELECT) tabeli
CREATE PROCEDURE lisaLinn
@linnNimi varchar(30),
@elanikeArv int,
@maakond varchar(25)
AS
BEGIN
INSERT INTO linnad(linnNimi, elanikeArv, maakond)
VALUES (@linnNimi, @elanikeArv, @maakond);
SELECT * FROM linnad;
END;

--kutse
EXEC lisaLinn 'Keila', 1000, 'Keila';

--protseduuri kustutamine
DROP Procedure lisaLinn;

--protseduur, mis kustutab tabelist linnID järgi
CREATE PROCEDURE kustutaLinn
@id int
AS
BEGIN
SELECT * FROM linnad;
DELETE FROM linnad WHERE linnId=@id;
SELECT * FROM linnad;
END

--kutse
EXEC kustutaLinn 4;

--protseduur mis uuendab tabeli ja suurendab elanike arv 10%
CREATE PROCEDURE uuendaLinn
@arv decimal(5,2)
AS
BEGIN
SELECT * FROM linnad;
UPDATE linnad SET elanikeArv=elanikeArv*@arv;
SELECT * FROM linnad;
END

--kutse
EXEC uuendaLinn 0.05;
DROP PROCEDURE uuendaLinn;
UPDATE linnad SET elanikeArv=200000 WHERE linnID=2;
SELECT * FROM linnad;
