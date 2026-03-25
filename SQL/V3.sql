-- V3.0.0

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

PROMPT "Insertions des données de la table Ordre_tenrac";

-- ORDRE_TENRAC
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (5, 'Le Temple du Croustillant', '1 bis Rue du Seau', 'Strasbourg', 'Régional', 67000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (6, 'Confrérie du Poêlon Sacré', '42 Route de la Combe', 'Chambéry', 'Départemental', 73000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (7, 'Ordre Intergalactique du Tender', 'Station Orbitale Alpha', 'Cayenne', 'International', 97300);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (8, 'Cercle des Amateurs de Croûte', '9 Impasse des Fromagers', 'Lille', 'Local', 59000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (9, 'Secte de la Panure Dorée', '666 Chemin de l''Épice', 'Nîmes', 'Occulte', 30000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (10, 'Ligue de la Pomme de Terre Vapeur', '12 Avenue du Tubercule', 'Noirmoutier', 'Thématique', 85330);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (11, 'Union des Gratinés de l''Ouest', '7 Quai des Brumes', 'Brest', 'Régional', 29200);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (12, 'Ordre de la Flamme et du Fromage', '30 Rue du Brasier', 'Clermont-Ferrand', 'National', 63000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (13, 'Les Chevaliers du Haut-Plateau', '1 Place de la Meule', 'Aurillac', 'Traditionnel', 15000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (14, 'Sanctuaire du Poulet Suprême', '77 Boulevard de l''Aile', 'Meaux', 'Religieux', 77100);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (15, 'Alliance du Cheddar et du Tender', '101 Highway Street', 'Dijon', 'Hybride', 21000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (16, 'Ordre Royal de la Fondue Nomade', '5 Rue du Voyageur', 'Perpignan', 'Itinérant', 66000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (17, 'Le Directoire du Gras Noble', '18 Rue de la Bourse', 'Bordeaux', 'Aristocratique', 33000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (18, 'Cénacle de la Sauce Blanche', '3 Allée des Condiments', 'Tours', 'Gastronomique', 37000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (19, 'Fraternité du Reblochon Libre', '22 Chemin des Alpages', 'Thonon-les-Bains', 'Militant', 74200);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (20, 'Garde Prétorienne du Tender Epicé', '1 Place d''Armes', 'Metz', 'Militaire', 57000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (21, 'L''Empire de la Raclette Fumée', '88 Rue du Charbon', 'Saint-Étienne', 'Industriel', 42000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (22, 'Ordre Mystique du Filet de Poulet', '9 bis Passage Secret', 'Rouen', 'Ésotérique', 76000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (23, 'Souveraineté de la Croûte de Lait', '14 Rue de la Ferme', 'Besançon', 'Régional', 25000);
INSERT INTO ORDRE_TENRAC (idOT, nom, adresse, ville, type, codePostale) VALUES (24, 'Fédération des Tenders Sans Frontières', '50 Avenue de l''Europe', 'Bruxelles', 'Diplomatique', 99000);

-- CLUB_TENRAC
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (5, 'Cercle de la Pomme de Terre', '22 Rue du Champ', 'Local', 'Grenoble', 'Isère');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (6, 'Bastion du Tender Épicé', '45 Avenue du Piment', 'Régional', 'Bordeaux', 'Sud-Ouest');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (7, 'Amicale du Reblochon Coulant', '12 Route des Alpes', 'Départemental', 'Annecy', 'Haute-Savoie');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (8, 'Ligue des Gratinés Bretons', '8 Quai de la Marine', 'Local', 'Brest', 'Bretagne');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (9, 'Club des Tenders de l''Est', '30 Rue des Vosges', 'Régional', 'Strasbourg', 'Grand Est');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (10, 'Le Poêlon Normand', '5 Rue du Beurre', 'Local', 'Caen', 'Normandie');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (11, 'Escadron de la Panure Dorée', '19 Rue Militaire', 'National', 'Paris', 'Île-de-France');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (12, 'Alliance Raclette Centrale', '3 Place du Marché', 'Régional', 'Tours', 'Centre-Val de Loire');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (13, 'Confrérie du Seau de Tenders', '7 Boulevard Maritime', 'Local', 'Nantes', 'Pays de la Loire');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (14, 'Sanctuaire de la Tomme', '2 Chemin de la Montagne', 'Local', 'Chambéry', 'Savoie');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (15, 'Club Outre-mer Tenrac', '10 Rue des Cocotiers', 'International', 'Fort-de-France', 'Martinique');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (16, 'L''Avant-Garde du Fromage', '55 Rue de la Liberté', 'Régional', 'Dijon', 'Bourgogne');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (17, 'Cénacle du Poulet Croustillant', '14 Rue de l''Université', 'Local', 'Montpellier', 'Occitanie');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (18, 'La Guilde des Poêlons Nomades', 'Variable - Camping Car', 'Itinérant', 'Limoges', 'Limousin');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (19, 'Club Tenrac Corse', '22 Cours Napoléon', 'Départemental', 'Ajaccio', 'Corse');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (20, 'Cercle des Tenders du Nord-Est', '9 Rue de la Paix', 'Régional', 'Reims', 'Champagne');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (21, 'Ligue de la Raclette des Volcans', '4 Rue de la Lave', 'Local', 'Clermont-Ferrand', 'Auvergne');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (22, 'Le Hangar du Croustillant', 'Zone Industrielle Nord', 'Local', 'Amiens', 'Picardie');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (23, 'Club de la Meule Sacrée', '18 Rue du Commerce', 'Régional', 'Besançon', 'Franche-Comté');
INSERT INTO CLUB_TENRAC (idCT, nom, adresse, type, ville, territoire) VALUES (24, 'Union des Tenders Azuréens', '10 Promenade des Anglais', 'Local', 'Nice', 'Provence-Alpes-Côte d''Azur');

-- PLAT
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (3, 'Bucket de l''Apocalypse', 'Partage', '30 tenders épicés et 1kg de frites');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (4, 'Raclette des Alpages', 'Principal', 'Fromage au lait cru et charcuterie fine');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (5, 'Le Solitaire du Gril', 'Solo', 'Tender géant de 400g avec sa sauce secrète');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (6, 'Duo Fondant-Croustillant', 'Dégustation', 'Mélange de mini-tenders trempés dans la raclette');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (7, 'Salade Tenrac Light', 'Entrée', 'Trois malheureux tenders sur un lit de salade');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (8, 'La Montagnarde Puriste', 'Principal', 'Pommes de terre, fromage, et rien d''autre');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (9, 'Tender de la Mer', 'Poisson', 'Filet de cabillaud pané façon Tenrac');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (10, 'Raclette Truffée', 'Luxe', 'Fromage à la truffe noire du Périgord');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (11, 'Le Burger du Commandeur', 'Sandwich', 'Double tender, raclette coulante et oignons frits');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (12, 'Wrap Tenracien', 'Snack', 'Tenders roulés dans une galette au fromage');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (13, 'Poutine façon Tenrac', 'Spécialité', 'Frites, sauce brune et morceaux de tenders');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (14, 'Le Plateau du Berger', 'Apéritif', 'Assortiment de cubes de fromage et nuggets');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (15, 'Tender Veggie Mystère', 'Végétarien', 'Substitut de poulet ultra croustillant');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (16, 'Raclette Fumée au Hêtre', 'Principal', 'Fromage fumé traditionnellement');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (17, 'Le Volcan de Fromage', 'Enfant', 'Purée en puits remplie de raclette fondue');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (18, 'Brochette Tenrac', 'Grillade', 'Alternance de tenders et poivrons grillés');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (19, 'La Box Croisade', 'Éphémère', 'Menu spécial avec jouet de collection Tenrac');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (20, 'Tender Sucré-Salé', 'Exotique', 'Poulet frit au miel et sésame');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (21, 'Raclette au Poivre Vert', 'Épicé', 'Meule de caractère aux grains de poivre');
INSERT INTO PLAT (idP, nom, type, libelle) VALUES (22, 'Le "Juste un Morceau"', 'Mini', 'Un seul tender pour les petites faims');

-- ALIMENT
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (5, 'Charcuterie', 'Jambon de Savoie', 'Grande');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (6, 'Charcuterie', 'Bacon fumé', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (7, 'Légume', 'Cornichon extra-fin', 'Petite');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (8, 'Fromage', 'Reblochon', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (9, 'Épice', 'Piment de la Jamaïque', 'Petite');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (10, 'Légume', 'Oignon rouge', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (11, 'Viande', 'Filet de Dinde', 'Grande');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (12, 'Fromage', 'Cheddar Vintage', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (13, 'Condiment', 'Poivre de Sichuan', 'Petite');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (14, 'Légume', 'Poivron grillé', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (15, 'Charcuterie', 'Chorizo Ibérique', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (16, 'Fromage', 'Morbier', 'Grande');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (17, 'Féculent', 'Farine de Blé', 'Grande');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (18, 'Divers', 'Œuf de plein air', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (19, 'Légume', 'Brocoli vapeur', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (20, 'Condiment', 'Ciboulette fraîche', 'Petite');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (21, 'Fromage', 'Gorgonzola', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (22, 'Charcuterie', 'Grison', 'Petite');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (23, 'Viande', 'Canard (Tender de luxe)', 'Moyenne');
INSERT INTO ALIMENT (idAli, type, nom, taille) VALUES (24, 'Divers', 'Chapelure Panko', 'Grande');

-- ALLERGIE
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (3, 'Arachide', 'Choc anaphylactique');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (4, 'Moutarde', 'Urticaire et démangeaisons');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (5, 'Sésame', 'Gonflement des lèvres');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (6, 'fromage', 'Éruptions cutanées');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (7, 'Céleri', 'Difficultés respiratoires');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (8, 'Sulfites', 'Maux de tête violents');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (9, 'Soja', 'Picotements dans la bouche');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (10, 'Poivre', 'Éternuements chroniques');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (11, 'Lupin', 'Rougeurs diffuses');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (12, 'Noix de cajou', 'Œdème de Quincke');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (13, 'Fromage', 'Nausées et vertiges');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (14, 'Paprika', 'Brûlures d''estomac');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (15, 'Poisson', 'Douleurs abdominales');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (16, 'Maïs', 'Ballonnements');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (17, 'Levure', 'Fatigue intense');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (18, 'Coriandre', 'Goût de savon et rejet');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (19, 'Fomage', 'Irritation des muqueuses');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (20, 'Noisette', 'Démangeaisons de la gorge');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (21, 'Lait de chèvre', 'Crampes d''estomac');
INSERT INTO ALLERGIE (idAll, nom, effet) VALUES (22, 'Colorant E120', 'Réaction allergique rare');

-- SAUCE
INSERT INTO SAUCE (idS, type, nom) VALUES (1, 'Froide', 'Sauce Blanche Tenrac');
INSERT INTO SAUCE (idS, type, nom) VALUES (2, 'Chaude', 'Sauce Barbecue Sacrée');

-- MACHINE
INSERT INTO MACHINE (idM, nom, modele, prix) VALUES (1, 'Gril Tenrac Pro', 'GT-3000', '599');
INSERT INTO MACHINE (idM, nom, modele, prix) VALUES (2, 'Appareil Raclette Elite', 'RE-500', '349');

-- CERTIFICAT
INSERT INTO CERTIFICAT (idM, nom, type, dateDep, dateFin) VALUES (1, 'Certificat Sécurité Gril', 'Sécurité', TO_DATE('2024-01-01','YYYY-MM-DD'), '2026-01-01');
INSERT INTO CERTIFICAT (idM, nom, type, dateDep, dateFin) VALUES (2, 'Certificat Conformité Raclette', 'Conformité', TO_DATE('2023-06-15','YYYY-MM-DD'), '2025-06-15');

-- HISTORIQUE
INSERT INTO HISTORIQUE (idH, dateEntretient, nomClub) VALUES (1, TO_DATE('2024-03-10','YYYY-MM-DD'), 'Club Tender Nord');
INSERT INTO HISTORIQUE (idH, dateEntretient, nomClub) VALUES (2, TO_DATE('2024-07-22','YYYY-MM-DD'), 'Club Raclette Sud');

-- REGISTRE
INSERT INTO REGISTRE (idReg, status, periodicite, idH) VALUES (1, 'Actif', TIMESTAMP '2024-03-10 10:00:00 +01:00', 1);
INSERT INTO REGISTRE (idReg, status, periodicite, idH) VALUES (2, 'Archivé', TIMESTAMP '2024-07-22 14:00:00 +01:00', 2);

-- CUISINIER
INSERT INTO CUISINIER (idCu, nom, prenom, age, adresse) VALUES (1, 'Dupont', 'Jean', '42', '10 Rue du Four, Paris');
INSERT INTO CUISINIER (idCu, nom, prenom, age, adresse) VALUES (2, 'Martin', 'Sophie', '35', '7 Allée du Gril, Lyon');

-- ORGANISME
INSERT INTO ORGANISME (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (1, 'Tenrac Corp', 'Association', '1 Place du Tender', 'Paris', 75000, 12345678901234.00);
INSERT INTO ORGANISME (idOA, nomEntreprise, type, adresse, ville, codePostale, siret) VALUES (2, 'Raclette & Co', 'Entreprise', '9 Rue Fondue', 'Grenoble', 38000, 98765432109876.00);

-- INGREDIENT (dépend de ALIMENT, idAli 3 = Ail)
INSERT INTO INGREDIENT (idAli, type, libelle, nom) VALUES (3, 'Aromatique', 'Utilisé en condiment', 'Ail');

-- FABRIQUANT
INSERT INTO FABRIQUANT (idF, nom, prenom, adresse, codePostale, ville) VALUES (1, 'Grillex', 'Industries', '20 Zone Industrielle', 13000, 'Marseille');
INSERT INTO FABRIQUANT (idF, nom, prenom, adresse, codePostale, ville) VALUES (2, 'FondueFactory', 'SAS', '5 Rue de la Fonte', 69000, 'Lyon');

-- RACLETTE
INSERT INTO RACLETTE (idRa, type, libelle) VALUES (1, 'Traditionnelle', 'Raclette au fromage de montagne');
INSERT INTO RACLETTE (idRa, type, libelle) VALUES (2, 'Fumée', 'Raclette au fromage fumé');

-- LEGUME (dépend de ALIMENT, idAli 2 = Pomme de terre)
INSERT INTO LEGUME (idAli, type, nom, _taille) VALUES (2, 'Tubercule', 'Pomme de terre', 'Moyenne');

-- ENTRETIEN
INSERT INTO ENTRETIEN (idEn, dateEntretien) VALUES (1.00, TO_DATE('2024-04-15','YYYY-MM-DD'));
INSERT INTO ENTRETIEN (idEn, dateEntretien) VALUES (2.00, TO_DATE('2024-09-01','YYYY-MM-DD'));

-- CROYANCE (dépend de ALIMENT)
INSERT INTO CROYANCE (idCr, dieuTenrac, dieuDesTenders, dieuDeLaRaclette, dieuDesLegumes, idAli) VALUES (1, 'Le Grand Tenrac', 'Tenderion', 'Raclos', 'Vegetus', 2);
INSERT INTO CROYANCE (idCr, dieuTenrac, dieuDesTenders, dieuDeLaRaclette, dieuDesLegumes, idAli) VALUES (2, 'Le Suprême', 'Croustillon', 'Fromagon', 'Légumiel', 1);

-- OPPOSITION_DE_CONVICTION_PERSONNELLE (dépend de ALIMENT)
INSERT INTO OPPOSITION_DE_CONVICTION_PERSONNELLE (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (1, 'Anti-Gril', 'Pro-Vapeur', 'Conflit Sauce vs Fromage', 1);
INSERT INTO OPPOSITION_DE_CONVICTION_PERSONNELLE (idOCP, politique, ethnique, chocDesCultures, idAli) VALUES (2, 'Pro-Fondue', 'Anti-Tender', 'Guerre Raclette vs BBQ', 2);

-- CROISADE
INSERT INTO CROISADE (idCro, duree, dateDep, nom, dateFin, type) VALUES (1, TIMESTAMP '0001-00-00 07:00:00', TO_DATE('2024-05-01','YYYY-MM-DD'), 'Croisade du Tender Sacré', TO_DATE('2024-05-15','YYYY-MM-DD'), 'Culinaire');
INSERT INTO CROISADE (idCro, duree, dateDep, nom, dateFin, type) VALUES (2, TIMESTAMP '0000-00-00 05:00:00', TO_DATE('2024-08-10','YYYY-MM-DD'), 'Croisade de la Raclette', TO_DATE('2024-08-17','YYYY-MM-DD'), 'Gastronomique');


-- GRADE (dépend de TENRAC)
INSERT INTO GRADE (idG, nom, type, libelle, idT) VALUES (1, 'Maître Tender', 'Culinaire', 'Expert en préparation de tenders', 1);
INSERT INTO GRADE (idG, nom, type, libelle, idT) VALUES (2, 'Chevalier Raclette', 'Honorifique', 'Défenseur de la raclette', 2);

-- RANG (dépend de TENRAC)
INSERT INTO RANG (idR, nom, type, libelle, idT) VALUES (1, 'Premier Rang', 'Hiérarchique', 'Rang suprême du club', 1);
INSERT INTO RANG (idR, nom, type, libelle, idT) VALUES (2, 'Deuxième Rang', 'Hiérarchique', 'Rang intermédiaire', 2);

-- TITRE (dépend de TENRAC)
INSERT INTO TITRE (idT, nom, type, libelle, idT_1) VALUES (1, 'Grand Maître', 'Honorifique', 'Titre suprême', 1);
INSERT INTO TITRE (idT, nom, type, libelle, idT_1) VALUES (2, 'Commandeur', 'Honorifique', 'Titre de commandement', 2);

-- DIGNITE (dépend de TENRAC)
INSERT INTO DIGNITE (idD, nom, type, libelle, idT) VALUES (1, 'Dignitaire Tender', 'Culinaire', 'Haute dignité culinaire', 1);
INSERT INTO DIGNITE (idD, nom, type, libelle, idT) VALUES (2, 'Gardien de la Raclette', 'Traditionnel', 'Protecteur des traditions', 2);

INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (21, 200021, 300021, 2214, 42158631803108, 'Gaudin');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (22, 200022, 300022, 2213, 58681218369759, 'Jacquot S.A.');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (23, 200023, 300023, 3242, 94401820063064, 'Potier S.A.R.L.');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (24, 200024, 300024, 1232, 15022160438704, 'Camus S.A.S.');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (25, 200025, 300025, 2215, 62158466132518, 'Petit');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (26, 200026, 300026, 4231, 82624709091551, 'Renault Da Costa S.A.R.L.');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (27, 200027, 300027, 2215, 86707200126905, 'Adam');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (28, 200028, 300028, 2214, 35195618195940, 'Royer');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (29, 200029, 300029, 2215, 23712669851077, 'Pottier');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (30, 200030, 300030, 3242, 94037650300714, 'Bègue');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (31, 200031, 300031, 1423, 93930559065046, 'Garnier SARL');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (32, 200032, 300032, 4231, 28195694817576, 'Dias');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (33, 200033, 300033, 1232, 83498396148063, 'Raynaud');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (34, 200034, 300034, 4142, 77987772727510, 'Aubry');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (35, 200035, 300035, 3242, 94250910796693, 'Pelletier Lecomte SARL');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (36, 200036, 300036, 3242, 51675916325866, 'Clément');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (37, 200037, 300037, 4124, 39329365342528, 'Rousseau');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (38, 200038, 300038, 4231, 80499170417340, 'Perrin S.A.R.L.');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (39, 200039, 300039, 4142, 25320132199645, 'Poirier');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (40, 200040, 300040, 2216, 54093656999595, 'Gay');
INSERT INTO Carte_Membre (idT, RFID, numCode, numClub, numSIRET, raisonSociale) VALUES (41, 200041, 300041, 2212, 27046643811118, 'Cousin Thomas S.A.');

-- GROUPE_TENRAC (dépend de TENRAC)
INSERT INTO GROUPE_TENRAC (idT, dateInscription, adressePartenaire) VALUES (1, TO_DATE('2023-09-01','YYYY-MM-DD'), '1 Rue Partenaire, Paris');
INSERT INTO GROUPE_TENRAC (idT, dateInscription, adressePartenaire) VALUES (2, TO_DATE('2023-11-15','YYYY-MM-DD'), '5 Avenue Alliance, Lyon');

-- REPAS (dépend de MACHINE)
INSERT INTO REPAS (idR, nomPlat, idM) VALUES (1, 'Repas Tender Festif', 1);
INSERT INTO REPAS (idR, nomPlat, idM) VALUES (2, 'Repas Raclette Convivial', 2);

-- RESTAURANT (dépend de CUISINIER)
INSERT INTO RESTAURANT (idRe, nom, ville, adresse, type, lieu, idCu) VALUES (1, 'Le Tender Sacré', 'Paris', '3 Place du Gril', 'Gastronomique', 'Centre-ville', 1);
INSERT INTO RESTAURANT (idRe, nom, ville, adresse, type, lieu, idCu) VALUES (2, 'La Raclette d''Or', 'Lyon', '11 Rue Fondue', 'Traditionnel', 'Vieux-Lyon', 2);

-- EST_COMPOSE_DE (REPAS x PLAT)
INSERT INTO EST_COMPOSE_DE (idR, idP) VALUES (1, 1);
INSERT INTO EST_COMPOSE_DE (idR, idP) VALUES (2, 2);

-- EST_CONSTITUE (REPAS x RACLETTE)
INSERT INTO EST_CONSTITUE (idR, idRa) VALUES (2, 1);
INSERT INTO EST_CONSTITUE (idR, idRa) VALUES (2, 2);

-- PROVOQUE (ALIMENT x ALLERGIE)
INSERT INTO PROVOQUE (idAli, idAll) VALUES (4, 1); -- Fromage -> Lactose
INSERT INTO PROVOQUE (idAli, idAll) VALUES (1, 2); -- Poulet pané -> Gluten

-- EST_ACCOMPAGNE_DE (PLAT x SAUCE)
INSERT INTO EST_ACCOMPAGNE_DE (idP, idS) VALUES (1, 1);
INSERT INTO EST_ACCOMPAGNE_DE (idP, idS) VALUES (2, 2);

-- COMMANDE (GROUPE_TENRAC x REPAS)
INSERT INTO COMMANDE (idT, idR) VALUES (1, 1);
INSERT INTO COMMANDE (idT, idR) VALUES (2, 2);

-- FEDERE (ORDRE_TENRAC x CLUB_TENRAC)
INSERT INTO FEDERE (idOT, idCT) VALUES (1, 1);
INSERT INTO FEDERE (idOT, idCT) VALUES (2, 2);

-- VALIDE (TENRAC x MACHINE)
INSERT INTO VALIDE (idT, idM) VALUES (1, 1);
INSERT INTO VALIDE (idT, idM) VALUES (2, 2);

-- A (CERTIFICAT x HISTORIQUE)
INSERT INTO A (idM, idH) VALUES (1, 1);
INSERT INTO A (idM, idH) VALUES (2, 2);

-- EST_CONSIGNE_DANS (MACHINE x REGISTRE)
INSERT INTO EST_CONSIGNE_DANS (idM, idReg) VALUES (1, 1);
INSERT INTO EST_CONSIGNE_DANS (idM, idReg) VALUES (2, 2);

-- SERT (REPAS x CUISINIER)
INSERT INTO SERT (idR, idCu) VALUES (1, 1);
INSERT INTO SERT (idR, idCu) VALUES (2, 2);

-- FAIT (MACHINE x ENTRETIEN)
INSERT INTO FAIT (idM, idEn) VALUES (1, 1.00);
INSERT INTO FAIT (idM, idEn) VALUES (2, 2.00);

-- EST_UN_ASSEMBLAGE (SAUCE x INGREDIENT)
INSERT INTO EST_UN_ASSEMBLAGE (idS, idAli) VALUES (1, 3); -- Sauce Blanche -> Ail
INSERT INTO EST_UN_ASSEMBLAGE (idS, idAli) VALUES (2, 3);

-- EST_FABRIQUE (MACHINE x FABRIQUANT)
INSERT INTO EST_FABRIQUE (idM, idF) VALUES (1, 1);
INSERT INTO EST_FABRIQUE (idM, idF) VALUES (2, 2);

-- INSERT INTO Amene_A (21 lignes)
-- Colonnes : idCr, idOCP
INSERT INTO Amene_A (idCr, idOCP) VALUES (1, 7);
INSERT INTO Amene_A (idCr, idOCP) VALUES (2, 20);
INSERT INTO Amene_A (idCr, idOCP) VALUES (2, 1);
INSERT INTO Amene_A (idCr, idOCP) VALUES (3, 9);
INSERT INTO Amene_A (idCr, idOCP) VALUES (4, 13);
INSERT INTO Amene_A (idCr, idOCP) VALUES (4, 5);
INSERT INTO Amene_A (idCr, idOCP) VALUES (4, 2);
INSERT INTO Amene_A (idCr, idOCP) VALUES (5, 19);
INSERT INTO Amene_A (idCr, idOCP) VALUES (6, 13);
INSERT INTO Amene_A (idCr, idOCP) VALUES (6, 7);
INSERT INTO Amene_A (idCr, idOCP) VALUES (7, 13);
INSERT INTO Amene_A (idCr, idOCP) VALUES (8, 17);
INSERT INTO Amene_A (idCr, idOCP) VALUES (8, 5);
INSERT INTO Amene_A (idCr, idOCP) VALUES (8, 3);
INSERT INTO Amene_A (idCr, idOCP) VALUES (9, 9);
INSERT INTO Amene_A (idCr, idOCP) VALUES (10, 3);
INSERT INTO Amene_A (idCr, idOCP) VALUES (10, 15);
INSERT INTO Amene_A (idCr, idOCP) VALUES (10, 17);
INSERT INTO Amene_A (idCr, idOCP) VALUES (11, 13);
INSERT INTO Amene_A (idCr, idOCP) VALUES (12, 17);
INSERT INTO Amene_A (idCr, idOCP) VALUES (13, 7);

-- ENGENDRE (OPPOSITION x CROISADE)
INSERT INTO ENGENDRE (idOCP, idCro) VALUES (1, 1);
INSERT INTO ENGENDRE (idOCP, idCro) VALUES (2, 2);

-- POSSEDE (ORDRE_TENRAC x CLUB_TENRAC x MACHINE)
INSERT INTO POSSEDE (idOT, idCT, idM) VALUES (1, 1, 1);
INSERT INTO POSSEDE (idOT, idCT, idM) VALUES (2, 2, 2);


PROMPT "Fin de la création de la base de données Voyages";