-- Creates the user with a password
CREATE USER 'util1'@'%' IDENTIFIED BY 'password1';

-- Grants all privileges to the user util1
GRANT ALL PRIVILEGES ON `papyrus`.* TO 'util1'@'%'
IDENTIFIED BY 'password1';

CREATE USER 'util2'@'%' IDENTIFIED BY 'password2';

-- Grants SELECT priviliege to the user util2
GRANT SELECT ON `papyrus`.* TO 'util2'@'%'
IDENTIFIED BY 'password2';

CREATE USER 'util3'@'%' IDENTIFIED BY 'password3';

-- Grants SELECT to the user util3
GRANT SELECT ON `papyrus`.`fournis` TO 'util3'@'%'
IDENTIFIED BY 'password3';
