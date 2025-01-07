DELETE FROM produit_categorie;
DELETE FROM produit_maladie;
DELETE FROM produit;
DELETE FROM types;
DELETE FROM categorie;
DELETE FROM maladie_symptome;
DELETE FROM maladie;
DELETE FROM fournisseur;
DELETE FROM symptome;

ALTER SEQUENCE seq_type RESTART WITH 1;
ALTER SEQUENCE seq_categorie RESTART WITH 1;
ALTER SEQUENCE seq_produit RESTART WITH 1;
ALTER SEQUENCE seq_maladie RESTART WITH 1;
ALTER SEQUENCE seq_fournisseur RESTART WITH 1;
ALTER SEQUENCE seq_produit_categorie RESTART WITH 1;
ALTER SEQUENCE seq_produit_maladie RESTART WITH 1;
ALTER SEQUENCE seq_maladie_symptome RESTART WITH 1;
ALTER SEQUENCE seq_symptome RESTART WITH 1;
