DELIMITER |

DROP TRIGGER IF EXISTS `maj_total`;

CREATE TRIGGER `maj_total` AFTER INSERT 
ON `lignedecommande` FOR EACH ROW
BEGIN
  DECLARE `id_c` INT;
  DECLARE `tot` DOUBLE;

  SET `id_c` = NEW.`id_commande`; -- nous captons le numéro de commande concerné
  SET `tot` = (
    SELECT SUM(`prix` * `quantite`)
    FROM `lignedecommande` 
    WHERE `id_commande` = `id_c`
  ); -- on recalcul le total

  UPDATE `commande` SET `total` = `tot` WHERE `id` = `id_c`; -- on stocke le total dans la table commande
END |

DELIMITER ;

INSERT INTO `lignedecommande` (`id_commande`, `id_produit`, `quantite`, `prix`)
VALUES
('1', '1', '50', '1');

--------------------------------------------------------------------------------------------------------
DELIMITER |

DROP PROCEDURE IF EXISTS `MAJ_Total`;
CREATE PROCEDURE `MAJ_Total`(IN `id_c` INT)
BEGIN
  DECLARE `tot` DOUBLE;

  SET `tot` = (
    SELECT SUM(`prix` * `quantite`) 
    FROM `lignedecommande` 
    WHERE `id_commande` = `id_c`
  );

  UPDATE `commande` SET `total` = `tot` WHERE `id` = `id_c`;
END |

DROP TRIGGER IF EXISTS `MAJ_Total_Ins`;
CREATE TRIGGER `MAJ_Total_Ins` AFTER INSERT 
ON `lignedecommande` FOR EACH ROW 
BEGIN
  CALL `MAJ_Total`(NEW.`id_commande`);
END |

DROP TRIGGER IF EXISTS `MAJ_Total_Upd`;
CREATE TRIGGER `MAJ_Total_Upd` AFTER UPDATE 
ON `lignedecommande` FOR EACH ROW 
BEGIN
  CALL `MAJ_Total`(NEW.`id_commande`);
END |

DROP TRIGGER IF EXISTS `MAJ_Total_Del`;
CREATE TRIGGER `MAJ_Total_Del` AFTER DELETE 
ON `lignedecommande` FOR EACH ROW 
BEGIN
  CALL `MAJ_Total`(OLD.`id_commande`);
END |

DELIMITER ;

--------------------------------------------------------------------------------------------------------
DELIMITER |

DROP PROCEDURE IF EXISTS `MAJ_Total`;
CREATE PROCEDURE `MAJ_Total`(IN `id_c` INT)
BEGIN
  DECLARE `tot` DOUBLE;
  DECLARE `remiseTot` FLOAT;

  SET `tot` = (
    SELECT SUM(`prix` * `quantite`) 
    FROM `lignedecommande` 
    WHERE `id_commande` = `id_c`
  );

  SET `remiseTot` = (
    SELECT `remise` 
    FROM `commande` 
    WHERE `id` = `id_c`
  );

  SET `tot` = `tot` - (`tot` * ((100 - `remiseTot`) / 100));

  UPDATE `commande` SET `total` = `tot` WHERE `id` = `id_c`;
END |

DROP TRIGGER IF EXISTS `MAJ_Total_Ins`;
CREATE TRIGGER `MAJ_Total_Ins` AFTER INSERT 
ON `lignedecommande` FOR EACH ROW 
BEGIN
  CALL `MAJ_Total`(NEW.`id_commande`);
END |

DROP TRIGGER IF EXISTS `MAJ_Total_Upd`;
CREATE TRIGGER `MAJ_Total_Upd` AFTER UPDATE 
ON `lignedecommande` FOR EACH ROW 
BEGIN
  CALL `MAJ_Total`(NEW.`id_commande`);
END |

DROP TRIGGER IF EXISTS `MAJ_Total_Del`;
CREATE TRIGGER `MAJ_Total_Del` AFTER DELETE 
ON `lignedecommande` FOR EACH ROW 
BEGIN
  CALL `MAJ_Total`(OLD.`id_commande`);
END |

DELIMITER ;