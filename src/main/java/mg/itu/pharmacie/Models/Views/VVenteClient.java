package mg.itu.pharmacie.Models.Views;


import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_vente_client")
public class VVenteClient {

    @AttributDb(name = "id_vente")
    private String idVente;

    @AttributDb(name = "produit")
    private String produit;

    @AttributDb(name = "client")
    private String client;

    @AttributDb(name = "prix_total")
    private double prixTotal;

    @AttributDb(name = "nombre")
    private int nombre;

    @AttributDb(name = "date_vente")
    private String dateVente;

    // Getters and setters

    public String getIdVente() {
        return idVente;
    }

    public void setIdVente(String idVente) {
        this.idVente = idVente;
    }

    public String getProduit() {
        return produit;
    }

    public void setProduit(String produit) {
        this.produit = produit;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public double getPrixTotal() {
        return prixTotal;
    }

    public void setPrixTotal(double prixTotal) {
        this.prixTotal = prixTotal;
    }

    public int getNombre() {
        return nombre;
    }

    public void setNombre(int nombre) {
        this.nombre = nombre;
    }

    public String getDateVente() {
        return dateVente;
    }

    public void setDateVente(String dateVente) {
        this.dateVente = dateVente;
    }
}
