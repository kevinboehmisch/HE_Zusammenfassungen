-- Tabelle: Boehmisch2_position
CREATE TABLE Boehmisch2_position (
    projektnr INT NOT NULL,
    position INT NOT NULL,
    artikelnr INT NOT NULL,
    menge INT NOT NULL,
    msteuer INT NOT NULL
);

INSERT INTO Boehmisch2_position (projektnr, position, artikelnr, menge, msteuer)
VALUES
(1, 1, 101, 10, 1),
(1, 2, 102, 5, 2),
(2, 1, 103, 20, 1),
(2, 2, 104, 15, 2);

-- Tabelle: Boehmisch2_projekte
CREATE TABLE Boehmisch2_projekte (
    projektnr INT NOT NULL,
    projektbezeichnung NVARCHAR(100) NOT NULL,
    kundennr INT NOT NULL,
    datum DATE NOT NULL
);

INSERT INTO Boehmisch2_projekte (projektnr, projektbezeichnung, kundennr, datum)
VALUES
(1, N'Website Design', 1, '2025-01-01'),
(2, N'App Development', 2, '2025-01-05');

-- Tabelle: Boehmisch2_artikel
CREATE TABLE Boehmisch2_artikel (
    artikelnr INT NOT NULL,
    name NVARCHAR(100) NOT NULL,
    preis DECIMAL(10, 2) NOT NULL
);

INSERT INTO Boehmisch2_artikel (artikelnr, name, preis)
VALUES
(101, N'Laptop', 1200.50),
(102, N'Monitor', 300.99),
(103, N'Tastatur', 25.50),
(104, N'Maus', 15.75);

-- Tabelle: Boehmisch2_kunde
CREATE TABLE Boehmisch2_kunde (
    kundennr INT NOT NULL,
    anrede NVARCHAR(10) NOT NULL,
    name NVARCHAR(100) NOT NULL,
    strasse NVARCHAR(100) NOT NULL,
    hausnr NVARCHAR(10) NOT NULL,
    plz NVARCHAR(10) NOT NULL,
    ort NVARCHAR(50) NOT NULL
);

INSERT INTO Boehmisch2_kunde (kundennr, anrede, name, strasse, hausnr, plz, ort)
VALUES
(1, N'Herr', N'Max Mustermann', N'Musterstraﬂe', N'1', N'12345', N'Musterstadt'),
(2, N'Frau', N'Erika Musterfrau', N'Hauptstraﬂe', N'20', N'67890', N'Beispielstadt');

-- Tabelle: Boehmisch2_mwst
CREATE TABLE Boehmisch2_mwst (
    msteuer INT NOT NULL,
    mwstsatz DECIMAL(5, 2) NOT NULL
);

INSERT INTO Boehmisch2_mwst (msteuer, mwstsatz)
VALUES
(1, 19.00),
(2, 7.00);
