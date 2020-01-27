DELIMITER |

-- Drops the trigger if it already exists
DROP TRIGGER IF EXISTS `modif_reservation`;

-- Creates a trigger BEFORE UPDATE
CREATE TRIGGER `modif_reservation` BEFORE UPDATE 
ON `reservation` FOR EACH ROW 
BEGIN
  -- Sends a error message
  SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Vous ne pouvez pas modifier les réservations';  
END |

DELIMITER ;

-- Will throw an error
UPDATE `reservation` SET `res_prix` = '9999.99';

---------------------------------------------------------------------------------------------------

DELIMITER |

-- Drops the trigger if it already exists
DROP TRIGGER IF EXISTS `insert_reservation`;

-- Creates a trigger BEFORE INSERT
CREATE TRIGGER `insert_reservation` BEFORE INSERT
ON `reservation` FOR EACH ROW
BEGIN
  DECLARE `Nombre de chambres` SMALLINT;

  SET `Nombre de chambres` =  (
    SELECT 
    COUNT(`reservation`.`res_id`)
    FROM `reservation`
    INNER JOIN `chambre` ON `reservation`.`res_cha_id` = `chambre`.`cha_id`
    WHERE `chambre`.`cha_id` = NEW.`res_cha_id`
  );

  IF `Nombre de chambres` >= 10 THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Le taux de réservations maximal est atteint.';
  END IF;
END |

DELIMITER ;

INSERT INTO `reservation` (`res_cha_id`, `res_cli_id`, `res_date`, `res_date_debut`, `res_date_fin`, `res_prix`, `res_arrhes`)
VALUES
(1, 1, '2017-01-10', '2017-07-01', '2017-07-15', 220, 700),
(1, 1, '2017-01-10', '2017-07-01', '2017-07-15', 220, 700),
(1, 2, '2017-01-10', '2017-07-01', '2017-07-15', 220, 700);

---------------------------------------------------------------------------------------------------

DELIMITER |

DROP TRIGGER IF EXISTS `insert_reservation2`;

CREATE TRIGGER `insert_reservation2` BEFORE INSERT
ON `reservation` FOR EACH ROW
BEGIN
  DECLARE `Nombre de réservations` SMALLINT;

  SET `Nombre de réservations` = (
    SELECT COUNT(`res_cli_id`) 
    FROM `reservation` 
    INNER JOIN `client` ON `reservation`.`res_cli_id` = `client`.`cli_id`
    WHERE `client`.`cli_id` = NEW.`res_cli_id`
  );

  IF `Nombre de réservations` >= 3 THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Le client ne peut pas réserver plus de 3 fois.'; 
  END IF;
END |

DELIMITER ;

INSERT INTO `reservation` (`res_cha_id`, `res_cli_id`, `res_date`, `res_date_debut`, `res_date_fin`, `res_prix`, `res_arrhes`)
VALUES 
(10, 1, '2017-01-10', '2017-07-01', '2017-07-15', 220, 700);

---------------------------------------------------------------------------------------------------

DELIMITER |

DROP TRIGGER IF EXISTS `insert_chambre`;

CREATE TRIGGER `insert_chambre` BEFORE INSERT
ON `chambre` FOR EACH ROW
BEGIN
  DECLARE `Capacité des chambres` SMALLINT;

  SET `Capacité des chambres` = (
    SELECT SUM(`chambre`.`cha_capacite`) 
    FROM `chambre`
    WHERE `chambre`.`cha_hot_id` = NEW.`cha_hot_id`
  );

  IF `Capacité des chambres` > 50 THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Le total ne peut pas être supérieur à 50.';
  END IF;
END |

DELIMITER ;

INSERT INTO `chambre` (`cha_numero`, `cha_hot_id`, `cha_capacite`, `cha_type`) 
VALUES 
(210, 7, 10, 1);
