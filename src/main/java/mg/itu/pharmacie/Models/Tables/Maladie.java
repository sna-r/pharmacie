package mg.itu.pharmacie.Models.Tables;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_maladie")
public class Maladie {
    @AttributDb(name = "id_maladie")
    String id_maladie;
    @AttributDb(name = "nom")
    String nom;
    public String getId_maladie() {
        return id_maladie;
    }
    public void setId_maladie(String id_maladie) {
        this.id_maladie = id_maladie;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
}
