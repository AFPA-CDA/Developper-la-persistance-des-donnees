-- 1
SELECT
`CompanyName` AS `Société`, -- Select the elements and gives them an Alias
`ContactName` AS `Contact`,
`ContactTitle` AS `Fonction`,
`Phone` AS `Téléphone`
FROM `customers`
WHERE `Country` = 'France'; -- Filters the records given to the user

-- 2
SELECT
`products`.`ProductName` AS `Produit`,
`products`.`UnitPrice` AS `Prix`
FROM `products`
INNER JOIN `suppliers` -- Selects the records that have matching values in both table
ON `products`.`SupplierID` = `suppliers`.`SupplierID`
WHERE `suppliers`.`CompanyName` = 'Exotic Liquids';

-- 3
SELECT
`suppliers`.`CompanyName` AS `Fournisseur`,
COUNT(`products`.`ProductID`) AS `NbreProduits` -- Returns the number of products 
FROM `suppliers`
INNER JOIN `products`
ON `suppliers`.`SupplierID` = `products`.`SupplierID`
WHERE `suppliers`.`Country` = 'France'
GROUP BY `suppliers`.`SupplierID` -- Groups rows that have the same values into summary rows
ORDER BY `NbreProduits` DESC; -- Sorts the result-set in descending order.

-- 4
SELECT
`customers`.`CompanyName` AS `Client`,
COUNT(`orders`.`CustomerID`) AS `NbreCommandes`
FROM `customers`
INNER JOIN `orders`
ON `customers`.`CustomerID` = `orders`.`CustomerID`
WHERE `customers`.`Country` = 'France'
GROUP BY `customers`.`CustomerID`
HAVING `NbreCommandes` > 10 -- Acts like WHERE but is used with aggregate functions
ORDER BY `Client` ASC;

-- 5
SELECT
`customers`.`CompanyName` AS `Client`,
SUM(`order details`.`UnitPrice` * `order details`.`Quantity`) as `CA`,
`customers`.`Country` AS `Pays`
FROM ((`customers`
INNER JOIN `orders` ON `orders`.`CustomerID` = `customers`.`CustomerID`)
INNER JOIN `order details` ON `order details`.`OrderID` = `orders`.`OrderID`)
GROUP BY `customers`.`CustomerID`
HAVING `CA` > 30000
ORDER BY `CA` DESC;

-- 6
SELECT DISTINCT
`orders`.`ShipCountry` AS `Pays`
FROM (((`orders`
INNER JOIN `order details` ON `order details`.`OrderID` = `orders`.`OrderID`)
INNER JOIN `products` ON `products`.`ProductID` = `order details`.`ProductID`)
INNER JOIN `suppliers` ON `suppliers`.`SupplierID` = `products`.`SupplierID`)
WHERE `suppliers`.`CompanyName` = 'Exotic Liquids'
ORDER BY `Pays` ASC;

-- 7
SELECT 
-- Returns the sum of the given field in the given table
SUM(`order details`.`Quantity` * `order details`.`UnitPrice`) AS 'Montant Ventes 97' 
FROM `order details`
INNER JOIN `orders` 
ON `orders`.`OrderID` = `order details`.`OrderID`
WHERE `orders`.`OrderDate` 
LIKE '1997%';

-- 8
SELECT 
MONTH(`orders`.`OrderDate`) AS `Mois 97`, -- Returns the month part of a date
SUM(`order details`.`UnitPrice` * `order details`.`Quantity`) AS `Montant Ventes`
FROM `order details`
INNER JOIN `orders` 
ON `orders`.`OrderID` = `order details`.`OrderID`
WHERE `orders`.`OrderDate` 
LIKE '1997%'
GROUP BY `Mois 97`;

-- 9
SELECT `orders`.`OrderDate` AS 'Date de dernière commande'
FROM `orders` 
INNER JOIN `customers` 
ON `customers`.`CustomerID` = `orders`.`CustomerID`
WHERE `customers`.`CustomerID` = 'DUMON'
ORDER BY `orders`.`OrderDate` DESC
LIMIT 1; -- Specify the number of records to return

-- 10
SELECT 
-- Calculates the Average and truncate it to remove the decimals
TRUNCATE (AVG(DATEDIFF(`orders`.`ShippedDate`, `orders`.`OrderDate`)), 0) AS 'Delais moyen de livraison en jours'
FROM `orders`;