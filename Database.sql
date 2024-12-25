CREATE DATABASE faculdade;
USE faculdade;
CREATE TABLE curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    duracao INT NOT NULL,
    area VARCHAR(100) NOT NULL
);
CREATE TABLE professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    area VARCHAR(100) NOT NULL
);
CREATE TABLE disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);
CREATE TABLE turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    periodo VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);
CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);
CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);
CREATE TABLE nota (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL UNIQUE,
    nota1 DECIMAL(4,2),
    nota2 DECIMAL(4,2),
    nota_final DECIMAL(4,2),
    frequencia DECIMAL(5,2),
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula)
);

