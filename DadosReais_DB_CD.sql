-- DADOS 

USE DB_CD
GO

-- MUSICA 
IF ((SELECT COUNT(*) FROM MUSICA) < 30)
BEGIN 
	DELETE FROM MUSICA
	INSERT INTO MUSICA VALUES 
		(1, 'SERÁ', 2.28),
		(2, 'AINDA É CEDO', 3.55),
		(3, 'GERAÇÃO COCA-COLA', 2.20),
		(4, 'EDUARDO E MÔNICA', 4.32),
		(5, 'TEMPO PERDIDO', 5),
		(6, 'INDIOS', 4.23),
		(7, 'QUE PAÍS É ESTE', 3.04),
		(8, 'FAROESTE CABOCLO', 9.03),
		(9, 'HÁ TEMPOS', 3.16),
		(10, 'PAÍS E FILHOS', 5.06),
		(11, 'MENINOS E MENINAS', 3.22),
		(12, 'VENTO NO LITORAL', 6.05),
		(13, 'PERFEIÇÃO', 4.35),
		(14, 'GIZ', 3.20),
		(15, 'DEZESSEIS', 5.28),
		(16, 'ANTES DAS SEIS', 3.09),
		(17, 'MENINOS, EU VI', 3.25),
		(18, 'EU TE AMO', 3.06),
		(19, 'PIANO NA MANGUEIRA', 2.23),
		(20, 'A VIOLEIRA', 2.54),
		(21, 'ANOS DOURADOS', 2.56),
		(22, 'OLHA, MARIA', 3.55),
		(23, 'BISCATE', 3.20),
		(24, 'RETRATO EM PRETO E BRANCO', 3.03),
		(25, 'FALANDO DE AMOR', 3.20),
		(26, 'POIS É', 2.48),
		(27, 'NOITE DOS MASCARADOS', 2.42),
		(28, 'SABIÁ', 3.20),
		(29, 'IMAGINA', 2.52),
		(30, 'BATE-BOCA', 4.41)
END

-- AUTOR 

IF NOT EXISTS (SELECT * FROM AUTOR)
BEGIN 
	INSERT INTO AUTOR VALUES 
		(1, 'RENATO RUSSO'),
		(2, 'TOM JOBIM'),
		(3, 'CHICO BUARQUE'),
		(4, 'DADO VILLA-LOBOS'),
		(5, 'MARCELO BONFÁ'),
		(6, 'ICO OURO PRETO'),
		(7, 'VINICIUS DE MORAES')
END

IF NOT EXISTS (SELECT * FROM MUSICA_AUTOR)
BEGIN 
	INSERT INTO MUSICA_AUTOR VALUES
		('1', '1'),
		('1', '4'),
		('1', '5'),
		('2', '1'),
		('2', '4'),
		('2', '5'),
		('2', '6'),
		('3', '1'),
		('4', '1'),
		('5', '1'),
		('6', '1'),
		('7', '1'),
		('8', '1'),
		('9', '1'),
		('10', '1'),
		('10', '4'),
		('10', '5'),
		('11', '1'),
		('11', '4'),
		('11', '5'),
		('12', '1'),
		('12', '4'),
		('12', '5'),
		('13', '1'),
		('13', '4'),
		('13', '5'),
		('14', '1'),
		('14', '4'),
		('14', '5'),
		('15', '1'),
		('15', '4'),
		('15', '5'),
		('16', '1'),
		('16', '4'),
		('16', '5'),
		('17', '2'),
		('17', '3'),
		('18', '2'),
		('18', '3'),
		('19', '2'),
		('19', '3'),
		('20', '2'),
		('20', '3'),
		('21', '2'),
		('21', '3'),
		('22', '2'),
		('22', '3'),
		('22', '7'),
		('23', '3'),
		('24', '2'),
		('24', '3'),
		('25', '2'),
		('26', '2'),
		('26', '3'),
		('27', '3'),
		('28', '2'),
		('28', '3'),
		('29', '2'),
		('29', '3'),
		('30', '3')
END

IF NOT EXISTS (SELECT * FROM GRAVADORA)
BEGIN 
	INSERT INTO GRAVADORA VALUES 
		(1,	'EMI','ROD. DUTRA, KM 29.8',55659856,'8965-7894','emi@emi-music.com.br'	),
		(2,	'POLYGRAM',	'ROD. IMIGRANTES, KM 29.8',	99659856, '7595-7894','polygram@music.com.br'),
		(3, 'BMG','ROD. ANCHIETA, KM 289.8',	99654456,'7595-7004','bmg@music.com.br'),
		(4,	'SOM LIVRE','AV. SAO JOSE, KM 289.8',99657806,'7895-7004','somlivre@music.com.br'),
		(5,	'EPIC',	'AV. ALDA, KM 89',	58793321,	'8965-4789','epic@music.com.br'	)
END


IF NOT EXISTS (SELECT * FROM CD_CATEGORIA)
BEGIN 
	INSERT INTO CD_CATEGORIA VALUES
		(1,10,20),
		(2,20,40),
		(3,30,60),
		(4,11,22),
		(5,15,30),
		(6,25,50),
		(7,21,42),
		(8,22,44),
		(9,9,18),
		(10,5,10)
END

IF NOT EXISTS (SELECT * FROM CD) AND EXISTS (SELECT * FROM GRAVADORA) AND EXISTS (SELECT * FROM CD_CATEGORIA)
BEGIN 
	INSERT INTO CD VALUES
		(1,	1,	1,	'MAIS DO MESMO',-5.00,	'19850203',	1),
		(2,	3,	2,	'BATE BOCA',	-15.00,	'19990807',	2),
		(3,	4,	3,	'ELIS REGINA-ESSA MULHER',	-18.00,	'19860525',	3),
		(4,	3,	4,	'A FORCA QUE NUNCA SECA',	5.25,	'19810715',	3),
		(5,	4,	5,	'PERFIL',	20.99,	'19870102',	5),
		(6,	2,	6,	'BARRY MANILOW GREATEST HITS',	25.00,	'19581218',	1),
		(7,	5,	7,	'LISTEN WITHOUT PREJUDICE',	28.00,	'19750611',	7)
END

IF EXISTS (SELECT * FROM CD) AND EXISTS(SELECT * FROM MUSICA) AND NOT EXISTS(SELECT * FROM FAIXA)
BEGIN
	INSERT INTO FAIXA(CODIGO_CD,NUMERO_FAIXA, CODIGO_MUSICA) VALUES 
		('1','1','1'),
		('1','2','2'),
		('1','3','3'),
		('1','4','4'),
		('1','5','5'),
		('1','6','6'),
		('1','7','7'),
		('1','8','8'),
		('1','9','9'),
		('1','10','10'),
		('1','11','11'),
		('1','12','12'),
		('1','13','13'),
		('1','14','14'),
		('1','15','15'),
		('1','16','16'),
		('2','1','17'),
		('2','2','18'),
		('2','3','19'),
		('2','4','20'),
		('2','5','21'),
		('2','6','22'),
		('2','7','23'),
		('2','8','24'),
		('2','9','25'),
		('2','10','26'),
		('2','11','27'),
		('2','12','28'),
		('2','13','29'),
		('2','14','30')
END

