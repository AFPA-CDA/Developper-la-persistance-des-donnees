-- 2
SELECT 
`nodept`, 
`nom` 
FROM `dept`;

-- 3
SELECT 
`nom`, 
`dateemb`, 
`nosup`, 
`nodep`, 
`salaire` 
FROM `employe`;

-- 4
SELECT `titre` 
FROM `employe`;

-- 5
SELECT DISTINCT `titre` 
FROM `employe`;

-- 6
SELECT 
`nom`, 
`noemp`, 
`nodep` 
FROM `employe` 
WHERE `titre` = 'Secrétaire';

-- 7
SELECT 
`nom`, 
`nodep` 
FROM `employe` 
WHERE `nodep` > 40;

-- 8
SELECT 
`nom`, 
`prenom` 
FROM `employe` 
WHERE `nom` < `prenom`;

-- 9
SELECT 
`nom`, 
`salaire`, 
`nodep` 
FROM `employe` 
WHERE `titre` = 'Représentant' 
AND `nodep` = 35 
AND `salaire` > 20000;

-- 10
SELECT 
`nom`, 
`salaire`, 
`nodep` 
FROM `employe` 
WHERE `titre` = 'Représentant' 
OR `titre` = 'Président';

-- 11
SELECT 
`nom`, 
`titre`, 
`nodep`, 
`salaire` 
FROM `employe`
WHERE `nodep` = 34 
AND (`titre` = 'Représentant' OR `titre` = 'Secrétaire');

-- 12
SELECT 
`nom`, 
`titre`, 
`nodep`, 
`salaire` 
FROM `employe`
WHERE `titre` = 'Représentant' 
OR (`titre` = 'Secrétaire' AND `nodep` = 34);

-- 13
SELECT 
`nom`, 
`salaire` 
FROM `employe`
WHERE `salaire` 
BETWEEN 20000 AND 30000;

-- 15
SELECT `nom` 
FROM `employe`
WHERE `nom` 
LIKE 'H%';

-- 16
SELECT `nom` 
FROM `employe`
WHERE `nom` 
LIKE '%n';

-- 17
SELECT `nom` 
FROM `employe`
WHERE `nom` 
LIKE '__u%';

-- 18
SELECT 
`salaire`, 
`nom` 
FROM `employe`
WHERE `nodep` = 41
ORDER BY `salaire` ASC;

-- 19
SELECT 
`salaire`, 
`nom` 
FROM `employe`
WHERE `nodep` = 41
ORDER BY `salaire` DESC;

-- 20
SELECT 
`titre`, 
`salaire`, 
`nom` 
FROM `employe`
ORDER BY 
`titre` ASC, 
`salaire` DESC;

-- 21
SELECT 
`tauxcom`, 
`salaire`, 
`nom` 
FROM `employe`
ORDER BY `tauxcom` ASC;

-- 22
SELECT 
`nom`, 
`salaire`, 
`tauxcom`, 
`titre` 
FROM `employe`
WHERE `tauxcom` IS NULL;

-- 23
SELECT 
`nom`, 
`salaire`, 
`tauxcom`, 
`titre` 
FROM `employe`
WHERE `tauxcom` IS NOT NULL;

-- 24
SELECT 
`nom`, 
`salaire`, 
`tauxcom`, 
`titre` 
FROM `employe`
WHERE `tauxcom` < 15;

-- 25
SELECT 
`nom`, 
`salaire`, 
`tauxcom`, 
`titre` 
FROM `employe`
WHERE `tauxcom` > 15;

-- 26
SELECT 
`nom`, 
`salaire`, 
`tauxcom`, 
(`salaire` * 2) AS `tauxemp` 
FROM `employe`
WHERE `tauxcom` IS NOT NULL;

-- 27
SELECT 
`nom`, 
`salaire`, 
`tauxcom`, (`salaire` * 2) AS `tauxemp` 
FROM `employe`
WHERE `tauxcom` IS NOT NULL
ORDER BY `tauxcom` ASC;

-- 28
SELECT CONCAT(`nom`, " ", `prenom`) AS `nomcomp`
FROM `employe`;

-- 29
SELECT SUBSTRING(`nom`, 1, 5) AS `nomcoup`
FROM `employe`;

-- 30
SELECT LOCATE('r', `nom`) AS `rangee`
FROM `employe`;

-- 31
SELECT 
`nom`, 
UPPER(`nom`) AS `nommaj`, 
LOWER(`nom`) AS `nommin`
FROM `employe`
WHERE `nom` = 'Vrante';

-- 32
SELECT 
`nom`, 
LENGTH(`nom`) AS `nomchar`
FROM `employe`;