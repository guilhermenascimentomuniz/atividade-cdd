-- Banco original fictício da clínica médica
CREATE TABLE Atendimentos (
    id_atendimento INTEGER PRIMARY KEY,
    nome_paciente TEXT,
    cpf_paciente TEXT,
    telefone_paciente TEXT,
    nome_medico TEXT,
    crm_medico TEXT,
    especialidade TEXT,
    data_consulta TEXT,
    status TEXT,
    descricao_prontuario TEXT
);

INSERT INTO Atendimentos VALUES
(1, 'Ana Silva', '00000000001', '11999990001', 'Carlos Mendes', 'CRM1001', 'Cardiologia', '2026-11-20 09:00', 'Concluido', 'Consulta de rotina'),
(2, 'Joao Santos', '00000000002', '11999990002', 'Mariana Costa', 'CRM1002', 'Dermatologia', '2026-11-20 10:00', 'Concluido', 'Avaliacao dermatologica'),
(3, 'Ana Silva', '00000000001', '11999990001', 'Carlos Mendes', 'CRM1001', 'Cardiologia', '2026-11-22 14:00', 'Agendado', 'Retorno medico'),
(4, 'Pedro Lima', '00000000003', '11999990003', 'Mariana Costa', 'CRM1002', 'Dermatologia', '2026-11-23 11:00', 'Agendado', 'Consulta inicial'),
(5, 'Joao Santos', '00000000002', '11999990002', 'Carlos Mendes', 'CRM1001', 'Cardiologia', '2026-11-24 15:00', 'Agendado', 'Avaliacao cardiologica');
