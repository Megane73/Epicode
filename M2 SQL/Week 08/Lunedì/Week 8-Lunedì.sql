/* W7D4 - Pratica
È necessario implementare uno schema che consenta di gestire le anagrafiche degli store di unʼipotetica azienda.
Uno store è collocato in una precisa area geografica.
In unʼarea geografica possono essere collocati store diversi.*/

% 1 - Crea una tabella Store per la gestione degli store (ID, nome, data apertura, ecc.).

% Creo il database.
 CREATE DATABASE WareHouse;

% Uso il Database appena creato.
USE WareHouse; 

% Creo e definisco la tabella Store.
 CREATE TABLE Store (
    StoreID INT AUTO_INCREMENT PRIMARY KEY, 
    StoreName VARCHAR(50),
    OpenData DATE
 );

 % 2 - Crea una tabella Region per la gestione delle aree geografiche (ID, città, regione, area geografica, …).

 % Creo e definisco la tabella Region.
 CREATE TABLE Region (
    RegionID INT AUTO_INCREMENT PRIMARY KEY, 
    City VARCHAR(50),
    Region VARCHAR(50),
    GeoArea VARCHAR(50),
    StoreID INT,
    CONSTRAINT FK_Store_Region FOREIGN KEY(StoreID) REFERENCES Store(StoreID)
 );

% 3 - Popola le tabelle con pochi record esemplificativi.

% Popolo la tabella Store
INSERT INTO Store (StoreName, OpenData) VALUES
('Tech Plaza Milano', '2015-03-10'),
('Gourmet Torino', '2016-05-22'),
('Fashion Hub Roma', '2014-11-01'),
('Digital Point Napoli', '2018-02-15'),
('Eco Store Firenze', '2017-09-30'),
('Sport Center Bologna', '2019-06-12'),
('Home Style Bari', '2020-01-20'),
('Trend Shop Venezia', '2015-08-05'),
('Smart Living Genova', '2021-04-18'),
('Gadget World Palermo', '2013-12-10'),
('Future Retail Verona', '2016-07-25'),
('Urban Style Catania', '2019-11-05'),
('Green Market Padova', '2014-04-14'),
('City Mart Trieste', '2022-03-01'),
('Elite Boutique Brescia', '2017-10-10'),
('Mega Store Messina', '2018-08-20'),
('Modern Shop Prato', '2015-01-15'),
('Global Tech Parma', '2020-09-05'),
('Daily Needs Modena', '2012-06-30'),
('Vision Store Reggio Calabria', '2021-12-12');

% Popolo la tabella Region
INSERT INTO Region (City, Region, GeoArea, StoreID) VALUES
('Milano', 'Lombardia', 'Nord-Ovest', 1),
('Torino', 'Piemonte', 'Nord-Ovest', 2),
('Roma', 'Lazio', 'Centro', 3),
('Napoli', 'Campania', 'Sud', 4),
('Firenze', 'Toscana', 'Centro', 5),
('Bologna', 'Emilia-Romagna', 'Nord-Est', 6),
('Bari', 'Puglia', 'Sud', 7),
('Venezia', 'Veneto', 'Nord-Est', 8),
('Genova', 'Liguria', 'Nord-Ovest', 9),
('Palermo', 'Sicilia', 'Isole', 10),
('Verona', 'Veneto', 'Nord-Est', 11),
('Catania', 'Sicilia', 'Isole', 12),
('Padova', 'Veneto', 'Nord-Est', 13),
('Trieste', 'Friuli-Venezia Giulia', 'Nord-Est', 14),
('Brescia', 'Lombardia', 'Nord-Ovest', 15),
('Messina', 'Sicilia', 'Isole', 16),
('Prato', 'Toscana', 'Centro', 17),
('Parma', 'Emilia-Romagna', 'Nord-Est', 18),
('Modena', 'Emilia-Romagna', 'Nord-Est', 19),
('Reggio Calabria', 'Calabria', 'Sud', 20);

%4 - Esegui operazioni di aggiornamento, modifica ed eliminazione record.

% Aggiungo uno store a Sassari e poi aggiongo la Sardegna nella tabella Region.

% Aggiungo uno store a Sassari e poi la Sardegna (venunesima regione).
INSERT INTO Store (StoreName) 
VALUES ('Mega Gatget World Sassari');

INSERT INTO Region (City, Region, GeoArea, StoreID) 
VALUES ('Sassari', 'Sardegna', 'Isole', 21);

# Aggiorno la data di apertura di uno store.
UPDATE Store
SET OpenData = '2017-05-23'
WHERE StoreID = 4;

# Elimino una Regione in modalità "sicura" e poi la reintegro con RALLBACK.
START TRANSACTION;
	DELETE FROM Region
	WHERE RegionID = 15;    
ROLLBACK;

# Elimino una regione im modo DEFINITIVO.
START TRANSACTION;
	DELETE FROM Region
	WHERE RegionID = 15;    
COMMIT;

# Reiserisco a mano i dati cancellati nella stessa posizione precedente.
INSERT INTO Region (RegionID, City, Region, GeoArea, StoreID) 
VALUES (15, 'Brescia','Lombardia','Nord-Ovest',15);


