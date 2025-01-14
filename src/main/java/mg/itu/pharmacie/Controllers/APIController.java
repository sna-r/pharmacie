package mg.itu.pharmacie.Controllers;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import mg.itu.pharmacie.Models.Databases.MyConnection;
import mg.itu.pharmacie.Models.Generalisation.GeneralisationDb.DB;
import mg.itu.pharmacie.Models.Tables.Categorie;
import mg.itu.pharmacie.Models.Tables.Maladie;
import mg.itu.pharmacie.Models.Tables.Types;
import mg.itu.pharmacie.Models.Views.VProduitCTM;
import mg.itu.pharmacie.Models.Views.VProduitSelect;
import mg.itu.pharmacie.Models.Views.VVenteProduit;
import mg.itu.pharmacie.Models.Views.VVenteProduitDetail;

@RestController
public class APIController {
    @GetMapping("produitsCTM")
    public Map<String, Object> getAllProduitCTM(@RequestBody(required = false) Map<String, String[]> payload)
            throws Exception {
        String[] categorie = payload != null && payload.containsKey("categorie")
                ? payload.getOrDefault("categorie", new String[0])
                : new String[0];
        String[] type = payload != null && payload.containsKey("type")
                ? payload.getOrDefault("type", new String[0])
                : new String[0];
        String[] maladie = payload != null && payload.containsKey("maladie")
                ? payload.getOrDefault("maladie", new String[0])
                : new String[0];

        Map<String, Object> resultat = new HashMap<>();
        int status = 0;
        String titre = null;
        String message = null;
        Connection connection = null;
        try {
            connection = MyConnection.connectDefault();
            connection.setAutoCommit(false);
            VProduitCTM[] produits = (VProduitCTM[]) DB.getList(new VProduitCTM(), connection);
            resultat.put("data", produits);
            status = 200;
            titre = "Prendre tout les produits reussi";
            message = "Success , voila les produits ";
        } catch (Exception e) {
            status = 500;
            titre = "Prendre tout les produits echoué";
            message = e.getMessage();
            e.printStackTrace();
            if (connection != null) {
                connection.rollback();
            }
        } finally {
            resultat.put("status", status);
            resultat.put("titre", titre);
            resultat.put("message", message);
            if (!(connection == null)) {
                connection.close();
            }
        }
        return resultat;
    }
    
    // ********* GET TABLES *******************
    @GetMapping("maladies")
    public Map<String, Object> getAllMaladie()
            throws Exception {

        Map<String, Object> resultat = new HashMap<>();
        int status = 0;
        String titre = null;
        String message = null;
        Connection connection = null;
        try {
            connection = MyConnection.connectDefault();
            connection.setAutoCommit(false);
            Maladie[] maladie = (Maladie[]) DB.getList(new Maladie(), connection);
            resultat.put("data", maladie);
            status = 200;
            titre = "Prendre tout les maladies reussi";
            message = "Success , voila les semestres ";
        } catch (Exception e) {
            status = 500;
            titre = "Prendre tout les maladies echoué";
            message = e.getMessage();
            e.printStackTrace();
            if (connection != null) {
                connection.rollback();
            }
        } finally {
            resultat.put("status", status);
            resultat.put("titre", titre);
            resultat.put("message", message);
            if (!(connection == null)) {
                connection.close();
            }
        }
        return resultat;
    }
    
    @GetMapping("types")
    public Map<String, Object> getAllTypes()
            throws Exception {

        Map<String, Object> resultat = new HashMap<>();
        int status = 0;
        String titre = null;
        String message = null;
        Connection connection = null;
        try {
            connection = MyConnection.connectDefault();
            connection.setAutoCommit(false);
            Types[] types = (Types[]) DB.getList(new Types(), connection);
            resultat.put("data", types);
            status = 200;
            titre = "Prendre tout les types reussi";
            message = "Success , voila les semestres ";
        } catch (Exception e) {
            status = 500;
            titre = "Prendre tout les types echoué";
            message = e.getMessage();
            e.printStackTrace();
            if (connection != null) {
                connection.rollback();
            }
        } finally {
            resultat.put("status", status);
            resultat.put("titre", titre);
            resultat.put("message", message);
            if (!(connection == null)) {
                connection.close();
            }
        }
        return resultat;
    }

