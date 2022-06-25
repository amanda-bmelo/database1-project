-- 1
SELECT e.nome, c.nome cidade
FROM Cidade c, Escola e 
WHERE e.cidade_id=c.id AND e.id NOT IN 
        (SELECT e.id 
        FROM Aluno a, Pessoa p, Escola e, Turma t 
        WHERE a.id=p.id AND p.cidade_id!=e.cidade_id 
        AND a.turma_id=t.id AND t.escola_id = e.id);

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

-- Ex 5
SELECT Disciplina.nome, count(*) QuantMax , count(DISTINCT prof.id) QuantReal 
FROM Professor prof, Disciplina, Turma_ministrada tmin
WHERE tmin.professor_id = prof.id AND tmin.disciplina_id = disciplina.id
GROUP BY disciplina_id;

-- Ex 6
SELECT E.nome,P.nome
FROM Escola E, Pessoa P, Cidade C
WHERE E.cidade_id = C.id AND P.id = E.diretor_id AND P.cidade_id != E.cidade_id;

-- 7

SELECT E.nome as Nome, COUNT(DISTINCT TM.turma_id) Turmas, COUNT(DISTINCT TM.Professor_id) Professores
FROM Escola E JOIN Turma T ON E.id = T.escola_id
              JOIN Turma_Ministrada TM ON T.id = TM.turma_id
              JOIN Professor P ON TM.Professor_id = P.id
GROUP BY E.nome;

-- 8

SELECT E.nome as Nome, COUNT(DISTINCT A.id)/COUNT(DISTINCT TM.Professor_id) 'Aluno/Professor'
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
WHERE Professor.id IN
    (SELECT Professor_id TurmasMinistradas FROM Turma_Ministrada
    GROUP BY Professor_id
    HAVING count(*) =1)
AND Pessoa.id = Professor.id;
