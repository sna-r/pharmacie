package mg.itu.pharmacie.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}
