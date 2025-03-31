--ex1
SELECT
    Student.sid,
    Student.nume,
    Student.media
FROM Student
WHERE Student.fid = 'AC' and Student.media < (SELECT media FROM Student WHERE CNP = '1020608359554')
--cnp nu exista
--backup - '1021205355288'

--ex2
SELECT
    sid,
    nume,
    bursa
FROM Student
WHERE fid = 'AC' 
AND bursa IS NOT NULL 
AND bursa > 0 
AND bursa = (SELECT MIN(bursa) FROM Student WHERE fid = 'AC' AND bursa > 0);

--ex3
SELECT
    Curs.cid,
    Curs.titlu,
    Curs.sala
From Curs 
WHERE Curs.sala IN (SELECT Sala.cods FROM Sala WHERE Sala.nrlocuri > 100);

--ex4
SELECT
    Sala.cods,
    Sala.nrlocuri
FROM Sala
WHERE Sala.cods IN ( SELECT Curs.sala FROM Curs WHERE Curs.fid = 'MEC') AND Sala.cods IN ( SELECT Curs.sala FROM Curs WHERE Curs.fid = 'AC');

--ex5
SELECT
    s1.sid,
    s1.nume,
    s1.bursa,
    s1.media
FROM Student s1
WHERE EXISTS( SELECT s2.sid FROM Student s2 WHERE s1.sid != s2.sid AND s1.bursa = s2.bursa AND s1.media = s2.media );


--ex6
SELECT
    f.fid,
    f.nume
FROM Facultate f
WHERE EXISTS (
    SELECT 1
    FROM Student s1
    WHERE s1.fid = f.fid
    AND NOT EXISTS(
        SELECT 1
        FROM Student s2
        WHERE s2.bursa > s1.bursa
    )
)