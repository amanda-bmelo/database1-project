-- 1
UPDATE Contato
SET aluno_id = 2
WHERE aluno_id = 1;


-- 2
DELETE FROM turma_ministrada WHERE professor_id = 40;
DELETE FROM ministra WHERE professor_id = 40;

UPDATE escola
SET diretor_id = 36
WHERE diretor_id = 40;

DELETE FROM Professor WHERE id = 40;

-- 3
INSERT INTO Ministra VALUES (32, 1);
UPDATE turma_ministrada
SET professor_id = 32
WHERE professor_id = 31;