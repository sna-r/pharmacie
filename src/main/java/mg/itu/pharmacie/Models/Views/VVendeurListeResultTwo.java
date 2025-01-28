package mg.itu.pharmacie.Models.Views;



import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;
@TableDb(name = "v_commission_par_vendeur")
public class VVendeurListeResultTwo {
    

    @AttributDb(name = "id_vendeur")
    private String idVendeur;
    @AttributDb(name = "nom_vendeur")
    private String nomVendeur;
    @AttributDb(name = "date_vente")
    private String dateVente;
    @AttributDb(name = "id_genre_user")
    private String idGenreUser;
    @AttributDb(name = "montant_commission")
    private Double montantCommission;

    // Constructeur
    public VVendeurListeResultTwo() {
    }

    // Getters et Setters
    public String getIdVendeur() {
        return idVendeur;
    }

    public void setIdVendeur(String idVendeur) {
        this.idVendeur = idVendeur;
    }

    public String getNomVendeur() {
        return nomVendeur;
    }

    public void setNomVendeur(String nomVendeur) {
        this.nomVendeur = nomVendeur;
    }

    public String getDateVente() {
        return dateVente;
    }

    public void setDateVente(String dateVente) {
        this.dateVente = dateVente;
    }

    public String getIdGenreUser() {
        return idGenreUser;
    }

    public void setIdGenreUser(String idGenreUser) {
        this.idGenreUser = idGenreUser;
    }

    public Double getMontantCommission() {
        return montantCommission;
    }

    public void setMontantCommission(Double montantCommission) {
        this.montantCommission = montantCommission;
    }
}
