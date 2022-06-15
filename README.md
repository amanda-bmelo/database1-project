# database1-project
A small group project developed for academic purposes with a focus on improving knowledge of SQL and basic database concepts.

Projeto Lógico

  Cidade (id, nome)

  Pessoa (id, nome, telefone, cidade_id)
      cidade_id referencia Cidade

  Escola (id, nome, cidade_id, diretor_id)
      cidade_id referencia Cidade
      diretor_id referencia Professor

  Turma (id, nome, escola_id)
      escola_id referencia Escola

  Disciplina (id, nome)

  Aluno (id, matricula, data_nascimento, turma_id)
      id referencia Pessoa
      turma_id referencia Turma

  Contato (aluno_id, nome, telefone)
      aluno_id referencia Aluno

  Professor (id, RG, CPF, titulacao)
      id referencia Pessoa

  Ministra (professor_id, disciplina_id)
      professor_id referencia Professor
      disciplina_id referencia Disciplina

  Turma_Ministrada (turma_id, professor_id, disciplina_id)
      turma_id referencia Turma
      professor_id referencia Ministra (professor_id)
      disciplina_id referencia Ministra(disciplina_id)
