package mg.itu.pharmacie.Models.Views;

import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.AttributDb;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.TableDb;

@TableDb(name = "v_users")
public class VUsers {

    @AttributDb(name = "id_user")
    private String idUser;

    @AttributDb(name = "nom")
    private String nom;

    @AttributDb(name = "login")
    private String login;

    @AttributDb(name = "mdp")
    private String mdp;

    @AttributDb(name = "id_type_users")
    private String idTypeUsers;

    // Constructeur par défaut
    public VUsers() {}

    // Getters et Setters
    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getIdTypeUsers() {
        return idTypeUsers;
    }

    public void setIdTypeUsers(String idTypeUsers) {
        this.idTypeUsers = idTypeUsers;
    }
}
