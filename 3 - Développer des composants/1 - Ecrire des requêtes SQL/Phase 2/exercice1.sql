-- 1
SELECT 
`hot_nom`, 
`hot_ville`
FROM `hotel`;

-- 2
SELECT 
`cli_adresse`, 
`cli_nom`, 
`cli_prenom`
FROM `client`;

-- 3
SELECT 
`sta_nom`, 
`sta_altitude`
FROM `station`
WHERE `sta_altitude` < 1000;

-- 4
SELECT 
`cha_numero`, 
`cha_capacite`
FROM `chambre`
WHERE `cha_capacite` > 1;

-- 5
SELECT 
`cli_nom`, 
`cli_ville`
FROM `client`
WHERE `cli_ville` <> 'Londre';

-- 6
SELECT 
`hot_nom`, 
`hot_ville`,
`hot_categorie`
FROM `hotel`
WHERE `hot_ville` = 'Bretou' 
AND `hot_categorie` > 3;

-- 7
SELECT 
`station`.`sta_nom` AS `Nom de la Station`,
`hotel`.`hot_nom` AS `Nom de l'Hôtel`,
`hotel`.`hot_categorie` AS `Categorie de l'Hôtel`,
`hotel`.`hot_ville` AS `Ville de l'Hôtel`
FROM `station`
INNER JOIN `hotel`
ON `station`.`sta_id` = `hotel`.`hot_sta_id`;

-- 8
SELECT
`chambre`.`cha_numero` AS `Numéro de la Chambre`,
`hotel`.`hot_nom` AS `Nom de l'Hôtel`,
`hotel`.`hot_categorie` AS `Categorie de l'Hôtel`,
`hotel`.`hot_ville` AS `Ville de l'Hôtel`
FROM `chambre`
INNER JOIN `hotel`
ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`;

-- 9
SELECT
`chambre`.`cha_numero` AS `Numéro de la Chambre`,
`chambre`.`cha_capacite` AS `Capacité de la Chambre`,
`hotel`.`hot_nom` AS `Nom de l'Hôtel`,
`hotel`.`hot_categorie` AS `Categorie de l'Hôtel`,
`hotel`.`hot_ville` AS `Ville de l'Hôtel`
FROM `chambre`
INNER JOIN `hotel`
ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`
WHERE `chambre`.`cha_capacite` > 1 
AND `hotel`.`hot_ville` = 'Bretou';

-- 10
SELECT 
`reservation`.`res_date` AS `Date de Réservation`,
`client`.`cli_nom` AS `Nom du Client`,
`hotel`.`hot_nom` AS `Nom de l'Hôtel`
FROM ((`reservation`
INNER JOIN `client` ON `client`.`cli_id` = `reservation`.`res_cli_id`)
INNER JOIN `hotel` ON `hotel`.`hot_id` = `reservation`.`res_id`);

-- 11
SELECT 
`hotel`.`hot_nom` AS `Nom de l'Hôtel`,
`station`.`sta_nom` AS `Nom de la Station`,
`chambre`.`cha_numero` AS `Numéro de la Chambre`,
`chambre`.`cha_capacite` AS `Capacite de la Chambre`
FROM ((`hotel`
INNER JOIN `station` ON `station`.`sta_id` = `hotel`.`hot_sta_id`)
INNER JOIN `chambre` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`);

-- 12
SELECT
DATEDIFF(`reservation`.`res_date_fin`, `reservation`.`res_date_debut`) AS `Durée du Séjour`,
`reservation`.`res_date_debut` AS `Date de début du Séjour`,
`client`.`cli_nom` AS `Nom du Client`,
`hotel`.`hot_nom` AS `Nom de l'Hôtel`
FROM ((`reservation`
INNER JOIN `client` ON `client`.`cli_id` = `reservation`.`res_cli_id`)
INNER JOIN `hotel` ON `hotel`.`hot_id` = `reservation`.`res_id`);

-- 13
SELECT
`station`.`sta_nom` AS `Nom de la Station`,
COUNT(`hotel`.`hot_id`) AS `Nombre d'Hôtels`
FROM `station`
INNER JOIN `hotel`
ON `station`.`sta_id` = `hotel`.`hot_sta_id`
GROUP BY `hotel`.`hot_sta_id`;

-- 14
SELECT
`station`.`sta_nom` AS `Nom de la station`,
COUNT(`chambre`.`cha_id`) AS `Nombre de Chambres`
FROM ((`station`
INNER JOIN `hotel` ON `hotel`.`hot_sta_id` = `station`.`sta_id`)
INNER JOIN `chambre` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`)
GROUP BY `station`.`sta_nom`;

-- 15
SELECT
`station`.`sta_nom` AS `Nom de la station`,
COUNT(`chambre`.`cha_id`) AS `Nombre de Chambres`
FROM ((`station`
INNER JOIN `hotel` ON `hotel`.`hot_sta_id` = `station`.`sta_id`)
INNER JOIN `chambre` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`)
WHERE `chambre`.`cha_capacite` > 1
GROUP BY `station`.`sta_nom`;

-- 16
SELECT `hotel`.`hot_nom` AS `Liste des Hôtels`
FROM (((`hotel` 
INNER JOIN `chambre` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`)
INNER JOIN `reservation` ON `reservation`.`res_cha_id` = `chambre`.`cha_id`)
INNER JOIN `client` ON `client`.`cli_id` = `reservation`.`res_cli_id`)
WHERE `client`.`cli_nom` = "Squire"
GROUP BY `hotel`.`hot_nom`;

-- 17
SELECT `station`.`sta_nom` AS `Nom de la station`, 
AVG(DATEDIFF(`reservation`.`res_date_fin`, `reservation`.`res_date_debut`)) AS `Moyenne`
FROM `station` 
JOIN `hotel` ON `hotel`.`hot_sta_id` = `station`.`sta_id`
JOIN `chambre` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`
JOIN `reservation` ON `reservation`.`res_cha_id` = `chambre`.`cha_id`
GROUP BY `station`.`sta_nom`;