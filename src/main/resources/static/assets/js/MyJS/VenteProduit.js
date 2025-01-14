
var displayVenteProduit = (types) => {
  let resultClass = ".result-venteProduit"; 
  let imageLoadUrl = "./../assets/images/Jumping letters.gif";
  let url = "/vente-produit";
  let titleTable = ["Nom", "Type", "Categorie", "Nombre", "Prix Totale"];
  let keyResponse = [
    "nom_produit",
    "nom_types",
    "nom_categorie",
    "nombre",
    "prixTotale"
  ];
  let form = new FormData();
  form.append("categorie", categorieSelectedKey);
  form.append("types", types);
  let classTable = "table table-hover"

  console.log(types)
  displayResultat(
    resultClass,
    imageLoadUrl,
    url,
    titleTable,
    keyResponse,
    form,
    classTable
  );
}

