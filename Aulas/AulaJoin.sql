USE DB_CD
GO

-- ################
-- # AULA DE JOIN #
-- ################

-- ###########
-- # EXEMPLO #
-- ###########

SELECT 
	 C.NOME_CD
	,G.NOME_GRAVADORA
	,C.PRECO_VENDA
FROM CD C 
INNER JOIN GRAVADORA G ON (C.CODIGO_GRAVADORA = G.CODIGO_GRAVADORA)
WHERE C.PRECO_VENDA > 20


-- ======================================================
-- DESAFIO 01: QUAIS AS MUSICAS DAS FAIXAS ENTRE 7 E 12?
-- ======================================================

SELECT 
	 M.CODIGO_MUSICA
	,M.NOME_MUSICA
	,M.DURACAO
	,F.NUMERO_FAIXA 
FROM MUSICA M 
INNER JOIN FAIXA F ON (M.CODIGO_MUSICA = F.CODIGO_MUSICA) 
WHERE F.NUMERO_FAIXA BETWEEN 7 AND 12

-- =================================================
-- DESAFIO 02: QUAIS OS AUTORES DAS M�SICAS 7 A 12? 
-- =================================================

SELECT 
	 A.CODIGO_AUTOR
	,A.NOME_AUTOR
	,M.NOME_MUSICA
	,M.DURACAO 
FROM AUTOR A 
INNER JOIN MUSICA_AUTOR MA ON (A.CODIGO_AUTOR = MA.CODIGO_AUTOR)
INNER JOIN MUSICA       M ON (M.CODIGO_MUSICA = MA.CODIGO_MUSICA)
WHERE M.CODIGO_MUSICA BETWEEN 7 AND 12



-- ==================================================
-- DESAFIO 03: QUAIS S�O OS CD'S DAS M�SICAS 7 A 12?
-- ==================================================

SELECT 
	 C.CODIGO_CD
	,C.NOME_CD
	,M.NOME_MUSICA
	,M.DURACAO 
FROM CD C 
INNER JOIN FAIXA  F ON (C.CODIGO_CD = F.CODIGO_CD)
INNER JOIN MUSICA M ON (F.CODIGO_MUSICA = M.CODIGO_MUSICA) 
WHERE M.CODIGO_MUSICA BETWEEN 7 AND 12 


-- ===================================================
-- DESAFIO 04: QUAIS AS GRAVADORAS DOS AUTORES 3 A 7? 
-- ===================================================

SELECT DISTINCT
	 G.CODIGO_GRAVADORA
	,G.NOME_GRAVADORA
	,A.NOME_AUTOR
FROM GRAVADORA G 
INNER JOIN CD           C  ON (G.CODIGO_GRAVADORA = C.CODIGO_GRAVADORA)
INNER JOIN FAIXA        F  ON (C.CODIGO_CD = F.CODIGO_CD)
INNER JOIN MUSICA       M  ON (M.CODIGO_MUSICA = F.CODIGO_MUSICA)
INNER JOIN MUSICA_AUTOR MA ON (MA.CODIGO_MUSICA = M.CODIGO_MUSICA)
INNER JOIN AUTOR        A  ON (MA.CODIGO_AUTOR = A.CODIGO_AUTOR)
WHERE A.CODIGO_AUTOR BETWEEN 3 AND 7



-- ###########################
-- # LEFT E RIGHT OUTER JOIN #
-- ###########################

-- ======================================================
-- DESAFIO 01B: QUAIS AS MUSICAS DAS FAIXAS ENTRE 7 E 12?
-- ======================================================

SELECT 
	 M.CODIGO_MUSICA
	,M.NOME_MUSICA
	,M.DURACAO
	,F.NUMERO_FAIXA 
FROM MUSICA M 
LEFT OUTER JOIN FAIXA F ON (M.CODIGO_MUSICA = F.CODIGO_MUSICA) 
WHERE F.NUMERO_FAIXA BETWEEN 7 AND 12



-- =================================================
-- DESAFIO 02B: QUAIS OS AUTORES DAS M�SICAS 7 A 12? 
-- =================================================

SELECT 
	 A.CODIGO_AUTOR
	,A.NOME_AUTOR
	,M.NOME_MUSICA
	,M.DURACAO 
FROM AUTOR A 
LEFT  OUTER JOIN MUSICA_AUTOR MA ON (A.CODIGO_AUTOR = MA.CODIGO_AUTOR)
RIGHT OUTER JOIN MUSICA       M  ON (M.CODIGO_MUSICA = MA.CODIGO_MUSICA)
WHERE M.CODIGO_MUSICA BETWEEN 7 AND 12



-- ==================================================
-- DESAFIO 03B: QUAIS S�O OS CD'S DAS M�SICAS 7 A 12?
-- ==================================================

SELECT 
	 C.CODIGO_CD
	,C.NOME_CD
	,M.NOME_MUSICA
	,M.DURACAO 
FROM CD C 
LEFT  OUTER JOIN FAIXA  F ON (C.CODIGO_CD = F.CODIGO_CD)
RIGHT OUTER JOIN MUSICA M ON (F.CODIGO_MUSICA = M.CODIGO_MUSICA) 
WHERE M.CODIGO_MUSICA BETWEEN 7 AND 12 


-- ===================================================
-- DESAFIO 04B: QUAIS AS GRAVADORAS DOS AUTORES 3 A 7? 
-- ===================================================

SELECT DISTINCT
	 G.CODIGO_GRAVADORA
	,G.NOME_GRAVADORA
	,A.NOME_AUTOR
FROM GRAVADORA G 
LEFT  OUTER JOIN CD           C  ON (G.CODIGO_GRAVADORA = C.CODIGO_GRAVADORA)
LEFT  OUTER JOIN FAIXA        F  ON (C.CODIGO_CD = F.CODIGO_CD)
RIGHT OUTER JOIN MUSICA       M  ON (M.CODIGO_MUSICA = F.CODIGO_MUSICA)
LEFT  OUTER JOIN MUSICA_AUTOR MA ON (MA.CODIGO_MUSICA = M.CODIGO_MUSICA)
RIGHT OUTER JOIN AUTOR        A  ON (MA.CODIGO_AUTOR = A.CODIGO_AUTOR)
WHERE A.CODIGO_AUTOR BETWEEN 3 AND 7

