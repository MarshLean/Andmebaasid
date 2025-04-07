## Andmetüüpid
1. ***Teksti Või Sümbolid*** - VARCHAR(255), CHAR(3), TEXT
Näited: Nimi, Nimetus, TelefoniNumber, Isikukood-VARCHAR(11)
2. ***ARVULISED*** - int, bigint, smallint, decimal(5,2) -5 Kokku, -2 Peale Komat
Näited: Vanus, Palk, Temperatuur, Kaal, Pikkus JNE
3. ***Kuupäeva*** - DATE, TIME, date/time
4. ***Loogilised*** - bit, bool, boolean

## Piirangud - Ограничения
1. Primary Key - Ei Anna Võimalatust Lisada Topelt Väärtused
2. UNIQUE - Unikaalsus
3. NOT NULL - Ei Lubada Tühjad Väärtused
4. Foreign Key - Saab Kasutada Ainult Teise Tabeli Vääartused
5. CHECK - Saab Sisestada Ainult Check Määratud Väärtused CHECK (mees, naine)
