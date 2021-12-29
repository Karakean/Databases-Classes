CREATE TABLE Miasta(
	nazwa_miasta varchar (30) PRIMARY KEY CHECK (nazwa_miasta NOT LIKE '%[^A-Z ĄĆĘŁŃÓŚŹŻ-]%' AND LEN(nazwa_miasta) >= 3)
)

CREATE TABLE Jednostki_organizacyjne(
	ID_jednostki int IDENTITY(1,1) PRIMARY KEY,
	nazwa_jednostki varchar(50) NOT NULL CHECK (nazwa_jednostki NOT LIKE '%[^A-Z0-9 ĄĆĘŁŃÓŚŹŻ/.-]%' AND LEN(nazwa_jednostki) >= 3),
	adres varchar(60) NOT NULL CHECK (adres LIKE 'ul. %' AND adres NOT LIKE '%[^A-Z0-9 ĄĆĘŁŃÓŚŹŻ/.-]%' AND LEN(adres) >= 5),
	Miasto varchar(30) NOT NULL,
	FOREIGN KEY (Miasto) REFERENCES Miasta (Nazwa_miasta) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Areszty(
	ID_aresztu int IDENTITY(1,1) PRIMARY KEY,
	nazwa_aresztu varchar(50) NOT NULL CHECK (nazwa_aresztu NOT LIKE '%[^A-Z0-9 ĄĆĘŁŃÓŚŹŻ/.-]%' AND LEN(nazwa_aresztu) >= 3),
	adres varchar(60) NOT NULL CHECK (adres LIKE 'ul. %' AND adres NOT LIKE '%[^A-Z0-9 ĄĆĘŁŃÓŚŹŻ/.-]%' AND LEN(adres) >= 5),
	Miasto varchar(30) NOT NULL,
	FOREIGN KEY (Miasto) REFERENCES Miasta (Nazwa_miasta) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Oddzialy(
	ID_oddzialu char(7) PRIMARY KEY CHECK (ID_oddzialu LIKE 'OD%' AND ID_oddzialu NOT LIKE '%[^A-Z0-9]%'),
	Jednostka_organizacyjna int NOT NULL,
	FOREIGN KEY (Jednostka_organizacyjna) REFERENCES Jednostki_organizacyjne (ID_jednostki) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Policjanci(
	ID_policjanta int IDENTITY(1,1) PRIMARY KEY,
	imie varchar (50) NOT NULL CHECK (imie NOT LIKE '%[^A-ZĄĆĘŁŃÓŚŹŻ]%' AND LEN(imie) >= 2),
	nazwisko varchar (50) NOT NULL CHECK (nazwisko NOT LIKE '%[^A-Z ĄĆĘŁŃÓŚŹŻ-]%' AND LEN(nazwisko) >= 2),
	wiek int NOT NULL CHECK (wiek  >= 18 AND wiek <= 125),
	stopien varchar (25) NOT NULL CHECK (LEN(stopien) >= 8 AND stopien NOT LIKE '%[^A-Z ĄĆĘŁŃÓŚŹŻ]%'),
	Oddzial char(7) NOT NULL,
	FOREIGN KEY (Oddzial) REFERENCES Oddzialy (ID_oddzialu) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Zglaszajacy(
	PESEL char(11) PRIMARY KEY CHECK (PESEL NOT LIKE '%[^0-9]%'),
	imie varchar (50) NOT NULL CHECK (imie NOT LIKE '%[^A-ZĄĆĘŁŃÓŚŹŻ]%' AND LEN(imie) >= 2),
	nazwisko varchar (50) NOT NULL CHECK (nazwisko NOT LIKE '%[^A-Z ĄĆĘŁŃÓŚŹŻ-]%' AND LEN(nazwisko) >= 2),
	wiek int NOT NULL CHECK (wiek  >= 4 AND wiek <= 125)
)

CREATE TABLE Interwencje(
	ID_interwencji int IDENTITY(1,1) PRIMARY KEY,
	miejsce varchar(50) NOT NULL,
	data date NOT NULL,
	godzina varchar (5) NOT NULL CHECK (godzina LIKE '[0-1][0-9]:[0-5][0-9]' OR godzina LIKE '2[0-3]:[0-5][0-9]'),
	Oddzial char(7) NOT NULL,
	Zglaszajacy char(11),
	FOREIGN KEY (Oddzial) REFERENCES Oddzialy (ID_oddzialu) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Zglaszajacy) REFERENCES Zglaszajacy (PESEL) ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE Kategorie_przestepstw(
	Nazwa_kategorii varchar(50) PRIMARY KEY
)

CREATE TABLE Przestepstwa(
	ID_przestepstwa int IDENTITY(1,1) PRIMARY KEY,
	data date NOT NULL,
	godzina varchar (5) NOT NULL CHECK (godzina LIKE '[0-1][0-9]:[0-5][0-9]' OR godzina LIKE '2[0-3]:[0-5][0-9]'),
	Interwencja int NOT NULL,
	Kategoria_przestepstwa varchar(50) NOT NULL,
	FOREIGN KEY (Interwencja) REFERENCES Interwencje (ID_interwencji) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Kategoria_przestepstwa) REFERENCES Kategorie_przestepstw (Nazwa_kategorii) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Poszkodowani(
	PESEL char(11) PRIMARY KEY CHECK (PESEL NOT LIKE '%[^0-9]%'),
	imie varchar (50) NOT NULL CHECK (imie NOT LIKE '%[^A-ZĄĆĘŁŃÓŚŹŻ]%' AND LEN(imie) >= 2),
	nazwisko varchar (50) NOT NULL CHECK (nazwisko NOT LIKE '%[^A-Z ĄĆĘŁŃÓŚŹŻ-]%' AND LEN(nazwisko) >= 2),
	wiek int NOT NULL CHECK (wiek  >= 0 AND wiek <= 125)
)

CREATE TABLE Wyrzadzanie_szkody(
	ID_przestepstwa int,
	ID_poszkodowanego char(11),
	PRIMARY KEY (ID_przestepstwa, ID_poszkodowanego),
	FOREIGN KEY (ID_przestepstwa) REFERENCES Przestepstwa (ID_przestepstwa) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ID_poszkodowanego) REFERENCES Poszkodowani (PESEL) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Przestepcy(
	PESEL char(11) PRIMARY KEY CHECK (PESEL NOT LIKE '%[^0-9]%'),
	imie varchar (50) NOT NULL CHECK (imie NOT LIKE '%[^A-ZĄĆĘŁŃÓŚŹŻ]%' AND LEN(imie) >= 2),
	nazwisko varchar (50) NOT NULL CHECK (nazwisko NOT LIKE '%[^A-Z ĄĆĘŁŃÓŚŹŻ-]%' AND LEN(nazwisko) >= 2),
	wiek int NOT NULL CHECK (wiek  >= 15 AND wiek <= 125),
)

CREATE TABLE Popelnianie_przestepstwa(
	ID_przestepstwa int NOT NULL,
	ID_przestepcy char(11) NOT NULL,
	PRIMARY KEY (ID_przestepstwa, ID_przestepcy),
	FOREIGN KEY (ID_przestepstwa) REFERENCES Przestepstwa (ID_przestepstwa) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ID_przestepcy) REFERENCES Przestepcy (PESEL) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE Pobyt_w_areszcie(
	ID_przestepcy char(11) NOT NULL,
	ID_aresztu int NOT NULL,
	PRIMARY KEY (ID_przestepcy, ID_aresztu),
	FOREIGN KEY (ID_przestepcy) REFERENCES Przestepcy (PESEL) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ID_aresztu) REFERENCES Areszty (ID_aresztu) ON UPDATE CASCADE ON DELETE CASCADE
)
