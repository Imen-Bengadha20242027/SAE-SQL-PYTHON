-- V4.0.0

PROMPT "Création de la base de données Tenrac";

-- **************************************************************************** Définition des données

PROMPT "Définition des données";

DROP TABLE IF EXISTS Ordre_Tenrac CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Club_Tenrac CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Plat CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Aliment CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Allergie CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Sauce CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Machine CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Certificat CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Historique CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Registre CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Cuisinier CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Organisme CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Ingredient CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Fabriquant CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Raclette CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Legume CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Entretien CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Croyance CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Opposition_De_Conviction_Personnelle CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Croisade CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Tenrac CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Grade CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Rang CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Titre CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Dignite CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Carte_Membre CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Groupe_Tenrac CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Repas CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Restaurant CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Est_Compose_De CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Est_Constitue CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Provoque CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Est_Accompagne_De CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Commande CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Federe CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Valide CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS A CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Est_Consigne_Dans CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Sert Cascade CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Fait Cascade CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Est_Un_Assemblage CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Est_Fabrique CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Amene_A CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Engendre CASCADE CONSTRAINTS PURGE;
DROP TABLE IF EXISTS Possede CASCADE CONSTRAINTS PURGE;



CREATE TABLE Ordre_Tenrac(
   idOT NUMBER(10),
   nom VARCHAR2(50),
   adresse VARCHAR2(50),
   ville VARCHAR2(50),
   type VARCHAR2(50),
   codePostale NUMBER(10),
   CONSTRAINT pk_Ordre_Tenrac PRIMARY KEY(idOT)
);

CREATE TABLE Club_Tenrac(
   idCT NUMBER(10),
   nom VARCHAR2(50),
   adresse VARCHAR2(50),
   type VARCHAR2(50),
   ville VARCHAR2(50),
   territoire VARCHAR2(50),
   CONSTRAINT pk_Club_Tenrac PRIMARY KEY(idCT)
);

CREATE TABLE Plat(
   idP NUMBER(10),
   nom VARCHAR2(50),
   type VARCHAR2(50),
   libelle VARCHAR2(50),
   CONSTRAINT pk_Plat PRIMARY KEY(idP)
);

CREATE TABLE Aliment(
   idAli NUMBER(10),
   type VARCHAR2(50),
   nom VARCHAR2(50),
   taille VARCHAR2(50),
   CONSTRAINT pk_Aliment PRIMARY KEY(idAli)
);

CREATE TABLE Allergie(
   idAll NUMBER(10),
   nom VARCHAR2(50),
   effet VARCHAR2(50),
   CONSTRAINT pk_Allergie PRIMARY KEY(idAll)
);

CREATE TABLE Sauce(
   idS NUMBER(10),
   type VARCHAR2(50),
   nom VARCHAR2(50),
   CONSTRAINT pk_Sauce PRIMARY KEY(idS)
);

CREATE TABLE Machine(
   idM NUMBER(10),
   nom VARCHAR2(50),
   modele VARCHAR2(50),
   prix VARCHAR2(50),
   CONSTRAINT pk_Machine PRIMARY KEY(idM)
);

CREATE TABLE Certificat(
   idM NUMBER(10),
   nom VARCHAR2(50),
   type VARCHAR2(50),
   dateDep DATE,
   dateFin VARCHAR2(50),
   CONSTRAINT pk_Certificat PRIMARY KEY(idM),
   CONSTRAINT fk_Certificat_Machine FOREIGN KEY(idM) REFERENCES Machine(idM)
);

CREATE TABLE Historique(
   idH NUMBER(10),
   dateEntretient DATE,
   nomClub VARCHAR2(50),
   CONSTRAINT pk_Historique PRIMARY KEY(idH)
);

CREATE TABLE Registre(
   idReg NUMBER(10),
   status VARCHAR2(50),
   periodicite TIMESTAMP WITH TIME ZONE,
   idH NUMBER(10) NOT NULL,
   CONSTRAINT pk_Registre PRIMARY KEY(idReg),
   CONSTRAINT fk_Registre_Historique FOREIGN KEY(idH) REFERENCES Historique(idH)
);

CREATE TABLE Cuisinier(
   idCu NUMBER(10),
   nom VARCHAR2(50),
   prenom VARCHAR2(50),
   age VARCHAR2(50),
   adresse VARCHAR2(50),
   CONSTRAINT pk_Cuisinier PRIMARY KEY(idCu)
);

CREATE TABLE Organisme(
   idOA NUMBER(10),
   nomEntreprise VARCHAR2(50),
   type VARCHAR2(50),
   adresse VARCHAR2(50),
   ville VARCHAR2(50),
   codePostale NUMBER(10),
   siret NUMBER(15,2),
   CONSTRAINT pk_Organisme PRIMARY KEY(idOA)
);

CREATE TABLE Ingredient(
   idAli NUMBER(10),
   type VARCHAR2(50),
   libelle VARCHAR2(50),
   nom VARCHAR2(50),
   CONSTRAINT pk_Ingredient PRIMARY KEY(idAli),
   CONSTRAINT fk_Ingredient_Aliment FOREIGN KEY(idAli) REFERENCES Aliment(idAli)
);

CREATE TABLE Fabriquant(
   idF NUMBER(10),
   nom VARCHAR2(50),
   prenom VARCHAR2(50),
   adresse VARCHAR2(50),
   codePostale NUMBER(10),
   ville VARCHAR2(50),
   CONSTRAINT pk_Fabriquant PRIMARY KEY(idF)
);

CREATE TABLE Raclette(
   idRa NUMBER(10),
   type VARCHAR2(50),
   libelle VARCHAR2(50),
   CONSTRAINT pk_Raclette PRIMARY KEY(idRa)
);

CREATE TABLE Legume(
   idAli NUMBER(10),
   type VARCHAR2(50),
   nom VARCHAR2(50),
   taille VARCHAR2(50),
   CONSTRAINT pk_Legume PRIMARY KEY(idAli),
   CONSTRAINT fk_Legume_Aliment FOREIGN KEY(idAli) REFERENCES Aliment(idAli)
);

CREATE TABLE Entretien(
   idEn NUMBER(10,2),
   dateEntretien DATE,
   CONSTRAINT pk_Entretien PRIMARY KEY(idEn)
);

CREATE TABLE Croyance(
   idCr NUMBER(10),
   dieuTenrac VARCHAR2(50),
   dieuDesTenders VARCHAR2(50),
   dieuDeLaRaclette VARCHAR2(50),
   dieuDesLegumes VARCHAR2(50),
   idAli NUMBER(10) NOT NULL,
   CONSTRAINT pk_Croyance PRIMARY KEY(idCr),
   CONSTRAINT fk_Croyance_Aliment FOREIGN KEY(idAli) REFERENCES Aliment(idAli)
);

CREATE TABLE Opposition_De_Conviction_Personnelle(
   idOCP NUMBER(10),
   politique VARCHAR2(50),
   ethnique VARCHAR2(50),
   chocDesCultures VARCHAR2(50),
   idAli NUMBER(10) NOT NULL,
   CONSTRAINT pk_Opposition PRIMARY KEY(idOCP),
   CONSTRAINT fk_Opposition_Aliment FOREIGN KEY(idAli) REFERENCES Aliment(idAli)
);

CREATE TABLE Croisade(
   idCro NUMBER(10),
   duree TIMESTAMP,
   dateDep DATE,
   nom VARCHAR2(50),
   dateFin DATE,
   type VARCHAR2(50),
   CONSTRAINT pk_Croisade PRIMARY KEY(idCro)
);

CREATE TABLE Tenrac(
   idT NUMBER(10),
   nom VARCHAR2(50),
   prenom VARCHAR2(50),
   age NUMBER(10),
   adresse VARCHAR2(50),
   courriel VARCHAR2(50),
   numTel NUMBER(10),
   adressePostale NUMBER(10),
   idCr NUMBER(10) NOT NULL,
   idOA NUMBER(10) NOT NULL,
   idOT NUMBER(10) NOT NULL,
   idCT NUMBER(10) NOT NULL,
   CONSTRAINT pk_Tenrac PRIMARY KEY(idT),
   CONSTRAINT fk_Tenrac_Croyance FOREIGN KEY(idCr) REFERENCES Croyance(idCr),
   CONSTRAINT fk_Tenrac_Organisme FOREIGN KEY(idOA) REFERENCES Organisme(idOA),
   CONSTRAINT fk_Tenrac_Ordre FOREIGN KEY(idOT) REFERENCES Ordre_Tenrac(idOT),
   CONSTRAINT fk_Tenrac_Club FOREIGN KEY(idCT) REFERENCES Club_Tenrac(idCT)
);

CREATE TABLE Grade(
   idG NUMBER(10),
   nom VARCHAR2(50),
   type VARCHAR2(50),
   libelle VARCHAR2(50),
   idT NUMBER(10),
   CONSTRAINT pk_Grade PRIMARY KEY(idG),
   CONSTRAINT fk_Grade_Tenrac FOREIGN KEY(idT) REFERENCES Tenrac(idT)
);

CREATE TABLE Rang(
   idR NUMBER(10),
   nom VARCHAR2(50),
   type VARCHAR2(50),
   libelle VARCHAR2(50),
   idT NUMBER(10),
   CONSTRAINT pk_Rang PRIMARY KEY(idR),
   CONSTRAINT fk_Rang_Tenrac FOREIGN KEY(idT) REFERENCES Tenrac(idT)
);

CREATE TABLE Titre(
   idTi NUMBER(10),
   nom VARCHAR2(50),
   type VARCHAR2(50),
   libelle VARCHAR2(50),
   idT NUMBER(10),
   CONSTRAINT pk_Titre PRIMARY KEY(idTi),
   CONSTRAINT fk_Titre_Tenrac FOREIGN KEY(idT) REFERENCES Tenrac(idT)
);

CREATE TABLE Dignite(
   idD NUMBER(10),
   nom VARCHAR2(50),
   type VARCHAR2(50),
   libelle VARCHAR2(50),
   idT NUMBER(10),
   CONSTRAINT pk_Dignite PRIMARY KEY(idD),
   CONSTRAINT fk_Dignite_Tenrac FOREIGN KEY(idT) REFERENCES Tenrac(idT)
);

CREATE TABLE Carte_Membre(
   idT NUMBER(10),
   RFID NUMBER(10) NOT NULL,
   numCode NUMBER(10) NOT NULL,
   numClub NUMBER(10) NOT NULL,
   numSIRET NUMBER(10) NOT NULL,
   raisonSociale VARCHAR2(50),
   CONSTRAINT pk_Carte_Membre PRIMARY KEY(idT),
   CONSTRAINT uq_Carte_RFID UNIQUE(RFID),
   CONSTRAINT uq_Carte_numCode UNIQUE(numCode),
   CONSTRAINT uq_Carte_numClub UNIQUE(numClub),
   CONSTRAINT uq_Carte_numSIRET UNIQUE(numSIRET),
   CONSTRAINT fk_Carte_Tenrac FOREIGN KEY(idT) REFERENCES Tenrac(idT)
);

CREATE TABLE Groupe_Tenrac(
   idT NUMBER(10),
   dateInscription DATE,
   adressePartenaire VARCHAR2(50),
   CONSTRAINT pk_Groupe_Tenrac PRIMARY KEY(idT),
   CONSTRAINT fk_Groupe_Tenrac FOREIGN KEY(idT) REFERENCES Tenrac(idT)
);

CREATE TABLE Repas(
   idR NUMBER(10),
   nomPlat VARCHAR2(50),
   idM NUMBER(10) NOT NULL,
   CONSTRAINT pk_Repas PRIMARY KEY(idR),
   CONSTRAINT fk_Repas_Machine FOREIGN KEY(idM) REFERENCES Machine(idM)
);

CREATE TABLE Restaurant(
   idRe NUMBER(10),
   nom VARCHAR2(50),
   ville VARCHAR2(50),
   adresse VARCHAR2(50),
   type VARCHAR2(50),
   lieu VARCHAR2(50),
   idCu NUMBER(10) NOT NULL,
   CONSTRAINT pk_Restaurant PRIMARY KEY(idRe),
   CONSTRAINT fk_Restaurant_Cuisinier FOREIGN KEY(idCu) REFERENCES Cuisinier(idCu)
);

CREATE TABLE Est_Compose_De(
   idR NUMBER(10),
   idP NUMBER(10),
   CONSTRAINT pk_Est_Compose_De PRIMARY KEY(idR, idP),
   CONSTRAINT fk_EstCompose_Repas FOREIGN KEY(idR) REFERENCES Repas(idR),
   CONSTRAINT fk_EstCompose_Plat FOREIGN KEY(idP) REFERENCES Plat(idP)
);

CREATE TABLE Est_Constitue(
   idR NUMBER(10),
   idRa NUMBER(10),
   CONSTRAINT pk_Est_Constitue PRIMARY KEY(idR, idRa),
   CONSTRAINT fk_EstConstitue_Repas FOREIGN KEY(idR) REFERENCES Repas(idR),
   CONSTRAINT fk_EstConstitue_Raclette FOREIGN KEY(idRa) REFERENCES Raclette(idRa)
);

CREATE TABLE Provoque(
   idAli NUMBER(10),
   idAll NUMBER(10),
   CONSTRAINT pk_Provoque PRIMARY KEY(idAli, idAll),
   CONSTRAINT fk_Provoque_Aliment FOREIGN KEY(idAli) REFERENCES Aliment(idAli),
   CONSTRAINT fk_Provoque_Allergie FOREIGN KEY(idAll) REFERENCES Allergie(idAll)
);

CREATE TABLE Est_Accompagne_De(
   idP NUMBER(10),
   idS NUMBER(10),
   CONSTRAINT pk_Est_Accompagne_De PRIMARY KEY(idP, idS),
   CONSTRAINT fk_Accompagne_Plat FOREIGN KEY(idP) REFERENCES Plat(idP),
   CONSTRAINT fk_Accompagne_Sauce FOREIGN KEY(idS) REFERENCES Sauce(idS)
);

