--DQL � Data Query Language - Linguagem de Consulta de Dados.

--Utilizado para consultas dos dados.
--SELECT- recuperar dados do banco de dados

USE DB_CD

SELECT NOME_MUSICA
FROM MUSICA 
WHERE CODIGO_MUSICA IN 
(
	SELECT CODIGO_MUSICA
	FROM FAIXA
	WHERE CODIGO_CD = 1 
)



SELECT NOME_AUTOR
FROM AUTOR
WHERE CODIGO_AUTOR IN 
(
	SELECT CODIGO_AUTOR
	FROM MUSICA_AUTOR 
	WHERE CODIGO_MUSICA IN 
	(
		SELECT CODIGO_MUSICA
		FROM MUSICA
		WHERE DURACAO > 5
	)
)


SELECT CODIGO_CD, NOME_CD, PRECO_VENDA
FROM CD 
WHERE PRECO_VENDA > 
(	
	SELECT AVG(PRECO_VENDA)
	FROM CD 
)




--1 
SELECT MIN(PRECO_VENDA) AS PRECO_VENDA, CODIGO_GRAVADORA
FROM CD
WHERE PRECO_VENDA > 
(
	SELECT PRECO_VENDA
	FROM CD 
	WHERE CODIGO_CD = 6
)
GROUP BY CODIGO_GRAVADORA





--2
SELECT CODIGO_CD, NUMERO_FAIXA
FROM FAIXA 
WHERE CODIGO_MUSICA IN 
(
	SELECT CODIGO_MUSICA 
	FROM MUSICA
	WHERE NOME_MUSICA LIKE '%AMOR%'
)

--3
SELECT NOME_CD
FROM CD 
WHERE CD_INDICADO IN
(
	SELECT MIN(CD_INDICADO) CD_INDICADO
	FROM CD
)


-- 4

SELECT NOME_AUTOR
FROM AUTOR 
WHERE CODIGO_AUTOR IN 
(
	SELECT CODIGO_AUTOR
	FROM MUSICA_AUTOR
	WHERE CODIGO_MUSICA IN 
	(
		SELECT CODIGO_MUSICA
		FROM FAIXA
		WHERE CODIGO_CD IN 
		(
			SELECT CODIGO_CD
			FROM CD
			WHERE CODIGO_GRAVADORA IN 
			(
				SELECT CODIGO_GRAVADORA
				FROM GRAVADORA 
				WHERE CODIGO_GRAVADORA IN (2,3,4)
			)

		)
	)
)