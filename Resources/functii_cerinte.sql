DELIMITER $$
CREATE OR REPLACE PROCEDURE rez3a()
BEGIN
	SELECT id_r, raspuns, corect
	FROM Raspuns
	WHERE id_i=3
	ORDER BY corect;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE rez3b()
BEGIN
	SELECT id_t, id_i, id_r 
	FROM Raspuns_Test
	WHERE id_t=1
	ORDER BY id_i, id_r DESC;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE rez4a()
BEGIN
	SELECT raspuns_test.id_i, raspuns_test.id_r, raspuns.corect
	FROM raspuns JOIN raspuns_test ON(raspuns.id_r=raspuns_test.id_r AND raspuns.id_i=raspuns_test.id_i) JOIN test ON(test.id_t=raspuns_test.id_t)
	WHERE test.punctaj<22;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE rez4b()
BEGIN
	SELECT DISTINCT c1.id_c as "Idc 1", c2.id_c as "Idc 2"
	FROM (SELECT id_c, id_i FROM CHESTIONAR JOIN INTREBARI_CHESTIONAR USING (id_c)) c1
	JOIN (SELECT id_c, id_i FROM CHESTIONAR JOIN INTREBARI_CHESTIONAR USING (id_c)) c2 ON (c1.id_c < c2.id_c)
	WHERE c1.id_i = c2.id_i
	ORDER BY c1.id_c, c2.id_c;
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE rez5a()
BEGIN
	SELECT id_i,id_r
	FROM raspuns_test
	WHERE id_t = 1 AND (id_i,id_r,corect) IN (SELECT id_i,id_r,corect FROM raspuns);
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE rez5b()
BEGIN
	SELECT id_t
	FROM test
	WHERE punctaj <= all (select punctaj from test);
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE rez6a()
BEGIN
	SELECT id_c,DENUMIRE,PUNCTAJ_MAX
	FROM chestionar
	WHERE punctaj_max=(SELECT distinct max(punctaj_max) from chestionar);
END $$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE rez6b()
BEGIN
	SELECT DISTINCT id_i 
	FROM raspuns r1 
	WHERE (SELECT COUNT(*) 
			FROM raspuns r2 
			WHERE corect = 'D' AND r1.id_i = r2.id_i
			) >= 2;
END $$
DELIMITER ;