-- 1
SELECT `numcom`
FROM `entcom`
WHERE `numfou` = 9120;

-- 2
SELECT DISTINCT `numfou`
FROM `entcom`;

-- 3
SELECT 
COUNT(`numcom`) AS `Nombre de Commandes`, 
COUNT(DISTINCT `numfou`) AS `Nombre de Fournisseurs`
FROM `entcom`;

-- 4
SELECT
`codart` AS `Numéro du Produit`,
`libart` AS `Libellé Produit`,
`stkphy` AS `Stock`,
`stkale` AS `Stock actuel d'alerte`,
`qteann` AS `Quantité annuelle`
FROM `produit`
WHERE `stkphy` <= `stkale`
AND `qteann` < 1000;

-- 5
SELECT 
SUBSTRING(`posfou`, 1, 2) AS 'Département', 
`nomfou` AS 'Nom Fournisseur'
FROM `fournis`
WHERE 
SUBSTRING(`posfou`, 1, 2) = '75' 
OR SUBSTRING(`posfou`, 1, 2) = '78' 
OR SUBSTRING(`posfou`, 1, 2) = '92' 
OR SUBSTRING(`posfou`, 1, 2) = '77'
ORDER BY `posfou` DESC, `nomfou`;

-- 6
SELECT 
`numcom` AS `Commande`, 
`datcom` AS `Date de Commande`
FROM `entcom` 
WHERE `datcom` LIKE '%-04-%'
OR `datcom` LIKE '%-03-%';

-- 7
SELECT
`numcom` AS `Numéro de commande`,
`obscom` AS `Observation `
FROM `entcom`
WHERE DATE(`datcom`) = (
  SELECT CAST(NOW() AS DATE)
  AND `obscom` != ''
);

-- 8
SELECT `ligcom`.`numcom` AS `Numéro de commande`, 
SUM(`ligcom`.`priuni` * `ligcom`.`qteliv`) AS `Total`
FROM `ligcom` 
GROUP BY `ligcom`.`numcom`
ORDER BY `Total` DESC;

-- 9
SELECT `ligcom`.`numcom` AS `Numéro de commande`,
SUM(`ligcom`.`priuni` * `ligcom`.`qteliv`) AS `Total`
FROM `ligcom`
WHERE `qtecde` >= 1000
GROUP BY `ligcom`.`numcom`
HAVING `Total` > 10000;

-- 10
SELECT 
`fournis`.`nomfou`, 
`entcom`.`numcom`,
`entcom`.`datcom`
FROM `entcom`
INNER JOIN `fournis` 
ON `fournis`.`numfou` = `entcom`.`numfou`;

-- 11
SELECT 
`entcom`.`numcom` AS `Commande`, 
`fournis`.`nomfou` AS `Fournisseur`, 
`produit`.`libart` AS `Article`, 
(`ligcom`.`priuni` * `ligcom`.`qtecde`) AS `Prix`
FROM (((`entcom` 
INNER JOIN `fournis` ON `entcom`.`numfou` = `fournis`.`numfou`)
INNER JOIN `ligcom` ON `ligcom`.`numcom`= `entcom`.`numcom`)
INNER JOIN `produit` ON `produit`.`codart` = `ligcom`.`codart`)
WHERE `entcom`.`obscom` = 'Commande urgente';

-- 12
SELECT DISTINCT `fournis`.`nomfou` AS `Fournisseur`
FROM ((`fournis`
INNER JOIN `entcom` ON `fournis`.`numfou` = `entcom`.`numfou`)
INNER JOIN `ligcom` ON `ligcom`.`numcom` = `entcom`.`numcom`)
WHERE `ligcom`.`qteliv` > 0;

-- 13
SELECT 
`entcom`.`datcom` AS `Date de la Commande`,
`entcom`.`numcom` AS `Numero`
FROM `entcom` 
WHERE `entcom`.`numfou` = (
	SELECT `entcom`.`numfou`
	FROM `entcom` 
	WHERE `entcom`.`numcom` = 70210);

-- 14
SELECT 
`produit`.`libart` AS `Articles`,
`vente`.`prix1` AS `Prix` 
FROM `vente` 
INNER JOIN `produit` 
ON `produit`.`codart` = `vente`.`codart`
WHERE `vente`.`prix1` < ALL (
	SELECT `vente`.`prix1`
	FROM `vente` 
	WHERE `vente`.`codart` LIKE 'R%');

-- 15
SELECT DISTINCT 
`fournis`.`nomfou` AS `Fournisseurs Stock Alerte`, 
`produit`.`libart` AS `Produits`
FROM ((`fournis` 
INNER JOIN `vente` ON `vente`.`numfou` = `fournis`.`numfou`)
INNER JOIN `produit` ON `produit`.`codart` = `vente`.`codart`)
WHERE `produit`.`stkphy` >= (`produit`.`stkale` * 1.5)
ORDER BY `produit`.`libart`, `fournis`.`nomfou`;

-- 16
SELECT DISTINCT 
`fournis`.`nomfou` AS `Fournisseurs Stock Alerte`,
`produit`.`libart` AS `Produits`
FROM ((`fournis` 
INNER JOIN `vente` ON `vente`.`numfou` = `fournis`.`numfou`)
INNER JOIN `produit` ON `produit`.`codart` = `vente`.`codart`)
WHERE `produit`.`stkphy` >= (`produit`.`stkale` * 1.5)
AND `vente`.`delliv` < 31
ORDER BY `fournis`.`nomfou`, `produit`.`libart`;

-- 18
SELECT `produit`.`libart` AS `produits`
FROM `produit` 
INNER JOIN `ligcom` 
ON `produit`.`codart` = `ligcom`.`codart`
WHERE (`produit`.`qteann` * 0.9) < `ligcom`.`qtecde`
GROUP BY `ligcom`.`codart`;

-- 19
SELECT 
`fournis`.`nomfou` AS `Fournisseurs`,
SUM(`ligcom`.`qteliv` * `ligcom`.`priuni`) * 1.2 AS `CA`
FROM ((`fournis` 
INNER JOIN `vente` ON `vente`.`numfou` = `fournis`.`numfou`)
INNER JOIN `ligcom` ON `ligcom`.`codart` = `vente`.`codart`)
GROUP BY `fournis`.`nomfou`;


-- Partie 2

-- 1
UPDATE `vente`
SET 
`prix1` = `prix1` * 0.4, 
`prix2` = `prix2` * 0.2
WHERE `numfou` = 9180;

-- 2
UPDATE `vente` 
SET `prix2` = `prix1`
WHERE `prix2` = 0;

-- 3
UPDATE `entcom` 
INNER JOIN `fournis` 
ON `fournis`.`numfou` = `entcom`.`numfou`
SET `entcom`.`obscom` = CONCAT(`entcom`.`obscom`, '*****')
WHERE `fournis`.`satisf` < 5;

-- 4
DELETE FROM `vente`
WHERE `codart` = 'I110';

DELETE FROM `produit`
WHERE `codart` = 'I110';

-- 5
DELETE FROM 
`entcom`, 
`ligcom`
USING `entcom`
INNER JOIN `ligcom` 
ON `ligcom`.`numcom` = `entcom`.`numcom`
WHERE `ligcom`.`qteliv` = 0;