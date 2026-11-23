-- Ative as chaves estrangeiras nesta conexão antes de executar os comandos:
PRAGMA foreign_keys = ON;

CREATE TABLE Pacientes (
    id_paciente INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cpf TEXT UNIQUE NOT NULL,
    telefone TEXT
);

CREATE TABLE Medicos (
    id_medico INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    crm TEXT UNIQUE NOT NULL,
    especialidade TEXT
);

CREATE TABLE Agendamentos (
    id_agendamento INTEGER PRIMARY KEY,
    id_paciente INTEGER NOT NULL,
    id_medico INTEGER NOT NULL,
    data_hora TEXT NOT NULL,
    status TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

CREATE TABLE Prontuarios (
    id_prontuario INTEGER PRIMARY KEY,
    id_agendamento INTEGER NOT NULL UNIQUE,
    descricao TEXT,
    data_registro TEXT,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamentos(id_agendamento)
);
