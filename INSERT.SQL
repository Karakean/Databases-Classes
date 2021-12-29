INSERT INTO Miasta VALUES
	('Gdynia'),
	('Gdańsk'),
	('Warszawa'),
	('Kędzierzyn-Koźle'),
	('Wodzisław Śląski'),
	('Gniewino'),
	('Bydgoszcz'),
	('Żołędowo'),
	('Sejny'),
	('Szczytno'),
	('Mława'),
	('Nowy Sącz')

INSERT INTO Kategorie_przestepstw VALUES
	('zabójstwo'),
	('pobicie'),
	('gwałt'),
	('kradzież'),
	('włamanie'),
	('rozbój'),
	('oszustwo'),
	('paserstwo'),
	('naruszenie zakazu sądowego'),
	('znieważenie funkcjonariusza'),
	('uchylanie się od alimentów'),
	('znęcanie się'),
	('groźba karalna')

INSERT INTO Jednostki_organizacyjne VALUES
	('Komenda Miejska Policji', 'ul. Portowa 15/6', 'Gdynia'),
	('Komisariat Policji nr 3', 'ul. Biała 1a', 'Gdańsk'),
	('Posterunek Policji im. Jana Pawła Drugiego', 'ul. Mała 3', 'Warszawa'),
	('Komenda Powiatowa Policji', 'ul. Wojska Polskiego 8/8', 'Kędzierzyn-Koźle'),
	('Komisariat Policji nr 1', 'ul. Kędzierzyno-Kozielska 3', 'Wodzisław Śląski'),
	('Komenda Gminna Policji im. Makowca-Górkowskiego', 'ul. Bagnista 4/20', 'Gniewino'),
	('Komisariat Policji nr 1', 'ul. Konfidencka 60', 'Gniewino'),
	('Komenda Miejska Policji', 'ul. Grzybkowa 37/21', 'Bydgoszcz'),
	('Posterunek Policji im. Natalii O.', 'ul. Strojna 6/9', 'Żołędowo'),
	('Komisariat Policji im. Baltazara Dlajego', 'ul. Dziadka Mroza 24/12', 'Sejny'),
	('Komenda Powiatowa Policji', 'ul. Marszałka Józefa Piłsudskiego 39', 'Szczytno'),
	('Posterunek Policji im. Książąt Cygańskich', 'ul. Bieszczadzka 14', 'Nowy Sącz'),
	('Trzynasty Posterunek', 'ul. Kubaliczna 15', 'Mława')

INSERT INTO Areszty VALUES
	('Areszt Śledczy nr 1', 'ul. Gniewińska 60', 'Gdynia'),
	('Areszt Śledczy', 'ul. Kurkowa 12', 'Gdańsk'),
	('Areszt Śledczy im. Jana Pawła Drugiego', 'ul. Warkoczykowa 4', 'Warszawa'),
	('Areszt Śledczy nr 2', 'ul. Wojska Polskiego 19/39', 'Kędzierzyn-Koźle'),
	('Areszt Śledczy nr 1', 'ul. Kędzierzyno-Kozielska 4', 'Wodzisław Śląski'),
	('Areszt Śledczy im. Św. Piotra', 'ul. Bagnista 60', 'Gniewino'),
	('Areszt Śledczy nr 2', 'ul. Trapowo-Bengerowa 22', 'Bydgoszcz'),
	('Areszt Śledczy im. Piotra Cuckowskiego', 'ul. Zgnieciona 8', 'Żołędowo'),
	('Areszt Śledczy im. ks. Bartłomieja Dlamnie', 'ul. Dziadka Mroza 6/1', 'Sejny'),
	('Areszt Śledczy', 'ul. Henryka Sienkiewicza 10', 'Szczytno'),
	('Areszt Śledczy', 'ul. Petersena 15', 'Mława'),
	('Areszt Śledczy im. Damiana Ciurei Rodrigeza', 'ul. Bieszczadzka 15', 'Nowy Sącz')

