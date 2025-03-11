--ex1
SELECT nume FROM Student WHERE nume LIKE '%u'

--ex2
SELECT 
    SUBSTR(nume,0,INSTR(nume,' ')) AS Prenume,
    SUBSTR(nume,INSTR(nume,' ')) AS NumeFamilie,
    an
FROM Student 

--ex3
SELECT 
    nume,
    SUBSTR(nume,0,INSTR(nume,' ')) AS Prenume,
    length(SUBSTR(nume,0,INSTR(nume,' '))) AS Lungime
FROM Student 
WHERE length(SUBSTR(nume,0,INSTR(nume,' ')-1)) >= 7;

--ex4
SELECT * FROM STUDENT 
WHERE extract(Year from SYSDATE) - extract(Year from DATAN) < 21 AND extract(Year from SYSDATE) - extract(Year from DATAN) > 19 AND extract(MONTH from DATAN) BETWEEN 1 and 12; 

--ex5
SELECT 
    nume,
    datan 
FROM STUDENT 
WHERE extract(MONTH from DATAN)=3; 

--ex6
SELECT * FROM STUDENT 
WHERE bursa IS NULL OR bursa=0;

--ex7
SELECT 
    nume,
    an,
    NVL(cnp,'CNP necompletat') AS CNP
FROM STUDENT 
WHERE an = 2 ;

--ex8
SELECT 
    nume,
    cnp,
    an
FROM STUDENT 
WHERE trim(SUBSTR(nume,0,INSTR(nume,' '))) LIKE '%a'; //pt muieri
WHERE trim(SUBSTR(nume,0,INSTR(nume,' '))) NOT LIKE '%a';

--ex9
SELECT 
    nume,
    an,
    CASE WHEN trim(SUBSTR(nume,0,INSTR(nume,' '))) NOT LIKE '%a' THEN 'M'
        WHEN trim(SUBSTR(nume,0,INSTR(nume,' '))) LIKE '%a' THEN 'F'
    END AS Grup
FROM STUDENT 
