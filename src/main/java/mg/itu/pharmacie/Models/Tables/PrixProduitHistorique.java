package mg.itu.pharmacie.Models.Tables;


import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;
@TableDb(name = "prix_produit_historique")
public class PrixProduitHistorique {
    
    // @AttributDb(name = "id_genre")
    private String id_genre;

    @AttributDb(name = "id_produit_fk")
    private String id_produit_fk;

    @AttributDb(name = "prix")
    private double prix;

    // @AttributDb(name = "date_modification")
    private String date_modification;

    // Getters et setters
    public String getId_genre() {
        return id_genre;
    }

    public void setId_genre(String id_genre) {
        this.id_genre = id_genre;
    }

    public String getId_produit_fk() {
        return id_produit_fk;
    }

    public void setId_produit_fk(String id_produit_fk) {
        this.id_produit_fk = id_produit_fk;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public String getDate_modification() {
        return date_modification;
    }

    public void setDate_modification(String date_modification) {
        this.date_modification = date_modification;
    }
}
