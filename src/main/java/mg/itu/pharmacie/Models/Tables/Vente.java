package mg.itu.pharmacie.Models.Tables;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;
import mg.itu.pharmacie.Models.utils.DateHeure;

@TableDb(name = "vente")
public class Vente {


    @AttributDb(name = "id_produit_fk")
    String idProduit;

    @AttributDb(name = "date_vente")
    DateHeure dateVente;

    @AttributDb(name = "nombre")
    int nombre;

    @AttributDb(name = "id_client_fk")
    String idClient;

    // Getters et Setters
    


    public String getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(String idProduit) {
        this.idProduit = idProduit;
    }

    public DateHeure getDateVente() {
        return dateVente;
    }

    public void setDateVente(DateHeure dateVente) {
        this.dateVente = dateVente;
    }

    public int getNombre() {
        return nombre;
    }

    public void setNombre(int nombre) {
        this.nombre = nombre;
    }

    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }
}
