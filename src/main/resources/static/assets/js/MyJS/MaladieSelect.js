
function displayMaladie() {
  let resultClass = ".select-maladie";
  let url = "/maladies";
  let key = 'id_maladie';
  let value = 'nom'
  let form = null;
 
  displayResultatSelect(
    resultClass,
    url,
    key,
    value,
    form,
  );
}

