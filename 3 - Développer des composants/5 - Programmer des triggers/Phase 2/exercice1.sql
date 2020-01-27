CREATE TABLE `ARTICLES_A_COMMANDER` (
  `codart` CHAR(4),
  `date` DATE DEFAULT CURRENT_TIMESTAMP,
  `qte_comm` INT,
  PRIMARY KEY (`codart`, `date_alert`),
  FOREIGN KEY (`codart`) REFERENCES `produit`(`codart`)
);

DELIMITER |

DROP PROCEDURE IF EXISTS `commande_alerte`;

CREATE PROCEDURE `commande_alerte`(IN `Code Article` CHAR(4))
BEGIN
  DECLARE `Stock Alerte` INT;
  DECLARE `Stock Physique` INT;
  DECLARE `Quantité à Commander` INT;
  DECLARE `Quantité Finale` INT;

  SET `Stock Alerte` = (
    SELECT `stkale`
    FROM `produit`
    WHERE `codart` = `Code Article`
  );

  SET `Stock Physique` = (
    SELECT `stkphy`
    FROM `produit`
    WHERE `codart` = `Code Article`
  );

  SET `Quantité à Commander` = `Stock Alerte` - `Stock Physique`;

  IF (SELECT COUNT(`codart`) FROM `ARTICLES_A_COMMANDER` WHERE `codart` = `Code Article`) > 0 THEN
    
  END IF;
END |

DELIMITER ;
