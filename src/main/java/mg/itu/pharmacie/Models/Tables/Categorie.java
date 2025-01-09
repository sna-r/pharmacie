package mg.itu.pharmacie.Models.Tables;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_categorie")
public class Categorie {
    @AttributDb(name = "id_categorie")
    String id_categorie;
    @AttributDb(name = "nom")
    String nom;
    public String getId_categorie() {
        return id_categorie;
    }
    public void setId_categorie(String id_categorie) {
        this.id_categorie = id_categorie;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
}
