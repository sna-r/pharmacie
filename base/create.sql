-- ** 07 / 01 / 2025
CREATE DATABASE pharmacie;
\c pharmacie;


-- ** function custom sequence
CREATE OR REPLACE FUNCTION public.custom_seq(in_prefix character varying, in_sequence_name character varying, in_digit_count integer)
    RETURNS character varying
    LANGUAGE plpgsql
    AS $function$
    DECLARE
        seq_value INT;
        result VARCHAR;
    BEGIN
        EXECUTE 'SELECT nextval(''' || in_sequence_name || '''::regclass)' INTO seq_value;
        result := in_prefix || LPAD(seq_value::TEXT, in_digit_count, '0');
    RETURN result;
    END;
    $function$;

-- ** SEQUENCE ** -----------------------------
CREATE SEQUENCE seq_type;
CREATE SEQUENCE seq_categorie;
CREATE SEQUENCE seq_maladie;
CREATE SEQUENCE seq_fournisseur;
CREATE SEQUENCE seq_produit;
CREATE SEQUENCE seq_produit_categorie;
CREATE SEQUENCE seq_produit_maladie;
CREATE SEQUENCE seq_maladie_symptome;
CREATE SEQUENCE seq_symptome;
-- ** TABLES ** --------------------------------
CREATE TABLE types(
    id_type VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'TYP' :: character varying,
        'seq_type' :: character varying,
        4
    ) NOT NULL,
    nom VARCHAR(255) NOT NULL
);
CREATE TABLE categorie(
    id_categorie VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'CAT' :: character varying,
        'seq_categorie' :: character varying,
        4
    ) NOT NULL,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE maladie(
    id_maladie VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'MAL' :: character varying,
        'seq_maladie' :: character varying,
        4
    ) NOT NULL,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE fournisseur(
    id_fournisseur VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'FRN' :: character varying,
        'seq_fournisseur' :: character varying,
        4
    ) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL
);

CREATE TABLE produit(
    id_produit VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'PROD' :: character varying,
        'seq_produit' :: character varying,
        4
    ) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    id_types_fk VARCHAR REFERENCES types(id_type),
    notice VARCHAR(255) NOT NULL,
    expiration timestamp,
    id_fournisseur_fk VARCHAR REFERENCES fournisseur(id_fournisseur),
);

CREATE TABLE produit_maladie(
    id_produit_maladie VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'PM' :: character varying,
        'seq_produit_maladie' :: character varying,
        4
    ) NOT NULL,
    id_produit_fk VARCHAR REFERENCES produit(id_produit),
    id_maladie_fk VARCHAR REFERENCES maladie(id_maladie)
);

CREATE TABLE produit_categorie(
    id_produit_categorie VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'PC' :: character varying,
        'seq_produit_categorie' :: character varying,
        4
    ) NOT NULL,
    id_produit_fk VARCHAR REFERENCES produit(id_produit),
    id_categorie_fk VARCHAR REFERENCES categorie(id_categorie)
);
CREATE TABLE symptome(
    id_symptome VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'SYMP' :: character varying,
        'seq_symptome' :: character varying,
        4
    ) NOT NULL,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE maladie_symptome(
    id_maladie_symptome VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'MS' :: character varying,
        'seq_maladie_symptome' :: character varying,
        4
    ) NOT NULL,
    id_symptome_fk VARCHAR REFERENCES symptome(id_symptome),
    id_maladie_fk VARCHAR REFERENCES maladie(id_maladie)
);


-- ** 09 / 01 / 2025
ALTER TABLE produit ADD prix_unitaire double precision;

CREATE SEQUENCE seq_vente;
CREATE TABLE vente(
    id_vente VARCHAR PRIMARY KEY DEFAULT custom_seq(
        'MS' :: character varying,
        'seq_vente' :: character varying,
        4
    ) NOT NULL,
    id_produit_fk VARCHAR REFERENCES produit(id_produit),
    date_vente timestamp default CURRENT_TIMESTAMP,
    nombre int
);