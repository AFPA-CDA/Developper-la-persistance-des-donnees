DELIMITER |

-- Drops the procedure if it already exists
DROP PROCEDURE IF EXISTS `dernière_commande`;

-- Creates the procedure with one argument
CREATE PROCEDURE `dernière_commande`(IN `ID_CLIENT` VARCHAR(5))
BEGIN
  SELECT `orders`.`OrderDate` AS 'Date de dernière commande'
  FROM `orders` 
  INNER JOIN `customers` 
  ON `customers`.`CustomerID` = `orders`.`CustomerID`
  WHERE `customers`.`CustomerID` = `ID_CLIENT`
  ORDER BY `orders`.`OrderDate` DESC
  LIMIT 1;
END |

DELIMITER ;

-- Calls the Procedure with the argument BLONP
CALL `dernière_commande`('BLONP');


-----------------------------------------------------------------------------------

DELIMITER |

-- Drops the procedure if it already exists
DROP PROCEDURE IF EXISTS `delais_moyen`;

CREATE PROCEDURE `delais_moyen`()
BEGIN
  SELECT 
  TRUNCATE (AVG(DATEDIFF(`orders`.`ShippedDate`, `orders`.`OrderDate`)), 0) AS 'Delais moyen de livraison en jours'
  FROM `orders`;
END |

DELIMITER ;

-- Calls the procedure with no arguments
CALL `delais_moyen`();
