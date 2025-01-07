-- ** VIEW liste produit
SELECT
    p.id_produit,
    p.id_types_fk,

FROM
    produit AS p
JOIN produit_categorie ;

SELECT 
    * 
FROM 
    produit_categorie;