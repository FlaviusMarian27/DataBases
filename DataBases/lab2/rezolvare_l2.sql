--ex1

CREATE TABLE MASINA (
    NrInregistrare NUMBER(5) PRIMARY KEY,
    Proprietar CHAR(6),
    NrInmatriculare CHAR(9) NOT NULL,
    Culoare VARCHAR2(10),
    Vporbagaj NUMBER(5,2) NOT NULL CHECK (Vporbagaj BETWEEN 0 AND 300),
    NrKm NUMBER(9,2) DEFAULT 0 NOT NULL,
    AnFabricatie NUMBER(4) NOT NULL,
    CONSTRAINT chk_nrkm CHECK (NrKm >= 0),
    CONSTRAINT fk_proprietar FOREIGN KEY (Proprietar) REFERENCES Profesor(pid) 
);

--ex2
ALTER TABLE MASINA
ADD CONSTRAINT MS_ANF_CK
CHECK (AnFabricatie BETWEEN 1980 AND 2024)

--ex3
SELECT * FROM Profesor;
SELECT pid FROM Profesor WHERE nume = 'Elisa Zamfirescu';
SELECT pid FROM Profesor WHERE nume = 'Veronica Micle';
SELECT pid FROM Profesor WHERE nume = 'Luca Caragiale';

--le adaugi pe rand ca nu da eroare

INSERT INTO MASINA( NrInregistrare, Proprietar, NrInmatriculare, Culoare, Vporbagaj, NrKm, AnFabricatie )
VALUES (19082,'PMEC01','TM 01 ABC','Rosie',100,12000,2021);

INSERT INTO MASINA( NrInregistrare, Proprietar, NrInmatriculare, Culoare, Vporbagaj, NrKm, AnFabricatie )
VALUES (23062,'PET002','TM 02 ABD','Rosie',100,19000,2021);

INSERT INTO MASINA( NrInregistrare, Proprietar, NrInmatriculare, Culoare, Vporbagaj, NrKm, AnFabricatie )
VALUES (33912,'PAC001','TM 40 PPT','Rosie',100,8000,2023);

--ex4
UPDATE MASINA 
SET Nrkm = 34000
WHERE NrInregistrare = 33912;

--ex5
UPDATE MASINA 
SET NrKm = Nrkm + 1250;

SELECT NrInregistrare, NrKm FROM MASINA;

--ex6
DELETE FROM MASINA
WHERE NrKm > 20000

--ex7
DROP TABLE MASINA