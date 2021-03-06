# Projeto de Banco de Dados 1

Alunos: Amanda Melo, Igor Monardez, Israel Navarro e Luiz Torre

## Modelagem de Dados

![modelo_conceitual](/images/modelagem.png)

## Projeto Lógico

  ```
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
```



## Resultado das consultas

1) Listar o nome e a cidade das escolas onde todos os alunos residam na mesma cidade onde a escola está localizada.

![questao1](/images/1.jpeg)


2) Listar o nome e matrícula dos alunos sem nenhum contato cadastrado.

![questao2](/images/2.jpeg)


3) Listar o código e nome das turmas com mais de 5 alunos.

![questao3](/images/3.jpeg)


4) Listar o código, nome e titulação dos professores que ministram aulas para pelo menos três turmas diferentes.

![questao4](/images/4.jpeg)


5) Listar por disciplina o número de professores que podem ministrá-la e quantos efetivamente ministram a mesma para uma turma.

![questao5](/images/5.jpeg)


6) Listar o nome da escola e o nome dos diretores de escola que residem em cidades diferentes da cidade da escola.

![questao6](/images/6.jpeg)


7) Listar por escola o número de turmas e o número de professores que ministram alguma disciplina para turmas da escola em questão.

![questao7](/images/7.jpeg)


8) Listar por escola a razão entre o número de alunos da escola e o número de professores que ministram alguma disciplina na escola em questão.

![questao8](/images/8.jpeg)


9) Listar todos os contatos dos alunos informando a matrícula e nome do aluno, nome e telefone do contato, ordenado por matrícula do aluno e nome do contato.

![questao9](/images/9.jpeg)


10) Listar todos os professores que ministram disciplinas para apenas uma turma.

![questao10](/images/10.jpeg)



## Resultado das modificações

1) Alterar todos os contatos vinculados a um aluno A para um aluno B.

Resultado, AlunoA.id é 1 e AlunoB.id é 2, antes e depois:

![questao1_antes](/images/before1.jpeg) ![questao1_depois](/images/after1.jpeg)


2) Forneça um conjunto de instruções SQL para remover da base de dados um professor qualquer. Caso o professor seja diretor de uma escola um novo diretor deverá ser definido.

Resultado, professor removido é o 40, antes, durante e depois:

![questao2_antes](/images/before2.jpeg) 

![questao2_durante](/images/process2.jpeg) 

![questao2_depois](/images/after2_1.jpeg) 

![questao2_depois](/images/after2_2.jpeg)


3) Considerando que um Professor P1 precisou sair de licença médica, substituí-lo por outro Professor P2 em todas as turmas onde P1 ministra disciplinas. Importante: Caso o Professor P2 não esteja vinculado a todas as disciplinas ministradas pelo Professor P1, inclua a informação de que o Professor P2 é capaz de ministrar todas as disciplinas ministradas pelo Professor P1.

Resultado, ProfessorP1.id é 31 e ProfessorP2.id é 32, antes e depois:

![questao1_antes](/images/before3.jpeg) ![questao1_depois](/images/after3.jpeg)
