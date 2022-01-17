--ZAPYTANIA AUTORSKIE

--1. Policja bada szybkość interwencji i chce wyliczyć ile średnio upływa minut od dokonania przestępstwa do interwencji oddziału policyjnego.
SELECT AVG(DATEDIFF(MINUTE, CAST(Przestepstwa.data AS datetime)+CAST(Przestepstwa.godzina AS datetime), 
CAST(Interwencje.data AS datetime)+CAST(Interwencje.godzina AS datetime))) AS Srednio_minut 
FROM Przestepstwa, Interwencje 
WHERE Przestepstwa.Interwencja = Interwencje.ID_interwencji

--2. Komenda Głowna policji chce stworzyć niechlubny ranking miast o najwiekszej przestepczosci, z tego wzgledu nalezy uporzadkowac miasta
--malejaco po ilosci przestepstw
SELECT Miasta.Nazwa_miasta, COUNT(ID_przestepstwa) AS Liczba_przestepstw 
FROM Miasta, Jednostki_organizacyjne, Oddzialy, Interwencje, Przestepstwa
WHERE Interwencje.ID_interwencji = Przestepstwa.Interwencja AND Interwencje.Oddzial = Oddzialy.ID_oddzialu AND
Oddzialy.Jednostka_organizacyjna = Jednostki_organizacyjne.ID_jednostki AND Jednostki_organizacyjne.Miasto = Miasta.nazwa_miasta
GROUP BY nazwa_miasta ORDER BY Liczba_przestepstw DESC

--3. Policja bierze sie za żartownisiów, którzy zgłaszają rzekome przestępstwa, podczas gdy wcale przestępstwo nie miało miejsca.
--Prosi o przygotowanie spisu takich gagatków.
GO
CREATE VIEW Zartownisie AS
SELECT Zglaszajacy.PESEL, Zglaszajacy.imie, Zglaszajacy.nazwisko
FROM Zglaszajacy, Interwencje, Przestepstwa
WHERE Interwencje.zglaszajacy = Zglaszajacy.PESEL AND 
(Interwencje.ID_interwencji NOT IN (SELECT Interwencje.ID_interwencji FROM Interwencje, Przestepstwa WHERE Przestepstwa.Interwencja = Interwencje.ID_interwencji))
GROUP BY Zglaszajacy.PESEL
GO

SELECT * FROM Zartownisie

--4. Konkurs na konfidenta roku. Policja szuka zgłaszającego który zgłosił najwieksza ilosc przestepstw w celu przyznania mu Złotego Makowca za zasługi.
--Jezeli natomiast zglosil cos co nie bylo przestepstwem, ta nagroda jest mu odbierana i przyznawana jego nastepcy (o ile rzecz jasna nie popelnil tego samego bledu)
SELECT TOP 1 (COUNT(Interwencje.ID_interwencji)) AS zgloszenia, Zglaszajacy.imie, Zglaszajacy.nazwisko, 'Złoty Makowiec' AS Nagroda 
FROM Zglaszajacy
INNER JOIN Interwencje ON Interwencje.zglaszajacy = Zglaszajacy.PESEL
WHERE Zglaszajacy.PESEL NOT IN (SELECT Zartownisie.PESEL FROM Zartownisie)
GROUP BY Zglaszajacy.PESEL, Zglaszajacy.imie, Zglaszajacy.nazwisko ORDER BY zgloszenia DESC

--SELECT COUNT(Interwencje.ID_interwencji) AS zgloszenia, Zglaszajacy.imie, Zglaszajacy.nazwisko, 'Złoty Makowiec' AS Nagroda 
--FROM Zglaszajacy, Interwencje
--WHERE Interwencje.zglaszajacy = Zglaszajacy.PESEL
--GROUP BY Zglaszajacy.PESEL, Zglaszajacy.imie, Zglaszajacy.nazwisko ORDER BY zgloszenia DESC

DROP VIEW Zartownisie

--5. Policja chce podarować Order Obieżyświata dla przestępcy który przebywał w największej ilości różnych aresztóww w różnych miastach.
SELECT TOP 1 COUNT(Areszty.ID_aresztu) AS liczba_aresztow, Przestepcy.imie as Imie, Przestepcy.nazwisko AS Nazwisko, 'Order Obieżyświata' AS Nagroda
FROM Miasta, Areszty, Pobyt_w_areszcie, Przestepcy
WHERE Pobyt_w_areszcie.ID_przestepcy = Przestepcy.PESEL AND Pobyt_w_areszcie.ID_aresztu = Areszty.ID_aresztu AND Areszty.Miasto = Miasta.nazwa_miasta
GROUP BY Przestepcy.PESEL, Imie, Nazwisko ORDER BY liczba_aresztow DESC

SELECT * FROM Pobyt_w_areszcie


--6. Komenda Glowna Policji zbiera statystyki dotyczace roku 2021. Interesuje ich liczba popelnionych przestepstw z podzialem na kategorie i posortowana malejąco.
SELECT Kategorie_przestepstw.Nazwa_kategorii AS Kategoria, COUNT (Przestepstwa.ID_Przestepstwa) AS Liczba_przestepstw
FROM Kategorie_przestepstw, Przestepstwa
WHERE Przestepstwa.Kategoria_przestepstwa = Kategorie_przestepstw.Nazwa_kategorii AND
Przestepstwa.data <= '2021-12-31' AND Przestepstwa.data >= '2021-01-01'
GROUP BY Kategorie_przestepstw.Nazwa_kategorii ORDER BY Liczba_przestepstw DESC

--7. Jeden z policjantów jest podejrzany w pewnej sprawie. Zarzeka się, że w momencie dokonania przestępstwa był na interwencji w sprawie innego przestępstwa 
--razem ze swoim oddziałem. Należy to sprawdzić (z dokladnoscia do 30 minut).
SELECT DISTINCT Interwencje.ID_interwencji, Interwencje.data, Interwencje.godzina,
Policjanci.ID_policjanta AS Numer_odznaki, Policjanci.imie AS Imie, Policjanci.nazwisko AS Nazwisko
FROM Interwencje, Oddzialy, Policjanci
WHERE DATEDIFF(MINUTE, '2021-04-13 14:00:00', CAST(Interwencje.data AS datetime)+CAST(Interwencje.godzina AS datetime)) < 30 AND
DATEDIFF(MINUTE, '2021-04-13 14:00:00', CAST(Interwencje.data AS datetime)+CAST(Interwencje.godzina AS datetime)) > -30 AND
Interwencje.Oddzial = 'OD00011' AND Policjanci.Oddzial = 'OD00011'


--ZAPYTANIA OD KOLEGOW/KOLEZANEK


--Ilość interwencji wykonanych przez wszystkie oddziały policji znajdujące się w
--wybranym mieście.
SELECT Jednostki_organizacyjne.nazwa_jednostki AS Jednostka, COUNT(Interwencje.ID_interwencji) AS Liczba_interwencji
FROM Miasta, Jednostki_organizacyjne, Oddzialy, Interwencje
WHERE Jednostki_organizacyjne.Miasto = 'Warszawa'
GROUP BY nazwa_jednostki

