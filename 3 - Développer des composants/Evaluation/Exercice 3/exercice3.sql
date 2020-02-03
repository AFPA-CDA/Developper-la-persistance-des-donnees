DELIMITER |

-- Drops the procedure if it alraedy exists
DROP PROCEDURE IF EXISTS `Validation Commande`;

-- Creates the procedure with 2 IN arguments
CREATE PROCEDURE `Validation Commande`(
  IN `ID Produit` INT, 
  IN `ID Commande` INT
)
BEGIN
  -- Declares the variables types
  DECLARE `Pays Fournisseur` VARCHAR(50);
  DECLARE `Pays Client` VARCHAR(50);

  -- Assigns the value to those variables
  SET `Pays Fournisseur` = (
    SELECT DISTINCT `suppliers`.`Country`
    FROM `products`
    INNER JOIN `suppliers`
    ON `products`.`SupplierID` = `suppliers`.`SupplierID`
    WHERE `products`.`ProductID` = `ID Produit`
  );

  SET `Pays Client` = (
    SELECT DISTINCT `orders`.`ShipCountry`
    FROM `orders`
    INNER JOIN `order details`
    ON `orders`.`OrderID` = `order details`.`OrderID`
    WHERE `order details`.`OrderID` = `ID Commande`
  );

  IF `Pays Client` <> `Pays Fournisseur` THEN
    -- Sends an ERROR message with a custom MESSAGE_TEXT
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Le pays du client et du fournisseur sont différent.';
  END IF;
END |

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS `Insertion Commande`;

-- Creates an BEFORE INSERT trigger
CREATE TRIGGER `Insertion Commande` BEFORE INSERT
ON `order details` FOR EACH ROW
BEGIN
  CALL `Validation Commande`(NEW.`ProductID`, NEW.`OrderID`);
END |

-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS `Modification Commande`;

-- Creates an BEFORE UPDATE trigger
CREATE TRIGGER `Modification Commande` BEFORE UPDATE
ON `order details` FOR EACH ROW
BEGIN
  CALL `Validation Commande`(NEW.`ProductID`, NEW.`OrderID`);
END |

DELIMITER ;

-- Testing
INSERT INTO `order details` (`OrderID`, `ProductID`, `UnitPrice`, `Quantity`, `Discount`) 
VALUES
(10248, 64, 34.8000, 5, 0);

UPDATE `order details`
SET `ProductID` = 11
WHERE `OrderID` = 10248
AND `ProductID` = 60;