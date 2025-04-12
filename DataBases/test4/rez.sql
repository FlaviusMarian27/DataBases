--ex1
SELECT
    pid,
    fid
FROM Profesor
WHERE datan < TO_DATE('01/01/1980','DD/MM/YYYY')

MINUS

SELECT
    pid,
    fid
FROM Profesor
WHERE grad = 'conf';

--ex2
SELECT
    sid,
    nume
FROM Student
WHERE bursa IS NULL OR bursa = 0

UNION 

SELECT
    sid,
    nume
FROM Student
WHERE media < 6.5;

--ex3
SELECT
    cid,
    an
FROM Curs 
INNER JOIN Profesor ON Curs.pid = Profesor.pid
WHERE Profesor.grad = 'prof'

MINUS

SELECT
    cid,
    an
FROM Curs
WHERE Curs.fid = 'AC';

--ex4
SELECT
    fid,
    nume
FROM Facultate
WHERE Facultate.fid IN(SELECT Student.fid FROM Student WHERE SUBSTR(Student.adr,INSTR(Student.adr,',') + 1) LIKE 'H%')

UNION

SELECT 
    fid,
    nume
FROM Facultate
WHERE Facultate.fid IN(SELECT Profesor.fid FROM Profesor WHERE Profesor.grad = 'prof');

--ex5
SELECT
    cid,
    an
FROM Curs
WHERE Curs.fid = 'AC'

MINUS

SELECT
    cid,
    an
FROM Curs
INNER JOIN Profesor ON Curs.pid = Profesor.pid
WHERE Curs.fid = 'AC' AND Profesor.grad = 'conf';

--ex6
SELECT
    cid,
    titlu
FROM Curs   
WHERE fid = 'AC'

MINUS

SELECT
    cid,
    titlu
FROM Curs
WHERE fid = 'AC' AND zi = 'Luni';

--ex7
SELECT
    s1.sid,
    s1.nume
FROM Student s1
WHERE s1.media NOT BETWEEN 6 AND 7.8

UNION

SELECT
    s2.sid,
    s2.nume
FROM Student s2
INNER JOIN Contract ON s2.sid = Contract.sid
WHERE Contract.an = 2021;

--ex8
SELECT
    c1.cid,
    c1.titlu
FROM Curs c1
WHERE c1.pid IN(SELECT pid FROM Profesor WHERE substr(Profesor.nume,instr(Profesor.nume,' ')+1) LIKE 'P%')

INTERSECT

SELECT
    c2.cid,
    c2.titlu
FROM Curs c2
WHERE c2.fid IN (SELECT s.fid FROM Student s WHERE s.media >= 9);

--ex9
SELECT
    c1.nrc,
    c1.semestru
FROM Contract c1
WHERE c1.nota >= 8

UNION

SELECT
    c2.nrc,
    c2.semestru
FROM Contract c2
WHERE c2.semestru = 2;