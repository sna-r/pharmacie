function generateHTMLSelect(retour, keyTitle, valueTitle, select) {
    select.innerHTML = "";
    retour.data.forEach((result) => {
    const option = document.createElement("option");
    option.textContent = result[valueTitle]
    option.value = result[keyTitle]
      
    select.appendChild(option);
  });
}
// Appel de la fonction pour générer le HTML
var displayResultatSelect = function (
  resultClass,
  url,
  titleTable,
  keyResponse,
  form,
) {
  let xhr = new XMLHttpRequest();
  
  let loadOption = document.createElement('option');
  loadOption.textContent = 'Chargement ...'
  let result = document.querySelector(resultClass);
  result.innerHTML = "";
  result.appendChild(loadOption);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 1) {
      result.innerHTML = "";
      result.appendChild(loadOption);
    }
    if (xhr.readyState === 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        if (retour.status == 200) {
          generateHTMLSelect(retour, titleTable, keyResponse, result);
        } else if (retour.status == 500) {
          result.innerHTML = "";
          let messageError = document.createElement("p");

          //   messageError.className = "text-danger";
          messageError.innerText = retour.message;
          result.appendChild(messageError);
        } else {
          result.innerHTML = "";
          result.appendChild(loadOption);
        }
      } else {
        result.innerHTML = "";

        let messageError = document.createElement("p");
        // messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        result.appendChild(messageError);
      }
    } else {
      result.innerHTML = "";
      result.setAttribute("style", "display:flex; justify-content:center;");
      result.appendChild(loadOption);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("GET", url, true);

  //XMLHttpRequest.send(body)
  xhr.send(form);
};