    @GetMapping("produit-select")
    public Map<String, Object> getAllProduitSelect()
            throws Exception {

        Map<String, Object> resultat = new HashMap<>();
        int status = 0;
        String titre = null;
        String message = null;
        Connection connection = null;
        try {
            connection = MyConnection.connectDefault();
            connection.setAutoCommit(false);
            VProduitSelect[] produitSelect = (VProduitSelect[]) DB.getList(new VProduitSelect(), connection);
            resultat.put("data", produitSelect);
            status = 200;
            titre = "Prendre tout les produits reussi";
            message = "Success , voila les produits ";
        } catch (Exception e) {
            status = 500;
            titre = "Prendre tout les produits echoué";
            message = e.getMessage();
            e.printStackTrace();
            if (connection != null) {
                connection.rollback();
            }
        } finally {
            resultat.put("status", status);
            resultat.put("titre", titre);
            resultat.put("message", message);
            if (!(connection == null)) {
                connection.close();
            }
        }
        return resultat;
    }

    @GetMapping("categories")
    public Map<String, Object> getAllcategorie()
            throws Exception {

        Map<String, Object> resultat = new HashMap<>();
        int status = 0;
        String titre = null;
        String message = null;
        Connection connection = null;
        try {
            connection = MyConnection.connectDefault();
            connection.setAutoCommit(false);
            Categorie[] categorie = (Categorie[]) DB.getList(new Categorie(), connection);
            resultat.put("data", categorie);
            status = 200;
            titre = "Prendre tout les categories reussi";
            message = "Success , voila les semestres ";
        } catch (Exception e) {
            status = 500;
            titre = "Prendre tout les categories echoué";
            message = e.getMessage();
            e.printStackTrace();
            if (connection != null) {
                connection.rollback();
            }
        } finally {
            resultat.put("status", status);
            resultat.put("titre", titre);
            resultat.put("message", message);
            if (!(connection == null)) {
                connection.close();
            }
        }
        return resultat;
    }
    
    // *** 09 - 01 - 2025
    @GetMapping("vente-produit")
    public Map<String, Object> getAllVenteProduit(@RequestBody(required = false) Map<String, String[]> payload)
            throws Exception {
        String[] categorie = payload != null && payload.containsKey("categorie")
                ? payload.getOrDefault("categorie", new String[0])
                : new String[0];
        String[] type = payload != null && payload.containsKey("type")
                ? payload.getOrDefault("type", new String[0])
                : new String[0];

                for (String cat : categorie) {
                    System.out.println(cat);
                }
                for (String cat : type) {
                    System.out.println(cat);
                }
        String where = "";
        if(categorie.length > 0 || type.length > 0)
            where += " where ";
        
        // for categorie et type
        Map<String, Object> resultat = new HashMap<>();
        int status = 0;
        String titre = null;
        String message = null;
        Connection connection = null;
        try {
            connection = MyConnection.connectDefault();
            connection.setAutoCommit(false);
            VVenteProduit[] produits = (VVenteProduit[]) DB.getList(new VVenteProduit(), connection);
            resultat.put("data", produits);
            status = 200;
            titre = "Prendre tout les ventes de produits reussi";
            message = "Success , voila les ventes ";
        } catch (Exception e) {
            status = 500;
            titre = "Prendre tout les produits echoué";
            message = e.getMessage();
            e.printStackTrace();
            if (connection != null) {
                connection.rollback();
            }
        } finally {
            resultat.put("status", status);
            resultat.put("titre", titre);
            resultat.put("message", message);
            if (!(connection == null)) {
                connection.close();
            }
        }
        return resultat;
    }
    
    @GetMapping("vente-produit-detail")
    public Map<String, Object> getAllVenteProduitDetail(@RequestBody(required = false) Map<String, String[]> payload)
            throws Exception {
        String[] categorie = payload != null && payload.containsKey("categorie")
                ? payload.getOrDefault("categorie", new String[0])
                : new String[0];
        String[] type = payload != null && payload.containsKey("type")
                ? payload.getOrDefault("type", new String[0])
                : new String[0];

        Map<String, Object> resultat = new HashMap<>();
        int status = 0;
        String titre = null;
        String message = null;
        Connection connection = null;
        try {
            connection = MyConnection.connectDefault();
            connection.setAutoCommit(false);
            VVenteProduitDetail[] produits = (VVenteProduitDetail[]) DB.getList(new VVenteProduitDetail(), connection);
            resultat.put("data", produits);
            status = 200;
            titre = "Prendre tout les ventes de produits reussi";
            message = "Success , voila les ventes ";
        } catch (Exception e) {
            status = 500;
            titre = "Prendre tout les produits echoué";
            message = e.getMessage();
            e.printStackTrace();
            if (connection != null) {
                connection.rollback();
            }
        } finally {
            resultat.put("status", status);
            resultat.put("titre", titre);
            resultat.put("message", message);
            if (!(connection == null)) {
                connection.close();
            }
        }
        return resultat;
    }
}
