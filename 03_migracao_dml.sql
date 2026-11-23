-- Ative as chaves estrangeiras nesta conexão.
PRAGMA foreign_keys = ON;

-- Copia cada paciente uma única vez.
INSERT INTO Pacientes (nome, cpf, telefone)
SELECT DISTINCT nome_paciente, cpf_paciente, telefone_paciente
FROM Atendimentos;

-- Copia cada médico uma única vez.
INSERT INTO Medicos (nome, crm, especialidade)
SELECT DISTINCT nome_medico, crm_medico, especialidade
FROM Atendimentos;

-- Migra os agendamentos mantendo o identificador original.
INSERT INTO Agendamentos
    (id_agendamento, id_paciente, id_medico, data_hora, status)
SELECT
    a.id_atendimento,
    p.id_paciente,
    m.id_medico,
    a.data_consulta,
    a.status
FROM Atendimentos AS a
JOIN Pacientes AS p ON p.cpf = a.cpf_paciente
JOIN Medicos AS m ON m.crm = a.crm_medico;

-- Cria prontuários somente para atendimentos concluídos.
INSERT INTO Prontuarios
    (id_agendamento, descricao, data_registro)
SELECT
    a.id_atendimento,
    a.descricao_prontuario,
    a.data_consulta
FROM Atendimentos AS a
WHERE a.status = 'Concluido'
AND NOT EXISTS (
    SELECT 1
    FROM Prontuarios AS pr
    WHERE pr.id_agendamento = a.id_atendimento
);
