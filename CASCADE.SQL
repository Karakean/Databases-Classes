SELECT * FROM Przestepstwa
UPDATE Kategorie_przestepstw SET Nazwa_kategorii='sutenerstwo' WHERE Nazwa_kategorii = 'paserstwo'

SELECT * FROM Pobyt_w_areszcie
SELECT * FROM Popelnianie_przestepstwa
DELETE FROM Przestepcy WHERE PESEL='01261106601' --AND (1 = (SELECT COUNT(*) FROM Popelnianie_przestepstwa WHERE ID_przestepcy ='01261106601'))
