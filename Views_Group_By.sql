use biblioteca;

-- Apresenta os funcionarios por data (desc), cargo e o nome

CREATE VIEW Funcionarios_por_Data AS SELECT data_contratacao,cargo, nome FROM funcionarios ORDER BY data_contratacao, nome DESC;

-- Apresenta o número de livros por categoria

CREATE VIEW Livros_por_Categoria AS SELECT COUNT(livros.id_livro) AS NumeroDeLivros,categoria.nome as Categoria 
FROM livros RIGHT JOIN categoria ON livros.id_categoria = categoria.id_categoria GROUP BY categoria.nome ORDER BY COUNT(livros.id_livro) DESC;

-- Apresenta os funcionários, leitores e livros emprestados (select copiado)
CREATE VIEW Funcionarios_por_Emprestimo AS SELECT
	F.nome AS Funcionario,
	LE.nome AS Leitor, 
    L.titulo AS Livro, 
    E.data_emprestimo AS DataEmprestimo, 
    E.data_devolucao AS DataDevolucao
FROM Emprestimo E
INNER JOIN Livros L ON E.ID_livro = L.id_livro
INNER JOIN Leitores LE ON E.ID_leitor = LE.id_leitor
INNER JOIN Funcionarios F ON E.id_funcionario = F.id_funcionario;

-- Consulta de views

SELECT * FROM Funcionarios_por_Emprestimo ;
SELECT * FROM Livros_por_Categoria ;
SELECT * FROM Funcionarios_por_Data ;
