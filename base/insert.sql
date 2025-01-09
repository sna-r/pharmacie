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