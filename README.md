# Refatoração de Banco de Dados — Clínica Médica

Projeto acadêmico do Exercício 6 — Sprint Ágil de Refatoração de Banco de Dados.
O cenário escolhido é o de Clínica Médica.

## Objetivo

Demonstrar a refatoração de uma tabela única de atendimentos para uma estrutura
separada em Pacientes, Medicos, Agendamentos e Prontuarios, reduzindo repetição
de dados e organizando os relacionamentos.

## Problema inicial

A tabela `Atendimentos` reúne dados de pacientes, médicos, agendamentos e
prontuários. Isso repete informações cadastrais a cada atendimento. O cenário
também aponta ausência de índices para pesquisas por data e CRM.

## Estrutura final

- `Pacientes`: cadastro dos pacientes.
- `Medicos`: cadastro dos médicos; `crm` é único.
- `Agendamentos`: relaciona pacientes e médicos por chaves estrangeiras.
- `Prontuarios`: registra informações dos atendimentos concluídos, com no
  máximo um prontuário por agendamento.

## Ordem de execução no SQLiteOnline

1. `01_banco_original.sql`
2. `02_refatoracao_ddl.sql`
3. `03_migracao_dml.sql`
4. `04_indices.sql`
5. `05_testes.sql`

Execute os arquivos em sequência no mesmo banco SQLite. Se as tabelas já
existirem na sua sessão, não execute novamente os comandos de criação e
inserção, pois eles podem gerar erros de tabela existente ou duplicidade.

## Índices

Foi criado o índice `idx_agendamentos_data` para a coluna `data_hora`.
A coluna `Medicos.crm` possui restrição `UNIQUE`; o SQLite cria um índice
automaticamente para garantir essa unicidade, portanto não é necessário criar
outro índice manual para o CRM.

## Dados

Os registros são fictícios e foram criados apenas para fins didáticos.

## Tecnologias

- SQLite
- SQLiteOnline
- GitHub
