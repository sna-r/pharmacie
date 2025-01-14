package mg.itu.pharmacie.Controllers;

import java.sql.Connection;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mg.itu.pharmacie.Models.Databases.MyConnection;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.DB;
import mg.itu.pharmacie.Models.Tables.ConseilMois;
import mg.itu.pharmacie.Models.Views.VListeConseil;
import mg.itu.pharmacie.Models.Views.VProduitSelect;
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

    @GetMapping("/liste-conseil-mois")
    public String liste_conseil(Model model) throws Exception {
        Connection connection = MyConnection.connectDefault();
        VListeConseil[] listeConseil = (VListeConseil[]) DB.getList(new VListeConseil(), connection);
        model.addAttribute("listeConseil", listeConseil);
        return "conseil-mois/lister";
    }

    @PostMapping("/add-conseil-mois-traitement")
    public String ajouter_conseil_mois_traimement(@RequestParam String id_produit, @RequestParam String date, 
            @RequestParam String raison, Model model) throws Exception {
        ConseilMois conseilMois = new ConseilMois();
        conseilMois.setDate(new DateHeure(date + "-01", "00:00:00"));
        conseilMois.setRaison(raison);
        conseilMois.setId_produit(id_produit);
        Connection connection =  MyConnection.connectDefault();

        DB.insert(conseilMois,connection);
        System.out.println(id_produit + " " + date + " " + raison);
        return "conseil-mois/ajouter";
    }
    
    
}
