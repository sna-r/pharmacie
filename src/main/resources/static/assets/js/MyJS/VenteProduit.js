
function VenteProduit() {
  let resultClass = ".result-venteProduit";
  let imageLoadUrl = "./../assets/images/Jumping letters.gif";
  let url = "/produitsCTM";
  let titleTable = ["Nom", "Notice", "Type", "Categorie", "Maladie"];
  let keyResponse = [
    "nom_produit",
    "notice",
    "nom_types",
    "nom_categorie",
    "nom_maladie",
  ];
  let form = new FormData();
  form.append("categorie", ["Rakoto", "Rabe", "Rasoa"]);
  let classTable = "table table-hover"
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

