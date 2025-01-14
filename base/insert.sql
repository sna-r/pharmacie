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

INSERT INTO vente (id_produit_fk, nombre, date_vente)
VALUES
    ('PROD0001', 3, '2024-01-15 10:30:00'),
    ('PROD0002', 5, '2024-02-10 11:45:00'),
    ('PROD0003', 2, '2024-03-20 15:00:00'),
    ('PROD0004', 7, '2024-04-05 14:20:00'),
    ('PROD0005', 1, '2024-05-18 09:10:00'),
    ('PROD0006', 10, '2024-06-25 17:30:00'),
    ('PROD0007', 4, '2024-07-13 13:00:00'),
    ('PROD0008', 6, '2024-08-02 16:00:00'),
    ('PROD0009', 8, '2024-09-19 12:00:00'),
    ('PROD0010', 9, '2024-10-07 10:00:00'),
    ('PROD0001', 3, '2024-01-22 12:30:00'),
    ('PROD0002', 5, '2024-02-25 14:30:00'),
    ('PROD0003', 2, '2024-03-05 11:00:00'),
    ('PROD0004', 7, '2024-04-11 16:10:00'),
    ('PROD0005', 1, '2024-05-28 18:30:00'),
    ('PROD0006', 10, '2024-06-30 08:50:00'),
    ('PROD0007', 4, '2024-07-21 14:15:00'),
    ('PROD0008', 6, '2024-08-16 13:40:00'),
    ('PROD0009', 8, '2024-09-03 09:20:00'),
    ('PROD0010', 9, '2024-10-14 17:05:00'),
    ('PROD0001', 3, '2024-02-07 13:25:00'),
    ('PROD0002', 5, '2024-03-12 15:00:00'),
    ('PROD0003', 2, '2024-04-19 12:45:00'),
    ('PROD0004', 7, '2024-05-09 10:10:00'),
    ('PROD0005', 1, '2024-06-17 16:30:00'),
    ('PROD0006', 10, '2024-07-25 18:20:00'),
    ('PROD0007', 4, '2024-08-01 11:40:00'),
    ('PROD0008', 6, '2024-09-11 09:00:00'),
    ('PROD0009', 8, '2024-10-05 17:30:00'),
    ('PROD0010', 9, '2024-11-18 14:50:00'),
    ('PROD0001', 3, '2024-02-22 09:30:00'),
    ('PROD0002', 5, '2024-03-03 16:00:00'),
    ('PROD0003', 2, '2024-04-17 13:00:00'),
    ('PROD0004', 7, '2024-05-30 10:30:00'),
    ('PROD0005', 1, '2024-06-28 12:00:00'),
    ('PROD0006', 10, '2024-07-08 15:40:00'),
    ('PROD0007', 4, '2024-08-05 18:10:00'),
    ('PROD0008', 6, '2024-09-25 14:00:00'),
    ('PROD0009', 8, '2024-10-21 16:15:00'),
    ('PROD0010', 9, '2024-11-02 10:30:00'),
    ('PROD0001', 3, '2024-01-17 14:40:00'),
    ('PROD0002', 5, '2024-02-15 13:20:00'),
    ('PROD0003', 2, '2024-03-08 12:00:00'),
    ('PROD0004', 7, '2024-04-12 17:45:00'),
    ('PROD0005', 1, '2024-05-23 08:00:00'),
    ('PROD0006', 10, '2024-06-12 11:30:00'),
    ('PROD0007', 4, '2024-07-05 13:10:00'),
    ('PROD0008', 6, '2024-08-18 16:40:00'),
    ('PROD0009', 8, '2024-09-29 09:50:00'),
    ('PROD0010', 9, '2024-10-13 12:00:00'),
    ('PROD0001', 3, '2024-02-20 17:15:00'),
    ('PROD0002', 5, '2024-03-30 18:40:00'),
    ('PROD0003', 2, '2024-04-09 10:50:00'),
    ('PROD0004', 7, '2024-05-17 14:00:00'),
    ('PROD0005', 1, '2024-06-05 16:25:00'),
    ('PROD0006', 10, '2024-07-01 08:20:00'),
    ('PROD0007', 4, '2024-08-30 12:50:00'),
    ('PROD0008', 6, '2024-09-09 15:30:00'),
    ('PROD0009', 8, '2024-10-18 11:10:00'),
    ('PROD0010', 9, '2024-11-07 14:20:00');

