--Rezolvari cerinte S05 Bolos Andrei 30226
0.0
INSERT INTO Intrebare VALUES(1,'alta intrebare Intrebarea 1',NULL,'Sectiunea 1','B');--pk

INSERT INTO Raspuns VALUES(50,'a','Raspuns a la intrebarea 50','D');--fk

INSERT INTO chestionar VALUES(4,'Chestionar 5',50);
2.
b
INSERT INTO Intrebare VALUES(351,'Intrebarea 3511',NULL,'indicatoare si marcaje','B');
3.
a
SELECT id_r, raspuns, corect
FROM Raspuns
WHERE id_i=3
ORDER BY corect;
b
SELECT id_t, id_i, id_r
FROM Raspuns_Test
WHERE id_t=1
ORDER BY id_i, id_r DESC;
4.
a.
SELECT raspuns_test.id_i "Id Intrebare", raspuns_test.id_r "Grila", raspuns.corect "Raspunsuri model", raspuns_test.corect "Raspunsuri date"
FROM raspuns JOIN raspuns_test ON(raspuns.id_r=raspuns_test.id_r AND raspuns.id_i=raspuns_test.id_i) JOIN test ON(test.id_t=raspuns_test.id_t)
WHERE test.punctaj<22;

b.
SELECT DISTINCT c1.id_c, c2.id_c
FROM (SELECT id_c, id_i FROM CHESTIONAR JOIN INTREBARI_CHESTIONAR USING (id_c)) c1
JOIN (SELECT id_c, id_i FROM CHESTIONAR JOIN INTREBARI_CHESTIONAR USING (id_c)) c2 ON (c1.id_c <d c2.id_c)
WHERE c1.id_i = c2.id_i
ORDER BY c1.id_c, c2.id_c;
5
a.
SELECT id_i,id_r
FROM raspuns_test
WHERE id_t = 1 AND (id_i,id_r,corect) IN (SELECT id_i,id_r,corect FROM raspuns);
b.
SELECT id_t
FROM test
WHERE punctaj <= ALL (select punctaj from test);
6
a.
SELECT *
FROM chestionar
WHERE punctaj_max=(SELECT distinct max(punctaj_max) from chestionar);
b.
SELECT DISTINCT id_i
FROM raspuns r1
WHERE(
SELECT COUNT(*) 
FROM raspuns r2
WHERE r1.id_i = r2.id_i AND corect= 'D';
) >= 2;
7
a.
INSERT INTO Intrebare VALUES(100,'Care din urmatoarele fapte se sanctioneaza doar cu amenda contraventionala si retinerea certificatului de inmatriculare?',NULL,'Sectiunea 1','B');
INSERT INTO Raspuns VALUES(100,'a','Conducerea unui autovehicul cu defectiuni la sistemul de directie','N');
INSERT INTO Raspuns VALUES(100,'b','Conducerea unui autovehicul cu defectiuni la sistemul de iluminare','D');
INSERT INTO Raspuns VALUES(100,'c','Conducerea unui autovehicul cu elemente de caroserie lipsa','D');
INSERT INTO Raspuns VALUES(100,'d','-','N');
b.
INSERT INTO Intrebare VALUES(101,'Care din urmatoarele fapte se sanctioneaza?',NULL,'Sectiunea 1','B');
DELETE FROM Intrebare
WHERE id_i NOT IN (select id_i from raspuns);
c.
UPDATE Test
SET punctaj=0
WHERE (SELECT id_r FROM Test JOIN Raspuns_Test USING (id_t)) IS NULL;
8
a)
CREATE OR REPLACE TRIGGER update_punctaj_delete_trggr
AFTER DELETE ON Raspuns_Test FOR EACH ROW
 DECLARE valid INT (1) DEFAULT 0;
BEGIN
 SELECT id_i INTO valid
 FROM Raspuns
 WHERE id_i = :OLD.id_i AND id_r = :OLD.id_r AND corect = :OLD.corect;
 IF valid ^= 0 THEN
  UPDATE Test t
  SET punctaj = punctaj - 1
  WHERE t.id_t = :OLD.id_t;
 END IF;
END;

CREATE OR REPLACE TRIGGER update_punctaj_insert_trggr
AFTER INSERT ON Raspuns_Test FOR EACH ROW
 DECLARE valid INT (1) DEFAULT 0;
BEGIN
 SELECT id_i INTO valid
 FROM Raspuns
 WHERE id_i = :NEW.id_i AND id_r = :NEW.id_r AND corect = :NEW.corect;
 IF valid ^= 0 THEN
  UPDATE Test t
  SET punctaj = punctaj + 1
  WHERE t.id_t = :NEW.id_t;
 END IF;
END;

--verificare:
Select id_t, punctaj from test where id_t=2;
Select id_t,id_i , id_r FROM Raspuns_Test WHERE id_i = 1 AND id_r = 'a' AND id_t=2;
DELETE FROM Raspuns_Test WHERE id_i = 1 AND id_r = 'a' and id_t=2;
Select id_t,id_i , id_r FROM Raspuns_Test WHERE id_i = 1 AND id_r = 'a' AND id_t=2;
Select id_t, punctaj from test where id_t=2;

b)
CREATE OR REPLACE TRIGGER verif_punctaj
BEFORE UPDATE ON Test FOR EACH ROW
 DECLARE v_pct_max INT(2);
BEGIN
 SELECT punctaj_max INTO v_pct_max
  FROM Chestionar c
  WHERE c.id_c = :OLD.id_c;
 IF :NEW.punctaj NOT BETWEEN 0 AND v_pct_max THEN
  RAISE_APPLICATION_ERROR(-12128, 'Punctaj invalid | Trebuie sa fie intre 0 si punctajul maxim posibil');
 END IF;
END;

--verif
UPDATE Test
SET punctaj=50
WHERE id_t=1;

c)
CREATE OR REPLACE VIEW Raspunsuri_Chestionar_1 AS
SELECT t.id_t, dataa, punctaj, i.id_i, intrebaree, poza, sectiune, a.id_r, a.raspuns,
a.corect AS referinta, b.corect as raspuns_dat
FROM Intrebare i, Raspuns a, Raspuns_Test b, Test t
WHERE t.id_c = 1 AND
b.id_t = t.id_t AND
a.id_i = b.id_i AND
a.id_r = b.id_r AND
i.id_i = a.id_i;

CREATE OR REPLACE TRIGGER insert_rasp_chestionar1
INSTEAD OF INSERT ON Raspunsuri_Chestionar_1
DECLARE
 v_categorie Intrebare.categorie%TYPE;
BEGIN
 SELECT categorie INTO v_categorie
  FROM Intrebare
  WHERE id_i LIKE :NEW.id_i;
 INSERT INTO Test VALUES (:NEW.id_t, :NEW.dataa, :NEW.punctaj, 1);
 INSERT INTO Intrebare VALUES (:NEW.id_i, :NEW.intrebaree, :NEW.poza, :NEW.sectiune, v_categorie);
 INSERT INTO Raspuns VALUES (:NEW.id_i, :NEW.id_r, :NEW.raspuns, :NEW.referinta);
 INSERT INTO Raspuns_Test VALUES (:NEW.id_t, :NEW.id_i, :NEW.id_r, :NEW.raspuns_dat);
END;