INSERT INTO Oddzialy VALUES ('OD00001', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komenda Miejska Policji' AND Miasto = 'Gdynia'))
INSERT INTO Policjanci VALUES 
	('Michał', 'Miotk', 30, 'młodszy aspirant', 'OD00001'),
	('Wierzchosława', 'Żmuda-Trzebiatowska', 31, 'aspirant', 'OD00001'),
	('Alojzy', 'Gżegżółka', 32, 'starszy aspirant', 'OD00001')

INSERT INTO Oddzialy VALUES ('OD00002', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komisariat Policji nr 3' AND Miasto = 'Gdańsk'))
INSERT INTO Policjanci VALUES 
	('Andrzej', 'Damps', 37, 'podkomisarz', 'OD00002'),
	('Andżelika', 'Brajan', 41, 'komisarz', 'OD00002'),
	('Paweł', 'Szczęsny', 52, 'nadkomisarz', 'OD00002')

INSERT INTO Oddzialy VALUES ('OD00003', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Posterunek Policji im. Jana Pawła Drugiego' AND Miasto = 'Warszawa'))
INSERT INTO Policjanci VALUES 
	('Andrzej', 'Złotopolski', 27, 'młodszy aspirant', 'OD00003'),
	('Brajan', 'Lorem-Ipsum', 31, 'aspirant', 'OD00003'),
	('Paweł', 'Gaweł', 42, 'starszy aspirant', 'OD00003')

INSERT INTO Oddzialy VALUES ('OD00004', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komenda Powiatowa Policji' AND Miasto = 'Kędzierzyn-Koźle'))
INSERT INTO Policjanci VALUES 
	('Antonio', 'Bandę Raz', 45, 'podinspektor', 'OD00004'),
	('Beata', 'Baba-Jaga', 53, 'młodszy inspektor', 'OD00004'),
	('Michał', 'Maleńczuk', 62, 'inspektor', 'OD00004')

INSERT INTO Oddzialy VALUES ('OD00005', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komisariat Policji nr 1' AND Miasto = 'Wodzisław Śląski'))
INSERT INTO Policjanci VALUES 
	('Maciej', 'Kopacz', 42, 'komisarz', 'OD00005'),
	('Beata', 'Jadwiga', 59, 'komisarz', 'OD00005'),
	('Izabela', 'Chusteczka', 60, 'komisarz', 'OD00005')

INSERT INTO Oddzialy VALUES ('OD00006', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komenda Gminna Policji im. Makowca-Górkowskiego' AND Miasto = 'Gniewino'))
INSERT INTO Policjanci VALUES 
	('Piotr', 'Babka Piaskowy', 23, 'sierżant', 'OD00006'),
	('Piotr', 'Sernik', 24, 'starszy sierżant', 'OD00006'),
	('Piotr', 'Makowiec', 25, 'sierżant sztabowy', 'OD00006')

INSERT INTO Oddzialy VALUES ('OD00007', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komisariat Policji nr 1' AND Miasto = 'Gniewino'))
INSERT INTO Policjanci VALUES 
	('Piotr', 'Makowiec', 23, 'podkomisarz', 'OD00007'),
	('Andrzej', 'Makowiec', 49, 'komisarz', 'OD00007'),
	('Agnieszka', 'Garzombke-Konkol', 56, 'nadkomisarz', 'OD00007')

INSERT INTO Oddzialy VALUES ('OD00008', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komenda Miejska Policji' AND Miasto = 'Bydgoszcz'))
	INSERT INTO Policjanci VALUES 
	('Aleksandra', 'Boszke', 22, 'posterunkowy', 'OD00008'),
	('Jakub', 'Grzybowski', 22, 'posterunkowy', 'OD00008'),
	('Oskar', 'Oskarowski', 23, 'starszy posterunkowy', 'OD00008')

INSERT INTO Oddzialy VALUES ('OD00009', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Posterunek Policji im. Natalii O.' AND Miasto = 'Żołędowo'))
	INSERT INTO Policjanci VALUES 
	('Marta', 'Klawa', 39, 'posterunkowy', 'OD00009'),
	('Małgorzata', 'Myszka', 47, 'posterunkowy', 'OD00009'),
	('Paweł', 'Monitor', 56, 'starszy posterunkowy', 'OD00009')

INSERT INTO Oddzialy VALUES ('OD00010', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komisariat Policji im. Baltazara Dlajego' AND Miasto = 'Sejny'))
	INSERT INTO Policjanci VALUES 
	('Kacper', 'Melchior-Baltazar', 37, 'komisarz', 'OD00010'),
	('Bartłomiej', 'Prawacki', 48, 'nadkomisarz', 'OD00010'),
	('Bartosz', 'Leklerk', 61, 'nadkomisarz', 'OD00010')

INSERT INTO Oddzialy VALUES	('OD00011', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komenda Powiatowa Policji' AND Miasto = 'Szczytno'))
	INSERT INTO Policjanci VALUES 
	('Przemysław', 'Wrzosek', 50, 'podinspektor', 'OD00011'),
	('George', 'Wrzosek', 50, 'inspektor', 'OD00011'),
	('Jerzy', 'Wrzosek', 50, 'nadinspektor', 'OD00011')

INSERT INTO Oddzialy VALUES ('OD00012', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Posterunek Policji im. Książąt Cygańskich' AND Miasto = 'Nowy Sącz'))
	INSERT INTO Policjanci VALUES 
	('Adam', 'Krauze', 33, 'komisarz', 'OD00012'),
	('Wiktoria', 'Parch', 44, 'nadkomisarz', 'OD00012'),
	('Edward', 'Bojke', 56, 'nadkomisarz', 'OD00012')

INSERT INTO Oddzialy VALUES ('OD00013', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Trzynasty Posterunek' AND Miasto = 'Mława'))
	INSERT INTO Policjanci VALUES 
	('Kuba', 'Waśniewski', 21, 'posterunkowy', 'OD00013'),
	('Jakub', 'Wiśniewski', 22, 'starszy posterunkowy', 'OD00013')

INSERT INTO Zglaszajacy VALUES 
	('01261106400', 'Piotr', 'Górkowski', 21),
	('01261106401', 'Imiesław', 'Nazwiskowy', 55),
	('01261106402', 'Piotr', 'Prostowski', 22),
	('01261106403', 'Łukasz', 'Pudliszki', 21),
	('01261106404', 'Piotr', 'Kamieniarz', 42),
	('01261106405', 'Grażyna', 'Żarko', 65),
	('01261106406', 'Sebastian', 'Problemowy', 30),
	('01261106407', 'Andrzej', 'Piotrowski-Niziński', 40),
	('01261106408', 'Adam', 'Karpiński Rybak', 50),
	('01261106409', 'Renata', 'Rączkowska', 22),
	('01261106410', 'Krystian', 'Kąkol', 34),
	('01261106411', 'Adrian', 'Garzombke', 31)

INSERT INTO Poszkodowani VALUES 
	('01261106500', 'Piotr','Dółkowski',21),
	('01261106501', 'Dorota','Dółkowska',52),
	('01261106402', 'Piotr','Prostowski',22),
	('01261106503', 'Natalia', 'Prostowska',20),
	('01261106504', 'Jakub','Heisenberg',33),
	('01261106505', 'Sebastian', 'Kowalski', 36),
	('01261106506', 'Jarosław', 'Kowalski', 35),
	('01261106507', 'Marcin', 'Sikorski', 44),
	('01261106508', 'Adrian', 'Garzombke', 31),
	('01261106509', 'Renata', 'Rączkowska', 22),
	('01261106510', 'Johann','Pawelec',85),
	('01261106511', 'Adam', 'Ostrowski Rybak', 50)

INSERT INTO Przestepcy VALUES
	('01261106600', 'Michał', 'Mlecz', 21),
	('01261106601', 'Piotr', 'Trybunalski', 31),
	('01261106602', 'Andrzej', 'Dempc', 48),
	('01261106603', 'Oskar', 'Ambroziak', 18),
	('01261106604', 'Tomasz', 'Jasiewicz', 56),
	('01261106605', 'Michał', 'Rączkowski', 42),
	('01261106606', 'Krystian', 'Andryskowski', 52),
	('01261106607', 'Karol', 'Nagel', 40),
	('01261106608', 'Jakub', 'Bieszke', 36),
	('01261106609', 'Magdalena', 'Krupnik', 49),
	('01261106610', 'Eugeniusz', 'Kepke', 53)

INSERT INTO Interwencje VALUES ('Skwer Kościuszki', '2020-12-30', '20:02', 'OD00002', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2020-12-30', '19:00', IDENT_CURRENT('Interwencje'), 'pobicie')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))
INSERT INTO Popelnianie_przestepstwa VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Przestepcy'))

INSERT INTO Interwencje VALUES ('ul. Sezamkowa', '2021-06-22', '11:11', 'OD00001', NULL)
INSERT INTO Przestepstwa VALUES ('2021-06-22', '11:11', IDENT_CURRENT('Interwencje'), 'znieważenie funkcjonariusza')
INSERT INTO Popelnianie_przestepstwa VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Przestepcy'))

INSERT INTO Interwencje VALUES ('ul. Arbuzowa', '2021-07-01', '01:23', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-07-01', '01:13', IDENT_CURRENT('Interwencje'), 'gwałt')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))
INSERT INTO Popelnianie_przestepstwa VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Przestepcy'))

INSERT INTO Interwencje VALUES ('ul. Gruszana', '2021-09-25', '02:30', 'OD00002', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-09-25', '00:30', IDENT_CURRENT('Interwencje'), 'włamanie')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))

INSERT INTO Interwencje VALUES ('ul. Truskawkowa', '2005-04-02', '21:38', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2005-04-02', '21:37', IDENT_CURRENT('Interwencje'), 'zabójstwo')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))

INSERT INTO Interwencje VALUES ('ul. Srebrna', '2021-11-22', '15:50', 'OD00001', IDENT_CURRENT('Zglaszajacy'))

INSERT INTO Interwencje VALUES ('ul. Żeliwna', '2021-03-05', '07:55', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-03-05', '05:55', IDENT_CURRENT('Interwencje'), 'rozbój')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))
INSERT INTO Popelnianie_przestepstwa VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Przestepcy'))
INSERT INTO Pobyt_w_areszcie VALUES (IDENT_CURRENT('Przestepcy'), SELECT ID_Aresztu FROM ARESZTY WHERE nazwa_aresztu = )

INSERT INTO Interwencje VALUES ('ul. Stalowa', '2021-02-21', '03:33', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-02-21', '06:00', IDENT_CURRENT('Interwencje'), 'groźba karalna')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))
INSERT INTO Popelnianie_przestepstwa VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Przestepcy'))

INSERT INTO Interwencje VALUES ('ul. Ogórkowa', '2021-01-30', '22:01', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-01-30', '20:01', IDENT_CURRENT('Interwencje'), 'paserstwo')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))
INSERT INTO Popelnianie_przestepstwa VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Przestepcy'))

INSERT INTO Interwencje VALUES ('ul. Pistacjowa', '2021-04-17', '17:20', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-04-17', '17:00', IDENT_CURRENT('Interwencje'), 'oszustwo')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))

INSERT INTO Interwencje VALUES ('ul. Orzechowa', '2021-04-13', '14:01', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-04-13', '13:30', IDENT_CURRENT('Interwencje'), 'naruszenie zakazu sądowego')
INSERT INTO Wyrzadzanie_szkody VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Poszkodowani'))
INSERT INTO Popelnianie_przestepstwa VALUES (IDENT_CURRENT('Przestepstwa'),IDENT_CURRENT('Przestepcy'))

