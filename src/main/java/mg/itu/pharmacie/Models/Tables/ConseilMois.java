package mg.itu.pharmacie.Models.Tables;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;
import mg.itu.pharmacie.Models.utils.DateHeure;

@TableDb(name = "conseil_mois")
public class ConseilMois {
    String id;
    @AttributDb(name = "date_conseil_mois")
    DateHeure date;
    @AttributDb(name = "id_produit_fk")
    String id_produit;
    @AttributDb(name = "raison")
    String raison;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public DateHeure getDate() {
        return date;
    }
    public void setDate(DateHeure date) {
        this.date = date;
    }
    public String getId_produit() {
        return id_produit;
    }
    public void setId_produit(String id_produit) {
        this.id_produit = id_produit;
    }
    public String getRaison() {
        return raison;
    }
    public void setRaison(String raison) {
        this.raison = raison;
    }

}
