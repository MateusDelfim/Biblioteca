show databases;

-- Criando a base de dados
create database biblioteca;
use biblioteca;

-- Criando a tabela de Categoria
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela de Livros
CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    ano_publicacao YEAR,
    quantidade int,
    isbn VARCHAR(13) UNIQUE,
    id_categoria INT,
    id_editora INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_editora) REFERENCES Editora(id_editora)
);

-- Criando a tabela de Editora
CREATE TABLE Editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    email  varchar(255),
    telefone VARCHAR(20)
);

-- Criando a tabela de Funcionários
CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    data_contratacao DATE,
    telefone VARCHAR(20),
    email varchar(100)
);

-- Criando a tabela de Leitores
CREATE TABLE Leitores (
    id_leitor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    data_cadastro Date
);

-- Criando a tabela de Leitura
CREATE TABLE Leitura (
    id_leitura INT AUTO_INCREMENT PRIMARY KEY,
    id_leitor INT NOT NULL,
    id_livro INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    status ENUM('Disponível', 'Emprestado', 'Reservado') DEFAULT 'Disponível', 
    FOREIGN KEY (id_leitor) REFERENCES Leitores(id_leitor),
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

-- Criando a tabela de Empréstimos
CREATE TABLE Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    ID_livro  INT NOT NULL,
    ID_Leitor INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    Data_devolução_real Date,
    id_funcionario INT,
     FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
      FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
    FOREIGN KEY (id_leitor) REFERENCES Leitores(id_leitor)
);

-- Criação tabela Livro_Emprestimo
CREATE TABLE Livro_Emprestimo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    id_emprestimo INT NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo)
);

-- Visualização das tabelas
DESCRIBE Categoria;

SELECT * FROM Categoria;

SELECT * FROM Editora; 

SELECT * FROM Leitores; 

SELECT * FROM Funcionarios;

SELECT `status` FROM Leitura;

SELECT * FROM Leitura;

 SELECT * FROM Livros;
 
 show tables;

SELECT * FROM Livro_Emprestimo;

SELECT * FROM Emprestimo;

SELECT id_livro FROM Livros;


DESCRIBE Leitores;

-- Diversão

SELECT * FROM Emprestimo WHERE status = 'Emprestado';





-- Alterações

RENAME TABLE Funcionario TO Funcionarios;

ALTER TABLE Emprestimo
ADD COLUMN status ENUM('Disponível', 'Emprestado', 'Reservado') DEFAULT 'Emprestado';

ALTER TABLE Categoria
ADD COLUMN descricao TEXT;

ALTER TABLE Livros
MODIFY COLUMN isbn VARCHAR(20);

ALTER TABLE Leitura
MODIFY COLUMN status ENUM('Em andamento', 'Concluída', 'Abandonada') DEFAULT 'Em andamento';

ALTER TABLE Leitura
MODIFY COLUMN data_fim DATE NULL;

ALTER TABLE Emprestimo
MODIFY COLUMN Data_devolução_real DATE NULL;


-- Inserção de Registros

INSERT INTO Categoria (nome, descricao) VALUES
('Ficção', 'Livros de ficção e literatura'),
('Não-ficção', 'Livros baseados em fatos reais e temas diversos'),
('Ciência', 'Livros sobre temas científicos e pesquisa'),
('História', 'Livros de história e fatos históricos'),
('Tecnologia', 'Livros sobre tecnologia e inovação'),
('Arte', 'Livros de artes visuais e performáticas'),
('Filosofia', 'Livros de filosofia e pensamento crítico'),
('Psicologia', 'Livros sobre psicologia e comportamento humano'),
('Religião', 'Livros sobre temas religiosos e espirituais'),
('Autoajuda', 'Livros de autoaperfeiçoamento e desenvolvimento pessoal'),
('Educação', 'Livros sobre métodos educacionais e ensino'),
('Literatura Infantil', 'Livros voltados para o público infantil'),
('Biografia', 'Livros que narram a vida de uma pessoa'),
('Poesia', 'Livros de poesia e poemas'),
('Saúde', 'Livros sobre medicina, saúde e bem-estar'),
('Direito', 'Livros sobre leis e temas jurídicos'),
('Administração', 'Livros sobre negócios e administração'),
('Economia', 'Livros de economia e finanças'),
('Matemática', 'Livros sobre matemática e estatística'),
('Ciência Política', 'Livros sobre política e governança'),
('Geografia', 'Livros sobre geografia e estudos territoriais');

-- Inserção de dados tabela Editora.

