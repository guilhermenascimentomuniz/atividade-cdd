-- Quantidade de registros em cada tabela.
SELECT COUNT(*) AS total_pacientes FROM Pacientes;
SELECT COUNT(*) AS total_medicos FROM Medicos;
SELECT COUNT(*) AS total_agendamentos FROM Agendamentos;
SELECT COUNT(*) AS total_prontuarios FROM Prontuarios;

-- Consulta dos agendamentos com paciente e médico.
SELECT
    a.id_agendamento,
    p.nome AS paciente,
    m.nome AS medico,
    m.crm,
    a.data_hora,
    a.status
FROM Agendamentos AS a
JOIN Pacientes AS p ON a.id_paciente = p.id_paciente
JOIN Medicos AS m ON a.id_medico = m.id_medico;

-- Consulta dos prontuários com paciente e médico.
SELECT
    p.nome AS paciente,
    m.nome AS medico,
    pr.descricao,
    pr.data_registro
FROM Prontuarios AS pr
JOIN Agendamentos AS a ON pr.id_agendamento = a.id_agendamento
JOIN Pacientes AS p ON a.id_paciente = p.id_paciente
JOIN Medicos AS m ON a.id_medico = m.id_medico;

-- Pesquisa por data.
SELECT *
FROM Agendamentos
WHERE data_hora LIKE '2026-11-20%';

-- Pesquisa por CRM.
SELECT *
FROM Medicos
WHERE crm = 'CRM1001';

-- Verifica violações de chaves estrangeiras.
PRAGMA foreign_key_check;

-- Lista os índices das tabelas.
PRAGMA index_list('Agendamentos');
PRAGMA index_list('Medicos');