CREATE TABLE Commande(
   idT NUMBER(10),
   idR NUMBER(10),
   CONSTRAINT pk_Commande PRIMARY KEY(idT, idR),
   CONSTRAINT fk_Commande_Groupe FOREIGN KEY(idT) REFERENCES Groupe_Tenrac(idT),
   CONSTRAINT fk_Commande_Repas FOREIGN KEY(idR) REFERENCES Repas(idR)
);

CREATE TABLE Federe(
   idOT NUMBER(10),
   idCT NUMBER(10),
   CONSTRAINT pk_Federe PRIMARY KEY(idOT, idCT),
   CONSTRAINT fk_Federe_Ordre FOREIGN KEY(idOT) REFERENCES Ordre_Tenrac(idOT),
   CONSTRAINT fk_Federe_Club FOREIGN KEY(idCT) REFERENCES Club_Tenrac(idCT)
);

CREATE TABLE Valide(
   idT NUMBER(10),
   idM NUMBER(10),
   CONSTRAINT pk_Valide PRIMARY KEY(idT, idM),
   CONSTRAINT fk_Valide_Tenrac FOREIGN KEY(idT) REFERENCES Tenrac(idT),
   CONSTRAINT fk_Valide_Machine FOREIGN KEY(idM) REFERENCES Machine(idM)
);

CREATE TABLE A(
   idM NUMBER(10),
   idH NUMBER(10),
   CONSTRAINT pk_A PRIMARY KEY(idM, idH),
   CONSTRAINT fk_A_Certificat FOREIGN KEY(idM) REFERENCES Certificat(idM),
   CONSTRAINT fk_A_Historique FOREIGN KEY(idH) REFERENCES Historique(idH)
);

CREATE TABLE Est_Consigne_Dans(
   idM NUMBER(10),
   idReg NUMBER(10),
   CONSTRAINT pk_Est_Consigne_Dans PRIMARY KEY(idM, idReg),
   CONSTRAINT fk_Consigne_Machine FOREIGN KEY(idM) REFERENCES Machine(idM),
   CONSTRAINT fk_Consigne_Registre FOREIGN KEY(idReg) REFERENCES Registre(idReg)
);

CREATE TABLE Sert(
   idR NUMBER(10),
   idCu NUMBER(10),
   CONSTRAINT pk_Sert PRIMARY KEY(idR, idCu),
   CONSTRAINT fk_Sert_Repas FOREIGN KEY(idR) REFERENCES Repas(idR),
   CONSTRAINT fk_Sert_Cuisinier FOREIGN KEY(idCu) REFERENCES Cuisinier(idCu)
);

CREATE TABLE Fait(
   idM NUMBER(10),
   idEn NUMBER(10,2),
   CONSTRAINT pk_Fait PRIMARY KEY(idM, idEn),
   CONSTRAINT fk_Fait_Machine FOREIGN KEY(idM) REFERENCES Machine(idM),
   CONSTRAINT fk_Fait_Entretien FOREIGN KEY(idEn) REFERENCES Entretien(idEn)
);

CREATE TABLE Est_Fabrique_Sauce(
   idS NUMBER(10),
   idAli NUMBER(10),
   CONSTRAINT pk_Est_Fabrique_Sauce PRIMARY KEY(idS, idAli),
   CONSTRAINT fk_FabriqueSauce_Sauce FOREIGN KEY(idS) REFERENCES Sauce(idS),
   CONSTRAINT fk_FabriqueSauce_Ingredient FOREIGN KEY(idAli) REFERENCES Ingredient(idAli)
);

CREATE TABLE Est_Fabrique_Machine(
   idM NUMBER(10),
   idF NUMBER(10),
   CONSTRAINT pk_Est_Fabrique_Machine PRIMARY KEY(idM, idF),
   CONSTRAINT fk_FabriqueMachine_Machine FOREIGN KEY(idM) REFERENCES Machine(idM),
   CONSTRAINT fk_FabriqueMachine_Fabriquant FOREIGN KEY(idF) REFERENCES Fabriquant(idF)
);

CREATE TABLE Amene_A(
   idCr NUMBER(10),
   idOCP NUMBER(10),
   CONSTRAINT pk_Amene_A PRIMARY KEY(idCr, idOCP),
   CONSTRAINT fk_AmeneA_Croyance FOREIGN KEY(idCr) REFERENCES Croyance(idCr),
   CONSTRAINT fk_AmeneA_Opposition FOREIGN KEY(idOCP) REFERENCES Opposition_De_Conviction_Personnelle(idOCP)
);

CREATE TABLE Engendre(
   idOCP NUMBER(10),
   idCro NUMBER(10),
   CONSTRAINT pk_Engendre PRIMARY KEY(idOCP, idCro),
   CONSTRAINT fk_Engendre_Opposition FOREIGN KEY(idOCP) REFERENCES Opposition_De_Conviction_Personnelle(idOCP),
   CONSTRAINT fk_Engendre_Croisade FOREIGN KEY(idCro) REFERENCES Croisade(idCro)
);

CREATE TABLE Possede(
   idOT NUMBER(10),
   idCT NUMBER(10),
   idM NUMBER(10),
   CONSTRAINT pk_Possede PRIMARY KEY(idOT, idCT, idM),
   CONSTRAINT fk_Possede_Ordre FOREIGN KEY(idOT) REFERENCES Ordre_Tenrac(idOT),
   CONSTRAINT fk_Possede_Club FOREIGN KEY(idCT) REFERENCES Club_Tenrac(idCT),
   CONSTRAINT fk_Possede_Machine FOREIGN KEY(idM) REFERENCES Machine(idM)
);

-- **************************************************************************** Insertions des données

PROMPT "Insertions des données"; 

INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (5, 'Cercle de la Pomme de Terre', '22 Rue de la République', 'Local', 'Marseille', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (6, 'Bastion du Tender Épicé', '45 Cours Mirabeau', 'Régional', 'Aix-en-Provence', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (7, 'Amicale du Reblochon Coulant', '12 Route des Calanques', 'Départemental', 'Cassis', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (8, 'Ligue des Gratinés du Littoral', '8 Quai de la Marine', 'Local', 'La Ciotat', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (9, 'Club des Tenders de l''Étang', '30 Rue des Vosges', 'Régional', 'Martigues', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (10, 'Le Poêlon Provençal', '5 Rue du Mistral', 'Local', 'Arles', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (11, 'Escadron de la Panure Dorée', '19 Avenue de l''Europe', 'National', 'Vitrolles', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (12, 'Alliance Raclette d''Aubagne', '3 Place du Marché', 'Régional', 'Aubagne', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (13, 'Confrérie du Seau d''Istres', '7 Boulevard Maritime', 'Local', 'Istres', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (14, 'Sanctuaire de la Tomme Bleue', '2 Chemin de la Montagne', 'Local', 'Salon-de-Provence', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (15, 'Club Tenrac de la Côte', '10 Rue des Cocotiers', 'International', 'Marignane', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (16, 'L''Avant-Garde du Fromage', '55 Rue de la Liberté', 'Régional', 'Gardanne', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (17, 'Cénacle du Poulet des Alpilles', '14 Rue de l''Université', 'Local', 'Saint-Rémy-de-Provence', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (18, 'La Guilde des Poêlons du Delta', 'Chemin du Vaccarès', 'Itinérant', 'Saintes-Maries-de-la-Mer', 'Bouches-du-Rhône');
INSERT INTO Club_Tenrac (idCT, nom, adresse, type, ville, territoire) VALUES (19, 'Club Tenrac Miramas', '22 Cours Napoléon', 'Départemental', 'Miramas', 'Bouches-du-Rhône');

COMMIT;

COMMIT;

--PLAT 

INSERT INTO Plat (idP, nom, type, libelle) VALUES (11, 'Plat Cérémonial #11', 'Principal', 'Pousser science en demande emporter parler.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (12, 'Plat Fromage Fondu #12', 'Cérémonial', 'Classe beau caresser rompre mais serrer.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (13, 'Plat du Chevalier #13', 'Entrée', 'Ça étendue faute inviter.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (14, 'Plat Légume Secret #14', 'Entrée', 'Secret presser déchirer trouver pointe.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (15, 'Plat Saumon Gratiné #15', 'Cérémonial', 'Rouler espérer sueur.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (16, 'Plat Légume Secret #16', 'Prestige', 'Circonstance roche signer soirée.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (17, 'Plat du Chevalier #17', 'Entrée', 'Souvenir divers extraordinaire.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (18, 'Plat du Chevalier #18', 'Cérémonial', 'Centre relation vouloir réduire rouler certes.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (19, 'Plat Fromage Fondu #19', 'Principal', 'Monter voie politique.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (20, 'Plat Tenders Spécial #20', 'Principal', 'Part appartenir intérieur poids.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (21, 'Plat Tenders Spécial #21', 'Principal', 'Pouvoir autour auteur rire.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (22, 'Plat du Chevalier #22', 'Principal', 'Moins bien fer.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (23, 'Plat Cérémonial #23', 'Entrée', 'Naturellement séparer souvenir chaleur appartement');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (24, 'Plat du Chevalier #24', 'Principal', 'Beau monter juger repas lutte autant.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (25, 'Plat Saumon Gratiné #25', 'Entrée', 'Revenir facile pénétrer matin noire annoncer.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (26, 'Plat Poulet Croustillant #26', 'Spécial', 'Malheur digne puissance ton.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (27, 'Plat Saumon Gratiné #27', 'Principal', 'Remonter tout sûr.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (28, 'Plat Saumon Gratiné #28', 'Spécial', 'Poète point dégager écouter.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (29, 'Plat Cérémonial #29', 'Cérémonial', 'Écrire respect remplacer.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (30, 'Plat Tenders Spécial #30', 'Entrée', 'Enfant connaître passion perte oeuvre paysan.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (31, 'Plat Raclette Fusion #31', 'Cérémonial', 'Ramener place dormir anglais large.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (32, 'Plat Fromage Fondu #32', 'Cérémonial', 'Passage exiger remplacer bataille coin.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (33, 'Plat Légume Secret #33', 'Prestige', 'Fait cours vingt ici reprendre douceur endormir.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (34, 'Plat Poulet Croustillant #34', 'Principal', 'Tant goût victime.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (35, 'Plat Légume Secret #35', 'Entrée', 'Mériter accrocher cheval soir brûler lourd.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (36, 'Plat Tenders Spécial #36', 'Entrée', 'Grâce étage dans mien journée.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (37, 'Plat Cérémonial #37', 'Cérémonial', 'Anglais quelque imaginer doigt.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (38, 'Plat Fromage Fondu #38', 'Prestige', 'Conversation saint saison haut.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (39, 'Plat Saumon Gratiné #39', 'Spécial', 'Village preuve demande attaquer froid.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (40, 'Plat Raclette Fusion #40', 'Spécial', 'Sec voisin métier remonter accent.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (41, 'Plat Légume Secret #41', 'Entrée', 'Douze attirer ça sauvage.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (42, 'Plat du Chevalier #42', 'Principal', 'Immobile recommencer mode arbre.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (43, 'Plat du Chevalier #43', 'Cérémonial', 'Gauche forêt espèce quinze vague revenir.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (44, 'Plat du Chevalier #44', 'Prestige', 'Jour conversation revenir signifier.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (45, 'Plat Poulet Croustillant #45', 'Principal', 'Condition violent charge.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (46, 'Plat Cérémonial #46', 'Principal', 'Discussion fleur conversation.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (47, 'Plat Raclette Fusion #47', 'Prestige', 'Perte occuper coûter personne peser été.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (48, 'Plat Tenders Spécial #48', 'Cérémonial', 'Professeur entretenir lien.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (49, 'Plat du Chevalier #49', 'Cérémonial', 'Nuit consentir plein toute sur.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (50, 'Plat du Chevalier #50', 'Cérémonial', 'Année étendue bleu paix.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (51, 'Plat Poulet Croustillant #51', 'Principal', 'Perte idée renoncer existence anglais tourner.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (52, 'Plat Cérémonial #52', 'Cérémonial', 'Rang humain haut.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (53, 'Plat du Chevalier #53', 'Spécial', 'Lequel chercher vide plutôt.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (54, 'Plat Poulet Croustillant #54', 'Entrée', 'Pas paquet demi.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (55, 'Plat Tenders Spécial #55', 'Cérémonial', 'Grandir retour placer causer depuis.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (56, 'Plat Fromage Fondu #56', 'Entrée', 'Soi environ armer exiger votre tourner.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (57, 'Plat Fromage Fondu #57', 'Principal', 'Coûter champ composer fin.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (58, 'Plat Saumon Gratiné #58', 'Entrée', 'Posséder bureau devoir après.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (59, 'Plat du Chevalier #59', 'Prestige', 'Chambre apparaître maison cinq vingt.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (60, 'Plat Raclette Fusion #60', 'Entrée', 'Théâtre frais pourquoi rapporter résistance.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (61, 'Plat Poulet Croustillant #61', 'Entrée', 'Pourquoi voiture chiffre place.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (62, 'Plat Saumon Gratiné #62', 'Spécial', 'Siège sable discussion lieu acheter.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (63, 'Plat Raclette Fusion #63', 'Entrée', 'Promettre passage vers.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (64, 'Plat Fromage Fondu #64', 'Entrée', 'Nouveau spectacle droit naître espèce pénétrer jau');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (65, 'Plat Fromage Fondu #65', 'Principal', 'Marcher mesure part gens précipiter.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (66, 'Plat Raclette Fusion #66', 'Entrée', 'Fumée droit habitude ton.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (67, 'Plat Tenders Spécial #67', 'Prestige', 'Lueur faire suffire écarter ami.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (68, 'Plat Grand Maître #68', 'Entrée', 'Relever sorte traverser nuit parent.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (69, 'Plat Tenders Spécial #69', 'Prestige', 'Prêter toit représenter.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (70, 'Plat Cérémonial #70', 'Principal', 'Seigneur beaux prix paysage tromper groupe.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (71, 'Plat Poulet Croustillant #71', 'Spécial', 'Réussir pauvre trou.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (72, 'Plat Poulet Croustillant #72', 'Principal', 'Élément doigt pont fatigue oh visage.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (73, 'Plat du Chevalier #73', 'Cérémonial', 'Intéresser tracer songer tu frapper approcher.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (74, 'Plat Tenders Spécial #74', 'Cérémonial', 'Découvrir trois promener ramasser trouver.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (75, 'Plat du Chevalier #75', 'Entrée', 'Lèvre petit odeur là passé.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (76, 'Plat Légume Secret #76', 'Prestige', 'Descendre seigneur respecter aimer gouvernement di');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (77, 'Plat Saumon Gratiné #77', 'Entrée', 'Main joie attirer intelligence relation.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (78, 'Plat Légume Secret #78', 'Entrée', 'Peuple eau pousser.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (79, 'Plat Poulet Croustillant #79', 'Principal', 'Entier franchir complet étonner près ajouter.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (80, 'Plat Légume Secret #80', 'Spécial', 'Remercier là main image changer sauver.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (81, 'Plat Fromage Fondu #81', 'Principal', 'Jardin courant reconnaître.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (82, 'Plat Cérémonial #82', 'Prestige', 'Plusieurs étaler autre divers alors front.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (83, 'Plat Légume Secret #83', 'Entrée', 'Égal loi complètement.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (84, 'Plat Raclette Fusion #84', 'Prestige', 'Par si notre curieux ordre.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (85, 'Plat Légume Secret #85', 'Spécial', 'Rejoindre lit entretenir.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (86, 'Plat Cérémonial #86', 'Cérémonial', 'Chez quelqu''un très.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (87, 'Plat Grand Maître #87', 'Prestige', 'Avis delà horizon oeil vision.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (88, 'Plat Saumon Gratiné #88', 'Principal', 'Soumettre lèvre idée dessus.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (89, 'Plat Tenders Spécial #89', 'Prestige', 'Vérité facile relever propos.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (90, 'Plat Fromage Fondu #90', 'Entrée', 'Caresser bras bien action travailler.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (91, 'Plat Tenders Spécial #91', 'Principal', 'Souvent goutte cela poser anglais.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (92, 'Plat Raclette Fusion #92', 'Cérémonial', 'Haut forêt aucun.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (93, 'Plat Légume Secret #93', 'Principal', 'Sûr vide déjà prêter maison million.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (94, 'Plat Tenders Spécial #94', 'Entrée', 'Cinq soldat réalité doucement repousser.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (95, 'Plat Poulet Croustillant #95', 'Spécial', 'Pur autre après lors.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (96, 'Plat Poulet Croustillant #96', 'Principal', 'Quarante étoile aimer.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (97, 'Plat Cérémonial #97', 'Principal', 'Diriger doute céder montrer.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (98, 'Plat Grand Maître #98', 'Entrée', 'Question geste absolument.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (99, 'Plat Grand Maître #99', 'Prestige', 'Étaler hôtel doute armée hors auprès.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (100, 'Plat du Chevalier #100', 'Entrée', 'Lendemain continuer lune d''autres.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (101, 'Plat Poulet Croustillant #101', 'Spécial', 'Sol caresser malgré.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (102, 'Plat Saumon Gratiné #102', 'Spécial', 'Roi lentement appartenir.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (103, 'Plat du Chevalier #103', 'Entrée', 'Leur tour immense empire tenter fin.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (104, 'Plat Fromage Fondu #104', 'Principal', 'Réserver oeil détruire promener.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (105, 'Plat Tenders Spécial #105', 'Entrée', 'Morceau même chef branche est.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (106, 'Plat Fromage Fondu #106', 'Entrée', 'Chaud engager cesse ajouter.');
INSERT INTO Plat (idP, nom, type, libelle) VALUES (107, 'Plat Tenders Spécial #107', 'Cérémonial', 'Sac enlever classe.');


-- **************************************************************************** Insertions supplémentaires table TENRAC

-- On vide la table pour éviter les erreurs de clés primaires si tu relances le script
DELETE FROM Tenrac;

-- Insertion des 42 membres (> 53 ans) répartis dans les clubs du 13
INSERT INTO Tenrac VALUES (1, 'Lefebvre', 'Marc', 55, '2 Rue du Tender', 'marc@tenrac.fr', 0612345678, 75001, 1, 1, 5, 5);
INSERT INTO Tenrac VALUES (2, 'Renard', 'Clara', 58, '14 Impasse Fondue', 'clara@tenrac.fr', 0698765432, 69002, 2, 2, 6, 6);
INSERT INTO Tenrac VALUES (3, 'Dubois', 'Quentin', 56, '12 Rue de la Panure', 'quentin.d@tenrac.fr', 0622334455, 67000, 1, 1, 5, 5);
INSERT INTO Tenrac VALUES (4, 'Morel', 'Amandine', 60, '5 Avenue du Fromage', 'amandine.m@tenrac.fr', 0611889900, 73000, 2, 2, 6, 7);
INSERT INTO Tenrac VALUES (5, 'Petit', 'Lucas', 54, '8 Chemin du Poulet', 'lucas.p@tenrac.fr', 0755443322, 59000, 1, 1, 8, 8);
INSERT INTO Tenrac VALUES (6, 'Bertrand', 'Julie', 76, '22 Impasse de la Meule', 'j.bertrand@tenrac.fr', 0644332211, 74200, 2, 2, 19, 14);
INSERT INTO Tenrac VALUES (7, 'Garnier', 'Hugo', 66, '10 bis Rue du Seau', 'hugo.g@tenrac.fr', 0601020304, 30000, 1, 1, 9, 9);
INSERT INTO Tenrac VALUES (8, 'Faure', 'Camille', 56, '1 Place de la Croûte', 'c.faure@tenrac.fr', 0699887766, 21000, 2, 2, 15, 16);
INSERT INTO Tenrac VALUES (9, 'Rousseau', 'Thomas', 59, '4 Allée du Piment', 'thomas.r@tenrac.fr', 0710203040, 33000, 1, 1, 17, 6);
INSERT INTO Tenrac VALUES (10, 'Blanc', 'Manon', 61, '17 Rue de l''Alpage', 'manon.b@tenrac.fr', 0677889911, 15000, 2, 2, 13, 14);
INSERT INTO Tenrac VALUES (11, 'Vincent', 'Enzo', 57, '9 Boulevard du Tender', 'enzo.v@tenrac.fr', 0655667788, 42000, 1, 1, 21, 11);
INSERT INTO Tenrac VALUES (12, 'Lambert', 'Chloé', 56, '3 Square de la Raclette', 'chloe.l@tenrac.fr', 0633221144, 25000, 2, 2, 13, 13);
INSERT INTO Tenrac VALUES (13, 'Martin', 'Bernard', 58, 'Rue 13', 'b.martin@tenrac.fr', 0600000013, 13001, 1, 1, 5, 5);
INSERT INTO Tenrac VALUES (14, 'Bernard', 'Thomas', 62, 'Rue 14', 't.bernard@tenrac.fr', 0600000014, 13100, 2, 2, 6, 6);
INSERT INTO Tenrac VALUES (15, 'Thomas', 'Robert', 55, 'Rue 15', 'r.thomas@tenrac.fr', 0600000015, 13260, 1, 1, 7, 7);
INSERT INTO Tenrac VALUES (16, 'Petit', 'Richard', 64, 'Rue 16', 'r.petit@tenrac.fr', 0600000016, 13600, 2, 2, 8, 8);
INSERT INTO Tenrac VALUES (17, 'Durand', 'Eric', 67, 'Rue 17', 'e.durand@tenrac.fr', 0600000017, 13500, 1, 1, 9, 9);
INSERT INTO Tenrac VALUES (18, 'Leroy', 'Gerard', 59, 'Rue 18', 'g.leroy@tenrac.fr', 0600000018, 13200, 2, 2, 10, 10);
INSERT INTO Tenrac VALUES (19, 'Moreau', 'Alain', 70, 'Rue 19', 'a.moreau@tenrac.fr', 0600000019, 13127, 1, 1, 11, 11);
INSERT INTO Tenrac VALUES (20, 'Simon', 'Patrick', 54, 'Rue 20', 'p.simon@tenrac.fr', 0600000020, 13400, 2, 2, 12, 12);
INSERT INTO Tenrac VALUES (21, 'Laurent', 'Jacky', 63, 'Rue 21', 'j.laurent@tenrac.fr', 0600000021, 13800, 1, 1, 13, 13);
INSERT INTO Tenrac VALUES (22, 'Lefebvre', 'Denis', 66, 'Rue 22', 'd.lefebvre@tenrac.fr', 0600000022, 13300, 2, 2, 14, 14);
INSERT INTO Tenrac VALUES (23, 'Michel', 'Pascal', 57, 'Rue 23', 'p.michel@tenrac.fr', 0600000023, 13700, 1, 1, 15, 15);
INSERT INTO Tenrac VALUES (24, 'Garcia', 'Didier', 61, 'Rue 24', 'd.garcia@tenrac.fr', 0600000024, 13120, 2, 2, 16, 16);
INSERT INTO Tenrac VALUES (25, 'David', 'Bruno', 68, 'Rue 25', 'b.david@tenrac.fr', 0600000025, 13210, 1, 1, 17, 17);
INSERT INTO Tenrac VALUES (26, 'Bertrand', 'Guy', 72, 'Rue 26', 'g.bertrand@tenrac.fr', 0600000026, 13460, 2, 2, 18, 18);
INSERT INTO Tenrac VALUES (27, 'Roux', 'Serge', 55, 'Rue 27', 's.roux@tenrac.fr', 0600000027, 13140, 1, 1, 19, 19);
INSERT INTO Tenrac VALUES (28, 'Vincent', 'Yvon', 59, 'Rue 28', 'y.vincent@tenrac.fr', 0600000028, 13001, 2, 2, 5, 5);
INSERT INTO Tenrac VALUES (29, 'Fournier', 'Jean', 64, 'Rue 29', 'j.fournier@tenrac.fr', 0600000029, 13100, 1, 1, 6, 6);
INSERT INTO Tenrac VALUES (30, 'Morel', 'Marc', 60, 'Rue 30', 'm.morel@tenrac.fr', 0600000030, 13260, 2, 2, 7, 7);
INSERT INTO Tenrac VALUES (31, 'Girard', 'Rene', 75, 'Rue 31', 'r.girard@tenrac.fr', 0600000031, 13600, 1, 1, 8, 8);
INSERT INTO Tenrac VALUES (32, 'Andre', 'Paul', 54, 'Rue 32', 'p.andre@tenrac.fr', 0600000032, 13500, 2, 2, 9, 9);
INSERT INTO Tenrac VALUES (33, 'Lefevre', 'Pierre', 58, 'Rue 33', 'p.lefevre@tenrac.fr', 0600000033, 13200, 1, 1, 10, 10);
INSERT INTO Tenrac VALUES (34, 'Mercier', 'Louis', 62, 'Rue 34', 'l.mercier@tenrac.fr', 0600000034, 13127, 2, 2, 11, 11);
INSERT INTO Tenrac VALUES (35, 'Dupont', 'Jacques', 55, 'Rue 35', 'j.dupont@tenrac.fr', 0600000035, 13400, 1, 1, 12, 12);
INSERT INTO Tenrac VALUES (36, 'Lambert', 'Henri', 64, 'Rue 36', 'h.lambert@tenrac.fr', 0600000036, 13800, 2, 2, 13, 13);
INSERT INTO Tenrac VALUES (37, 'Bonnet', 'Georges', 67, 'Rue 37', 'g.bonnet@tenrac.fr', 0600000037, 13300, 1, 1, 14, 14);
INSERT INTO Tenrac VALUES (38, 'Francois', 'Marcel', 59, 'Rue 38', 'm.francois@tenrac.fr', 0600000038, 13700, 2, 2, 15, 15);
INSERT INTO Tenrac VALUES (39, 'Martinez', 'Noel', 70, 'Rue 39', 'n.martinez@tenrac.fr', 0600000039, 13120, 1, 1, 16, 16);
INSERT INTO Tenrac VALUES (40, 'Legrand', 'Yves', 54, 'Rue 40', 'y.legrand@tenrac.fr', 0600000040, 13210, 2, 2, 17, 17);
INSERT INTO Tenrac VALUES (41, 'Garnier', 'Christian', 63, 'Rue 41', 'c.garnier@tenrac.fr', 0600000041, 13460, 1, 1, 18, 18);
INSERT INTO Tenrac VALUES (42, 'Faure', 'Gilbert', 66, 'Rue 42', 'g.faure@tenrac.fr', 0600000042, 13140, 2, 2, 19, 19);

COMMIT;

--Historique 


INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (21, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (22, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (23, TO_DATE('2024-11-24', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (24, TO_DATE('2024-09-03', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (25, TO_DATE('2025-04-05', 'YYYY-MM-DD'), 'Les Fondue Masters');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (26, TO_DATE('2023-07-16', 'YYYY-MM-DD'), 'Croquants Fondus');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (27, TO_DATE('2025-07-02', 'YYYY-MM-DD'), 'Croquants Fondus');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (28, TO_DATE('2023-04-30', 'YYYY-MM-DD'), 'Les Fondue Masters');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (29, TO_DATE('2023-08-14', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (30, TO_DATE('2023-03-07', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (31, TO_DATE('2021-01-10', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (32, TO_DATE('2024-12-26', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (33, TO_DATE('2025-10-08', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (34, TO_DATE('2024-08-19', 'YYYY-MM-DD'), 'Les Fondue Masters');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (35, TO_DATE('2022-09-19', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (36, TO_DATE('2023-07-08', 'YYYY-MM-DD'), 'Croquants Fondus');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (37, TO_DATE('2022-02-05', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (38, TO_DATE('2024-05-03', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (39, TO_DATE('2021-04-27', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (40, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (41, TO_DATE('2024-12-10', 'YYYY-MM-DD'), 'Poulet Raclé');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (42, TO_DATE('2021-06-01', 'YYYY-MM-DD'), 'Les Fondue Masters');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (43, TO_DATE('2023-02-06', 'YYYY-MM-DD'), 'Croquants Fondus');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (44, TO_DATE('2021-08-13', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (45, TO_DATE('2021-06-12', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (46, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 'Raclette Éternelle');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (47, TO_DATE('2025-08-26', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (48, TO_DATE('2022-01-18', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (49, TO_DATE('2022-10-06', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (50, TO_DATE('2025-09-15', 'YYYY-MM-DD'), 'Raclette Éternelle');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (51, TO_DATE('2023-03-17', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (52, TO_DATE('2025-11-30', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (53, TO_DATE('2021-07-15', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (54, TO_DATE('2025-02-13', 'YYYY-MM-DD'), 'Raclette Éternelle');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (55, TO_DATE('2023-04-05', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (56, TO_DATE('2022-07-01', 'YYYY-MM-DD'), 'Poulet Raclé');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (57, TO_DATE('2021-11-13', 'YYYY-MM-DD'), 'Poulet Raclé');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (58, TO_DATE('2021-09-13', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (59, TO_DATE('2024-06-26', 'YYYY-MM-DD'), 'Croquants Fondus');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (60, TO_DATE('2022-02-04', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (61, TO_DATE('2024-07-29', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (62, TO_DATE('2021-10-25', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (63, TO_DATE('2021-01-11', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (64, TO_DATE('2021-05-24', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (65, TO_DATE('2021-10-12', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (66, TO_DATE('2022-02-26', 'YYYY-MM-DD'), 'Les Fondue Masters');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (67, TO_DATE('2024-08-19', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (68, TO_DATE('2022-03-27', 'YYYY-MM-DD'), 'Raclette Éternelle');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (69, TO_DATE('2022-09-22', 'YYYY-MM-DD'), 'Les Fondue Masters');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (70, TO_DATE('2021-12-22', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (71, TO_DATE('2024-07-22', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (72, TO_DATE('2023-04-10', 'YYYY-MM-DD'), 'Les Fondue Masters');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (73, TO_DATE('2020-05-15', 'YYYY-MM-DD'), 'Poulet Raclé');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (74, TO_DATE('2020-08-19', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (75, TO_DATE('2025-05-17', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (76, TO_DATE('2025-07-22', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (77, TO_DATE('2020-11-16', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (78, TO_DATE('2021-01-12', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (79, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (80, TO_DATE('2021-11-09', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (81, TO_DATE('2020-06-01', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (82, TO_DATE('2021-06-18', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (83, TO_DATE('2020-03-27', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (84, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (85, TO_DATE('2023-03-26', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (86, TO_DATE('2021-08-13', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (87, TO_DATE('2025-08-05', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (88, TO_DATE('2024-05-22', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (89, TO_DATE('2024-05-17', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (90, TO_DATE('2023-01-24', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (91, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (92, TO_DATE('2021-12-04', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (93, TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'Raclette Éternelle');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (94, TO_DATE('2025-03-07', 'YYYY-MM-DD'), 'Poulet Raclé');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (95, TO_DATE('2022-04-09', 'YYYY-MM-DD'), 'Croquants Fondus');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (96, TO_DATE('2022-11-04', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (97, TO_DATE('2022-07-20', 'YYYY-MM-DD'), 'Poulet Crousti');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (98, TO_DATE('2021-02-20', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (99, TO_DATE('2020-01-26', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (100, TO_DATE('2023-07-26', 'YYYY-MM-DD'), 'Raclette Éternelle');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (101, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 'Raclette Éternelle');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (102, TO_DATE('2023-10-23', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (103, TO_DATE('2024-05-06', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (104, TO_DATE('2021-01-27', 'YYYY-MM-DD'), 'Poulet Raclé');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (105, TO_DATE('2024-12-13', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (106, TO_DATE('2020-03-23', 'YYYY-MM-DD'), 'Tenders Doré');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (107, TO_DATE('2020-06-01', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (108, TO_DATE('2021-04-12', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (109, TO_DATE('2023-08-14', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (110, TO_DATE('2025-01-19', 'YYYY-MM-DD'), 'Poulet Fondant');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (111, TO_DATE('2021-07-27', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (112, TO_DATE('2020-10-05', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (113, TO_DATE('2020-04-08', 'YYYY-MM-DD'), 'Les Fondue Masters');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (114, TO_DATE('2023-12-19', 'YYYY-MM-DD'), 'Saint-Tenders');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (115, TO_DATE('2025-08-27', 'YYYY-MM-DD'), 'Raclette Sacrée');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (116, TO_DATE('2023-10-07', 'YYYY-MM-DD'), 'Fromager Suprême');
INSERT INTO Historique (idH, dateEntretient, nomClub) VALUES (117, TO_DATE('2022-06-06', 'YYYY-MM-DD'), 'Raclette Éternelle');


--Registre 

INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (21, 'Actif', '1/semaine', 57904);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (22, 'Actif', '3/semaine', 65217);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (23, 'Actif', '2/an', 67918);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (24, 'Inactif', '2/an', 86980);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (25, 'Inactif', '3/an', 59033);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (26, 'Actif', '2/an', 8530);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (27, 'Inactif', '2/semaine', 77167);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (28, 'Actif', '2/an', 69855);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (29, 'Actif', '1/mois', 75106);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (30, 'Actif', '3/semaine', 24992);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (31, 'Inactif', '3/an', 67945);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (32, 'Actif', '3/semaine', 53491);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (33, 'Actif', '2/semaine', 25282);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (34, 'Actif', '1/semaine', 3780);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (35, 'Actif', '2/an', 71737);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (36, 'Actif', '1/mois', 40416);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (37, 'Actif', '6/mois', 87938);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (38, 'Actif', '6/mois', 96421);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (39, 'Inactif', '1/an', 9938);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (40, 'Inactif', '3/an', 12578);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (41, 'Inactif', '6/mois', 84574);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (42, 'Actif', '3/an', 48904);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (43, 'Actif', '3/semaine', 49388);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (44, 'Actif', '2/an', 32138);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (45, 'Actif', '1/an', 95588);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (46, 'Inactif', '3/semaine', 15393);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (47, 'Actif', '2/semaine', 32519);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (48, 'Actif', '2/an', 70513);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (49, 'Actif', '6/mois', 33122);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (50, 'Actif', '3/semaine', 27951);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (51, 'Inactif', '1/an', 81575);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (52, 'Inactif', '1/mois', 2493);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (53, 'Actif', '1/an', 41669);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (54, 'Actif', '1/mois', 76395);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (55, 'Actif', '2/an', 43547);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (56, 'Actif', '1/an', 53484);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (57, 'Actif', '1/semaine', 18193);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (58, 'Actif', '1/mois', 83927);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (59, 'Actif', '2/semaine', 22830);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (60, 'Actif', '1/an', 11946);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (61, 'Actif', '3/mois', 34762);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (62, 'Actif', '6/mois', 30836);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (63, 'Actif', '2/an', 62279);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (64, 'Actif', '1/mois', 3725);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (65, 'Actif', '3/mois', 31796);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (66, 'Actif', '2/semaine', 73696);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (67, 'Inactif', '6/mois', 57464);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (68, 'Actif', '2/semaine', 90437);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (69, 'Actif', '3/an', 64738);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (70, 'Actif', '3/an', 78404);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (71, 'Actif', '3/mois', 37354);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (72, 'Inactif', '2/an', 36811);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (73, 'Inactif', '3/semaine', 80327);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (74, 'Actif', '1/mois', 54803);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (75, 'Actif', '1/mois', 19717);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (76, 'Actif', '6/mois', 95256);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (77, 'Actif', '2/an', 39737);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (78, 'Actif', '3/mois', 81868);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (79, 'Inactif', '3/an', 48482);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (80, 'Inactif', '1/semaine', 95424);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (81, 'Actif', '1/an', 26000);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (82, 'Actif', '6/mois', 22132);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (83, 'Inactif', '2/an', 54115);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (84, 'Actif', '3/an', 95099);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (85, 'Actif', '3/semaine', 41493);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (86, 'Actif', '1/an', 92284);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (87, 'Inactif', '1/an', 22465);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (88, 'Actif', '3/semaine', 95546);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (89, 'Actif', '1/mois', 85489);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (90, 'Actif', '6/mois', 13913);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (91, 'Actif', '3/an', 53192);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (92, 'Actif', '3/semaine', 97751);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (93, 'Actif', '1/mois', 24827);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (94, 'Actif', '1/an', 39527);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (95, 'Actif', '2/semaine', 57962);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (96, 'Inactif', '2/semaine', 46478);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (97, 'Actif', '2/an', 22141);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (98, 'Actif', '1/semaine', 29644);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (99, 'Actif', '1/an', 15805);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (100, 'Actif', '1/an', 53887);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (101, 'Actif', '1/mois', 27905);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (102, 'Actif', '3/an', 83454);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (103, 'Inactif', '3/an', 3533);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (104, 'Actif', '3/semaine', 85191);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (105, 'Actif', '3/mois', 32965);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (106, 'Inactif', '2/semaine', 14435);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (107, 'Actif', '1/an', 92882);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (108, 'Actif', '3/mois', 45543);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (109, 'Inactif', '2/semaine', 75416);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (110, 'Actif', '1/semaine', 61263);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (111, 'Actif', '1/an', 79049);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (112, 'Actif', '3/mois', 80962);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (113, 'Actif', '1/mois', 34052);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (114, 'Actif', '1/an', 58546);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (115, 'Actif', '3/an', 23157);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (116, 'Inactif', '3/semaine', 89921);
INSERT INTO Registre (idReg, status, periodicite, idH) VALUES (117, 'Actif', '1/mois', 39691);

--Cuisinier 


INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (6, 'Chauvin', 'Stéphanie', 36, '15, rue Grégoire Schneider, 35000 Rennes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (7, 'Clément', 'Eugène', 64, '2, rue de Sauvage, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (8, 'Gauthier', 'Nathalie', 40, '167, boulevard de Lucas, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (9, 'Blondel', 'Denise', 29, '34, boulevard Pons, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (10, 'Diaz', 'Étienne', 26, '13, rue Diaz, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (11, 'Marion', 'René', 58, '41, rue Stéphanie Michel, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (12, 'Bruneau', 'Dorothée', 29, '43, rue Allard, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (13, 'Bouvet', 'Alexandria', 38, '23, rue de Lebon, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (14, 'Peltier', 'Nath', 53, 'avenue Allard, 59000 Lille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (15, 'Alexandre', 'Élise', 35, '18, chemin Perrot, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (16, 'Roger', 'Valentine', 26, '25, boulevard Bertrand, 34000 Montpellier');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (17, 'Boulay', 'Théophile', 54, '89, boulevard Gilles Lesage, 34000 Montpellier');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (18, 'Lopez', 'Joséphine', 25, '60, chemin de Charpentier, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (19, 'Gomez', 'Luce', 45, '49, chemin Dias, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (20, 'Bernier', 'Frédérique', 29, '9, boulevard de Lévêque, 06000 Nice');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (21, 'Delannoy', 'Agnès', 52, '7, rue de Bazin, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (22, 'Lamy', 'Louise', 51, 'avenue Vidal, 44000 Nantes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (23, 'Bertrand', 'Arnaude', 46, 'rue Christelle Mendès, 44000 Nantes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (24, 'Regnier', 'Josette', 24, '61, rue de Lombard, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (25, 'Dumas', 'Susanne', 26, '763, avenue Emmanuelle Blanc, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (26, 'Ferrand', 'Laurent', 26, '36, chemin Benoît Jourdan, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (27, 'Brunel', 'Agnès', 24, '361, avenue Marianne Bègue, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (28, 'Perez', 'Richard', 34, 'rue Bertin, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (29, 'Delmas', 'Gilles', 21, '45, chemin de Fischer, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (30, 'Barbe', 'Maryse', 46, '905, rue Brunel, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (31, 'Marques', 'Victoire', 52, '36, rue Rousset, 44000 Nantes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (32, 'Adam', 'Victoire', 38, '71, rue Rémy Fleury, 35000 Rennes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (33, 'Da Silva', 'Aimée', 20, '1, avenue de Auger, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (34, 'Potier', 'Aimée', 27, 'boulevard Franck Philippe, 31000 Toulouse');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (35, 'Diaz', 'Christophe', 45, '47, boulevard Joséphine Brunel, 06000 Nice');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (36, 'Normand', 'Noël', 61, '18, avenue de Royer, 51100 Reims');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (37, 'Marion', 'Manon', 41, 'rue Luc Mary, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (38, 'Berger', 'Laure', 25, '24, boulevard Louis David, 06000 Nice');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (39, 'Rolland', 'Susan', 34, '4, rue Gay, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (40, 'Louis', 'Jean', 51, '395, avenue Antoine Grondin, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (41, 'Benoit', 'Thomas', 23, '31, rue de Dupont, 44000 Nantes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (42, 'Techer', 'Pauline', 23, 'rue Margaux Leclerc, 31000 Toulouse');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (43, 'Alves', 'Henriette', 27, 'boulevard de Lucas, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (44, 'Marchal', 'Auguste', 57, '6, avenue Simone Leclercq, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (45, 'Da Costa', 'Nicolas', 26, '853, rue de Lefebvre, 34000 Montpellier');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (46, 'Marie', 'Corinne', 39, '680, rue Monique Delahaye, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (47, 'Cordier', 'Alexandrie', 64, '71, rue Henriette Roussel, 06000 Nice');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (48, 'Lagarde', 'Jérôme', 46, '399, rue Céline Klein, 67000 Strasbourg');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (49, 'Schmitt', 'Sébastien', 61, '60, avenue de Delannoy, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (50, 'Pasquier', 'Alfred', 44, '9, chemin Renard, 51100 Reims');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (51, 'Sanchez', 'Raymond', 54, '75, chemin Colette Salmon, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (52, 'Allain', 'Philippe', 21, '56, boulevard Eugène Lebon, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (53, 'Lesage', 'Nicole', 36, '72, boulevard Martins, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (54, 'Le Gall', 'Noémi', 28, '1, avenue de Barbier, 67000 Strasbourg');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (55, 'Gaudin', 'Daniel', 42, '287, rue Jacqueline Petitjean, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (56, 'Marchand', 'Olivier', 55, '787, avenue Lefebvre, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (57, 'Benard', 'Adrienne', 58, 'avenue Le Gall, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (58, 'Brunel', 'André', 61, '2, rue de Moulin, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (59, 'Berger', 'Hortense', 21, '82, chemin Moulin, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (60, 'Daniel', 'Roland', 39, '32, chemin de Masse, 06000 Nice');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (61, 'Fouquet', 'Martine', 42, '98, rue Dupuy, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (62, 'Robin', 'Alexandre', 43, '43, chemin Mallet, 35000 Rennes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (63, 'Dupuy', 'Nathalie', 48, '2, boulevard de Tessier, 67000 Strasbourg');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (64, 'Besnard', 'Élodie', 50, '91, boulevard Simone Bègue, 31000 Toulouse');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (65, 'Maréchal', 'Josette', 22, 'avenue Benjamin Imbert, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (66, 'Guyot', 'Alain', 21, '800, boulevard de Allain, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (67, 'Pascal', 'Hortense', 43, '44, boulevard Rivière, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (68, 'Lecomte', 'Anouk', 38, '63, boulevard Hamon, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (69, 'Fernandez', 'Olivie', 22, '769, chemin Pires, 51100 Reims');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (70, 'Lamy', 'Marine', 39, 'boulevard Antoinette Chrétien, 35000 Rennes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (71, 'Petitjean', 'Hortense', 48, '676, chemin Lemaire, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (72, 'Dupuis', 'Bernard', 20, '8, avenue de Lagarde, 67000 Strasbourg');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (73, 'Gillet', 'Thibault', 55, '58, chemin Richard Godard, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (74, 'Becker', 'Thomas', 24, '31, boulevard Bernard, 06000 Nice');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (75, 'Parent', 'Édith', 51, '382, chemin de Lemoine, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (76, 'Lebon', 'Geneviève', 29, '89, chemin Christiane Salmon, 44000 Nantes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (77, 'Chauvin', 'Adèle', 38, '556, rue de Dumas, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (78, 'Lemoine', 'Henri', 36, '92, chemin Augustin Lecomte, 67000 Strasbourg');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (79, 'Roux', 'Constance', 42, '92, avenue Eugène Menard, 35000 Rennes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (80, 'Delahaye', 'Marcel', 45, '5, chemin Lucas Pires, 67000 Strasbourg');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (81, 'Alexandre', 'Charlotte', 56, 'chemin Édouard Muller, 44000 Nantes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (82, 'Jourdan', 'Anaïs', 22, 'rue Ferrand, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (83, 'Lecomte', 'Adrien', 24, 'chemin Diallo, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (84, 'Bertin', 'Arnaude', 29, '668, rue Joséphine Joly, 44000 Nantes');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (85, 'Laroche', 'Vincent', 29, '44, rue Rémy, 59000 Lille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (86, 'Léger', 'Emmanuelle', 35, 'chemin de Adam, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (87, 'Vasseur', 'Bernard', 30, '21, rue Isabelle Martinez, 31000 Toulouse');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (88, 'Lambert', 'Jeanne', 56, '64, boulevard Antoine, 34000 Montpellier');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (89, 'Gimenez', 'Simone', 50, '228, rue de Bousquet, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (90, 'Simon', 'Danielle', 41, '47, rue Chantal Mendès, 75001 Paris');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (91, 'Langlois', 'Simone', 34, '4, avenue de Gilles, 31000 Toulouse');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (92, 'Guibert', 'Renée', 36, '76, chemin Boutin, 34000 Montpellier');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (93, 'Collet', 'Colette', 65, '143, chemin de Fontaine, 31000 Toulouse');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (94, 'Roux', 'Alphonse', 58, '38, rue Danielle Faure, 34000 Montpellier');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (95, 'Roger', 'Denise', 55, '48, rue de Cousin, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (96, 'Goncalves', 'Benoît', 53, '15, avenue Susan Lacombe, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (97, 'Maillot', 'Laurent', 24, '51, avenue de Brun, 13001 Marseille');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (98, 'Hoareau', 'Bernard', 51, '32, rue Thibault Renaud, 33000 Bordeaux');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (99, 'Denis', 'Patrick', 40, '386, boulevard Jules Samson, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (100, 'Pruvost', 'Grégoire', 35, '86, rue Ruiz, 31000 Toulouse');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (101, 'Maréchal', 'Jeanne', 53, '10, avenue de Meyer, 69001 Lyon');
INSERT INTO Cuisinier (idCu, nom, prenom, age, adresse) VALUES (102, 'Letellier', 'Paulette', 55, '81, rue Godard, 69001 Lyon');



--Organisme 

INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (23, 'Germain', 'Entreprise', '6, boulevard Étienne', 'Nantes', 44000, 48709430206715);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (24, 'Hoarau et Fils', 'Université', '94, rue Édith Garnier', 'Marseille', 13001, 24425663299753);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (25, 'Henry', 'Coopérative', '8, rue Reynaud', 'Nantes', 44000, 93103695609730);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (26, 'Guyon', 'Entreprise', '86, chemin Julien Brunel', 'Lyon', 69001, 40769548126554);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (27, 'Vidal', 'Coopérative', '75, chemin Robin', 'Marseille', 13001, 88984562544563);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (28, 'Giraud', 'Artisan', '15, rue de Lecomte', 'Paris', 75001, 86693948205196);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (29, 'Lamy', 'Organisme de formation', '310, chemin Mace', 'Lyon', 69001, 49151157779884);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (30, 'Torres Renaud SA', 'Entreprise', '67, boulevard de Rossi', 'Montpellier', 34000, 57886405498129);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (31, 'Labbé François S.A.S.', 'Université', '594, rue Bailly', 'Marseille', 13001, 24385291136889);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (32, 'Grégoire Albert SARL', 'Entreprise', '36, rue Hebert', 'Paris', 75001, 94964520328049);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (33, 'Bernier', 'Entreprise', 'rue Texier', 'Marseille', 13001, 74659571848144);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (34, 'Daniel SARL', 'Organisme de formation', '49, rue de Blondel', 'Toulouse', 31000, 87692001861608);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (35, 'Fernandez', 'Artisan', '47, rue Pénélope Dumont', 'Marseille', 13001, 60899063460545);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (36, 'Legendre Mendès S.A.R.L.', 'Artisan', '636, boulevard Poulain', 'Nice', 6000, 16447044648402);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (37, 'Le Roux', 'Association', '58, boulevard Durand', 'Nantes', 44000, 21231276005964);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (38, 'Joly SARL', 'Entreprise', '57, avenue Andrée Breton', 'Bordeaux', 33000, 49120194761687);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (39, 'Huet Lemaire S.A.', 'Association', '71, rue Girard', 'Lyon', 69001, 62098651894505);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (40, 'Leclerc', 'Artisan', '9, avenue Gérard Marie', 'Lyon', 69001, 20048711796139);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (41, 'Maillot', 'Université', '667, rue Frédéric Noël', 'Nice', 6000, 32996306357707);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (42, 'Parent', 'Association', 'rue Gilbert Verdier', 'Lyon', 69001, 40908976742969);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (43, 'Collin', 'Entreprise', '74, rue de Le Roux', 'Nantes', 44000, 66458699966460);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (44, 'Grenier Paul S.A.', 'Université', '29, boulevard Chantal Garcia', 'Marseille', 13001, 54288491207375);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (45, 'Duval', 'Organisme de formation', 'rue de Carre', 'Marseille', 13001, 30106712666281);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (46, 'Leroux', 'Université', 'rue Andrée Lombard', 'Marseille', 13001, 89004828145945);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (47, 'Delmas Weber et Fils', 'Artisan', '7, avenue Juliette Martin', 'Toulouse', 31000, 70295261678969);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (48, 'Roy', 'Organisme de formation', 'rue Riou', 'Lille', 59000, 40865189751959);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (49, 'Lejeune SARL', 'Université', '7, rue de Bourdon', 'Reims', 51100, 79456104542376);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (50, 'Martinez', 'Entreprise', '31, rue de Lecoq', 'Paris', 75001, 25431220936086);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (51, 'Techer SA', 'Université', '602, rue de Delattre', 'Paris', 75001, 93938359028968);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (52, 'Fournier', 'Organisme de formation', '263, rue Berthelot', 'Paris', 75001, 84468153236994);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (53, 'Charpentier S.A.R.L.', 'Coopérative', '63, rue Louise Marin', 'Marseille', 13001, 26122107738553);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (54, 'Evrard', 'Coopérative', '6, avenue de Léger', 'Nantes', 44000, 47554124064528);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (55, 'Masson', 'Association', '88, chemin de Pons', 'Montpellier', 34000, 51305179598569);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (56, 'Maury', 'Organisme de formation', '6, avenue Leclerc', 'Lyon', 69001, 47068658769419);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (57, 'Allard', 'Université', '65, chemin Céline Buisson', 'Reims', 51100, 52003170831470);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (58, 'Jean', 'Coopérative', '197, chemin de Moreno', 'Bordeaux', 33000, 37992917375175);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (59, 'Fernandes Lambert SARL', 'Université', '4, rue de Pires', 'Paris', 75001, 94293030607569);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (60, 'Thomas Lacombe S.A.', 'Entreprise', '347, rue Xavier Descamps', 'Marseille', 13001, 53279555545901);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (61, 'Laine', 'Université', 'chemin de Bonnin', 'Marseille', 13001, 89851508022456);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (62, 'Samson Jean S.A.R.L.', 'Entreprise', '4, rue de Schneider', 'Rennes', 35000, 78396202740687);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (63, 'Le Roux SARL', 'Coopérative', 'boulevard Ferrand', 'Bordeaux', 33000, 27698554493364);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (64, 'Legrand et Fils', 'Organisme de formation', '87, rue Regnier', 'Paris', 75001, 87377902521548);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (65, 'Barbe Raynaud S.A.', 'Coopérative', '2, chemin Grenier', 'Paris', 75001, 95370517046682);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (66, 'Guibert SA', 'Université', '69, chemin de Foucher', 'Lyon', 69001, 85900356740702);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (67, 'Allain Bodin SARL', 'Artisan', '56, rue de Pascal', 'Montpellier', 34000, 66153741239194);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (68, 'Bonnin', 'Artisan', '24, chemin Margot Morel', 'Reims', 51100, 71655859362929);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (69, 'Antoine', 'Organisme de formation', '7, boulevard Michelle Jacques', 'Lille', 59000, 44888539054487);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (70, 'Cohen', 'Association', 'rue Eugène Vallée', 'Marseille', 13001, 92794174906457);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (71, 'Besson', 'Coopérative', 'rue de Legrand', 'Nice', 6000, 11010263141046);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (72, 'Adam', 'Artisan', '494, chemin Paul Lopes', 'Paris', 75001, 42216802548192);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (73, 'Colas', 'Entreprise', '744, chemin Vidal', 'Paris', 75001, 56505303019713);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (74, 'Lefebvre SA', 'Université', '64, boulevard Ollivier', 'Paris', 75001, 40152755257319);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (75, 'Carre S.A.R.L.', 'Artisan', '4, avenue Juliette Pages', 'Toulouse', 31000, 91095730127194);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (76, 'Gautier', 'Organisme de formation', '22, rue de Ramos', 'Toulouse', 31000, 67289741967261);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (77, 'Delahaye', 'Entreprise', '10, rue Maggie Delaunay', 'Paris', 75001, 70664948398074);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (78, 'Chauvet S.A.R.L.', 'Organisme de formation', '89, rue Dupont', 'Lyon', 69001, 17626698307354);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (79, 'Le Goff', 'Artisan', '8, avenue Jacquet', 'Nantes', 44000, 18530227751406);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (80, 'Martinez Lopes S.A.S.', 'Association', '56, rue Adrienne Gomez', 'Lyon', 69001, 44991567867431);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (81, 'Muller Chrétien S.A.R.L.', 'Coopérative', 'rue Gérard Petitjean', 'Paris', 75001, 29728711571069);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (82, 'Bodin SARL', 'Association', '80, rue de Giraud', 'Lyon', 69001, 45156294290197);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (83, 'Cousin Le Roux S.A.R.L.', 'Entreprise', '161, chemin Joseph Dufour', 'Lille', 59000, 23780618714787);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (84, 'Brunel Roussel S.A.', 'Coopérative', 'chemin Thérèse Bonneau', 'Paris', 75001, 12078059915120);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (85, 'Blanc', 'Université', 'boulevard Martin Charles', 'Reims', 51100, 67196793781602);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (86, 'Chauveau', 'Université', 'avenue Roger Gérard', 'Toulouse', 31000, 66443878881905);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (87, 'Leduc', 'Université', '26, boulevard Jacob', 'Lille', 59000, 10302275387875);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (88, 'Antoine', 'Association', '34, rue Jules Goncalves', 'Reims', 51100, 74037039520973);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (89, 'Moulin', 'Artisan', '47, chemin Grenier', 'Marseille', 13001, 78494929009354);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (90, 'Sanchez Lucas SARL', 'Association', '84, chemin de Lebreton', 'Paris', 75001, 91510140527318);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (91, 'Perrot Rolland S.A.R.L.', 'Entreprise', 'rue Martin Hernandez', 'Strasbourg', 67000, 54138296464283);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (92, 'Boyer', 'Coopérative', '2, rue de Ferrand', 'Paris', 75001, 80770223927274);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (93, 'Bourdon Cohen S.A.R.L.', 'Coopérative', 'avenue Lesage', 'Lille', 59000, 18002200240869);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (94, 'Maillet SARL', 'Entreprise', 'avenue Henriette Rousseau', 'Reims', 51100, 36155712353744);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (95, 'Paris', 'Entreprise', '70, boulevard de Seguin', 'Paris', 75001, 66823427519126);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (96, 'Mercier Ledoux et Fils', 'Coopérative', '3, rue Nicolas Lopez', 'Paris', 75001, 91476587091988);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (97, 'Louis', 'Coopérative', '39, rue Adélaïde Andre', 'Nice', 6000, 69000317861204);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (98, 'Becker', 'Coopérative', '25, rue Faure', 'Nantes', 44000, 54523876325013);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (99, 'Dufour S.A.', 'Université', '45, avenue de Lefèvre', 'Rennes', 35000, 43592288631450);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (100, 'Robin', 'Université', '11, avenue Moulin', 'Marseille', 13001, 74348488506306);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (101, 'Olivier et Fils', 'Entreprise', '7, rue de Andre', 'Marseille', 13001, 74497563893619);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (102, 'Jacob', 'Coopérative', 'avenue Munoz', 'Nantes', 44000, 24074591063373);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (103, 'Le Gall', 'Université', '84, boulevard Stéphanie Clerc', 'Paris', 75001, 47325438560460);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (104, 'Fischer', 'Association', 'avenue Allain', 'Paris', 75001, 19684639568001);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (105, 'Riou Daniel S.A.R.L.', 'Association', '114, avenue Leroy', 'Lille', 59000, 32201909964562);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (106, 'Jourdan', 'Coopérative', '64, chemin Grégoire Allain', 'Lyon', 69001, 52574737518915);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (107, 'Ledoux', 'Artisan', '14, avenue Pierre', 'Nice', 6000, 11101783410767);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (108, 'Vallet', 'Coopérative', '3, rue Aubert', 'Nantes', 44000, 24579968235463);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (109, 'Guichard S.A.S.', 'Université', 'avenue Margot Ferreira', 'Rennes', 35000, 26244702185967);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (110, 'Alves SARL', 'Artisan', '68, rue Marion', 'Lille', 59000, 31876644515991);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (111, 'Normand', 'Coopérative', '69, avenue de Martin', 'Marseille', 13001, 38653199491242);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (112, 'Weber', 'Association', '31, chemin Patricia Lévêque', 'Nantes', 44000, 78756007189745);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (113, 'Leduc', 'Entreprise', '19, rue Nathalie Noël', 'Marseille', 13001, 99266996698953);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (114, 'Carpentier', 'Association', '996, avenue de Pages', 'Lyon', 69001, 10498405557549);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (115, 'Chrétien Weiss et Fils', 'Université', 'rue Mathilde Schmitt', 'Marseille', 13001, 32738681954333);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (116, 'Leblanc', 'Coopérative', 'boulevard Adèle Faivre', 'Strasbourg', 67000, 70192702504764);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (117, 'Andre et Fils', 'Entreprise', '34, rue Picard', 'Nice', 6000, 30980502617322);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (118, 'Besnard', 'Association', '62, chemin Loiseau', 'Toulouse', 31000, 87762884753616);
INSERT INTO Organisme (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (119, 'Alves', 'Université', '34, boulevard de Chevalier', 'Paris', 75001, 53383644310494);


--INGREDIENT 


INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (1, 'Condiment', 'Huile de tournesol', 'Huile de tournesol');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (2, 'Condiment', 'Vinaigre', 'Vinaigre');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (3, 'Condiment', 'Moutarde', 'Moutarde');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (4, 'Condiment', 'Sel', 'Sel');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (5, 'Condiment', 'Poivre', 'Poivre');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (6, 'Condiment', 'Ail', 'Ail');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (7, 'Condiment', 'Citron', 'Citron');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (8, 'Condiment', 'Herbes de Provence', 'Herbes de Provence');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (9, 'Condiment', 'Paprika', 'Paprika');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (10, 'Condiment', 'Cumin', 'Cumin');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (11, 'Condiment', 'Curry', 'Curry');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (12, 'Condiment', 'Gingembre', 'Gingembre');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (13, 'Condiment', 'Piment', 'Piment');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (14, 'Condiment', 'Coriandre', 'Coriandre');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (15, 'Condiment', 'Basilic', 'Basilic');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (16, 'Condiment', 'Thym', 'Thym');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (17, 'Condiment', 'Romarin', 'Romarin');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (18, 'Condiment', 'Sucre', 'Sucre');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (19, 'Condiment', 'Miel', 'Miel');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (20, 'Condiment', 'Crème fraîche', 'Crème fraîche');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (21, 'Condiment', 'Yaourt', 'Yaourt');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (22, 'Condiment', 'Mayonnaise', 'Mayonnaise');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (23, 'Condiment', 'Ketchup', 'Ketchup');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (24, 'Condiment', 'Sauce soja', 'Sauce soja');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (25, 'Condiment', 'Worcestershire', 'Worcestershire');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (26, 'Condiment', 'Tabasco', 'Tabasco');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (27, 'Condiment', 'Eau', 'Eau');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (28, 'Condiment', 'Farine', 'Farine');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (29, 'Condiment', 'Beurre', 'Beurre');
INSERT INTO Ingredient (idAli, type, libelle, nom) VALUES (30, 'Condiment', 'Fromage blanc', 'Fromage blanc');

--Ordre Tenrac

INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (5, 'Le Temple du Croustillant', '1 bis Rue du Seau', 'Strasbourg', 'Régional', 67000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (6, 'Le Temple du Croustillant', '1 bis Rue du Seau', 'Strasbourg', 'Régional', 67000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (7, 'Le Temple du Croustillant', '1 bis Rue du Seau', 'Strasbourg', 'Régional', 67000);INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (5, 'Le Temple du Croustillant', '1 bis Rue du Seau', 'Strasbourg', 'Régional', 67000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (5, 'Le Temple du Croustillant', '1 bis Rue du Seau', 'Strasbourg', 'Régional', 67000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (8, 'Le Temple du Croustillant', '1 bis Rue du Seau', 'Strasbourg', 'Régional', 67000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (9, 'Le Temple du Croustillant', '1 bis Rue du Seau', 'Strasbourg', 'Régional', 67000);





--Fabriquant 


INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (1, 'Marchal', 'Édouard', '96, rue Pauline Weiss', 33000, 'Bordeaux');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (2, 'Camus', 'Jules', '8, avenue de Faure', 31000, 'Toulouse');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (3, 'Barre', 'Aurélie', '1, avenue de Le Gall', 69001, 'Lyon');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (4, 'Seguin', 'Arthur', '92, rue de Guyon', 13001, 'Marseille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (5, 'Samson', 'Suzanne', '11, avenue de Moulin', 69001, 'Lyon');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (6, 'Gilbert', 'William', 'boulevard Charrier', 69001, 'Lyon');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (7, 'Muller', 'Michèle', '166, avenue de Gros', 69001, 'Lyon');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (8, 'Gérard', 'Patricia', '46, rue Joséphine Wagner', 75001, 'Paris');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (9, 'Laporte', 'Dominique', '267, rue Jacquot', 6000, 'Nice');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (10, 'Merle', 'Patricia', '37, rue de Riou', 67000, 'Strasbourg');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (11, 'Durand', 'Manon', 'rue de Andre', 44000, 'Nantes');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (12, 'Potier', 'Anne', '174, chemin Charpentier', 75001, 'Paris');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (13, 'Mallet', 'Geneviève', 'avenue Noël Breton', 44000, 'Nantes');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (14, 'Delahaye', 'Charles', '172, boulevard Nicolas Boulanger', 33000, 'Bordeaux');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (15, 'Moreau', 'Brigitte', '89, rue de Vallée', 35000, 'Rennes');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (16, 'Moreau', 'Gabrielle', '9, rue Brunet', 69001, 'Lyon');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (17, 'Chevallier', 'Juliette', '97, rue Michel', 67000, 'Strasbourg');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (18, 'Michaud', 'Denise', '6, rue de Blanchet', 59000, 'Lille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (19, 'Chauveau', 'Cécile', '94, avenue de Lemaire', 67000, 'Strasbourg');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (20, 'Marchand', 'Stéphanie', '12, chemin de Roy', 6000, 'Nice');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (21, 'Gimenez', 'Zoé', '511, rue Yves Ledoux', 13001, 'Marseille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (22, 'Boulay', 'Nath', '822, avenue Timothée Pages', 59000, 'Lille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (23, 'Moreno', 'Paulette', 'avenue de Bonneau', 75001, 'Paris');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (24, 'Leclercq', 'Antoine', '66, chemin Faivre', 75001, 'Paris');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (25, 'Neveu', 'Cécile', '83, avenue de Lenoir', 34000, 'Montpellier');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (26, 'Renault', 'Cécile', '94, boulevard Diane Nguyen', 75001, 'Paris');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (27, 'Regnier', 'Suzanne', 'chemin Fontaine', 51100, 'Reims');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (28, 'Marques', 'Victor', 'rue de Gallet', 13001, 'Marseille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (29, 'Gimenez', 'Honoré', '33, rue de Coste', 13001, 'Marseille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (30, 'Vasseur', 'Martin', 'rue Inès Lombard', 13001, 'Marseille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (31, 'Millet', 'Nathalie', '73, boulevard de Normand', 13001, 'Marseille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (32, 'Allard', 'Stéphanie', '18, boulevard Bertrand Mahe', 69001, 'Lyon');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (33, 'Thibault', 'Élisabeth', 'chemin Marchand', 69001, 'Lyon');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (34, 'Munoz', 'Paulette', '188, chemin François Renard', 75001, 'Paris');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (35, 'Gaudin', 'Adrienne', '877, avenue Catherine Royer', 6000, 'Nice');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (36, 'Da Costa', 'Guillaume', '1, rue Amélie Prévost', 67000, 'Strasbourg');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (37, 'Henry', 'Adèle', '639, chemin Marine Navarro', 44000, 'Nantes');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (38, 'Vaillant', 'Jean', '954, chemin Alix Antoine', 51100, 'Reims');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (39, 'Delorme', 'Brigitte', 'boulevard Émilie Renard', 69001, 'Lyon');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (40, 'Seguin', 'Luce', '61, rue Millet', 75001, 'Paris');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (41, 'Durand', 'Hélène', '47, rue de Bailly', 33000, 'Bordeaux');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (42, 'Brunet', 'Susan', '52, boulevard Perez', 59000, 'Lille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (43, 'Martel', 'Victoire', '4, avenue Maréchal', 31000, 'Toulouse');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (44, 'Perez', 'Paul', '41, boulevard de Colin', 44000, 'Nantes');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (45, 'Gosselin', 'Margot', '525, rue Monique Potier', 13001, 'Marseille');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (46, 'Gay', 'Grégoire', '8, chemin de Gaudin', 75001, 'Paris');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (47, 'Collin', 'Laurence', '131, rue Arthur Lecomte', 34000, 'Montpellier');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (48, 'Petitjean', 'Eugène', '71, avenue Bouvier', 35000, 'Rennes');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (49, 'Gomez', 'Zoé', 'rue Victor Weber', 31000, 'Toulouse');
INSERT INTO Fabriquant (idF, nom, prenom, adresse, codePostale, ville) VALUES (50, 'Ribeiro', 'Julien', '3, rue Andre', 31000, 'Toulouse');
;


-- RACLETTE

-- LEGUME



--entretien 

INSERT INTO Entretien (idEn, dateEntretien) VALUES (21, TO_DATE('2023-08-01', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (22, TO_DATE('2025-10-08', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (23, TO_DATE('2024-07-25', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (24, TO_DATE('2020-09-03', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (25, TO_DATE('2021-02-21', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (26, TO_DATE('2020-06-06', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (27, TO_DATE('2024-09-30', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (28, TO_DATE('2020-02-07', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (29, TO_DATE('2020-04-14', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (30, TO_DATE('2023-04-14', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (31, TO_DATE('2025-12-12', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (32, TO_DATE('2024-08-23', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (33, TO_DATE('2022-07-05', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (34, TO_DATE('2024-01-24', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (35, TO_DATE('2023-06-17', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (36, TO_DATE('2022-11-17', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (37, TO_DATE('2024-06-04', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (38, TO_DATE('2024-05-03', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (39, TO_DATE('2021-05-29', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (40, TO_DATE('2025-01-19', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (41, TO_DATE('2020-04-10', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (42, TO_DATE('2020-03-30', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (43, TO_DATE('2024-06-07', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (44, TO_DATE('2023-10-17', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (45, TO_DATE('2022-11-30', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (46, TO_DATE('2024-05-18', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (47, TO_DATE('2021-05-27', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (48, TO_DATE('2022-01-20', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (49, TO_DATE('2022-03-16', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (50, TO_DATE('2024-01-05', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (51, TO_DATE('2025-07-15', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (52, TO_DATE('2021-10-22', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (53, TO_DATE('2021-03-06', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (54, TO_DATE('2024-05-22', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (55, TO_DATE('2021-11-14', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (56, TO_DATE('2025-04-12', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (57, TO_DATE('2020-06-21', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (58, TO_DATE('2024-02-29', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (59, TO_DATE('2024-05-30', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (60, TO_DATE('2024-11-10', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (61, TO_DATE('2025-08-15', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (62, TO_DATE('2025-01-24', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (63, TO_DATE('2024-09-08', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (64, TO_DATE('2024-02-15', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (65, TO_DATE('2022-02-18', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (66, TO_DATE('2021-07-19', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (67, TO_DATE('2021-04-18', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (68, TO_DATE('2024-08-10', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (69, TO_DATE('2022-03-22', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (70, TO_DATE('2020-08-27', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (71, TO_DATE('2022-06-30', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (72, TO_DATE('2025-01-16', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (73, TO_DATE('2025-03-22', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (74, TO_DATE('2021-12-24', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (75, TO_DATE('2020-01-02', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (76, TO_DATE('2024-03-08', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (77, TO_DATE('2024-02-17', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (78, TO_DATE('2023-02-08', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (79, TO_DATE('2024-02-22', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (80, TO_DATE('2020-07-08', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (81, TO_DATE('2020-10-22', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (82, TO_DATE('2024-10-31', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (83, TO_DATE('2023-11-30', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (84, TO_DATE('2020-08-07', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (85, TO_DATE('2020-03-28', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (86, TO_DATE('2025-06-09', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (87, TO_DATE('2021-09-26', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (88, TO_DATE('2025-02-14', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (89, TO_DATE('2024-04-30', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (90, TO_DATE('2023-04-21', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (91, TO_DATE('2020-09-13', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (92, TO_DATE('2021-07-23', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (93, TO_DATE('2024-09-21', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (94, TO_DATE('2020-02-01', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (95, TO_DATE('2025-11-15', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (96, TO_DATE('2022-08-30', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (97, TO_DATE('2020-05-14', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (98, TO_DATE('2020-04-15', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (99, TO_DATE('2025-06-16', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (100, TO_DATE('2024-10-04', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (101, TO_DATE('2021-05-04', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (102, TO_DATE('2022-05-15', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (103, TO_DATE('2022-03-28', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (104, TO_DATE('2024-10-22', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (105, TO_DATE('2024-05-29', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (106, TO_DATE('2020-10-04', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (107, TO_DATE('2023-05-09', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (108, TO_DATE('2022-10-26', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (109, TO_DATE('2025-08-18', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (110, TO_DATE('2023-05-27', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (111, TO_DATE('2023-09-07', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (112, TO_DATE('2023-01-18', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (113, TO_DATE('2024-09-04', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (114, TO_DATE('2023-08-16', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (115, TO_DATE('2021-06-15', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (116, TO_DATE('2024-11-05', 'YYYY-MM-DD'));
INSERT INTO Entretien (idEn, dateEntretien) VALUES (117, TO_DATE('2021-10-20', 'YYYY-MM-DD'));


---- CROYANCE

-- OPPOSITION_DE_CONVICTION_PERSONNELLE

INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (1, 'Centriste', 'Halal', 'Sauces industrielles', 6);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (2, 'Conservatrice', 'Casher', 'Sauces industrielles', 1);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (3, 'Conservatrice', 'Sans porc', 'Ananas sur plat chaud', 2);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (4, 'Libérale', 'Casher', 'Sauces industrielles', 16);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (5, 'Écologiste', 'Sans alcool', 'Produits importés', 18);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (6, 'Libérale', 'Végane', 'Sauces industrielles', 13);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (7, 'Libérale', 'Végane', 'Sauces industrielles', 12);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (8, 'Centriste', 'Casher', 'Mélange viande-fromage', 7);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (9, 'Centriste', 'Végane', 'Sauces industrielles', 2);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (10, 'Centriste', 'Sans porc', 'Sauces industrielles', 14);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (11, 'Libérale', 'Halal', 'Mélange viande-fromage', 14);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (12, 'Centriste', 'Sans porc', 'Sauces industrielles', 2);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (13, 'Écologiste', 'Halal', 'Produits importés', 9);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (14, 'Conservatrice', 'Végane', 'Ananas sur plat chaud', 19);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (15, 'Progressiste', 'Végane', 'Ananas sur plat chaud', 14);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (16, 'Écologiste', 'Végane', 'Sauces industrielles', 16);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (17, 'Libérale', 'Sans porc', 'Sauces industrielles', 15);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (18, 'Écologiste', 'Sans alcool', 'Ananas sur plat chaud', 4);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (19, 'Écologiste', 'Halal', 'Ananas sur plat chaud', 3);
INSERT INTO Opposition_De_Conviction_Personnelle (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (20, 'Conservatrice', 'Casher', 'Ananas sur plat chaud', 16);

-- CROISADE

INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (1, '121 jours', TO_DATE('2020-07-10', 'YYYY-MM-DD'), 'Croisade des Légumes Bannis', TO_DATE('2021-06-17', 'YYYY-MM-DD'), 'Cérémoniale');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (2, '348 jours', TO_DATE('2023-06-21', 'YYYY-MM-DD'), 'Croisade du Grand Maître', TO_DATE('2024-01-02', 'YYYY-MM-DD'), 'Traditionnelle');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (3, '95 jours', TO_DATE('2022-05-05', 'YYYY-MM-DD'), 'Croisade de la Raclette Sacrée', TO_DATE('2022-07-10', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (4, '68 jours', TO_DATE('2022-09-13', 'YYYY-MM-DD'), 'Croisade de la Sauce Interdite', TO_DATE('2023-01-03', 'YYYY-MM-DD'), 'Cérémoniale');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (5, '342 jours', TO_DATE('2020-10-24', 'YYYY-MM-DD'), 'Croisade du Tender Doré', TO_DATE('2021-09-30', 'YYYY-MM-DD'), 'Cérémoniale');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (6, '224 jours', TO_DATE('2022-03-20', 'YYYY-MM-DD'), 'Croisade de la Raclette Sacrée', TO_DATE('2022-06-13', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (7, '307 jours', TO_DATE('2020-12-18', 'YYYY-MM-DD'), 'Croisade du Tender Doré', TO_DATE('2021-12-10', 'YYYY-MM-DD'), 'Secrète');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (8, '154 jours', TO_DATE('2020-01-28', 'YYYY-MM-DD'), 'Croisade du Grand Maître', TO_DATE('2020-12-30', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (9, '32 jours', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 'Croisade des Légumes Bannis', TO_DATE('2023-05-30', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (10, '317 jours', TO_DATE('2022-08-11', 'YYYY-MM-DD'), 'Croisade du Tender Doré', TO_DATE('2023-06-09', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (11, '269 jours', TO_DATE('2021-11-04', 'YYYY-MM-DD'), 'Croisade du Fromage Fondu', TO_DATE('2022-01-31', 'YYYY-MM-DD'), 'Cérémoniale');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (12, '116 jours', TO_DATE('2020-09-14', 'YYYY-MM-DD'), 'Croisade du Fromage Fondu', TO_DATE('2021-07-25', 'YYYY-MM-DD'), 'Traditionnelle');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (13, '138 jours', TO_DATE('2022-06-24', 'YYYY-MM-DD'), 'Croisade de la Raclette Sacrée', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'Cérémoniale');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (14, '49 jours', TO_DATE('2021-10-21', 'YYYY-MM-DD'), 'Croisade des Légumes Bannis', TO_DATE('2022-03-07', 'YYYY-MM-DD'), 'Cérémoniale');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (15, '30 jours', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'Croisade de la Raclette Sacrée', TO_DATE('2022-06-19', 'YYYY-MM-DD'), 'Traditionnelle');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (16, '303 jours', TO_DATE('2022-05-27', 'YYYY-MM-DD'), 'Croisade des Légumes Bannis', TO_DATE('2023-01-11', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (17, '167 jours', TO_DATE('2021-07-16', 'YYYY-MM-DD'), 'Croisade de la Sauce Interdite', TO_DATE('2021-12-11', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (18, '203 jours', TO_DATE('2022-08-27', 'YYYY-MM-DD'), 'Croisade des Légumes Bannis', TO_DATE('2023-04-12', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (19, '95 jours', TO_DATE('2023-12-16', 'YYYY-MM-DD'), 'Croisade du Tender Doré', TO_DATE('2024-06-14', 'YYYY-MM-DD'), 'Gastronomique');
INSERT INTO Croisade (idCro, duree, dateDep, nom, dateFin, type) VALUES (20, '286 jours', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'Croisade du Grand Maître', TO_DATE('2023-07-10', 'YYYY-MM-DD'), 'Traditionnelle');


-- GRADE (dépend de TENRAC)

INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (8, 4, 'Généré', 'Auto', 21);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (9, 1, 'Généré', 'Auto', 22);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (10, 1, 'Généré', 'Auto', 23);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (11, 1, 'Généré', 'Auto', 24);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (12, 2, 'Généré', 'Auto', 25);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (13, 4, 'Généré', 'Auto', 26);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (14, 3, 'Généré', 'Auto', 27);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (15, 1, 'Généré', 'Auto', 28);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (16, 3, 'Généré', 'Auto', 29);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (17, 2, 'Généré', 'Auto', 30);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (18, 3, 'Généré', 'Auto', 31);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (19, 2, 'Généré', 'Auto', 32);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (20, 2, 'Généré', 'Auto', 33);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (21, 2, 'Généré', 'Auto', 34);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (22, 1, 'Généré', 'Auto', 35);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (23, 5, 'Généré', 'Auto', 36);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (24, 1, 'Généré', 'Auto', 37);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (25, 4, 'Généré', 'Auto', 38);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (26, 2, 'Généré', 'Auto', 39);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (27, 1, 'Généré', 'Auto', 40);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (28, 2, 'Généré', 'Auto', 41);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (29, 2, 'Généré', 'Auto', 42);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (30, 2, 'Généré', 'Auto', 43);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (31, 3, 'Généré', 'Auto', 44);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (32, 1, 'Généré', 'Auto', 45);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (33, 6, 'Généré', 'Auto', 46);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (34, 2, 'Généré', 'Auto', 47);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (35, 2, 'Généré', 'Auto', 48);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (36, 6, 'Généré', 'Auto', 49);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (37, 3, 'Généré', 'Auto', 50);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (38, 1, 'Généré', 'Auto', 51);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (39, 6, 'Généré', 'Auto', 52);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (40, 3, 'Généré', 'Auto', 53);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (41, 3, 'Généré', 'Auto', 54);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (42, 3, 'Généré', 'Auto', 55);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (43, 3, 'Généré', 'Auto', 56);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (44, 1, 'Généré', 'Auto', 57);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (45, 1, 'Généré', 'Auto', 58);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (46, 2, 'Généré', 'Auto', 59);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (47, 2, 'Généré', 'Auto', 60);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (48, 1, 'Généré', 'Auto', 61);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (49, 2, 'Généré', 'Auto', 62);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (50, 3, 'Généré', 'Auto', 63);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (51, 2, 'Généré', 'Auto', 64);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (52, 5, 'Généré', 'Auto', 65);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (53, 1, 'Généré', 'Auto', 66);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (54, 2, 'Généré', 'Auto', 67);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (55, 6, 'Généré', 'Auto', 68);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (56, 2, 'Généré', 'Auto', 69);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (57, 3, 'Généré', 'Auto', 70);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (58, 1, 'Généré', 'Auto', 71);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (59, 4, 'Généré', 'Auto', 72);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (60, 1, 'Généré', 'Auto', 73);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (61, 2, 'Généré', 'Auto', 74);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (62, 3, 'Généré', 'Auto', 75);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (63, 2, 'Généré', 'Auto', 76);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (64, 2, 'Généré', 'Auto', 77);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (65, 2, 'Généré', 'Auto', 78);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (66, 3, 'Généré', 'Auto', 79);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (67, 2, 'Généré', 'Auto', 80);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (68, 1, 'Généré', 'Auto', 81);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (69, 1, 'Généré', 'Auto', 82);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (70, 5, 'Généré', 'Auto', 83);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (71, 1, 'Généré', 'Auto', 84);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (72, 5, 'Généré', 'Auto', 85);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (73, 1, 'Généré', 'Auto', 86);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (74, 3, 'Généré', 'Auto', 87);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (75, 5, 'Généré', 'Auto', 88);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (76, 1, 'Généré', 'Auto', 89);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (77, 3, 'Généré', 'Auto', 90);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (78, 1, 'Généré', 'Auto', 91);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (79, 1, 'Généré', 'Auto', 92);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (80, 1, 'Généré', 'Auto', 93);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (81, 1, 'Généré', 'Auto', 94);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (82, 2, 'Généré', 'Auto', 95);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (83, 1, 'Généré', 'Auto', 96);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (84, 1, 'Généré', 'Auto', 97);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (85, 4, 'Généré', 'Auto', 98);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (86, 2, 'Généré', 'Auto', 99);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (87, 2, 'Généré', 'Auto', 100);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (88, 1, 'Généré', 'Auto', 101);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (89, 3, 'Généré', 'Auto', 102);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (90, 3, 'Généré', 'Auto', 103);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (91, 1, 'Généré', 'Auto', 104);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (92, 3, 'Généré', 'Auto', 105);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (93, 2, 'Généré', 'Auto', 106);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (94, 5, 'Généré', 'Auto', 107);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (95, 2, 'Généré', 'Auto', 108);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (96, 2, 'Généré', 'Auto', 109);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (97, 1, 'Généré', 'Auto', 110);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (98, 1, 'Généré', 'Auto', 111);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (99, 1, 'Généré', 'Auto', 112);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (100, 2, 'Généré', 'Auto', 113);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (101, 1, 'Généré', 'Auto', 114);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (102, 1, 'Généré', 'Auto', 115);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (103, 1, 'Généré', 'Auto', 116);
INSERT INTO Grade (idG, nom, type, libelle, idT) VALUES (104, 4, 'Généré', 'Auto', 117);


-- RANG (dépend de TENRAC)


INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (3, 2, 'Généré', 'Auto', 21);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (4, 1, 'Généré', 'Auto', 26);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (5, 1, 'Généré', 'Auto', 27);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (6, 2, 'Généré', 'Auto', 29);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (7, 2, 'Généré', 'Auto', 31);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (8, 2, 'Généré', 'Auto', 36);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (9, 1, 'Généré', 'Auto', 38);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (10, 2, 'Généré', 'Auto', 44);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (11, 1, 'Généré', 'Auto', 46);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (12, 2, 'Généré', 'Auto', 49);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (13, 2, 'Généré', 'Auto', 50);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (14, 1, 'Généré', 'Auto', 52);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (15, 1, 'Généré', 'Auto', 53);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (16, 1, 'Généré', 'Auto', 54);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (17, 1, 'Généré', 'Auto', 55);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (18, 2, 'Généré', 'Auto', 56);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (19, 2, 'Généré', 'Auto', 63);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (20, 1, 'Généré', 'Auto', 65);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (21, 1, 'Généré', 'Auto', 68);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (22, 1, 'Généré', 'Auto', 70);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (23, 1, 'Généré', 'Auto', 72);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (24, 1, 'Généré', 'Auto', 75);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (25, 1, 'Généré', 'Auto', 79);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (26, 2, 'Généré', 'Auto', 83);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (27, 1, 'Généré', 'Auto', 85);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (28, 1, 'Généré', 'Auto', 87);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (29, 1, 'Généré', 'Auto', 88);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (30, 1, 'Généré', 'Auto', 90);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (31, 2, 'Généré', 'Auto', 98);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (32, 1, 'Généré', 'Auto', 102);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (33, 2, 'Généré', 'Auto', 103);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (34, 2, 'Généré', 'Auto', 105);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (35, 2, 'Généré', 'Auto', 107);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (36, 2, 'Généré', 'Auto', 117);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (37, 2, 'Généré', 'Auto', 118);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (38, 2, 'Généré', 'Auto', 120);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (39, 2, 'Généré', 'Auto', 125);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (40, 2, 'Généré', 'Auto', 126);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (41, 1, 'Généré', 'Auto', 128);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (42, 2, 'Généré', 'Auto', 135);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (43, 1, 'Généré', 'Auto', 137);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (44, 1, 'Généré', 'Auto', 138);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (45, 1, 'Généré', 'Auto', 139);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (46, 2, 'Généré', 'Auto', 142);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (47, 2, 'Généré', 'Auto', 144);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (48, 1, 'Généré', 'Auto', 146);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (49, 2, 'Généré', 'Auto', 152);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (50, 2, 'Généré', 'Auto', 153);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (51, 2, 'Généré', 'Auto', 156);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (52, 2, 'Généré', 'Auto', 158);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (53, 2, 'Généré', 'Auto', 160);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (54, 1, 'Généré', 'Auto', 162);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (55, 1, 'Généré', 'Auto', 163);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (56, 1, 'Généré', 'Auto', 164);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (57, 1, 'Généré', 'Auto', 165);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (58, 1, 'Généré', 'Auto', 169);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (59, 2, 'Généré', 'Auto', 170);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (60, 1, 'Généré', 'Auto', 173);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (61, 2, 'Généré', 'Auto', 175);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (62, 1, 'Généré', 'Auto', 178);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (63, 1, 'Généré', 'Auto', 180);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (64, 1, 'Généré', 'Auto', 183);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (65, 2, 'Généré', 'Auto', 184);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (66, 2, 'Généré', 'Auto', 187);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (67, 2, 'Généré', 'Auto', 188);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (68, 1, 'Généré', 'Auto', 193);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (69, 1, 'Généré', 'Auto', 195);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (70, 2, 'Généré', 'Auto', 197);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (71, 2, 'Généré', 'Auto', 198);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (72, 2, 'Généré', 'Auto', 201);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (73, 2, 'Généré', 'Auto', 202);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (74, 2, 'Généré', 'Auto', 203);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (75, 2, 'Généré', 'Auto', 206);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (76, 1, 'Généré', 'Auto', 209);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (77, 1, 'Généré', 'Auto', 214);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (78, 2, 'Généré', 'Auto', 215);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (79, 2, 'Généré', 'Auto', 216);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (80, 2, 'Généré', 'Auto', 218);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (81, 1, 'Généré', 'Auto', 219);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (82, 2, 'Généré', 'Auto', 220);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (83, 1, 'Généré', 'Auto', 226);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (84, 1, 'Généré', 'Auto', 231);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (85, 1, 'Généré', 'Auto', 232);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (86, 2, 'Généré', 'Auto', 234);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (87, 1, 'Généré', 'Auto', 236);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (88, 2, 'Généré', 'Auto', 239);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (89, 2, 'Généré', 'Auto', 240);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (90, 2, 'Généré', 'Auto', 242);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (91, 1, 'Généré', 'Auto', 243);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (92, 1, 'Généré', 'Auto', 248);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (93, 1, 'Généré', 'Auto', 252);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (94, 1, 'Généré', 'Auto', 259);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (95, 1, 'Généré', 'Auto', 260);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (96, 1, 'Généré', 'Auto', 261);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (97, 1, 'Généré', 'Auto', 263);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (98, 2, 'Généré', 'Auto', 265);
INSERT INTO Rang (idR, nom, type, libelle, idT) VALUES (99, 1, 'Généré', 'Auto', 267);

-- TITRE (dépend de TENRAC


INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (4, 3, 'Généré', 'Auto', 21);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (5, 2, 'Généré', 'Auto', 26);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (6, 2, 'Généré', 'Auto', 36);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (7, 1, 'Généré', 'Auto', 38);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (8, 2, 'Généré', 'Auto', 46);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (9, 2, 'Généré', 'Auto', 49);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (10, 1, 'Généré', 'Auto', 52);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (11, 1, 'Généré', 'Auto', 65);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (12, 3, 'Généré', 'Auto', 68);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (13, 3, 'Généré', 'Auto', 72);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (14, 3, 'Généré', 'Auto', 83);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (15, 3, 'Généré', 'Auto', 85);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (16, 2, 'Généré', 'Auto', 88);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (17, 1, 'Généré', 'Auto', 98);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (18, 1, 'Généré', 'Auto', 107);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (19, 1, 'Généré', 'Auto', 117);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (20, 1, 'Généré', 'Auto', 120);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (21, 2, 'Généré', 'Auto', 126);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (22, 2, 'Généré', 'Auto', 128);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (23, 3, 'Généré', 'Auto', 135);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (24, 3, 'Généré', 'Auto', 137);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (25, 3, 'Généré', 'Auto', 144);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (26, 2, 'Généré', 'Auto', 146);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (27, 2, 'Généré', 'Auto', 152);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (28, 3, 'Généré', 'Auto', 153);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (29, 1, 'Généré', 'Auto', 158);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (30, 2, 'Généré', 'Auto', 160);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (31, 2, 'Généré', 'Auto', 162);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (32, 3, 'Généré', 'Auto', 165);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (33, 1, 'Généré', 'Auto', 169);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (34, 1, 'Généré', 'Auto', 170);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (35, 1, 'Généré', 'Auto', 173);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (36, 1, 'Généré', 'Auto', 180);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (37, 2, 'Généré', 'Auto', 183);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (38, 1, 'Généré', 'Auto', 187);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (39, 3, 'Généré', 'Auto', 197);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (40, 1, 'Généré', 'Auto', 201);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (41, 1, 'Généré', 'Auto', 203);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (42, 2, 'Généré', 'Auto', 214);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (43, 2, 'Généré', 'Auto', 215);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (44, 2, 'Généré', 'Auto', 218);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (45, 2, 'Généré', 'Auto', 219);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (46, 3, 'Généré', 'Auto', 226);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (47, 1, 'Généré', 'Auto', 231);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (48, 2, 'Généré', 'Auto', 232);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (49, 1, 'Généré', 'Auto', 234);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (50, 3, 'Généré', 'Auto', 239);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (51, 3, 'Généré', 'Auto', 240);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (52, 1, 'Généré', 'Auto', 242);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (53, 2, 'Généré', 'Auto', 243);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (54, 3, 'Généré', 'Auto', 252);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (55, 1, 'Généré', 'Auto', 260);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (56, 3, 'Généré', 'Auto', 261);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (57, 2, 'Généré', 'Auto', 263);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (58, 1, 'Généré', 'Auto', 265);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (59, 2, 'Généré', 'Auto', 270);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (60, 1, 'Généré', 'Auto', 272);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (61, 3, 'Généré', 'Auto', 275);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (62, 1, 'Généré', 'Auto', 277);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (63, 2, 'Généré', 'Auto', 280);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (64, 1, 'Généré', 'Auto', 281);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (65, 3, 'Généré', 'Auto', 283);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (66, 1, 'Généré', 'Auto', 285);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (67, 3, 'Généré', 'Auto', 287);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (68, 1, 'Généré', 'Auto', 295);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (69, 3, 'Généré', 'Auto', 307);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (70, 3, 'Généré', 'Auto', 308);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (71, 3, 'Généré', 'Auto', 310);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (72, 2, 'Généré', 'Auto', 313);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (73, 1, 'Généré', 'Auto', 320);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (74, 2, 'Généré', 'Auto', 321);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (75, 2, 'Généré', 'Auto', 322);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (76, 1, 'Généré', 'Auto', 331);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (77, 1, 'Généré', 'Auto', 335);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (78, 2, 'Généré', 'Auto', 338);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (79, 3, 'Généré', 'Auto', 339);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (80, 2, 'Généré', 'Auto', 343);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (81, 2, 'Généré', 'Auto', 355);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (82, 3, 'Généré', 'Auto', 359);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (83, 3, 'Généré', 'Auto', 364);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (84, 3, 'Généré', 'Auto', 370);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (85, 3, 'Généré', 'Auto', 378);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (86, 1, 'Généré', 'Auto', 382);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (87, 1, 'Généré', 'Auto', 387);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (88, 3, 'Généré', 'Auto', 393);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (89, 3, 'Généré', 'Auto', 400);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (90, 3, 'Généré', 'Auto', 401);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (91, 2, 'Généré', 'Auto', 409);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (92, 1, 'Généré', 'Auto', 411);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (93, 3, 'Généré', 'Auto', 413);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (94, 3, 'Généré', 'Auto', 418);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (95, 2, 'Généré', 'Auto', 419);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (96, 3, 'Généré', 'Auto', 423);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (97, 1, 'Généré', 'Auto', 428);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (98, 1, 'Généré', 'Auto', 429);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (99, 1, 'Généré', 'Auto', 434);
INSERT INTO Titre (idTi, nom, type, libelle, idT) VALUES (100, 3, 'Généré', 'Auto', 436);


-- DIGNITE (dépend de TENRAC)


-- GROUPE_TENRAC (dépend de TENRAC)


-- REPAS (dépend de MACHINE)

INSERT INTO Repas (idR, nomPlat, idM) VALUES (21, 'Raclette des Chevaliers #21', 2);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (22, 'Raclette Fusion #22', 5);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (23, 'Raclette Tradition #23', 6);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (24, 'Raclette Fusion #24', 20);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (25, 'Raclette des Chevaliers #25', 4);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (26, 'Raclette Ultime #26', 16);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (27, 'Raclette Festive #27', 17);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (28, 'Raclette Ultime #28', 20);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (29, 'Raclette Cérémoniale #29', 6);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (30, 'Raclette Fusion #30', 2);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (31, 'Raclette Secrète #31', 15);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (32, 'Raclette des Chevaliers #32', 5);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (33, 'Raclette Ultime #33', 2);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (34, 'Raclette Tradition #34', 13);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (35, 'Raclette Gourmande #35', 10);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (36, 'Raclette Tradition #36', 1);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (37, 'Raclette Cérémoniale #37', 14);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (38, 'Raclette Festive #38', 9);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (39, 'Raclette Festive #39', 11);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (40, 'Raclette Grand Maître #40', 12);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (41, 'Raclette Gourmande #41', 5);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (42, 'Raclette Gourmande #42', 13);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (43, 'Raclette Tradition #43', 9);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (44, 'Raclette Légendaire #44', 20);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (45, 'Raclette Festive #45', 19);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (46, 'Raclette Gourmande #46', 19);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (47, 'Raclette Festive #47', 14);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (48, 'Raclette Cérémoniale #48', 19);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (49, 'Raclette Gourmande #49', 12);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (50, 'Raclette Prestige #50', 10);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (51, 'Raclette Secrète #51', 11);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (52, 'Raclette Cérémoniale #52', 17);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (53, 'Raclette Spéciale #53', 18);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (54, 'Raclette Fusion #54', 18);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (55, 'Raclette Gourmande #55', 1);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (56, 'Raclette des Chevaliers #56', 20);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (57, 'Raclette Fusion #57', 4);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (58, 'Raclette Prestige #58', 15);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (59, 'Raclette Express #59', 1);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (60, 'Raclette Royale #60', 5);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (61, 'Raclette Ultime #61', 2);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (62, 'Raclette du Chef #62', 2);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (63, 'Raclette Spéciale #63', 14);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (64, 'Raclette Ultime #64', 17);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (65, 'Raclette du Chef #65', 8);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (66, 'Raclette Grand Maître #66', 13);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (67, 'Raclette Légendaire #67', 4);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (68, 'Raclette Festive #68', 3);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (69, 'Raclette Grand Maître #69', 6);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (70, 'Raclette Cérémoniale #70', 20);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (71, 'Raclette Ultime #71', 15);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (72, 'Raclette Express #72', 11);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (73, 'Raclette Royale #73', 1);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (74, 'Raclette Spéciale #74', 1);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (75, 'Raclette Fusion #75', 14);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (76, 'Raclette Royale #76', 1);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (77, 'Raclette Express #77', 1);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (78, 'Raclette Prestige #78', 3);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (79, 'Raclette Ultime #79', 3);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (80, 'Raclette Gourmande #80', 20);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (81, 'Raclette Ultime #81', 13);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (82, 'Raclette Fusion #82', 2);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (83, 'Raclette Festive #83', 18);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (84, 'Raclette Secrète #84', 11);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (85, 'Raclette Royale #85', 4);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (86, 'Raclette Gourmande #86', 13);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (87, 'Raclette Fusion #87', 13);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (88, 'Raclette Express #88', 17);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (89, 'Raclette Secrète #89', 16);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (90, 'Raclette du Chef #90', 3);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (91, 'Raclette Fusion #91', 9);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (92, 'Raclette des Chevaliers #92', 3);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (93, 'Raclette Tradition #93', 19);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (94, 'Raclette Express #94', 7);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (95, 'Raclette Ultime #95', 20);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (96, 'Raclette Tradition #96', 5);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (97, 'Raclette Tradition #97', 7);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (98, 'Raclette du Chef #98', 16);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (99, 'Raclette Festive #99', 19);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (100, 'Raclette du Chef #100', 10);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (101, 'Raclette Cérémoniale #101', 1);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (102, 'Raclette Ultime #102', 18);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (103, 'Raclette du Chef #103', 20);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (104, 'Raclette Express #104', 10);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (105, 'Raclette Cérémoniale #105', 16);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (106, 'Raclette Cérémoniale #106', 11);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (107, 'Raclette Express #107', 12);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (108, 'Raclette Royale #108', 7);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (109, 'Raclette Gourmande #109', 19);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (110, 'Raclette Royale #110', 4);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (111, 'Raclette Tradition #111', 5);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (112, 'Raclette Express #112', 6);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (113, 'Raclette Cérémoniale #113', 4);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (114, 'Raclette Ultime #114', 9);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (115, 'Raclette Spéciale #115', 13);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (116, 'Raclette Légendaire #116', 19);
INSERT INTO Repas (idR, nomPlat, idM) VALUES (117, 'Raclette Légendaire #117', 1);


-- RESTAURANT (dépend de CUISINIER)