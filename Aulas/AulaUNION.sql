/*
	1- APRESENTAR AS GRAVADOREAS QUE TEM CD 
	2- QUAIS AS MUSICAS GRAVADAS?
	3- QUAIS OS AUTORES E MUSICAS DO CD 1? 
	4- QUAIS AS GRAVADORAS DOS AUTORES 2 E 5
*/


USE DB_CD
GO 
/*
======================================================
 1- APRESENTAR AS GRAVADOREAS QUE TEM CD 
======================================================
*/
SELECT 
	C.CODIGO_GRAVADORA
FROM CD C 
INTERSECT 
SELECT 
	G.CODIGO_GRAVADORA
FROM GRAVADORA G 


/*
======================================================
 1B- APRESENTAR OS CD QUE N�O POSSUEM GRAVADORA 
 PARA ISTO VERIFICAR A ESTRUTURA DA TABELA CD ONDE O CAMPO  CODIGO_GRAVADORA PODE SER NULO
======================================================
*/

DECLARE @ULT_REGISTRO INT = (SELECT MAX(CODIGO_CD) + 1 FROM CD)

INSERT INTO CD VALUES (@ULT_REGISTRO, NULL, 1, 'CD DE TESTE PARA GRAVADORA NULA', 23.54, GETDATE(), NULL)

SELECT 
	C.CODIGO_GRAVADORA
FROM CD C 
EXCEPT 
SELECT 
	G.CODIGO_GRAVADORA
FROM GRAVADORA G


SELECT 
	 C.CODIGO_CD
	,C.NOME_CD
FROM CD C
WHERE C.CODIGO_GRAVADORA IS NULL


/*
======================================================
 2- QUAIS AS MUSICAS GRAVADAS?
======================================================
*/

SELECT  
	M.CODIGO_MUSICA 
FROM MUSICA M 
INTERSECT 
SELECT 
	F.CODIGO_MUSICA
FROM FAIXA F 
GO

/*
======================================================
3 QUAIS OS AUTORES E MUSICAS DO CD 1? 
======================================================
*/


SELECT	
	 CODIGO_AUTOR
	,NOME_AUTOR
FROM AUTOR 
WHERE CODIGO_AUTOR IN 
(
	SELECT DISTINCT CODIGO_AUTOR 
	FROM MUSICA_AUTOR 
	WHERE CODIGO_MUSICA IN 
	(

		SELECT CODIGO_MUSICA 
		FROM MUSICA 
		WHERE CODIGO_MUSICA IN 
		(
			SELECT CODIGO_MUSICA
			FROM FAIXA 
			WHERE CODIGO_CD = 1 
		)
	)
)

UNION ALL

SELECT 
	 CODIGO_MUSICA
	,NOME_MUSICA 
FROM MUSICA 
WHERE CODIGO_MUSICA IN 
(
	SELECT CODIGO_MUSICA
	FROM FAIXA 
	WHERE CODIGO_CD = 1 
)


/*
======================================================
4 - QUAIS AS GRAVADORAS DOS AUTORES 2 E 5?
======================================================
*/

SELECT 
	 CODIGO_GRAVADORA
	,NOME_GRAVADORA
FROM GRAVADORA 
WHERE CODIGO_GRAVADORA IN 
(
	SELECT CODIGO_GRAVADORA 
	FROM CD 
	WHERE CODIGO_CD IN 
	(
		SELECT CODIGO_CD 
		FROM FAIXA 
		WHERE CODIGO_MUSICA IN (

			SELECT CODIGO_MUSICA 
			FROM MUSICA
			WHERE CODIGO_MUSICA IN 
			(
				SELECT 
					CODIGO_MUSICA
				FROM MUSICA_AUTOR
				WHERE CODIGO_AUTOR IN (2, 5)
			)
		)
	)
)

UNION ALL

SELECT 
	 CODIGO_AUTOR
	,NOME_AUTOR
FROM AUTOR 
WHERE CODIGO_AUTOR IN (2,5)