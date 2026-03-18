import random
import sqlite3

def gerar_dados():
    nomes = ["João", "Maria", "José", "Ana", "Pedro", "Paula", "Carlos", "Fernanda", "Lucas", "Julia", "Marcos", "Beatriz", "Ricardo", "Camila", "André", "Larissa", "Rafael", "Amanda", "Gustavo", "Bruna"]
    sobrenomes = ["Silva", "Santos", "Oliveira", "Souza", "Rodrigues", "Ferreira", "Alves", "Pereira", "Lima", "Gomes", "Costa", "Ribeiro", "Martins", "Carvalho", "Teixeira", "Barbosa", "Mendes", "Rocha", "Vieira", "Nascimento"]
    logradouros = ["Rua das Flores", "Avenida Central", "Rua 7 de Setembro", "Praça da Matriz", "Rua XV de Novembro", "Avenida Paulista", "Rua Augusta", "Avenida Brasil", "Rua Amazonas", "Rua Minas Gerais"]
    cidades = [("São Paulo", "SP"), ("Rio de Janeiro", "RJ"), ("Belo Horizonte", "MG"), ("Curitiba", "PR"), ("Porto Alegre", "RS"), ("Salvador", "BA"), ("Recife", "PE"), ("Fortaleza", "CE"), ("Brasília", "DF"), ("Campinas", "SP")]

    alunos = []
    enderecos = []
    telefones = []

    for i in range(1, 301):
        nome = random.choice(nomes)
        sobrenome = random.choice(sobrenomes)
        email = f"{nome.lower()}.{sobrenome.lower()}{i}@gmail.com"
        if i % 5 == 0:
            email = email.replace("@gmail.com", "@outlook.com")
        
        nascimento = f"{random.randint(1980, 2010)}-{random.randint(1, 12):02d}-{random.randint(1, 28):02d}"
        cpf = f"{random.randint(100, 999)}.{random.randint(100, 999)}.{random.randint(100, 999)}-{random.randint(10, 99)}"
        
        alunos.append((i, nome, sobrenome, email, nascimento, cpf))
        
        cidade_info = random.choice(cidades)
        enderecos.append((i, i, random.choice(logradouros), cidade_info[0], cidade_info[1], f"{random.randint(10000, 99999)}-{random.randint(100, 999)}"))
        
        # Alguns alunos têm 1 telefone, outros 2
        num_tels = random.choices([1, 2], weights=[0.7, 0.3])[0]
        for _ in range(num_tels):
            ddd = random.choice(["11", "21", "31", "41", "51", "61", "71", "81", "85", "19"])
            numero = f"9{random.randint(7000, 9999)}-{random.randint(1000, 9999)}"
            telefones.append((i, ddd, numero))

    return alunos, enderecos, telefones

def criar_sql_file(alunos, enderecos, telefones):
    with open('setup_banco.sql', 'w') as f:
        f.write("CREATE TABLE Alunos (\n")
        f.write("    id_aluno INTEGER PRIMARY KEY,\n")
        f.write("    nome TEXT,\n")
        f.write("    sobrenome TEXT,\n")
        f.write("    email TEXT,\n")
        f.write("    data_nascimento DATE,\n")
        f.write("    cpf TEXT\n")
        f.write(");\n\n")

        f.write("CREATE TABLE Enderecos (\n")
        f.write("    id_endereco INTEGER PRIMARY KEY,\n")
        f.write("    id_aluno INTEGER,\n")
        f.write("    logradouro TEXT,\n")
        f.write("    cidade TEXT,\n")
        f.write("    estado TEXT,\n")
        f.write("    cep TEXT,\n")
        f.write("    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)\n")
        f.write(");\n\n")

        f.write("CREATE TABLE Telefones (\n")
        f.write("    id_telefone INTEGER PRIMARY KEY AUTOINCREMENT,\n")
        f.write("    id_aluno INTEGER,\n")
        f.write("    ddd TEXT,\n")
        f.write("    numero TEXT,\n")
        f.write("    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)\n")
        f.write(");\n\n")

        f.write("INSERT INTO Alunos (id_aluno, nome, sobrenome, email, data_nascimento, cpf) VALUES\n")
        f.write(",\n".join([f"({a[0]}, '{a[1]}', '{a[2]}', '{a[3]}', '{a[4]}', '{a[5]}')" for a in alunos]))
        f.write(";\n\n")

        f.write("INSERT INTO Enderecos (id_endereco, id_aluno, logradouro, cidade, estado, cep) VALUES\n")
        f.write(",\n".join([f"({e[0]}, {e[1]}, '{e[2]}', '{e[3]}', '{e[4]}', '{e[5]}')" for e in enderecos]))
        f.write(";\n\n")

        f.write("INSERT INTO Telefones (id_aluno, ddd, numero) VALUES\n")
        f.write(",\n".join([f"({t[0]}, '{t[1]}', '{t[2]}')" for t in telefones]))
        f.write(";\n")

if __name__ == "__main__":
    alunos, enderecos, telefones = gerar_dados()
    criar_sql_file(alunos, enderecos, telefones)
    print("Script SQL 'setup_banco.sql' gerado com sucesso.")
