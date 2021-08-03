/*--------------------------------------------------------------
  Curso Técnico em Desenvolvimento de Sistemas
  Banco de Dados II - Prof. Sérgio Lacerda
  Exemplos de comandos Select, Insert, Update e Delete
--------------------------------------------------------------*/

/*--------------------------------------------------------------
  Selecionando o banco de dados para uso.
--------------------------------------------------------------*/
USE dbCursos;

/*--------------------------------------------------------------
  Estrutura básica (inicial) de um Select
	  Select 	"O quê"
	  From		"De onde (qual tabela)"
	  Where		"Com quais condições / filtros"
--------------------------------------------------------------*/
 
/*--- Buscando todos os campos (colunas) ---*/
SELECT *
FROM	tbAlunos;

/*--- Buscando apenas algumas colunas ---*/
SELECT RM, Aluno
FROM	tbAlunos;

/*--- Colocando "Apelidos" (Alias) na exibição de colunas ---*/
SELECT 	RM AS "Código do Aluno", 
		Aluno AS Nome
FROM	tbAlunos;

/*--- Colocando "Apelidos" (Alias) em tabelas ---*/
SELECT 	Al.RM, 
		Al.Aluno
FROM	tbAlunos Al;

/*--- Ordenando os resultados com Order By ---*/
/* Ordem alfabética */
SELECT 		*
FROM		tbAlunos
ORDER BY 	Aluno ASC;

/* Ordem alfabética invertida */
SELECT 		*
FROM		tbAlunos
ORDER BY 	Aluno DESC;

/* Ordem de data de nascimento invertida */
SELECT 		*
FROM		tbAlunos
ORDER BY 	DataNascimento DESC;

/* Combinando critérios de ordenação */
SELECT 		*,
			YEAR(DataNascimento) AS Ano
FROM		tbAlunos
ORDER BY 	YEAR(DataNascimento) DESC,
			Aluno ASC;

/*--- Criando colunas "calculadas" no result set ---*/
SELECT 	concat(RM, " - ", Aluno) AS Estudante, 
		"Etec Comendador João Rays" AS Escola,
        (3 + 5) AS SOMA
FROM	tbAlunos;

/*--- Pesquisando um aluno específico ---*/
SELECT 	*
FROM	tbAlunos
WHERE	IdAluno = 5;

/*--- Pesquisando um grupo de alunos por outras condições de Id ---*/
/* Ids menores ou iguais a 5 */
SELECT 	*
FROM	tbAlunos
WHERE	IdAluno <= 5;

/* Ids maiores que 9 */
SELECT 	*
FROM	tbAlunos
WHERE	IdAluno > 9;

/* Ids entre 3 e 7 */
SELECT 	*
FROM	tbAlunos
WHERE	IdAluno BETWEEN 3 AND 7;

/* Obtendo dados de um conjunto de IDs */
SELECT 	*
FROM	tbAlunos
WHERE	IdAluno IN (2, 4, 7, 9);

/* Todos os IDs menos o Id 2 */
SELECT 	*
FROM	tbAlunos
WHERE	IdAluno <> 2;

/*--- Pesquisando alunos por outros campos ---*/
/* Buscando por RM */
SELECT 	*
FROM	tbAlunos
WHERE	RM = "12004";

/* Buscando por Data de Nascimento */
SELECT 	*
FROM	tbAlunos
WHERE	DataNascimento >= "2012-01-01";

/* Todos os nascidos em Junho (qualquer ano) */
SELECT 	*
FROM	tbAlunos
WHERE	Month(DataNascimento) = 6;

/* Todos os nascidos no dia 15 (qualquer mês/ano) */
SELECT 	*
FROM	tbAlunos
WHERE	Day(DataNascimento) = 15;

/* Todos os nascidos 2010 */
SELECT 	*
FROM	tbAlunos
WHERE	Year(DataNascimento) = 2010;

/* Todos com idade menor que 10 anos */
SELECT 	IdAluno, Aluno,
		Year(Now()) AS "Ano atual",
		Year(DataNascimento) AS "Ano nascimento",
        Year(Now()) - Year(DataNascimento) AS "Idade em anos",
        datediff(Now(), DataNascimento) AS "Idade em dias"
