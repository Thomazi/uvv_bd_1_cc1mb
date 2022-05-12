-- Pset2

-- Questão 1

SELECT AVG(salario) AS media_salarial, numero_departamento
  FROM funcionario
  GROUP BY numero_departamento;

-- Questão 2

SELECT
 CASE sexo
 WHEN 'M' THEN 'Homens'
 WHEN 'F' THEN 'Mulheres'
 ELSE ''
 END sexo,
 AVG(salario) AS media_salarial
 FROM funcionario 
 GROUP BY sexo;

-- Questão 3

SELECT 
  numero_departamento,
  nome_departamento,
  CONCAT(primeiro_nome,' ', f.nome_meio, ' ', ultimo_nome) AS nome_completo,
  data_nascimento, idade('year', age(data_nascimento))::int AS idade, salario
  FROM departamento, funcionario;

-- Questão 4

SELECT 
  concat(primeiro_nome,' ', nome_meio, ' '. ultimo_nome) AS nome_completo,
  idade("year", age(data_nascimento))::int AS idade,
  salario AS salario_atual, salario *1.20 AS salario_reajustado
  FROM funcionario
  WHERE salario < 35000
  UNION 
  SELECT concat(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS nome_completo,
  idade, salario AS salario atual, salario *1.15 AS salario_reajustado
  FROM funcionario
  WHERE salario >= 35000

-- Questão 5

WITH gerente AS (SELECT concat(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS nome,
  cpf FROM funcionario)
  SELECT nome_departamento, concat(primeiro_nome,' ', nome_meio, ' ', ultimo_nome) AS nome_funcionario,
  nome AS nome_gerente
  FROM departamento
  INNER JOIN funcionario ON numero_departamento = numero_departamento
  INNER JOIN gerente ON cpf = cpf_gerente
  ORDER BY nome_departamento ASC, salario DESC;

--Questão 6

SELECT
  CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS funcionario,
  nome_departamento AS departamento,
  nome_dependente AS dependentes,
  idade('year', age(data_nascimento))::int AS idade,
  CASE sexo
  WHEN 'M' THEN 'Homem'
  WHEN 'F' THEN 'Mulher'
  ELSE ''
  END sexo
  FROM funcionario, dependente, departamento
  WHERE
  (cpf = cpf_funcionario)
  AND
  (numero_departamento = numero_departamento);

-- Questão 7

SELECT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS funcionario,
  numero_departamento AS departamento,
  salario AS salario
  FROM funcionario 
  EXCEPT
  SELECT
  CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS funcionario,
  numero_departamento AS departamento,
  salario AS salario
  FROM dependente 
  INNER JOIN funcionario f ON (cpf_funcionario = cpf);

-- Questão 8

SELECT DISTINCT nome_departamento,
  concat('(n', numero_projeto, ')', nome_projeto) AS numero_projeto, nome_projeto,
  concat(primeiro_nome, ' ', nome_meio, ' 'ultimo_nome) AS nome_completo, horas
  FROM funcionario 
  INNER JOIN departamento
  INNER JOIN trabalha_em
  INNER JOIN funcionario ON cpf = cpf_funcionario
  WHERE numero_departamento = numero_departamento
  AND numero_projeto = numero_departamento
  ORDER BY numero_projeto;

-- Questão 9

SELECT
  nome_departamento AS departamento,
  nome_projeto AS projeto,
  SUM(horas) AS horas
  FROM trabalha_em 
  INNER JOIN projeto ON (numero_projeto = numero_projeto)
  INNER JOIN departamento ON (numero_departamento = numero_departamento)
  GROUP BY numero_departamento, nome_projeto
  ORDER BY nome_departamento;

-- Questão 10

SELECT concat('(n',numero_departamento, ')', nome_departamento) AS Numero_departamento, nome_departamento
 FROM funcionario 
 INNER JOIN departamento ON numero_departamento = numero_departamento
 GROUP BY nome_departamento
 ORDER BY numero_e_nome_departamento;

-- Questão 11

SELECT 
concat(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome_completo,
 nome_projeto,
 horas *50 AS valor_recebido
 FROM trabalha_em 
 INNER JOIN projeto ON numero_projeto = numero_projeto
 INNER JOIN funcionario ON cpf = cpf_funcionario
 ORDER BY nome_completo;

-- Questão 12

SELECT
 nome_departamento, nome_projeto,
 concat(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome_completo 
 FROM trabalha_em 
 INNER JOIN projeto ON numero_projeto = numero_projeto
 INNER JOIN departamento ON numero_departamento = numero_departamento
 INNER JOIN funcionario ON cpf = cpf_funcionario
 WHERE horas IS NULL;

 -- Questão 13
 
 SELECT 
  CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS nome,
  CASE sexo
  WHEN 'M' THEN 'Homens'
  WHEN 'F' THEN 'Mulheres'
  ELSE ''
  END sexo, idade('year', age(data_nascimento))::int AS idade
  idade('year', age(data_nascimento))::int AS idade
  FROM funcionario 
  UNION
  SELECT
  nome_dependente AS nome,
  CASE sexo
  WHEN 'M' THEN 'Homens'
  WHEN 'F' THEN 'Mulheres'
  ELSE ''
  END sexo,
  idade('year', age(data_nascimento))::int AS idade
  FROM dependente 
  ORDER BY idade DESC;
  
  
  
-- Questão 14

SELECT concat('(n', numero_departamento, ')', nome_departamento) AS numero_departamento, nome_departamento,
 count(*) AS quantidade_de_funcionarios
 FROM departamento 
 JOIN funcionario ON (numero_departamento = numero_departamento)
 GROUP BY numero_e_nome_departamento;

-- Questão 15

SELECT concat(primeiro_nome,' ', nome_meio,'. ', ultimo_nome) AS nome_completo_funcionario,
 nome_departamento, nome_projeto
 FROM funcionario 
 INNER JOIN trabalha_em ON cpf_funcionario = cpf 
 INNER JOIN projeto ON numero_projeto = numero_projeto 
 INNER JOIN departamento ON numero_departamento = numero_departamento 
 WHERE numero_departamento = numero_departamento
 ORDER BY nome_completo;
