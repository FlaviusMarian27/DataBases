--ex1
SELECT COUNT(*) AS NumarStudenti FROM Student WHERE media BETWEEN 7 AND 9;

--ex2
SELECT
    an,
    trunc(variance(nota),2)
FROM Contract
WHERE semestru = 1
GROUP BY an;

--ex3
SELECT
    grad,
    count(*) As NumarProfesori
FROM Profesor
GROUP BY grad HAVING COUNT(*) > 5;