FROM	tbAlunos
WHERE	Year(Now()) - Year(DataNascimento) < 10;

/* Calculando intervalos de tempo com TimestampDiff */
SELECT 	NOW() AS DataAtual,
		DataNascimento,
        timestampdiff(YEAR, DataNascimento, Now()) AS "Idade em anos",
        timestampdiff(MONTH, DataNascimento, Now()) AS "Idade em meses",
        timestampdiff(DAY, DataNascimento, Now()) AS "Idade em dias",
        timestampdiff(HOUR, DataNascimento, Now()) AS "Idade em horas",
        timestampdiff(MINUTE, DataNascimento, Now()) AS "Idade em minutos",
        timestampdiff(SECOND, DataNascimento, Now()) AS "Idade em segundos"
FROM	tbAlunos
WHERE	Year(Now()) - Year(DataNascimento) < 10;

/*--- Pesquisando alunos, combinando condições ---*/
/* Condição OR (ou) */
SELECT 	*
FROM	tbAlunos
WHERE	RM = "12004" OR IdAluno = 3;

/* Condição AND (e) */
SELECT 	*
FROM	tbAlunos
WHERE	Year(DataNascimento) = 2010 AND
		IdAluno >= 10;
        
/*--- Pesquisando por campos texto ---*/
/* Busca exata */
SELECT 	*
FROM	tbAlunos
WHERE	Aluno = "Cintia Machado";

/* Não funciona se você quiser pesquisar apenas parte do texto */
SELECT 	*
FROM	tbAlunos
WHERE	Aluno = "Cintia";

/* Busca por parte do texto usando % */
SELECT 	*
FROM	tbAlunos
WHERE	Aluno LIKE "Cintia%";

SELECT 	*
FROM	tbAlunos
WHERE	Aluno LIKE "%Machado";

SELECT 	*
FROM	tbAlunos
WHERE	Aluno LIKE "%tia%";

/* Cuidado com situações case sensitive (maiúscula diferente de minúscula)
   Se o banco fizer essa diferenciação, você precisa converter tudo para
   maiúscula ou tudo para minúscula antes de comparar */
  
SELECT 	Aluno AS Original,
		upper(Aluno) AS Maiuscula,
        lower(Aluno) AS Minuscula
FROM	tbAlunos
WHERE	lower(Aluno) LIKE "cintia%";

/*--------------------------------------------------------------
  Inserindo dados em uma tabela com Insert. É o mesmo comando que
  já estamos utilizando desde o começo do curso.
  Insert Into (lista de campos) Values (lista de valores);
--------------------------------------------------------------*/
INSERT INTO tbAlunos (IdAluno, Aluno, RM, DataNascimento, IdTipoAluno) 
VALUES (12, 'Um Nome Errado Qualquer', '12012', '2015-03-03', 1);

SELECT 	* FROM	tbAlunos;

/*--------------------------------------------------------------
  Atualizando valores em um registro.
	  Update Tabela
	  Set Campo = Valor
	  Where Condições
  OBS: Cuidado com a cláusua Where. Se for programada incorreta-
  mente, você vai alterar valores em todos os registros ou em 
  registros diferentes do que você gostaria.
--------------------------------------------------------------*/
UPDATE 	tbAlunos
SET		Aluno = "Florisbela Ramos",
		DataNascimento = "2015-12-25"
WHERE	IdAluno = 12;

SELECT 	* FROM	tbAlunos WHERE	IdAluno = 12;

/*--------------------------------------------------------------
  Apagando registros de uma tabela.
	  Delete From Tabela	  
	  Where Condições
  OBS: Cuidado com a cláusua Where. Se for programada incorreta-
  mente, você vai pagar todos os registros ou registros diferentes 
  do que você gostaria.
--------------------------------------------------------------*/
DELETE FROM	tbAlunos
WHERE	IdAluno = 12;

SELECT 	* FROM	tbAlunos WHERE	IdAluno = 12;

/*--------------------------------------------------------------
  Trabalhando com funções de agregação
--------------------------------------------------------------*/
/* Obter o Maior ID */
SELECT	MAX(IdAluno) AS "Maior Id"
FROM	tbAlunos;

