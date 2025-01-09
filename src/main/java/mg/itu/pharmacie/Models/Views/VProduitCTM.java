package mg.itu.pharmacie.Models.Views;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_produit_ctm")
public class VProduitCTM {
    @AttributDb(name = "nom_produit")
    String nom_produit;
    @AttributDb(name = "notice")
    String notice;
    @AttributDb(name = "nom_types")
    String nom_types;
    @AttributDb(name = "nom_maladie")
    String nom_maladie;
    @AttributDb(name = "nom_categorie")
    String nom_categorie;
    public String getNom_produit() {
        return nom_produit;
    }
    public void setNom_produit(String nom_produit) {
        this.nom_produit = nom_produit;
    }
    public String getNotice() {
        return notice;
    }
    public void setNotice(String notice) {
        this.notice = notice;
    }
    public String getNom_types() {
        return nom_types;
    }
    public void setNom_types(String nom_types) {
        this.nom_types = nom_types;
    }
    public String getNom_maladie() {
        return nom_maladie;
    }
    public void setNom_maladie(String nom_maladie) {
        this.nom_maladie = nom_maladie;
    }
    public String getNom_categorie() {
        return nom_categorie;
    }
    public void setNom_categorie(String nom_categorie) {
        this.nom_categorie = nom_categorie;
    }

}
