--ex1
SELECT COUNT(*) FROM Student WHERE (bursa IS NULL OR bursa = 0) AND media > 7.50;  

--ex2
SELECT 
    COUNT(DISTINCT Student.sid) 
FROM Student 
INNER JOIN Contract ON Student.sid = Contract.sid
INNER JOIN Curs ON Contract.cid = Curs.cid
INNER JOIN Profesor ON Curs.pid = Profesor.pid
WHERE Profesor.nume = 'Luca Caragiale';

--ex3
SELECT
    COUNT(DISTINCT Student.sid) As NumarStudenti
FROM Student
INNER JOIN Contract ON Student.sid = Contract.sid
INNER JOIN Curs ON Contract.cid = Curs.cid
INNER JOIN Sala ON Curs.sala = Sala.cods
WHERE Sala.etaj = 1;

--ex4
SELECT
    MAX(Student.datan) AS Data_Nasterii_Celui_Mai_Tanar_Student,
    MIN(Student.datan) AS Data_Nasterii_Celui_Mai_Batran_Student
FROM Student
WHERE Student.an = 2

--ex5
SELECT
    Facultate.nume AS NumeFacultate,
    Student.an,
    SUM(Student.bursa),
    trunc(AVG(Student.bursa),2)
FROM Student
INNER JOIN Facultate ON Student.fid = Facultate.fid
GROUP BY Facultate.nume, Student.an;

--ex6
SELECT 
    MIN(Student.bursa) AS BursaMinima,
    trunc(AVG(Student.bursa),2) AS BursaMedie,
    MAX(Student.bursa) AS BursaMaxima
FROM Student
INNER JOIN Contract ON Student.sid = Contract.sid
INNER JOIN Curs ON Contract.cid = Curs.cid
WHERE Curs.zi = 'Luni' AND Student.bursa > 0;

--ex7
SELECT
    sid, 
    nume, 
    bursa
FROM Student
WHERE bursa > (SELECT AVG(bursa) FROM Student);

--ex8
SELECT
    Facultate.nume,
    trunc(AVG(Student.media),2) AS Media_Globala,
    trunc(AVG(Student.media) - STDDEV(Student.media),2) AS Prag_Jos,
    trunc(AVG(Student.media) + STDDEV(Student.media),2) AS Prag_Sus
FROM Student
INNER JOIN Facultate ON Student.fid = Facultate.fid
GROUP BY Facultate.nume;

--ex9
SELECT
    Student.sid,
    Student.nume,
    Student.media
FROM Student
WHERE Student.media < (SELECT trunc(AVG(s1.media) - STDDEV(s1.media),2) FROM Student s1 ) OR Student.media > (SELECT trunc(AVG(s2.media) + STDDEV(s2.media),2) FROM Student s2 );