/* Obter o menor ID */
SELECT	MIN(IdAluno) AS "Menor Id"
FROM	tbAlunos;

/* Obter quantidade de alunos cadastrados */
SELECT	COUNT(IdAluno) AS "Quantidade de alunos"
FROM	tbAlunos;

/* Obter média de idade dos alunos cadastrados */
SELECT 	AVG (
			Year(Now()) - Year(DataNascimento)
        ) AS "Média das idades"
FROM	tbAlunos;

/* Obter os meses nos quais temos aniversariantes */
SELECT	MONTH(DataNascimento) AS "Mês"		
FROM	tbAlunos
ORDER BY MONTH(DataNascimento);

/* Obter os meses (sem repetição) nos quais temos aniversariantes */
SELECT	DISTINCT MONTH(DataNascimento) AS "Mês"		
FROM	tbAlunos
ORDER BY MONTH(DataNascimento);

/* Obter quantos alunos fazem aniversário em cada mês */
SELECT	DISTINCT MONTH(DataNascimento) AS "Mês",
		COUNT(IdAluno) AS "Aniversariantes"
FROM	tbAlunos
GROUP BY MONTH(DataNascimento)
ORDER BY MONTH(DataNascimento);

/* Obter quantos alunos nasceram em cada ano */
SELECT	DISTINCT YEAR(DataNascimento) AS "ANO",
		COUNT(IdAluno) AS "Qtd. Alunos"
FROM	tbAlunos
GROUP BY YEAR(DataNascimento)
ORDER BY YEAR(DataNascimento);

/* Filtrando agregação com a cláusula Having */
SELECT	DISTINCT YEAR(DataNascimento) AS "ANO",
		COUNT(IdAluno) AS "Qtd. Alunos"
FROM	tbAlunos
GROUP BY YEAR(DataNascimento)
HAVING COUNT(IdAluno) >= 3    /* somente os meses onde tiver 3 ou + aniversariantes */
ORDER BY YEAR(DataNascimento);

/*--------------------------------------------------------------
  Formatando a exibição de números e datas
--------------------------------------------------------------*/
/* Formatando números */
SELECT	12.36587 AS "Float sem formatação",
		Format(12.36587, 2) AS "Float com 2 casas decimais";

/* Formatando moeda brasileira */
SELECT	1436.65 AS "Float sem formatação",
		Format(1436.65, 2, "de_DE") AS "Float com 2 casas decimais",
        Concat("R$ ",   Format(1436.65, 2, "de_DE")   ) AS Moeda;
        
/* Formatando data e hora */        
SELECT	Now() AS "DateTime sem formatação",
        Date_Format(Now(), "%d/%m/%Y %H:%i:%s") AS "DateTime formatado",
        Date_Format(Now(), "%d/%m/%Y") AS "Somente Data",
        Date_Format(Now(), "%H:%i:%s") AS "Hora minuto e segundo";

/*--------------------------------------------------------------
  Relacionando informações de mais de uma tabela em um select
--------------------------------------------------------------*/
/* Obtendo dados relacionados de tbAlunos e tbTipoAluno */
SELECT  A.RM,
		A.Aluno,
        T.Tipo
FROM	tbAlunos A
		INNER JOIN tbTipoAluno T ON T.IdTipo = A.IdTipoAluno;

/* Obtendo quantidade de alunos por Tipo */
SELECT  T.Tipo,
		COUNT(A.IdAluno) AS QtdAlunos
FROM	tbAlunos A
		INNER JOIN tbTipoAluno T ON T.IdTipo = A.IdTipoAluno
GROUP BY T.Tipo;

/* Obtendo dados de 3 tabelas relacionadas */
SELECT  A.RM,
		A.Aluno,
        C.Curso,
        C.Sigla,
        C.CargaHoraria
FROM	tbMatricula M
		INNER JOIN tbAlunos A ON A.IdAluno = M.IdAluno
        INNER JOIN tbCursos C ON C.IdCurso = M.IdCurso
ORDER BY C.Curso,
		 A.Aluno;