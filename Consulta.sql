-- 7

SELECT E.nome, COUNT(DISTINCT TM.turma_id), COUNT(DISTINCT TM.professor_id)
FROM Escola E JOIN Turma T on E.id = T.escola_id
              JOIN Turma_Ministrada TM on T.id = TM.turma_id
              JOIN Professor P on TM.professor_id = P.id
GROUP BY E.nome;

-- 8

SELECT E.nome, COUNT(DISTINCT A.id)/COUNT(DISTINCT TM.professor_id) as 'aluno/professor'
FROM Escola E JOIN Turma T on E.id = T.escola_id
              JOIN Turma_Ministrada TM on T.id = TM.turma_id
              JOIN Professor P on TM.professor_id = P.id
              JOIN Aluno A on TM.turma_id = A.turma_id
GROUP BY E.nome;