-- ** Types **
INSERT INTO types(nom) VALUES
('Comprimé'),
('Sirop'),
('Injection'),
('Pommade'),
('Gélules'),
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
('Personne âgée'),
('Grossesse'),
('Allaitement'),
('Chronique'),
('Aiguë'),
('Saisonnière');

-- ** Fournisseur **
INSERT INTO fournisseur(nom, adresse) VALUES
('Pharma-Global', 'Lot 45, Antananarivo'),
('BioCare', 'Rue 12, Tamatave'),
('HealthTech', 'Avenue 22, Majunga'),
('MadaPharma', 'Rue de la Santé, Fianarantsoa'),
('VitaHealth', 'Boulevard 10, Diego Suarez'),
('GreenMed', 'Lot 98, Tulear'),
('SanoMada', 'Route 5, Morondava'),
('MediSupply', 'Quartier 7, Antsirabe'),
('PharmaDistrib', 'Avenue 8, Nosy Be'),
('ProHealth', 'Lot 66, Fort Dauphin');

-- ** Produit **
INSERT INTO produit(nom, id_types_fk, notice, expiration, id_fournisseur_fk) VALUES
('Doliprane', 'TYP0001', 'Soulage les douleurs et fièvres', '2026-01-15 12:00:00', 'FRN0001'),
('Ibuprofène', 'TYP0002', 'Anti-inflammatoire non stéroïdien', '2025-10-10 12:00:00', 'FRN0002'),
('Amoxicilline', 'TYP0003', 'Antibiotique large spectre', '2025-06-20 12:00:00', 'FRN0003'),
('Vitamine C', 'TYP0004', 'Renforce le système immunitaire', '2026-12-01 12:00:00', 'FRN0004'),
('Oméprazole', 'TYP0005', 'Traitement des ulcères gastriques', '2025-09-15 12:00:00', 'FRN0005'),
('Paracétamol', 'TYP0001', 'Efficace contre la douleur', '2026-02-20 12:00:00', 'FRN0006'),
('Hydrocortisone', 'TYP0006', 'Traitement des inflammations', '2025-11-30 12:00:00', 'FRN0007'),
('Salbutamol', 'TYP0008', 'Traitement des crises d asthme', '2025-04-12 12:00:00', 'FRN0008'),
('Lorazépam', 'TYP0009', 'Réduction de l anxiété', '2026-07-10 12:00:00', 'FRN0009'),
('Insuline', 'TYP0003', 'Traitement du diabète', '2026-05-25 12:00:00', 'FRN0010');

-- ** Maladie **
INSERT INTO maladie(nom) VALUES
('Grippe'),
('Angine'),
('Otite'),
('Sinusite'),
('Bronchite'),
('Diabète'),
('Hypertension'),
('Dermatite'),
('Anxiété'),
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
('Fièvre'),
('Maux de gorge'),
('Douleurs auriculaires'),
('Congestion nasale'),
('Toux sèche'),
('Soif excessive'),
('Maux de tête'),
('Démangeaisons'),
('Insomnie'),
('Difficultés respiratoires');

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
