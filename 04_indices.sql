-- Índice para acelerar filtros e ordenações pela data do agendamento.
CREATE INDEX idx_agendamentos_data
ON Agendamentos(data_hora);

-- A coluna Medicos.crm já é UNIQUE.
-- No SQLite, a restrição UNIQUE cria automaticamente um índice.
-- Por isso, não criamos um segundo índice redundante para o CRM.
