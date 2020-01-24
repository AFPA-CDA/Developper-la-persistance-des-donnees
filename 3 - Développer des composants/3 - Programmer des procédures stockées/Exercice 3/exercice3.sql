DELIMITER |

-- Drops the procedure if it already exists
DROP PROCEDURE IF EXISTS CA_Fournisseur;

-- Creates a procedure with one argument
CREATE PROCEDURE CA_Fournisseur(
  IN `Nom du Fournisseur` VARCHAR(50),
  IN `Date de la Commande` VARCHAR(4)
)

BEGIN
  SELECT `fournis`.`nomfou` AS `Fournisseurs`,
  SUM(`ligcom`.`qteliv` * `ligcom`.`priuni`) * 1.2 AS `CA`
  FROM (((`fournis`
  INNER JOIN `vente` ON `vente`.`numfou` = `fournis`.`numfou`)
  INNER JOIN `ligcom` ON `ligcom`.`codart` = `vente`.`codart`)
  INNER JOIN `entcom` ON `entcom`.`numcom` = `ligcom`.`numcom`)
  WHERE `fournis`.`nomfou` = `Nom du Fournisseur`
  AND SUBSTRING(CAST(`entcom`.`datcom` AS DATE), 1, 4) = `Date de la Commande`
  GROUP BY `nomfou`;
END |

DELIMITER ;

-- Call the procedure with one argument
CALL CA_Fournisseur('DISCOBOL', '2018');