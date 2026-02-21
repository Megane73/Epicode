SHOW DATABASES;
   USE AdventureWorksDW;

/* W7D4 - Pratica
 1.Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa. 
   La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto, 
   il nome della sottocategoria associata e il nome della categoria associata.*/

CREATE VIEW Product AS (
SELECT
    dp.EnglishProductName AS NomeProdotto,
    dpc.EnglishProductCategoryName AS Categoria,
    dpS.EnglishProductSubcategoryName AS Sottocategoria
FROM dimproduct AS dp
JOIN dimproductsubcategory dps
ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
JOIN dimproductcategory AS dpc
ON dps.ProductCategoryKey = dpc.ProductCategoryKey
);
   
/* 2. Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa. 
La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome del reseller, il nome della città e il nome della regione.*/

CREATE VIEW Reseller AS (
SELECT
    dr.ResellerName AS Venditore,
    dg.City AS Cttà,
    dg.EnglishCountryRegionName AS Regione
FROM dimreseller dr
JOIN dimgeography dg
ON dr.GeographyKey = dg.GeographyKey
);

/* 3. Crea una vista denominata Sales che deve restituire la data dellʼordine, 
      il codice documento, la riga di corpo del documento, la quantità venduta, lʼimporto totale e il profitto.*/
      
CREATE VIEW Sales AS (
SELECT
	OrderDate AS DataOrdine,
    SalesOrderLineNumber AS CodiceDocumento,
    OrderQuantity AS Quantità,
    SalesAmount AS QuantitàVenduta,
    (SalesAmount-TotalProductCost) AS Profitto
FROM factresellersales
);