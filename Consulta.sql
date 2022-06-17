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

-- 9
SELECT matricula, pessoa.nome NomeAluno, contato.nome NomeContato, contato.telefone TelefoneContato 
FROM aluno, pessoa, contato 
WHERE aluno.id = pessoa.id AND aluno.id = contato.aluno_id
ORDER BY aluno.matricula, NomeContato;

-- 10
SELECT professor.id,nome, telefone, RG, CPF, titulacao, cidade_id 
FROM pessoa, professor 
WHERE professor.id in 
    (SELECT professor_id TurmasMinistradas FROM turma_ministrada
    GROUP BY professor_id
    HAVING count(*) =1) 
AND pessoa.id = professor.id;