-- Criação da tabela de Espécies
CREATE TABLE especies (
    especie_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(250)
);

-- Inserções na tabela espécies
INSERT INTO especies (nome, descricao) VALUES
('gato', 'Animal doméstico com quatro patas e pelagem'),
('cao', 'Animal de estimação leal e amigável'),
('passaro', 'Animal alado que pode voar');

-- Criação da tabela de Animais
CREATE TABLE animais (
    animal_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE,
    peso DECIMAL(5,2),
    cor varchar(50),
    especie_id INT,
    
    FOREIGN KEY (especie_id) REFERENCES Especies(especie_id)
);

-- Inserções na tabela Animais
INSERT INTO animais (nome, data_nasc, peso, cor, especie_id) VALUES
('Cato', '2020-05-10', 5.2, 'preto', 1),
('NekoBasu', '2017-04-01', 199.99, 'preto', 1),
('Garfield', '2020-11-20', 9.8, 'amarelo', 1),
('Dogo', '2018-09-12', 3.5, 'branco', 2),
('Pateta', '2019-08-15', 12.5, 'branco', 2),
('rex', '2017-12-30', 10.3, 'marrom', 2),
('Tweety', '2018-02-25', 0.1, 'azul', 3),
('FatChocobo', '2019-06-08', 200.0, 'amarelo', 3);

-- Atualizando a tabela animais, definindo o campo "nome" como "Goofy" onde existir o valor "Pateta".
  UPDATE animais
  SET nome = 'Goofy' 
  WHERE nome = 'Pateta';
 
 -- Atualizando a tabela animais, definindo o campo "peso" como 10 onde existir o valor Garfield. 
  UPDATE animais
  SET peso = 10
  WHERE nome = 'Garfield';
  
  /*Atualizando a tabela animais, definindo o campo "cor" como "laranja" 
  onde o valor de especie_id da tabela animais corresponda ao valor de 
  "especie_id" da tabela especies e o nome da especie seja "gato".*/  
  UPDATE animais
  SET cor = 'laranja'
  WHERE especie_id = (SELECT especie_id FROM Especies WHERE nome = 'gato' );
  
  -- Alterar estrutura da tabela animais adicionando um campo "altura".
  ALTER TABLE animais
  ADD altura decimal(3,2);
  
  -- Alterar estrutura da tabela animais, adicionando um campo "observação".
  ALTER TABLE animais
  ADD observacao varchar(100);
  
  -- Deletando registros da tabela animais onde "peso" seja maior ou igual á 200.
  DELETE FROM animais
  WHERE peso >= 200;
  
  -- Deletando registros da tabela animais onde "nome" seja iniciado por "C".
  DELETE FROM animais
  WHERE nome LIKE  'C%';
  
  -- Alterar estrutura da tabela animais, removendo o campo "cor".
  ALTER TABLE animais
  DROP cor;
  
  -- Altera a estrutura da tabela animais, modifica o tamanho do campo "nome" para 80. 
  ALTER TABLE animais
  MODIFY nome varchar(80);

  /* Deletando registros da tabela animal onde "especie_id" da tabela 
  animais corresponda a "especie_id" da tabela especies onde os valores 
  "gato" e "cao" estajam presentes  */
  DELETE FROM animais
  WHERE especie_id in (SELECT especie_id FROM Especies WHERE nome IN ('gato', 'cao'));

  -- Alterar estrutura da tabela animais, removendo o campo "data_nasc". 
  ALTER TABLE animais
  DROP data_nasc;
  
  -- Detela todos os registros da tabela animais.
  DELETE FROM animais;
  
  -- Apaga a tabela especies
  DROP TABLE especies;
