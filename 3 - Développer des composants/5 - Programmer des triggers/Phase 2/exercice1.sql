CREATE TABLE IF NOT EXISTS `articles_a_commander` (
  `codart` CHAR(4),
  `date` DATE,
  `qte` INT,
  PRIMARY KEY (`codart`, `date`),
  FOREIGN KEY (`codart`) REFERENCES `produit`(`codart`)
);

DELIMITER |

DROP TRIGGER IF EXISTS `commande_alerte`;

CREATE TRIGGER `commande_alerte` AFTER UPDATE
ON `articles_a_commander` FOR EACH ROW
BEGIN
  DECLARE `Stock Alerte` INT;
  DECLARE `Stock Physique` INT;
  DECLARE `Quantité à Commander` INT;
  DECLARE `Quantité Finale` INT;

  SET `Stock Alerte` = (
    SELECT `stkale`
    FROM `produit`
    WHERE `codart` = NEW.`codart`
  );

  SET `Stock Physique` = (
    SELECT `stkphy`
    FROM `produit`
    WHERE `codart` = NEW.`codart`
  );

  SET `Quantité à Commander` = `Stock Alerte` - `Stock Physique`;

  IF (SELECT COUNT(`codart`) FROM `articles_a_commander` WHERE `codart` = NEW.`codart`) > 0 THEN
    SET `Quantité Finale` = `Quantité à Commander` - ( 
      SELECT SUM(`qte`)
      FROM `articles_a_commander`
      WHERE `codart` = NEW.`codart`
    );
  ELSEIF `Stock Alerte` > `Stock Physique` THEN
    INSERT INTO `articles_a_commander`(`codart`, `qte`, `date`) VALUES (NEW.`codart`, `Quantité Finale`, NOW());
  ELSE
    SET `Quantité Finale` = `Quantité à Commander`;
  END IF;
END |

DELIMITER ;

UPDATE `produit` SET `stkphy` = 50 WHERE `codart` = 'I100';
