-- 1
USE `papyrus`;

-- Starts the transaction
BEGIN WORK;

-- nomfou = GROBRIGAN
SELECT `nomfou` FROM `fournis` WHERE `numfou` = 120;

UPDATE `fournis`  SET `nomfou` = 'GROSBRIGAND' WHERE `numfou` = 120;

-- nomfou = GROSBRIGAND
SELECT `nomfou` FROM `fournis` WHERE `numfou` = 120;

-- Reverts the last DB change
ROLLBACK;

-- nomfou = GROBRIGAN
SELECT `nomfou` FROM `fournis` WHERE `numfou` = 120;

UPDATE `fournis`  SET `nomfou` = 'GROSBRIGAND' WHERE `numfou` = 120;

-- Commit the last DB change
COMMIT;

-- nomfou = GROSBRIGAND
SELECT `nomfou` FROM `fournis` WHERE `numfou` = 120;

