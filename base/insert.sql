-- ** Types **
INSERT INTO types(nom) VALUES
('Comprime'),
('Sirop'),
('Injection'),
('Pommade'),
('Gelules'),
('Poudre'),
('Suppositoire'),
('Inhalateur'),
('Patch'),
('Solution buvable');

-- ** Categorie **
INSERT INTO categorie(nom) VALUES
('Nourrisson'),
('Enfant'),
('Adolescent'),
('Adulte'),
('Personne âgee'),
('Grossesse'),
('Allaitement'),
('Chronique'),
('Aigue'),
('Saisonniere');

-- ** Fournisseur **
INSERT INTO fournisseur(nom, adresse) VALUES
('Pharma-Global', 'Lot 45, Antananarivo'),
('BioCare', 'Rue 12, Tamatave'),
('HealthTech', 'Avenue 22, Majunga'),
('MadaPharma', 'Rue de la Sante, Fianarantsoa'),
('VitaHealth', 'Boulevard 10, Diego Suarez'),
('GreenMed', 'Lot 98, Tulear'),
('SanoMada', 'Route 5, Morondava'),
('MediSupply', 'Quartier 7, Antsirabe'),
('PharmaDistrib', 'Avenue 8, Nosy Be'),
('ProHealth', 'Lot 66, Fort Dauphin');

-- ** Produit **
INSERT INTO produit(nom, id_types_fk, notice, expiration, id_fournisseur_fk, prix_unitaire) VALUES
('Doliprane', 'TYP0001', 'Soulage les douleurs et fievres', '2026-01-15 12:00:00', 'FRN0001', 5000),
('Ibuprofene', 'TYP0002', 'Anti-inflammatoire non steroidien', '2025-10-10 12:00:00', 'FRN0002', 4000),
('Amoxicilline', 'TYP0003', 'Antibiotique large spectre', '2025-06-20 12:00:00', 'FRN0003',3000),
('Vitamine C', 'TYP0004', 'Renforce le systeme immunitaire', '2026-12-01 12:00:00', 'FRN0004',14000),
('Omeprazole', 'TYP0005', 'Traitement des ulceres gastriques', '2025-09-15 12:00:00', 'FRN0005',3000),
('Paracetamol', 'TYP0001', 'Efficace contre la douleur', '2026-02-20 12:00:00', 'FRN0006',5000),
('Hydrocortisone', 'TYP0006', 'Traitement des inflammations', '2025-11-30 12:00:00', 'FRN0007',6700),
('Salbutamol', 'TYP0008', 'Traitement des crises d asthme', '2025-04-12 12:00:00', 'FRN0008',20000),
('Lorazepam', 'TYP0009', 'Reduction de l anxiete', '2026-07-10 12:00:00', 'FRN0009',12000),
('Insuline', 'TYP0003', 'Traitement du diabete', '2026-05-25 12:00:00', 'FRN0010',17000);

-- ** Maladie **
INSERT INTO maladie(nom) VALUES
('Grippe'),
('Angine'),
('Otite'),
('Sinusite'),
('Bronchite'),
('Diabete'),
('Hypertension'),
('Dermatite'),
('Anxiete'),
('Asthme');

-- ** Produit Maladie **
INSERT INTO produit_maladie(id_produit_fk, id_maladie_fk) VALUES
('PROD0001', 'MAL0001'),
('PROD0002', 'MAL0002'),
('PROD0003', 'MAL0003'),
('PROD0004', 'MAL0004'),
('PROD0005', 'MAL0005'),
('PROD0006', 'MAL0006'),
('PROD0007', 'MAL0007'),
('PROD0008', 'MAL0008'),
('PROD0009', 'MAL0009'),
('PROD0010', 'MAL0010');

-- ** Produit Categorie **
INSERT INTO produit_categorie(id_produit_fk, id_categorie_fk) VALUES
('PROD0001', 'CAT0001'),
('PROD0002', 'CAT0002'),
('PROD0003', 'CAT0003'),
('PROD0004', 'CAT0004'),
('PROD0005', 'CAT0005'),
('PROD0006', 'CAT0006'),
('PROD0007', 'CAT0007'),
('PROD0008', 'CAT0008'),
('PROD0009', 'CAT0009'),
('PROD0010', 'CAT0010');

-- ** Symptome **
INSERT INTO symptome(nom) VALUES
('Fievre'),
('Maux de gorge'),
('Douleurs auriculaires'),
('Congestion nasale'),
('Toux seche'),
('Soif excessive'),
('Maux de tête'),
('Demangeaisons'),
('Insomnie'),
('Difficultes respiratoires');

-- ** Maladie Symptome **
INSERT INTO maladie_symptome(id_symptome_fk, id_maladie_fk) VALUES
('SYMP0001', 'MAL0001'),
('SYMP0002', 'MAL0002'),
('SYMP0003', 'MAL0003'),
('SYMP0004', 'MAL0004'),
('SYMP0005', 'MAL0005'),
('SYMP0006', 'MAL0006'),
('SYMP0007', 'MAL0007'),
('SYMP0008', 'MAL0008'),
('SYMP0009', 'MAL0009'),
('SYMP0010', 'MAL0010');


