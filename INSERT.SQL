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
	('Areszt Śledczy nr 7', 'ul. Wojska Polskiego 19/39', 'Kędzierzyn-Koźle'),
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
	('Michał', 'Miotk', 30, 'młodszy aspirant', IDENT_CURRENT('Oddzialy')),
	('Wierzchosława', 'Żmuda-Trzebiatowska', 31, 'aspirant', IDENT_CURRENT('Oddzialy')),
	('Alojzy', 'Gżegżółka', 32, 'starszy aspirant', IDENT_CURRENT('Oddzialy'))

INSERT INTO Oddzialy VALUES ('OD00002', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komenda Gminna Policji im. Św. Piotra Makowca-Górkowskiego' AND Miasto = 'Gniewino'))
INSERT INTO Policjanci VALUES 
	('Piotr', 'Babka Piaskowy', 23, 'sierżant', IDENT_CURRENT('Oddzialy')),
	('Piotr', 'Sernik', 24, 'starszy sierżant', IDENT_CURRENT('Oddzialy')),
	('Piotr', 'Makowiec', 25, 'sierżant sztabowy', IDENT_CURRENT('Oddzialy'))

INSERT INTO Oddzialy VALUES	('OD00003', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Komenda Powiatowa Policji' AND Miasto = 'Szczytno'))
	INSERT INTO Policjanci VALUES 
	('Przemysław', 'Wrzosek', 50, 'podinspektor', 'OD00003'),
	('George', 'Wrzosek', 50, 'inspektor', 'OD00003'),
	('Jerzy', 'Wrzosek', 50, 'nadinspektor', 'OD00003')
INSERT INTO Oddzialy VALUES ('OD00004', (SELECT ID_jednostki FROM Jednostki_organizacyjne WHERE nazwa_jednostki = 'Trzynasty Posterunek' AND Miasto = 'Mława'))
	INSERT INTO Policjanci VALUES 
	('Kuba', 'Waśniewski', 21, 'posterunkowy', 'OD00004'),
	('Jakub', 'Wiśniewski', 22, 'starszy posterunkowy', 'OD00004')

INSERT INTO Zglaszajacy VALUES ('Piotr', 'Górkowski', 20)
INSERT INTO Interwencje VALUES ('Skwer Kościuszki', '2020-12-30', '20:02', 'OD00002', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2020-12-30', '19:00', IDENT_CURRENT('Interwencje'), 'pobicie')

INSERT INTO Interwencje VALUES ('ul. Sezamkowa', '2021-06-22', '11:11', 'OD00001', NULL)
INSERT INTO Przestepstwa VALUES ('2021-06-22', '11:11', IDENT_CURRENT('Interwencje'), 'znieważenie funkcjonariusza')

INSERT INTO Zglaszajacy VALUES ('Imiesław', 'Nazwiskowy', 55)
INSERT INTO Interwencje VALUES ('ul. Arbuzowa', '2021-07-01', '01:23', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-07-01', '01:13', IDENT_CURRENT('Interwencje'), 'gwałt')

INSERT INTO Zglaszajacy VALUES ('Piotr', 'Prostowski', 21)
INSERT INTO Interwencje VALUES ('ul. Gruszana', '2021-09-25', '02:30', 'OD00002', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-09-25', '00:30', IDENT_CURRENT('Interwencje'), 'włamanie')

INSERT INTO Zglaszajacy VALUES ('Łukasz', 'Pudliszki', 21)
INSERT INTO Interwencje VALUES ('ul. Truskawkowa', '2005-04-02', '21:38', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2005-04-02', '21:37', IDENT_CURRENT('Interwencje'), 'zabójstwo')

INSERT INTO Zglaszajacy VALUES ('Grażyna', 'Żarko', 65)
INSERT INTO Interwencje VALUES ('ul. Srebrna', '2021-11-22', '15:50', 'OD00001', IDENT_CURRENT('Zglaszajacy'))

INSERT INTO Zglaszajacy VALUES ('Piotr', 'Kamieniarz', 42)
INSERT INTO Interwencje VALUES ('ul. Żeliwna', '2021-03-05', '07:55', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-03-05', '05:55', IDENT_CURRENT('Interwencje'), 'rozbój')

INSERT INTO Zglaszajacy VALUES ('Sebastian', 'Problemowy', 30)
INSERT INTO Interwencje VALUES ('ul. Stalowa', '2021-02-21', '03:33', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-02-21', '06:00', IDENT_CURRENT('Interwencje'), 'groźba karalna')

INSERT INTO Zglaszajacy VALUES ('Andrzej', 'Piotrowski-Niziński', 40)
INSERT INTO Interwencje VALUES ('ul. Ogórkowa', '2021-01-30', '22:01', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-01-30', '20:01', IDENT_CURRENT('Interwencje'), 'paserstwo')

INSERT INTO Zglaszajacy VALUES ('Adam', 'Karpiński Rybak', 50)
INSERT INTO Interwencje VALUES ('ul. Pistacjowa', '2021-04-17', '17:20', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-04-17', '17:00', IDENT_CURRENT('Interwencje'), 'oszustwo')

INSERT INTO Zglaszajacy VALUES ('Renata', 'Rączkowska', 22)
INSERT INTO Interwencje VALUES ('ul. Orzechowa', '2021-04-13', '14:01', 'OD00001', IDENT_CURRENT('Zglaszajacy'))
INSERT INTO Przestepstwa VALUES ('2021-04-13', '13:30', IDENT_CURRENT('Interwencje'), 'naruszenie zakazu sądowego')
