package mg.itu.pharmacie.Models.Views;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_produit_select")
public class VProduitSelect {
    @AttributDb(name = "nom")
    String nom_produit;
    
    @AttributDb(name = "id_produit")
    String id_produit;
  
    public void setId_produit(String id_produit) {
        this.id_produit = id_produit;
    }

    public void setNom_produit(String nom_produit) {
        this.nom_produit = nom_produit;
    }

    public String getId_produit() {
        return id_produit;
    }
    public String getNom_produit() {
        return nom_produit;
    }

}