-- produit
INSERT INTO produit(nom, id_types_fk, notice, expiration, id_fournisseur_fk, prix_unitaire) VALUES
('Doliprane', 'TYP0001', 'Soulage les douleurs et les fièvres. Utilisé pour traiter la douleur modérée et la fièvre.', '2026-01-15 12:00:00', 'FRN0001', 5000),
('Ibuprofene', 'TYP0001', 'Anti-inflammatoire non stéroïdien utilisé pour traiter l inflammation, la douleur, et la fièvre.', '2025-10-10 12:00:00', 'FRN0002', 4000),
('Amoxicilline', 'TYP0002', 'Antibiotique de la famille des pénicillines, utilisé pour traiter des infections bactériennes.', '2025-06-20 12:00:00', 'FRN0003', 3000),
('Vitamine C', 'TYP0005', 'Renforce le système immunitaire, aide à lutter contre le rhume et soutient la santé de la peau.', '2026-12-01 12:00:00', 'FRN0004', 14000),
('Omeprazole', 'TYP0006', 'Inhibiteur de la pompe à protons, utilisé pour traiter les ulcères gastriques et le reflux acide.', '2025-09-15 12:00:00', 'FRN0005', 3000),
('Paracetamol', 'TYP0001', 'Antalgiques et antipyrétiques courants pour soulager la douleur légère à modérée et réduire la fièvre.', '2026-02-20 12:00:00', 'FRN0006', 5000),
('Hydrocortisone', 'TYP0007', 'Corticostéroïde utilisé pour traiter des inflammations et des allergies sévères.', '2025-11-30 12:00:00', 'FRN0007', 6700),
('Salbutamol', 'TYP0008', 'Bronchodilatateur utilisé pour traiter les crises d asthme et d autres troubles respiratoires.', '2025-04-12 12:00:00', 'FRN0008', 20000),
('Lorazepam', 'TYP0009', 'Anxiolytique utilisé pour traiter les troubles d anxiété, l insomnie et les troubles convulsifs.', '2026-07-10 12:00:00', 'FRN0009', 12000),
('Insuline', 'TYP0003', 'Hormone utilisée pour traiter le diabète de type 1 et 2 en régulant le niveau de glucose sanguin.', '2026-05-25 12:00:00', 'FRN0010', 17000),
('Loperamide', 'TYP0001', 'Utilisé pour traiter la diarrhée en ralentissant les mouvements intestinaux.', '2026-08-15 12:00:00', 'FRN0001', 2500),
('Cetirizine', 'TYP0001', 'Antihistaminique utilisé pour soulager les symptômes d allergies comme la rhinite et l urticaires.', '2025-11-01 12:00:00', 'FRN0002', 3500),
('Metformine', 'TYP0003', 'Médicament utilisé pour traiter le diabète de type 2 en régulant les niveaux de glucose sanguin.', '2026-03-01 12:00:00', 'FRN0003', 8500),
('Prednisone', 'TYP0007', 'Corticostéroïde utilisé pour traiter diverses conditions inflammatoires et auto-immunes.', '2025-12-15 12:00:00', 'FRN0004', 10000),
('Amoxicilline + Acide clavulanique', 'TYP0002', 'Antibiotique combiné pour traiter les infections bactériennes plus résistantes.', '2025-05-30 12:00:00', 'FRN0005', 4500),
('Aspirine', 'TYP0001', 'Anti-inflammatoire non stéroïdien utilisé pour traiter la douleur et réduire la fièvre.', '2025-10-25 12:00:00', 'FRN0006', 3000),
('Diphenhydramine', 'TYP0001', 'Antihistaminique utilisé pour traiter les allergies, le rhume, et l insomnie.', '2026-02-18 12:00:00', 'FRN0007', 4000),
('Diazepam', 'TYP0009', 'Médicament anxiolytique, sédatif, utilisé pour traiter l anxiété, les convulsions et l insomnie.', '2026-06-10 12:00:00', 'FRN0008', 13000),
('Clindamycine', 'TYP0002', 'Antibiotique utilisé pour traiter les infections bactériennes, particulièrement les infections de la peau.', '2025-12-05 12:00:00', 'FRN0009', 5500),
('Fluconazole', 'TYP0005', 'Antifongique utilisé pour traiter les infections fongiques, notamment les infections vaginales et buccales.', '2026-01-20 12:00:00', 'FRN0010', 6000);