--ex1
SELECT 
    Profesor.*,
    Facultate.nume AS NumeFacultate,
    Facultate.adr AS AdresaFacultate,
    Facultate.tel AS TelefonFacultate
FROM Profesor INNER JOIN Facultate ON Profesor.fid = Facultate.fid; 

--ex2
SELECT
    Curs.cid,
    Curs.titlu AS TitluCurs,
    Curs.ora,
    Sala.cods As CodSala,
    Sala.nrlocuri AS NumarLocuriSala
FROM Curs INNER JOIN Sala ON Curs.sala = Sala.cods WHERE Curs.ora > 12;

--ex3
SELECT 
    Curs.cid,
    Curs.titlu AS CursTitlu,
    Curs.zi,
    Curs.ora,
    Sala.cods AS CodSala,
    Sala.etaj
FROM Curs INNER JOIN Sala ON Curs.sala = Sala.cods WHERE Sala.etaj = 1;

--ex4
SELECT
    Curs.titlu As TitluCurs,
    Curs.zi,
    Profesor.nume
FROM Curs INNER JOIN Profesor ON Curs.pid = Profesor.pid
WHERE trim(convert(to_char(SYSDATE, 'Day', 'NLS_DATE_LANGUAGE = Romanian'),'US7ASCII')) = Curs.zi;

--ex5
SELECT
    Student.nume AS NumeStudent,
    Curs.titlu AS TitluCurs,
    Curs.sala AS Sala,
    Contract.nota AS NotaCurs
FROM Student 
INNER JOIN Contract ON Student.sid = Contract.sid
INNER JOIN Curs ON Contract.cid = Curs.cid
WHERE Contract.nota <= 8;

--ex6
SELECT
    Student.sid,
    Student.an AS An,
    Student.nume AS Nume
FROM Student LEFT JOIN Contract ON Student.sid = Contract.sid
WHERE Contract.sid IS NULL
ORDER BY Student.an,Student.nume;

--ex7
SELECT
    Student.sid,
    Student.nume AS NumeComplet,
    Student.an AS AnulDeStudiu
FROM Student LEFT JOIN Contract ON Student.sid = Contract.sid
GROUP BY Student.sid,Student.nume,Student.an --Grupăm rezultatele pe baza ID-ului studentului, numele complet, și anul de studiu pentru a evita duplicatele, în cazul în care un student are mai multe contracte
ORDER BY substr(Student.nume,instr(Student.nume,' ')+1);

--ex8
SELECT DISTINCT
    Student.sid,
    Student.nume AS Nume
FROM Student 
INNER JOIN Contract ON Student.sid = Contract.sid
INNER JOIN Curs ON Contract.cid = Curs.cid
WHERE Curs.zi = 'Luni'
ORDER BY Student.nume;

--ex9
SELECT DISTINCT
    Student.sid,
    Student.nume AS NumeStudent,
    Student.datan AS DataNasterii
FROM Student 
INNER JOIN Contract ON Student.sid = Contract.sid
INNER JOIN Curs ON Contract.cid = Curs.cid
INNER JOIN Sala ON Curs.sala = Sala.cods
WHERE Sala.nrlocuri < 200
ORDER BY Student.datan , Student.nume;