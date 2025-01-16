package mg.itu.pharmacie.Models.Views;


import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_client")
public class VClient {

    @AttributDb(name = "id_client")
    private String idClient;
    @AttributDb(name = "nom")
    private String nom;

    // Constructeur
   

    // Getters et Setters
    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    

} 
