-- 2
SELECT P.nome,A.matricula
FROM Aluno A,Pessoa P
WHERE A.id = P.id AND A.id NOT IN (SELECT C.Aluno_id FROM Contato C);

-- 3
SELECT T.id,T.nome
FROM Turma T,Aluno A
WHERE A.turma_id = T.id
GROUP BY T.id
HAVING count(A.id)>5;

-- 4
SELECT F.id,P.nome,F.titulacao
FROM Professor F, Pessoa P,Turma_Ministrada M,Ministra N,Turma T
WHERE F.id = P.id AND F.id = M.Professor_id AND N.Professor_id = M.Professor_id AND T.id = M.turma_id
GROUP BY F.id
HAVING count(P.nome)>=3;

-- 7

SELECT E.nome, COUNT(DISTINCT TM.turma_id), COUNT(DISTINCT TM.Professor_id)
FROM Escola E JOIN Turma T ON E.id = T.escola_id
              JOIN Turma_Ministrada TM ON T.id = TM.turma_id
              JOIN Professor P ON TM.Professor_id = P.id
GROUP BY E.nome;

-- 8

SELECT E.nome, COUNT(DISTINCT A.id)/COUNT(DISTINCT TM.Professor_id) as 'Aluno/Professor'
FROM Escola E JOIN Turma T ON E.id = T.escola_id
              JOIN Turma_Ministrada TM ON T.id = TM.turma_id
              JOIN Professor P ON TM.Professor_id = P.id
              JOIN Aluno A ON TM.turma_id = A.turma_id
GROUP BY E.nome;

-- 9
SELECT matricula, Pessoa.nome NomeAluno, Contato.nome NomeContato, Contato.telefone TelefoneContato
FROM Aluno, Pessoa, Contato
WHERE Aluno.id = Pessoa.id AND Aluno.id = Contato.Aluno_id
ORDER BY Aluno.matricula, NomeContato;

-- 10
SELECT Professor.id,nome, telefone, RG, CPF, titulacao, cidade_id
FROM Pessoa, Professor
WHERE Professor.id in
    (SELECT Professor_id TurmasMinistradas FROM Turma_Ministrada
    GROUP BY Professor_id
    HAVING count(*) =1)
AND Pessoa.id = Professor.id;
