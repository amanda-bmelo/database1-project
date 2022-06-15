from faker import Faker 
from random import randint
import datetime

faker = Faker()
for i in range (40):
    print(f'insert into Pessoa(nome, telefone, cidade_id) values ("{faker.name()}", "(21)9{randint(1000,9999)}-{randint(1000,9999)}", 3);')

for i in range (106, 116):
    string = f'insert into Aluno(id, matricula, data_nasc, turma_id) values ({i}, "0{randint(15,21)}.{randint(100,199)}.{randint(100,999)}","{faker.date_between_dates(date_start=datetime.date(2005, 1, 1), date_end=datetime.date(2006, 1, 1))}", 9);'
    print(string)

for i in range (81, 106):
    string = f'insert into Contato(aluno_id, nome, telefone) values ({i}, "{faker.first_name()+" "+ faker.last_name()}","(21)9{randint(1000,9999)}-{randint(1000,9999)}");'
    print(string)


titulacao = ["mestre", "doutor", "PhD"]
for i in range(116,121):
    string = f'insert into Professor(id, RG, CPF, titulacao) values ({i}, "{randint(10,99)}.{randint(100,999)}.{randint(100,999)}-{randint(10,99)}", "{randint(100,999)}.{+randint(100,999)}.{randint(100,999)}-{randint(10,99)}", "{titulacao[randint(0,2)]}");'
    print(string)
x = 2
for i in range(116,121):
    print(f'insert into Turma_Ministrada(professor_id, disciplina_id, turma_id) values({i}, {x}, 7);\ninsert into Turma_Ministrada(professor_id, disciplina_id, turma_id) values({i}, {x}, 8);\ninsert into Turma_Ministrada(professor_id, disciplina_id, turma_id) values({i}, {x}, 9);')
    x+=1