INSERT INTO Editora (nome, endereco, email,telefone) VALUES
('A esfera dos livros','R.Professsor Reinaldo dos Santos Nº42 Lisboa', 'livros@esferadoslivros.pt','+351-21-340-4060'),
('SHEDD Publicações','Rua Carlos Gomes,993 Santo Amaro-São Paulo','shedd@sheddpublicaaoes.com.br','11-3223-6594'),
('Editora Esperança','','pedidos@editoraesperanca.com.br','41-3022-3390'),
('Editora Vida','Rua Conde de Sarzedas,246 São Pauol','atendimento@editoravida.com.br','11-2618-7000'),
('Plural Editores','Centro de Logistica Talatona,LojaC3,Belas','','924-351-990'),
('União dos Escritores Angolanos','','','928-295-805'),
('Santos Editora','Rua Cândido Lopes 342,Centro Curitiba','vendas@adsantos.com.br','41-99790-9180'),
('Thomas Nelson Brasil','Pedro Pinhares Gomes,3990','vendas@thomasnelson.com.br','');

-- Inserção tabela Livros

INSERT INTO Livros(titulo, autor, ano_publicacao, quantidade, isbn, id_categoria, id_editora) VALUES
('Nascido para Triunfar','Adelino Cunha','2012','4','9-789896-261528','10','1'),
('Casamento Blindado','Renato e Cristiane Cardoso','2012','6','9-788578-609443','10','8'),
('Socorro!!! Teenho que preparar um sermão','Cesar Cezar','2010','200','85-7459-063-0','9','7'),
('No País Chamado Árvores E Outros Contos','Giuseppe Mistretta','2010','1','','1','6'),
('Ensina o Teu Filho a Estudar','Renato Paiva','2015','18','9-78-9896-263683','10','1'),
('Lei Geral do Trabalho','Colecção Legislação Angola','2019','156','978-989-611-486-2','16','5'),
('Poder para mudar Sua Vida','Rick Warren','2007','123','978-85-7367-987-8','9','4'),
('Mais de Mil Esbolços Bíblicos de Gênesis a Apocalipse','Georg Brinke','2017','15','978-85-86249-53-2','9','3'),
('Esbolços Bíblicos de Salmos','C.H.Spurgeon','2018','57','978-85-88315-49-5','9','2'),
('Grandes Dúvidas Da Língua Portuguesa','Elsa Rodrigues dos Santos','2012','23','9-789896-263171','2','1');

-- Inserção tabela

INSERT INTO Funcionarios(nome, cargo, data_contratacao, telefone, email) VALUES
('Hazaela Lemos','Bibliotecária Chefe','2018-02-12','923-504-399','hazaelaluisa@gmail.com'),
('Carla Camilo','Bibliotecária','2019-06-25','941-234-675','carla@camilo@gmail.com'),
('Igor Teixeira','Auxiliar de Biblioteca','2020-01-15','901-231-223','teixeiraigor@gmail.com'),
('Mateus Cazunga','Assistente de Processamento','2021-03-10','','mateus29cazunga2@gmail.com'),
('Leopoldo Piedade','Responsável pelo Acervo Digital','2021-11-30','987-546-122','leopoldopiedado80@gmail.com'),
('Fernanda Silva','Contadora','2016-05-22','923-768-549','fernandasilva@gmail.com');

-- Inserção tabela Leitors.
INSERT INTO Leitores(nome, email, telefone, endereco, data_cadastro) VALUES
('Dinétria Lemos Camilo','dinetrialemos16@gmail.com','997-501-124','Condomínio Planalto do Kinu','2020-06-12'),
('Yani de Jesus','dejesus13@gmail.com','928-234-198','Kilamba','2020-03-19'),
('Edmilton Dário','darioedmilton@gmail.com','998-332-342','Sequele','2021-02-12'),
('Richel Alves','richelalves16@gmail.com','912-454-112','Condomínio Kuditemo','2022-07-16'),
('Kassio Neves','neves2312gmail.com','923-284-983','Cassenda','2023-08-18'),
('Sandro Lopes','lopeslpoes@gmail.com','990-226-554','Jardim de Rosas','2024-11-06'); 

-- INSERÇÃO TABELA LEITURA

INSERT INTO Leitura(id_leitor, id_livro, id_funcionario, data_inicio, data_fim, status) VALUES
('4','11','2','2024-11-02',NULL,'Em andamento'),
('5','14','2','2024-10-04','2024-10-27','Concluída'),
('1','17','2','2024-11-07',NULL,'Em andamento'),
('5','13','2','2024-10-30',NULL,'Em andamento'),
('3','20','2','2024-09-12',NULL,'Abandonada');

-- inserção tabela Emprestimo

INSERT INTO Emprestimo(ID_livro, ID_leitor, data_emprestimo, data_devolucao, Data_devolução_real, id_funcionario,  status) VALUES
('12','6','2024-11-04','2024-12-24',NULL,'3','Emprestado'),
('17','2','2024-10-16','2024-11-20',NULL,'2','Emprestado');

INSERT INTO Livro_Emprestimo(id_livro, id_emprestimo) VALUES
('12','3'),
('17','4');