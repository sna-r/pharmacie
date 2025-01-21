-- ** VIEW liste 
CREATE OR REPLACE VIEW v_produit_ctm AS
SELECT
    p.id_produit,
    p.id_types_fk,
    pc.id_categorie_fk,
    pm.id_maladie_fk,
    p.nom AS nom_produit,
    p.notice,
    t.nom AS nom_types,
    m.nom AS nom_maladie,
    c.nom AS nom_categorie
FROM
    produit AS p
JOIN produit_categorie AS pc ON p.id_produit = pc.id_produit_fk
JOIN produit_maladie AS pm ON p.id_produit = pm.id_produit_fk
JOIN maladie AS m ON pm.id_maladie_fk = m.id_maladie
JOIN types AS t ON t.id_type = p.id_types_fk
JOIN categorie AS c ON c.id_categorie = pc.id_categorie_fk;

-- ** View table
    -- maladie
CREATE OR REPLACE VIEW v_maladie AS
SELECT
    * 
FROM 
    maladie;

    -- types
CREATE OR REPLACE VIEW v_types AS
SELECT
    *
FROM
    types;

    -- categorie
CREATE OR REPLACE VIEW v_categorie AS
SELECT
    *
FROM
    categorie;


-- *** 09 / 01 / 2025
-- vente produit
-- general

CREATE OR REPLACE VIEW v_vente_produit AS 
SELECT
    p.id_produit,
    p.id_types_fk,
    pc.id_categorie_fk,
    p.nom AS nom_produit,
    t.nom AS nom_types,
    c.nom AS nom_categorie,
    v.nombre,
    (v.nombre*p.prix_unitaire) AS prix_totale
FROM
    produit AS p
    JOIN produit_categorie AS pc ON p.id_produit = pc.id_produit_fk
    JOIN types AS t ON t.id_type = p.id_types_fk
    JOIN categorie AS c ON c.id_categorie = pc.id_categorie_fk
    JOIN (SELECT
            id_produit_fk,
            SUM(nombre) AS nombre
        FROM
            vente
        WHERE date_vente >= '05-01-2025 00:00:00' and date_vente <= '13-01-2025 00:00:00'
        GROUP BY
            id_produit_fk) AS v ON v.id_produit_fk = p.id_produit;

-- detail 
CREATE
OR REPLACE VIEW v_vente_produit_detail AS
SELECT
    p.id_produit,
    p.id_types_fk,
    pc.id_categorie_fk,
    p.nom AS nom_produit,
    t.nom AS nom_types,
    c.nom AS nom_categorie,
    v.nombre,
    v.date_vente,
    (v.nombre * p.prix_unitaire) AS prix_totale
FROM
    produit AS p
    JOIN produit_categorie AS pc ON p.id_produit = pc.id_produit_fk
    JOIN types AS t ON t.id_type = p.id_types_fk
    JOIN categorie AS c ON c.id_categorie = pc.id_categorie_fk
    JOIN (
        SELECT
            id_produit_fk,
            SUM(nombre) AS nombre,
            date_vente
        FROM
            vente
        WHERE date_vente >= '05-01-2025 00:00:00' and date_vente <= '13-01-2025 00:00:00'
        GROUP BY
            id_produit_fk,
            date_vente

    ) AS v ON v.id_produit_fk = p.id_produit;

-- ** 14 - 01 - 2024
CREATE OR REPLACE VIEW v_produit_select AS
SELECT 
    nom,
    id_produit
FROM 
    produit;

CREATE OR REPLACE VIEW v_liste_conseil AS 
SELECT
    p.nom AS nom_produit,
    t.nom AS nom_types,
    c.raison,
    c.date_conseil_mois
FROM
    conseil_mois AS c
JOIN produit AS p ON c.id_produit_fk = p.id_produit
JOIN types AS t ON t.id_type = p.id_types_fk;

-- ** 16 - 01 - 2025
CREATE OR REPLACE VIEW v_vente_client AS
SELECT 
    v.id_vente, 
    p.nom AS produit, 
    c.nom AS client, 
    v.nombre * p.prix_unitaire AS prix_total, 
    v.nombre,
    v.date_vente
FROM 
    vente v
JOIN 
    produit p ON v.id_produit_fk = p.id_produit
JOIN 
    client c ON v.id_client_fk = c.id_client;

CREATE OR REPLACE VIEW v_client AS 
SELECT * from client;

-- ** 21 - 01 - 2025
CREATE OR REPLACE VIEW v_users AS
 SELECT 
 * 
 FROM  users;


