DELIMITER |

-- Drops the procedure if it already exists
DROP PROCEDURE IF EXISTS Lst_fournis;

-- Creates a procedure without arguments
CREATE PROCEDURE Lst_fournis()

BEGIN
  SELECT DISTINCT numfou FROM entcom;
END |

DELIMITER ;

-- Call the procedure without arguments
CALL Lst_fournis;

-- Shows info about the created procedure
SHOW CREATE PROCEDURE Lst_fournis;

