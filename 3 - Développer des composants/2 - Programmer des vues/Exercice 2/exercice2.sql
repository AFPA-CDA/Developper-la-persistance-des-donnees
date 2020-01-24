-- 1
CREATE OR REPLACE VIEW `v_GlobalCde` AS
SELECT
`ligcom`.`codart` AS `Article`,
SUM(`ligcom`.`qtecde`) AS `QteTot`,
SUM(`ligcom`.`priuni` * `ligcom`.`qtecde`) AS `PrixTot`
FROM `ligcom`
GROUP BY `ligcom`.`codart`;

-- 2
CREATE OR REPLACE VIEW `v_VentesI100` AS
SELECT *
FROM `ligcom`
WHERE `ligcom`.`codart` = 'I100';

-- 3
CREATE OR REPLACE VIEW `v_VentesI100Grobrigan` AS
SELECT 
`entcom`.`numcom` AS `Numéro de la commande`,
`ligcom`.`codart` AS `Code de l'article`,
`fournis`.`nomfou` AS `Nom du fournisseur`,
`ligcom`.`qtecde` AS `Quantité commandé`,
`ligcom`.`qteliv` AS `Quantité livrée`,
`ligcom`.`priuni` AS `Prix Unitaire`
FROM ((`ligcom`
INNER JOIN `entcom` ON `entcom`.`numcom` = `ligcom`.`numcom`)
INNER JOIN `fournis` ON `fournis`.`numfou` = `entcom`.`numfou`)
WHERE `ligcom`.`codart` = 'I100'
AND `entcom`.`numfou` = 120;