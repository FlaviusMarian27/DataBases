--ex1
SELECT s1.sid,s1.nume,s1.an,s1.bursa FROM Student s1
WHERE s1.bursa <750 AND s1.bursa > 0 AND s1.bursa IS NOT NULL

UNION

SELECT s2.sid,s2.nume,s2.an,s2.bursa FROM Student s2
WHERE s2.bursa > 900

--ex2
SELECT 
    Student.sid,
    Student.nume,
    Student.an,
    Student.bursa 
FROM Student
WHERE (Student.bursa < 750 OR Student.bursa > 900) AND ( Student.bursa > 0 AND Student.bursa IS NOT NULL );

--ex3
SELECT 
    s1.sid,
    s1.nume,
    s1.an,
    s1.bursa 
FROM Student s1
WHERE s1.bursa > 0 AND NOT EXISTS(SELECT 1 FROM Student s2 WHERE s2.bursa > 0 AND s2.bursa < s1.bursa)

UNION

SELECT 
    s3.sid,
    s3.nume,
    s3.an,
    s3.bursa 
FROM Student s3
WHERE s3.bursa > 0 AND NOT EXISTS(SELECT 1 FROM Student s4 WHERE s4.bursa > 0 AND s4.bursa > s3.bursa);


--ex4
SELECT
    f1.fid,
    f1.nume,
    f1.adr
FROM Facultate f1
JOIN Curs c1 ON f1.fid = c1.fid
JOIN Sala s1 ON c1.sala = s1.cods
WHERE s1.etaj = 1
GROUP BY f1.fid, f1.nume, f1.adr

INTERSECT

SELECT
    f2.fid,
    f2.nume,
    f2.adr
FROM Facultate f2
JOIN Curs c2 ON f2.fid = c2.fid
JOIN Sala s2 ON c2.sala = s2.cods
WHERE s2.etaj = 2
GROUP BY f2.fid, f2.nume, f2.adr

--ex5
SELECT
    s.sid,
    s.nume,
    s.an,
    s.bursa
FROM Student s
WHERE s.bursa > 0 AND s.bursa IS NOT NULL

INTERSECT

SELECT
    s1.sid,
    s1.nume,
    s1.an,
    s1.bursa
FROM Student s1
INNER JOIN Contract co ON s1.sid = co.sid
INNER JOIN Curs cu ON co.cid = cu.cid
INNER JOIN Sala sa ON cu.sala = sa.cods
WHERE sa.cods = 'A101';

--ex6
SELECT
    s.sid,
    s.nume,
    s.an,
    s.bursa
FROM Student s
INNER JOIN Facultate f ON s.fid = f.fid
WHERE f.tel = '0256-403211'

MINUS

SELECT
    s1.sid,
    s1.nume,
    s1.an,
    s1.bursa
FROM Student s1
INNER JOIN Contract co ON s1.sid = co.sid
INNER JOIN Curs cu ON co.cid = cu.cid
INNER JOIN Profesor pi ON cu.pid = pi.pid
WHERE pi.nume = 'Ciprian Porumbescu'