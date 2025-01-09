package mg.itu.pharmacie.Models.Tables;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_types")
public class Types {
    @AttributDb(name = "id_type")
    String id_types;
    @AttributDb(name = "nom")
    String nom;
    public String getId_types() {
        return id_types;
    }
    public void setId_types(String id_types) {
        this.id_types = id_types;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }

}
