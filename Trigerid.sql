CREATE DATABASE TITtriger;

USE TITtriger;

--tabel, mida automaatselt täidab triger
CREATE TABLE logi(
id INT PRIMARY KEY IDENTITY(1,1),
tegevus VARCHAR(25),
kasutaja VARCHAR(25),
aeg DATETIME,
andmed TEXT)

--tabel, millega töötab kasutaja
CREATE TABLE puud(
puuID INT PRIMARY KEY IDENTITY(1,1),
puuNimi VARCHAR(25),
pikkus INT,
aasta INT)

INSERT INTO puud (puuNimi, pikkus, aasta) VALUES ('Käsk', 41, 12);

--Triger, mis jälgib tabeli puud täitmine(lisamine)
CREATE TRIGGER puuLisamine

ON puud

FOR INSERT

AS

INSERT INTO logi (kasutaja, tegevus, aeg, andmed)

SELECT

SYSTEM_USER, 

'puu on lisatud',

GETDATE(),

CONCAT (inserted.puuNimi, ',' ,inserted.pikkus , ',' ,inserted.aasta)

FROM inserted;

--kontroll
INSERT INTO puud(puuNimi, pikkus, aasta)

VALUES ('vaher', 22, 2000);

SELECT * FROM puud;

SELECT * FROM logi;

DROP TRIGGER puuLisamine;

--triger, mis jälgib tabelis kustutamine
CREATE TRIGGER puuKustutamine

ON puud

FOR DELETE

AS

INSERT INTO logi(kasutaja, tegevus, aeg, andmed)

SELECT

SYSTEM_USER,

'puu on kustatud',

GETDATE(),

CONCAT(deleted.puuNimi, ',' ,deleted.pikkus , ',' ,deleted.aasta)

FROM deleted;

--kontroll
DELETE FROM puud WHERE puuID=1;

SELECT * FROM puud;

SELECT * FROM logi;

--triger, mis jälgib tabelis uuendamine
CREATE TRIGGER puuUuendamine

ON puud

FOR UPDATE

AS

INSERT INTO logi(kasutaja, tegevus, aeg, andmed)

SELECT

SYSTEM_USER,

'puu on uuendatud',

GETDATE(),

CONCAT(
' vana puu info - ', deleted.puuNimi, ',' ,deleted.pikkus , ',' ,deleted.aasta,
' uus puu info - ', inserted.puuNimi, ',' ,inserted.pikkus , ',' ,inserted.aasta
)

FROM deleted INNER JOIN inserted

ON deleted.puuID=inserted.puuID;

--kontroll
UPDATE puud SET pikkus=25555, aasta=1900

WHERE puuID=2;

SELECT * FROM puud;

SELECT * FROM logi;
