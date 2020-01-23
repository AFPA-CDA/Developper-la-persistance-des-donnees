-- 1
SELECT `prenom`, `nodep`, `dept`.`nodept`
FROM `employe`
INNER JOIN `dept`
ON `employe`.`nodep` = `dept`.`nodept`;

-- 2
SELECT `nodep`,
`dept`.`nom` AS `Nom du département`,
`employe`.`nom` AS `Nom employé`
FROM `employe`
INNER JOIN `dept` 
ON `employe`.`nodep` = `dept`.`nodept`
ORDER BY `nodep`;

-- 3
SELECT `employe`.`nom`
FROM `employe`
INNER JOIN `dept`
ON `dept`.`nodept` = `employe`.`nodep`
WHERE `dept`.`nom` = 'Distribution';

-- 4
SELECT 
`u1`.`nom` AS `Nom employé`,
`u1`.`salaire` AS `Salaire employé`,
`u2`.`nom` AS `Nom patron`,
`u2`.`salaire` AS `Salaire patron`
FROM `employe` AS `u1`, `employe` AS `u2`
WHERE `u1`.`salaire` > `u2`.`salaire`
AND `u1`.`nosup` = `u2`.`noemp`;

-- 5
SELECT `nom`, `titre`
FROM `employe`
WHERE `titre` IN (
  SELECT `titre`
  FROM `employe`
  WHERE `nom` = 'Amartakaldire'
);

-- 6
SELECT `nom`, `nodep`, `salaire`
FROM `employe`
WHERE `salaire` > ANY (
  SELECT `nodep`
  FROM `employe`
  WHERE `nodep` = 31
)
ORDER BY `nodep`, `salaire`;

-- 7
SELECT `nom`, `nodep`, `salaire`
FROM `employe`
WHERE `salaire` > ALL (
  SELECT `nodep`
  FROM `employe`
  WHERE `nodep` = 31
)
ORDER BY `nodep`, `salaire`;

-- 8
SELECT `nom`, `titre`
FROM `employe`
WHERE `nodep` = 31 AND `titre` IN (
  SELECT `titre`
  FROM `employe`
  WHERE `nodep` = 32
);

-- 9
SELECT `nom`, `titre`
FROM `employe`
WHERE `nodep` = 31 AND `titre` NOT IN (
  SELECT `titre`
  FROM `employe`
  WHERE `nodep` = 32
);

-- 10
SELECT `nom`, `titre`, `salaire`
FROM `employe`
WHERE `salaire` = (
  SELECT `salaire`
  FROM `employe`
  WHERE `nom` = 'Fairent'
)
AND `titre` = (
  SELECT `titre`
  FROM `employe`
  WHERE `nom` = 'Fairent'
)
AND `nom` <> 'Fairent';

-- 11
SELECT 
`dept`.`nodept` AS `Numéro du Département`,
`dept`.`nom` AS `Nom du Département`,
`employe`.`nom` AS `Nom employé`
FROM `dept`
LEFT JOIN `employe` ON `nodept` = `nodep`
ORDER BY `nodep`; 

-- 12
SELECT `titre`, 
COUNT(`noemp`) AS `Nombre employé`
FROM `employe` 
GROUP BY `titre`;

-- 13
SELECT 
AVG(`employe`.`salaire`) AS `Moyenne des salaires`,
SUM(`employe`.`salaire`) AS `Somme des salaires`,
`dept`.`noregion` AS `Numéro de la Région`
FROM `employe`
INNER JOIN `dept`
ON `employe`.`nodep` = `dept`.`nodept`
GROUP BY `dept`.`noregion`;

-- 14
SELECT
`nodep` AS `Numéro du Département`,
COUNT(`nodep`) AS `Nombre de Départements`
FROM `employe`
GROUP BY `nodep`
HAVING COUNT(`nodep`) >= 3;

-- 15
SELECT 
SUBSTRING(`nom`, 1, 1) AS `Initiales`,
COUNT(SUBSTRING(`nom`, 1, 1)) AS `NombreInitiales`
FROM `employe` 
GROUP BY `Initiales`
HAVING `NombreInitiales` >= 3;

-- 16
SELECT 
MAX(`salaire`) AS `Max`,
MIN(`salaire`) AS `Min`,
MAX(`salaire`) - MIN(`salaire`) AS `Écart`
FROM `employe`;

-- 17
SELECT COUNT(DISTINCT `titre`) AS `Nombre de titres différents`
FROM `employe`;

-- 18
SELECT DISTINCT 
`titre` AS `Titres Uniques`,
COUNT(`titre`) AS `Nombre d'employés`
FROM `employe`
GROUP BY `titre`;

-- 19
SELECT DISTINCT 
`dept`.`nom` AS `Nom du Département`,
COUNT(`employe`.`noemp`) AS `Nombre d'employés`
FROM `employe`
INNER JOIN `dept`
ON `employe`.`nodep` = `dept`.`nodept`
GROUP BY `dept`.`nom`;

-- 20
SELECT DISTINCT
`titre`,
AVG(`salaire`) AS `Salaire Moyen`
FROM `employe`
GROUP BY `titre`
HAVING AVG(`salaire`) > (
  SELECT AVG(`salaire`)
  FROM `employe`
  WHERE `titre` = 'Représentant'
);

-- 21
SELECT 
COUNT(DISTINCT `salaire`) AS `Nombre de Salaires`,
COUNT(DISTINCT `tauxcom`) AS `Nombre de Taux de Com`
FROM `employe`;