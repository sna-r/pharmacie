function generateHTML(retour, titleTable, keyJson, main, classTable) {
    main.innerHTML = "";
    main.removeAttribute("style");
  

  // Création de la table
  let table = document.createElement("table");
    table.setAttribute("class", classTable);
    
    let titleTh = ''
    titleTable.forEach(title => {
        titleTh = titleTh + '<th> ' + title +' </th>'
    });

  table.innerHTML = `
        <thead>
            ${titleTh}
        </thead>
    `;

//   // Ajout des lignes des notes d'étudiant
  retour.data.forEach((result) => {
      const row = document.createElement("tr");
      let rowValue = ''
      keyJson.forEach(key => {
            rowValue += `
                    <td>${result[key]}</td>
                `;
      });
      row.innerHTML = `${rowValue}`
    table.appendChild(row);
  });
  main.appendChild(table);
}
// Appel de la fonction pour générer le HTML
var displayResultat = function (
  resultClass,
  imageLoadUrl,
  url,
  titleTable,
  keyResponse,
  form,
  classTable
) {
  let xhr = new XMLHttpRequest();
  
  let imageLoad = new Image();
  imageLoad.onload = function () {
    imageLoad.src = imageLoadUrl;
  };
  imageLoad.src = imageLoadUrl;
  let result = document.querySelector(resultClass);
  result.innerHTML = "";
  result.setAttribute("style", "display:flex; justify-content:center;");
  result.appendChild(imageLoad);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 1) {
      result.innerHTML = "";
      result.setAttribute("style", "display:flex; justify-content:center;");
      result.appendChild(imageLoad);
    }
    if (xhr.readyState === 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        if (retour.status == 200) {
          generateHTML(retour, titleTable, keyResponse, result, classTable);
        } else if (retour.status == 500) {
          result.innerHTML = "";
          let messageError = document.createElement("p");
          result.setAttribute("style", "display:flex; justify-content:center;");

          //   messageError.className = "text-danger";
          messageError.innerText = retour.message;
          result.appendChild(messageError);
        } else {
          result.innerHTML = "";
          result.setAttribute("style", "display:flex; justify-content:center;");
          result.appendChild(imageLoad);
        }
      } else {
        result.innerHTML = "";
        result.setAttribute("style", "display:flex; justify-content:center;");

        let messageError = document.createElement("p");
        // messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        result.appendChild(messageError);
      }
    } else {
      result.innerHTML = "";
      result.setAttribute("style", "display:flex; justify-content:center;");
      result.appendChild(imageLoad);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("GET", url, true);

  //XMLHttpRequest.send(body)
  xhr.send(form);
};
