package mg.itu.pharmacie.Models.Views;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_vente_produit_detail")
public class VVenteProduitDetail {
    @AttributDb(name = "nom_produit")
    String nom_produit;
    @AttributDb(name = "nom_types")
    String nom_types;

    @AttributDb(name = "nom_categorie")
    String nom_categorie;
    @AttributDb(name = "nombre")
    String nombre;
    @AttributDb(name = "prix_totale")
    String prixTotale;
    @AttributDb(name = "date_vente")
    String date_vente;
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getPrixTotale() {
        return prixTotale;
    }
    public void setPrixTotale(String prixTotale) {
        this.prixTotale = prixTotale;
    }
    public String getNom_produit() {
        return nom_produit;
    }
    public void setNom_produit(String nom_produit) {
        this.nom_produit = nom_produit;
    }

    public String getNom_types() {
        return nom_types;
    }
    public void setNom_types(String nom_types) {
        this.nom_types = nom_types;
    }
    public String getNom_categorie() {
        return nom_categorie;
    }
    public void setNom_categorie(String nom_categorie) {
        this.nom_categorie = nom_categorie;
    }

}
