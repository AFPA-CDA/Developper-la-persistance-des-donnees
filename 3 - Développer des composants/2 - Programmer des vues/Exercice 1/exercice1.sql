-- 1
CREATE OR REPLACE VIEW `Hôtel et Station` AS
SELECT 
`station`.`sta_nom` AS `Nom de la Station`,
`hotel`.`hot_nom` AS `Nom de l'Hôtel`,
`hotel`.`hot_categorie` AS `Categorie de l'Hôtel`,
`hotel`.`hot_ville` AS `Ville de l'Hôtel`
FROM `station`
INNER JOIN `hotel`
ON `station`.`sta_id` = `hotel`.`hot_sta_id`;

-- 2
CREATE OR REPLACE VIEW `Chambre et Hôtel` AS
SELECT
`chambre`.`cha_numero` AS `Numéro de la Chambre`,
`hotel`.`hot_nom` AS `Nom de l'Hôtel`,
`hotel`.`hot_categorie` AS `Categorie de l'Hôtel`,
`hotel`.`hot_ville` AS `Ville de l'Hôtel`
FROM `chambre`
INNER JOIN `hotel`
ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`;

-- 3
-- Changer c'est pas le bon
CREATE OR REPLACE VIEW `Client et Réservation` AS
SELECT 
`reservation`.`res_date` AS `Date de Réservation`,
`client`.`cli_nom` AS `Nom du Client`
FROM `reservation`
INNER JOIN `client` ON `client`.`cli_id` = `reservation`.`res_cli_id`;

-- 4
CREATE OR REPLACE VIEW `Chambre et Hôtel et Station` AS
SELECT 
`hotel`.`hot_nom` AS `Nom de l'Hôtel`,
`station`.`sta_nom` AS `Nom de la Station`,
`chambre`.`cha_numero` AS `Numéro de la Chambre`,
`chambre`.`cha_capacite` AS `Capacite de la Chambre`
FROM ((`hotel`
INNER JOIN `station` ON `station`.`sta_id` = `hotel`.`hot_sta_id`)
INNER JOIN `chambre` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`);

-- 5
CREATE OR REPLACE VIEW `Client et Hôtel et Réservation` AS
SELECT 
`reservation`.`res_date` AS `Date de Réservation`,
`client`.`cli_nom` AS `Nom du Client`,
`hotel`.`hot_nom` AS `Nom de l'Hôtel`
FROM ((`reservation`
INNER JOIN `client` ON `client`.`cli_id` = `reservation`.`res_cli_id`)
INNER JOIN `hotel` ON `hotel`.`hot_id` = `reservation`.`res_id`);