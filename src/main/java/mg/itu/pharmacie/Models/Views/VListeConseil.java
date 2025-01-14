package mg.itu.pharmacie.Models.Views;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_liste_conseil")
public class VListeConseil {
    @AttributDb(name = "nom_produit")
    String nom_produit;
    @AttributDb(name = "nom_types")
    String nom_types;
    @AttributDb(name = "raison")
    String raison;
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
    public String getRaison() {
        return raison;
    }
    public void setRaison(String raison) {
        this.raison = raison;
    }

}
