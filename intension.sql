intension

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
   prix NUMBER(10,2),
   CONSTRAINT pk_Machine PRIMARY KEY(idM)
);

CREATE TABLE Certificat(
   idM NUMBER(10),
   nom VARCHAR2(50),
   type VARCHAR2(50),
   dateDep DATE,
   dateFin DATE,
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
   periodicite DATE,
   idH NUMBER(10) NOT NULL,
   CONSTRAINT pk_Registre PRIMARY KEY(idReg),
   CONSTRAINT fk_Registre_Historique FOREIGN KEY(idH) REFERENCES Historique(idH)
);


CREATE TABLE Cuisinier(
   idCu NUMBER(10),
   nom VARCHAR2(50),
   prenom VARCHAR2(50),
   age NUMBER(3),
   adresse VARCHAR2(80),
   CONSTRAINT pk_Cuisinier PRIMARY KEY(idCu)
);

CREATE TABLE Organisme(
   idOA NUMBER(10),
   nomEntreprise VARCHAR2(50),
   type VARCHAR2(50),
   adresse VARCHAR2(80),
   ville VARCHAR2(50),
   codePostale NUMBER(10),
   siret NUMBER(16,2) ,
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
   niveau VARCHAR2(50),
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
   age NUMBER(3),
   adresse VARCHAR2(50),
   courriel VARCHAR2(50),
   numTel VARCHAR2(15),
   adressePostale NUMBER(10),
   idCr NUMBER(10),
   idOA NUMBER(10),
   idOT NUMBER(10),
   idCT NUMBER(10),
   CONSTRAINT pk_Tenrac PRIMARY KEY(idT),
   CONSTRAINT fk_Tenrac_Croyance FOREIGN KEY(idCr) REFERENCES Croyance(idCr),
   CONSTRAINT fk_Tenrac_Organisme FOREIGN KEY(idOA) REFERENCES Organisme(idOA),
   CONSTRAINT fk_Tenrac_Ordre FOREIGN KEY(idOT) REFERENCES Ordre_Tenrac(idOT),
   CONSTRAINT fk_Tenrac_Club FOREIGN KEY(idCT) REFERENCES Club_Tenrac(idCT),
   CONSTRAINT ck_Tenrac_club_ou_ordre CHECK (
      (idOT IS NOT NULL AND idCT IS NULL)
      OR
      (idOT IS NULL AND idCT IS NOT NULL)
   )
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
