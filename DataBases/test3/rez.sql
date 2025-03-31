--ex1
SELECT 
    Profesor.nume,
    Profesor.datan
FROM Profesor
WHERE (Profesor.fid = 'MEC' OR Profesor.fid = 'AC') AND Profesor.datan < (SELECT p.datan FROM Profesor p WHERE p.nume = 'Raul Brad');

--ex2
SELECT
    Student.sid,
    Student.nume
FROM Student
WHERE Student.fid = 'MEC' AND EXISTS(SELECT 1 FROM Contract WHERE Contract.sid = Student.sid );

--ex3
SELECT
    Curs.titlu,
    Curs.cid
FROM Curs
WHERE (Curs.fid = 'AC' OR Curs.fid = 'ET') AND Curs.zi IN (SELECT c.zi FROM Curs c WHERE c.titlu = 'Fizica' );

--ex4
SELECT
    Student.sid,
    Student.nume
FROM Student
WHERE Student.an = 1 AND Student.fid NOT IN (SELECT fid FROM Profesor WHERE pid IN( SELECT pid FROM Curs WHERE titlu = 'Limbaje de programare'));

--ex5
SELECT 
    f.fid,
    f.nume
FROM Facultate f
WHERE NOT EXISTS(SELECT 1 FROM Student s WHERE s.fid = f.fid AND s.media < 5.5 );

--ex6
SELECT
    s.nume,
    s.media
FROM Student s
WHERE s.fid = 'AC' AND s.media > (SELECT s2.media FROM Student s2 WHERE s2.nume = 'Emanuel Petrescu' );


