
function displayProductCTM() {
  let resultClass = ".result-productCTM";
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
  let methode = "POST"
  console.log(typesSelectedKey);
  console.log(categorieSelectedKey);
  console.log(maladieSelectedKey);
let form = new FormData();
form.append("categorie", JSON.stringify(categorieSelectedKey));
form.append("types", JSON.stringify(typesSelectedKey));
form.append("maladie", JSON.stringify(maladieSelectedKey));

  let classTable = "table table-hover"
  displayResultat(
    resultClass,
    imageLoadUrl,
    url,
    titleTable,
    keyResponse,
    form,
    classTable,
    methode
  );
}

