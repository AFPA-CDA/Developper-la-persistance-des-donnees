DROP DATABASE IF EXISTS exercice2;
CREATE DATABASE exercice2;
USE exercice2;

CREATE TABLE client(
   cli_num INT,
   cli_nom VARCHAR(50),
   cli_prenom VARCHAR(50),
   PRIMARY KEY(cli_num)
);

CREATE TABLE commande(
   com_num INT,
   com_date DATE,
   com_montant DECIMAL(10,2),
   cli_num INT NOT NULL,
   PRIMARY KEY(com_num),
   FOREIGN KEY(cli_num) REFERENCES client(cli_num)
);

CREATE TABLE article(
   art_num INT,
   art_designation VARCHAR(50),
   art_prix_unitaire DECIMAL(10,2),
   PRIMARY KEY(art_num)
);

CREATE TABLE SeComposeDe(
   com_num INT,
   art_num INT,
   qte INT,
   taux_tva DECIMAL(4,2),
   PRIMARY KEY(com_num, art_num),
   FOREIGN KEY(com_num) REFERENCES commande(com_num),
   FOREIGN KEY(art_num) REFERENCES article(art_num)
);
