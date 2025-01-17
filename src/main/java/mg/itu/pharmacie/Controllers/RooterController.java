package mg.itu.pharmacie.Controllers;

import java.sql.Connection;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mg.itu.pharmacie.Models.Databases.MyConnection;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.DB;
import mg.itu.pharmacie.Models.Tables.ClientTable;
import mg.itu.pharmacie.Models.Tables.ConseilMois;
import mg.itu.pharmacie.Models.Tables.Vente;
import mg.itu.pharmacie.Models.Views.VClient;
import mg.itu.pharmacie.Models.Views.VListeConseil;
import mg.itu.pharmacie.Models.Views.VProduitSelect;
import mg.itu.pharmacie.Models.Views.VVenteClient;
import mg.itu.pharmacie.Models.utils.DateHeure;

@Controller
public class RooterController {
    @GetMapping("/")
    public String home() {
        return "product/liste";
    }

    @GetMapping("/vente-product")
    public String venteProduct() {
        return "product/vente-produit";
    }

    @GetMapping("/add-conseil-mois")
    public String ajoute_conseil() {
        return "conseil-mois/ajouter";
    }
    
    @GetMapping("/ajouter-client")
    public String ajoute_client() {
        return "client/ajouter";
    }

    @GetMapping("/liste-conseil-mois")
    public String liste_conseil(@RequestParam(defaultValue = "") String date, Model model) throws Exception {
        Connection connection = MyConnection.connectDefault();
        DateHeure now = null;
        if (date.length() > 0) {
            now = new DateHeure(date + "-01", "00:00:00");
        } else {
            now = DateHeure.getTodayDateHeure();
        }

        int mois = now.getTypeMois();
        int anne = now.getYear();
        String where = " WHERE EXTRACT(MONTH FROM date_conseil_mois) = " + mois
                + " AND EXTRACT(YEAR FROM date_conseil_mois) = " + anne;
        VListeConseil[] listeConseil = (VListeConseil[]) DB.getList(new VListeConseil(), where, connection);
        model.addAttribute("listeConseil", listeConseil);
        return "conseil-mois/lister";
    }
    
    @GetMapping("/liste-conseil-anne")
    public String liste_conseil_anne(@RequestParam(defaultValue = "2025") String date, Model model) throws Exception {
        Connection connection = MyConnection.connectDefault();
        DateHeure now = null;
        if (date.length() > 0) {
            now = new DateHeure(date + "-01-01", "00:00:00");
        } else {
            now = DateHeure.getTodayDateHeure();
        }

        int mois = now.getTypeMois();
        int anne = now.getYear();
        String where = "WHERE EXTRACT(YEAR FROM date_conseil_mois) = " + anne;
        VListeConseil[] listeConseil = (VListeConseil[]) DB.getList(new VListeConseil(), where, connection);
        model.addAttribute("listeConseil", listeConseil);
        return "conseil-mois/anne";
    }
    
    @GetMapping("/liste-vente-client")
    public String liste_vente_client(@RequestParam(defaultValue = "2025") String anne, 
            @RequestParam(defaultValue = "tout") String mois, 
            @RequestParam(defaultValue = "tout") String jour, 
            Model model) throws Exception {

        // Connexion à la base de données
        Connection connection = MyConnection.connectDefault();

        String where = "WHERE EXTRACT(YEAR FROM date_vente) = " + anne;

        if (!mois.equals("tout")) {
            where += " AND EXTRACT(MONTH FROM date_vente) = " + mois;
        }

        if (!jour.equals("tout")) {
            where += " AND EXTRACT(DAY FROM date_vente) = " + jour;
        }

        VVenteClient[] listeVenteClient = (VVenteClient[]) DB.getList(new VVenteClient(), where, connection);

        model.addAttribute("listeVenteClient", listeVenteClient);

        return "client/liste-vente";
    }


    @PostMapping("/add-conseil-mois-traitement")
    public String ajouter_conseil_mois_traimement(@RequestParam String id_produit, @RequestParam String date, 
            @RequestParam String raison, Model model) throws Exception {
        ConseilMois conseilMois = new ConseilMois();
        conseilMois.setDate(new DateHeure(date + "-01", "00:00:00"));
        conseilMois.setRaison(raison);
        conseilMois.setId_produit(id_produit);
        Connection connection = MyConnection.connectDefault();

        DB.insert(conseilMois, connection);
        System.out.println(id_produit + " " + date + " " + raison);
        return "conseil-mois/ajouter";
    }
    
    
    
    @PostMapping("/ajouter-client-traitement")
    public String ajouter_client_traitement(@RequestParam String nom, Model model) throws Exception {

        Connection connection = MyConnection.connectDefault();
        ClientTable client = new ClientTable();
        client.setNom(nom);
        DB.insert(client, connection);
        return "client/ajouter";
    }

    @GetMapping("/vente-form")
    public String afficherFormulaireVente(Model model) throws Exception {
        // Connexion à la base de données
        Connection connection = MyConnection.connectDefault();

        // Récupérer la liste des produits
        String whereProduit = ""; // Filtre si nécessaire
        VProduitSelect[] produits = (VProduitSelect[]) DB.getList(new VProduitSelect(), whereProduit, connection);

        // Récupérer la liste des clients
        String whereClient = ""; // Filtre si nécessaire
        VClient[] clients = (VClient[]) DB.getList(new VClient(), whereClient, connection);

        // Ajouter les listes au modèle
        model.addAttribute("produits", produits);
        model.addAttribute("clients", clients);

        return "vente/ajouter"; // Nom de la vue à afficher
    }
    
     @PostMapping("/ajouter-vente-traitement")
    public String ajouterVente(@RequestParam("id_produit") String idProduit,
                                @RequestParam int nombre,
                                @RequestParam("id_client") String idClient,
                                @RequestParam("date_vente") String dateVente, // Optional, will default to current date if not provided
                                Model model) throws Exception {

        Connection connection = MyConnection.connectDefault();
        
        // Créer une nouvelle instance de la vente
        Vente vente = new Vente();
        vente.setIdProduit(idProduit);
        vente.setNombre(nombre);
        vente.setIdClient(idClient);

        // Si la date n'est pas fournie, on utilise la date actuelle
        if (dateVente == null || dateVente.isEmpty()) {
            vente.setDateVente(DateHeure.getTodayDateHeure());
        } else {
            dateVente = dateVente.replace("T", " ");
            vente.setDateVente(new DateHeure(dateVente));
        }

        // Insérer la vente dans la base de données
        DB.insert(vente, connection);

        // Ajouter un message de confirmation dans le modèle
        model.addAttribute("message", "Vente ajoutée avec succès.");

        String whereProduit = ""; // Filtre si nécessaire
        VProduitSelect[] produits = (VProduitSelect[]) DB.getList(new VProduitSelect(), whereProduit, connection);

        // Récupérer la liste des clients
        String whereClient = ""; // Filtre si nécessaire
        VClient[] clients = (VClient[]) DB.getList(new VClient(), whereClient, connection);
        // Rediriger vers la page d'ajout de vente
        model.addAttribute("produits", produits);
        model.addAttribute("clients", clients);
        return "vente/ajouter"; // Remplacer par la page de confirmation ou de retour souhaitée
    }

}
