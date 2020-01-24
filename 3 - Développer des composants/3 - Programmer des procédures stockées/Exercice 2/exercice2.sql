DELIMITER |

-- Drops the procedure if it already exists
DROP PROCEDURE IF EXISTS Lst_Commandes;

-- Creates a procedure with one argument
CREATE PROCEDURE Lst_Commandes(IN `Observations` VARCHAR(50))

BEGIN
  SELECT 
  `entcom`.`numcom` AS `Commande`, 
  `fournis`.`nomfou` AS `Fournisseur`, 
  `produit`.`libart` AS `Article`, 
  (`ligcom`.`priuni` * `ligcom`.`qtecde`) AS `Prix`
  FROM (((`entcom` 
  INNER JOIN `fournis` ON `entcom`.`numfou` = `fournis`.`numfou`)
  INNER JOIN `ligcom` ON `ligcom`.`numcom`= `entcom`.`numcom`)
  INNER JOIN `produit` ON `produit`.`codart` = `ligcom`.`codart`)
  WHERE `entcom`.`obscom` = `Observations`;
END |

DELIMITER ;

-- Call the procedure with one argument
CALL Lst_Commandes('Commande urgente');