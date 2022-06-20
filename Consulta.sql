-- 2
select P.nome,A.matricula
from Aluno A,Pessoa P
where A.id = P.id AND A.id NOT IN (select C.aluno_id from contato C);

-- 3
select T.id,T.nome
from Turma T,Aluno A
where A.turma_id = T.id
group by T.id
having count(A.id)>5;

-- 4
select F.id,P.nome,F.titulacao
from professor F, pessoa P,turma_ministrada M,ministra N,turma T
where F.id = P.id AND F.id = M.professor_id AND N.professor_id = M.professor_id AND T.id = M.turma_id
group by F.id
having count(P.nome)>=3;

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
