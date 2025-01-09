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