-- ** 09 / 01 / 2025
-- Insérer 50 ventes avec des données variées
INSERT INTO
    vente (id_produit_fk, nombre)
VALUES
    ('PROD0001', 3),
    ('PROD0002', 5),
    ('PROD0003', 2),
    ('PROD0004', 7),
    ('PROD0005', 1),
    ('PROD0006', 10),
    ('PROD0007', 4),
    ('PROD0008', 6),
    ('PROD0009', 8),
    ('PROD0010', 9),
    ('PROD0001', 1),
    ('PROD0002', 3),
    ('PROD0003', 5),
    ('PROD0004', 2),
    ('PROD0005', 4),
    ('PROD0006', 6),
    ('PROD0007', 2),
    ('PROD0008', 7),
    ('PROD0009', 10),
    ('PROD0010', 5),
    ('PROD0001', 2),
    ('PROD0002', 6),
    ('PROD0003', 3),
    ('PROD0004', 1),
    ('PROD0005', 8),
    ('PROD0006', 7),
    ('PROD0007', 9),
    ('PROD0008', 10),
    ('PROD0009', 4),
    ('PROD0010', 5),
    ('PROD0001', 7),
    ('PROD0002', 2),
    ('PROD0003', 10),
    ('PROD0004', 8),
    ('PROD0005', 6),
    ('PROD0006', 4),
    ('PROD0007', 5),
    ('PROD0008', 3),
    ('PROD0009', 7),
    ('PROD0010', 1),
    ('PROD0001', 9),
    ('PROD0002', 4),
    ('PROD0003', 8),
    ('PROD0004', 6),
    ('PROD0005', 2),
    ('PROD0006', 5),
    ('PROD0007', 10),
    ('PROD0008', 7),
    ('PROD0009', 3),
    ('PROD0010', 8);


-- conseil du mois
INSERT INTO conseil_mois(id_produit_fk,date_conseil_mois, raison) VALUES 
('PROD0001','2024-05-03 00:00:00', 'Changement climatique');

-- 16 - 01 - 2025
INSERT INTO client (nom) VALUES ('Rakoto'), ('Rabe'), ('Rasoa');

DO $$
BEGIN
    FOR i IN 1..50 LOOP
        -- Insérer un client
        INSERT INTO client (nom)
        VALUES ('Client ' || i);

        -- Obtenir l'id du dernier client inséré
        INSERT INTO vente (id_produit_fk, id_client_fk, nombre)
        VALUES (
            (SELECT id_produit FROM produit ORDER BY RANDOM() LIMIT 1), -- Produit aléatoire
            (SELECT id_client FROM client ORDER BY id_client DESC LIMIT 1), -- Dernier client inséré
            FLOOR(RANDOM() * 10 + 1) -- Quantité aléatoire entre 1 et 10
        );
    END LOOP;
END $$;

-- 21 - 01 - 2025
INSERT INTO type_users(nom) VALUES ('Vendeur') , ('admin');


INSERT INTO users (nom, login, mdp, id_type_users) VALUES 
('Andrianina Rakoto', 'arakoto', 'rakoto123', 'TPU0001'),
('Finaritra Rabe', 'frabe', 'finaritra123', 'TPU0001'),
('Tsiry Randriamampionona', 'trandria', 'tsiry456', 'TPU0001'),
('Voahangy Rasoamanana', 'vrasoa', 'voahangy789', 'TPU0001'),
('Tiana Razafindrabe', 'trazafy', 'tiana321', 'TPU0001');

WITH random_users AS (
    SELECT id_user, ROW_NUMBER() OVER () AS rn
    FROM users
    ORDER BY RANDOM()
),
random_ventes AS (
    SELECT id_vente, ROW_NUMBER() OVER () AS rn
    FROM vente
)
UPDATE vente
SET id_user_fk = ru.id_user
FROM random_users ru
JOIN random_ventes rv ON ru.rn = ((rv.rn - 1) % (SELECT COUNT(*) FROM users)) + 1
WHERE vente.id_vente = rv.id_vente;


INSERT INTO commission (valeur) VALUES (5.50);
INSERT INTO commission (valeur) VALUES (10.75);
INSERT INTO commission (valeur) VALUES (20.25);
INSERT INTO commission (valeur) VALUES (3.00);
INSERT INTO commission (valeur) VALUES (2.30);

-- 23 - 01 - 2025
INSERT INTO genre(nom) VALUES ('Homme') , ('Femme');

WITH random_genres AS (
    SELECT id_genre, ROW_NUMBER() OVER () AS rn
    FROM genre
    ORDER BY RANDOM()
),
random_users AS (
    SELECT id_user, ROW_NUMBER() OVER () AS rn
    FROM users
)
UPDATE users
SET id_genre_fk = rg.id_genre
FROM random_genres rg
JOIN random_users ru ON rg.rn = ru.rn
WHERE users.id_user = ru.id_user;

-- 28 - 01 - 2025
WITH produit_list AS (
    SELECT id_produit, prix_unitaire FROM produit
)
INSERT INTO prix_produit_historique (id_produit_fk, prix,date_modification)
SELECT id_produit, prix_unitaire, '2020-01-01 00:00:00'
FROM produit_list;
