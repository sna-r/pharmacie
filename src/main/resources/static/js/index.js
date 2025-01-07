var semestreSearch = document.getElementById("semestre-search");
var optionSearch = document.getElementById("option-search");
var etuSearch = document.getElementById("etu-search");
var searchButton = document.getElementById("search-button");

var promotionEtu = document.getElementById("promotion-etu-input");
var nomEtu = document.getElementById("nom-etu-input");
var prenomEtu = document.getElementById("prenom-etu-input");
var buttonEtu = document.getElementById("ajouter-etudiant-button");
var resultatAddEtudant = document.getElementById("etudiant-resultat");

var matiereEtu = document.getElementById("matiere-input");
var etuEtu = document.getElementById("etu-input");
var noteEtu = document.getElementById("note-input");
var etuResultat = document.getElementById("etu-resultat");
var noteButton = document.getElementById("etu-button");

var etuDeliberation = document.getElementById("etu-input-deliberation");
var matiereSend = document.getElementById("matiere-input-send");
var matiereReceive = document.getElementById("matiere-input-receive");
var buttonDeliberation = document.getElementById("etu-button-deliberation");
var noteDeliberation = document.getElementById("note-input-deliberation");
var etuResultatDeliberation = document.getElementById(
  "etu-resultat-deliberation"
);
var optionDeliberation = document.getElementById("option-deliberation");

var etuPayement = document.getElementById("etu-input-payement");
var datePayement = document.getElementById("date-payement");
var montantPayement = document.getElementById("montant-payement");
var resultatPayement = document.getElementById("resultat-payement");
var buttonPayement = document.getElementById("button-payement");

var urlServer = "http://localhost:8080";
var imageLoadUrl = "http://localhost:8080/gif/Glass-spheres.gif";
var initializeSemestre = function () {
  semestreSearch.innerHTML = "";
  var optionLoad = document.createElement("option");
  optionLoad.innerText = "Loading ...";
  var optionError = document.createElement("option");
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        if (retour.status == 200) {
          semestreSearch.innerHTML = "";
          if (retour.semestres.length > 0) {
            var selectOptionDefault = document.createElement("option");
            selectOptionDefault.innerText = "Choisir un semestre";
            semestreSearch.appendChild(selectOptionDefault);
            retour.semestres.forEach((semestre) => {
              var datesOptions = document.createElement("option");
              datesOptions.innerText = semestre.nom;
              datesOptions.value = semestre.id_semestre;
              semestreSearch.appendChild(datesOptions);
            });
          } else {
            var dateNone = document.createElement("option");
            dateNone.innerText = "Aucun semestre créer";
            semestreSearch.appendChild(dateNone);
          }
        } else {
          optionError.innerText = retour.message;
          semestreSearch.innerHTML = "";
          semestreSearch.appendChild(optionError);
        }
      } else {
        optionError.innerHTML = "Error code " + xhr.status;
        semestreSearch.innerHTML = "";
        semestreSearch.appendChild(optionError);
      }
    } else {
      semestreSearch.innerHTML = "";
      semestreSearch.appendChild(optionLoad);
    }
  };
  semestreSearch.appendChild(optionLoad);
  //XMLHttpRequest.open(method, url, async)
  xhr.open("GET", urlServer + "/semestres", true);

  //XMLHttpRequest.send(body)
  xhr.send(null);
};

var initializeOption = function () {
  optionSearch.innerHTML = "";
  optionDeliberation.innerHTML = "";
  var optionLoad = document.createElement("option");
  optionLoad.innerText = "Loading ...";

  var optionLoadDeliberation = document.createElement("option");
  optionLoadDeliberation.innerText = "Loading ...";

  var optionError = document.createElement("option");
  var optionErrorDeliberation = document.createElement("option");
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        if (retour.status == 200) {
          optionSearch.innerHTML = "";
          optionDeliberation.innerHTML = "";
          if (retour.options.length > 0) {
            var selectOptionDefault = document.createElement("option");
            selectOptionDefault.innerText = "Choisir un option";
            optionSearch.appendChild(selectOptionDefault);

            var selectOptionDefaultDeliberation =
              document.createElement("option");
            selectOptionDefaultDeliberation.innerText = "Choisir un option";
            optionDeliberation.appendChild(selectOptionDefaultDeliberation);

            retour.options.forEach((semestre) => {
              var datesOptions = document.createElement("option");
              datesOptions.innerText = semestre.nom;
              datesOptions.value = semestre.id_option;
              optionSearch.appendChild(datesOptions);

              var datesOptionsDeliberation = document.createElement("option");
              datesOptionsDeliberation.innerText = semestre.nom;
              datesOptionsDeliberation.value = semestre.id_option;
              optionDeliberation.appendChild(datesOptionsDeliberation);
            });
          } else {
            var dateNone = document.createElement("option");
            dateNone.innerText = "Aucun option créer";
            optionSearch.appendChild(dateNone);

            var dateNoneDeliberation = document.createElement("option");
            dateNoneDeliberation.innerText = "Aucun option créer";
            optionDeliberation.appendChild(dateNoneDeliberation);
          }
        } else {
          optionError.innerText = retour.message;
          optionSearch.innerHTML = "";
          optionSearch.appendChild(optionError);

          optionErrorDeliberation.innerText = retour.message;
          optionDeliberation.innerHTML = "";
          optionDeliberation.appendChild(optionError);
        }
      } else {
        optionErrorDeliberation.innerHTML = "Error code " + xhr.status;
        optionDeliberation.innerHTML = "";
        optionDeliberation.appendChild(optionErrorDeliberation);
      }
    } else {
      optionDeliberation.innerHTML = "";
      optionDeliberation.appendChild(optionLoadDeliberation);
    }
  };
  optionDeliberation.appendChild(optionLoadDeliberation);
  //XMLHttpRequest.open(method, url, async)
  xhr.open("GET", urlServer + "/options", true);

  //XMLHttpRequest.send(body)
  xhr.send(null);
};

// Fonction pour générer le HTML
function generateHTML(data) {
  // Récupération de l'élément `main` où insérer le contenu
  const main = document.querySelector("main");
  main.innerHTML = "";

  // Création de la liste avec le semestre et l'option
  const list = document.createElement("center");
  list.innerHTML = `
        <h2 class="text-secondary-itu"><b> ${data.resultNote.etudiant.nom} ${data.resultNote.etudiant.prenom}</b></h2>
        <h2 class="text-secondary-itu">${data.resultNote.etudiant.id_etudiant}</h2>
        <h2 class="text-secondary-itu">Semestre : ${data.resultNote.nomsemestre}</h2>
        <h2 class="text-secondary-itu">Option : ${data.resultNote.nomoption}</h2>
    `;
  main.appendChild(list);
  // avant deliberation
  const title = document.createElement("h4");
  title.innerHTML = "Avant deliberation";
  main.appendChild(title);
  // Création de la table
  const table = document.createElement("table");
  table.innerHTML = `
        <tr>
            <th>UE</th>
            <th>Intitule</th>
            <th class="td-center">Credit</th>
            <th class="td-center">Note/20</th>
            <th class="td-center">Resultat</th>
        </tr>
    `;

  // Ajout des lignes des notes d'étudiant
  data.resultNote.noteEtudiants.forEach((note) => {
    const row = document.createElement("tr");
    row.innerHTML = `
            <td>${note.ue}</td>
            <td>${note.intitule}</td>
            <td class="td-center">${note.credits}</td>
            <td class="td-center">${note.note}</td>
            <td class="td-center">${note.resultat}</td>
        `;
    table.appendChild(row);
  });
  main.appendChild(table);

  // Création de la liste des totaux
  const totalsList = document.createElement("ul");
  totalsList.innerHTML = `
        <li>Totale note : ${data.resultNote.totaleNote}</li>
        <li>Total credit : ${data.resultNote.credits}/${data.resultNote.totaleCredit}</li>
        <li>Moyenne generale : ${data.resultNote.moyennegenerale}/20</li>
        <li>Resultat : <strong>${data.resultNote.resultatSemestre}</strong></li>
    `;
  main.appendChild(totalsList);

  // apres deliberation
  const titleDel = document.createElement("h4");
  titleDel.innerHTML = "Apres deliberation";
  main.appendChild(titleDel);
  // Création de la table
  const tableDel = document.createElement("table");
  tableDel.innerHTML = `
        <tr>
            <th>UE</th>
            <th>Intitule</th>
            <th class="td-center">Credit</th>
            <th class="td-center">Note/20</th>
            <th class="td-center">Resultat</th>
        </tr>
    `;

  // Ajout des lignes des notes d'étudiant
  data.resultNote.noteEtudiantsAfterDel.forEach((note) => {
    const row = document.createElement("tr");
    row.innerHTML = `
            <td>${note.ue}</td>
            <td>${note.intitule}</td>
            <td class="td-center">${note.credits}</td>
            <td class="td-center">${note.note}</td>
            <td class="td-center">${note.resultat}</td>
        `;
    tableDel.appendChild(row);
  });
  main.appendChild(tableDel);

  // Création de la liste des totaux
  const totalsListDel = document.createElement("ul");
  totalsListDel.innerHTML = `
        <li>Totale note : ${data.resultNote.totaleNoteDel}</li>
        <li>Total credit : ${data.resultNote.creditsDel}/${data.resultNote.totaleCreditDel}</li>
        <li>Moyenne generale : ${data.resultNote.moyenneGeneraleDel}/20</li>
        <li>Resultat : <strong>${data.resultNote.resultatSemestreDel}</strong></li>
    `;
  main.appendChild(totalsListDel);
}

function generateHTMLGenerale(data) {
  // Récupération de l'élément `main` où insérer le contenu
  const main = document.querySelector("main");
  main.innerHTML = "";

  // Création de la liste avec le semestre et l'option
  const title = document.createElement("center");
  title.innerHTML = `
        <h1 class="text-secondary-itu">Resultat du ${data.semestre.nom} option ${data.option.nom}</h1>
    `;
  main.appendChild(title);

  // Création de la table
  const table = document.createElement("table");
  table.setAttribute("id", "table-generale");
  table.innerHTML = `
        <tr>
            <th>Nom</th>
            <th class="td-center">Avant deliberation</th>
            <th class="td-center">Apres deliberation</th> 
        </tr>
    `;

  // Ajout des lignes des notes d'étudiant
  data.resultatGenerale.forEach((resultat) => {
    const row = document.createElement("tr");
    row.innerHTML = `
            <td>${resultat.etudiant.nom} ${resultat.etudiant.prenom}</td>
        `;
    let tdAdel = document.createElement("td");
    if (resultat.resultatInt != 30) {
      tdAdel.classList = "td-non-admis";
    }
    tdAdel.innerText = resultat.resultatString;
    let tdApdel = document.createElement("td");
    if (resultat.resultatIntDel != 30) {
      tdApdel.classList = "td-non-admis";
    }
    tdApdel.innerText = resultat.resultatStringDel;
    row.appendChild(tdAdel);
    row.appendChild(tdApdel);
    row.addEventListener("click", () => {
      displayNoteEtudiant(resultat.etudiant.id_etudiant);
    });
    table.appendChild(row);
  });
  main.appendChild(table);
}
// Appel de la fonction pour générer le HTML

var displayNoteEtudiant = function (etu) {
  let sem = semestreSearch.value;
  let opt = optionSearch.value;
  let url = urlServer + "/resultat-note/" + sem + "/" + opt + "/" + etu;

  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    let mainResult = document.querySelector("main");
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        if (retour.status == 200) {
          generateHTML(retour);
        } else {
          mainResult.innerHTML = "";
          let messageError = document.createElement("p");
          messageError.className = "text-danger";
          messageError.innerText = retour.message;
          mainResult.appendChild(messageError);
        }
      } else {
        mainResult.innerHTML = "";
        let messageError = document.createElement("p");
        messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        mainResult.appendChild(messageError);
      }
    } else {
      mainResult.innerHTML = "";
      let imageLoad = document.createElement("img");
      imageLoad.src = imageLoadUrl;
      mainResult.appendChild(imageLoad);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("GET", url, true);

  //XMLHttpRequest.send(body)
  xhr.send(null);
};

var displayResultatEtudiant = function () {
  let sem = semestreSearch.value;
  let opt = optionSearch.value;
  let url = urlServer + "/resultat-note/" + sem + "/" + opt;

  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    let mainResult = document.querySelector("main");
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        if (retour.status == 200) {
          generateHTMLGenerale(retour);
        } else {
          mainResult.innerHTML = "";
          let messageError = document.createElement("p");
          messageError.className = "text-danger";
          messageError.innerText = retour.message;
          mainResult.appendChild(messageError);
        }
      } else {
        mainResult.innerHTML = "";
        let messageError = document.createElement("p");
        messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        mainResult.appendChild(messageError);
      }
    } else {
      mainResult.innerHTML = "";
      let imageLoad = document.createElement("img");
      imageLoad.src = imageLoadUrl;
      mainResult.appendChild(imageLoad);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("GET", url, true);

  //XMLHttpRequest.send(body)
  xhr.send(null);
};

// ajouter dateResult
window.addEventListener("load", () => {
  initializeSemestre();
  initializeOption();
  initializePromotionSelect();
  initializeMatiere();
});
searchButton.addEventListener("click", () => {
  displayResultatEtudiant();
});
// *********************************************************************
// **************** promotion **********************************
var promotionId = document.querySelector("#promotion-id");
var promotionName = document.querySelector("#promotion-nom");
var promotionButton = document.querySelector("#promotion-button");
var promotionResultat = document.querySelector("#promotion-resultat");
var createNewPromotion = function () {
  let promotionIdValue = promotionId.value;
  let promotionNameValue = promotionName.value;
  let formData = new FormData();
  formData.append("id", promotionIdValue); 
  formData.append("nom", promotionNameValue);
  console.log(formData);
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        promotionResultat.innerHTML = "";
        if (retour.status == 200) {
          let messageSuccess = document.createElement("p");
          messageSuccess.className = "text-primary-itu";
          messageSuccess.innerText = retour.message;
          promotionResultat.appendChild(messageSuccess);
          initializePromotionSelect();
        } else {
          let messageError = document.createElement("p");
          messageError.className = "text-danger";
          messageError.innerText = retour.message;
          promotionResultat.appendChild(messageError);
        }
      } else {
        promotionResultat.innerHTML = "";
        let messageError = document.createElement("p");
        messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        promotionResultat.appendChild(messageError);
      }
    } else {
      let imageLoad = document.createElement("img");
      imageLoad.src = imageLoadUrl;
      promotionResultat.innerHTML = "";
      promotionResultat.appendChild(imageLoad);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("POST", urlServer + "/promotion", true);

  //XMLHttpRequest.send(body)
  xhr.send(formData);
};
var initializePromotionSelect = function () {
  promotionEtu.innerHTML = "";
  var optionLoadPromotion = document.createElement("option");
  optionLoadPromotion.innerText = "Loading ...";
  var optionErrorPromotion = document.createElement("option");
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        if (retour.status == 200) {
          promotionEtu.innerHTML = "";
          if (retour.promotions.length > 0) {
            var selectOptionDefaultPromotion = document.createElement("option");
            selectOptionDefaultPromotion.innerText = "Choisir un promotion";
            promotionEtu.appendChild(selectOptionDefaultPromotion);
            retour.promotions.forEach((promotion) => {
              var optionPromotion = document.createElement("option");
              optionPromotion.innerText = promotion.nom;
              optionPromotion.value = promotion.id_promotion;
              promotionEtu.appendChild(optionPromotion);
            });
          } else {
            var dateNone = document.createElement("option");
            dateNone.innerText = "Aucun promotion créer";
            promotionEtu.appendChild(dateNone);
          }
        } else {
          optionErrorPromotion.innerText = retour.message;
          promotionEtu.innerHTML = "";
          promotionEtu.appendChild(optionErrorPromotion);
        }
      } else {
        optionErrorPromotion.innerHTML = "Error code " + xhr.status;
        promotionEtu.innerHTML = "";
        promotionEtu.appendChild(optionErrorPromotion);
      }
    } else {
      promotionEtu.innerHTML = "";
      promotionEtu.appendChild(optionLoadPromotion);
    }
  };
  promotionEtu.appendChild(optionLoadPromotion);
  //XMLHttpRequest.open(method, url, async)
  xhr.open("GET", urlServer + "/promotions", true);

  //XMLHttpRequest.send(body)
  xhr.send(null);
};
promotionButton.addEventListener("click", () => {
  createNewPromotion();
});

// ****************** Etudiant ***********************
var createNewEtudiant = function () {
  let etudiantNomValue = nomEtu.value;
  let etudiantPrenomValue = prenomEtu.value;
  let etudiantPromotionValue = promotionEtu.value;
  let formData = new FormData();
  formData.append("nom", etudiantNomValue);
  formData.append("prenom", etudiantPrenomValue);
  formData.append("promotion", etudiantPromotionValue);
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        resultatAddEtudant.innerHTML = "";
        if (retour.status == 200) {
          let messageSuccess = document.createElement("p");
          messageSuccess.className = "text-primary-itu";
          messageSuccess.innerText = retour.message;
          resultatAddEtudant.appendChild(messageSuccess);
        } else {
          let messageError = document.createElement("p");
          messageError.className = "text-danger";
          messageError.innerText = retour.message;
          resultatAddEtudant.appendChild(messageError);
        }
      } else {
        resultatAddEtudant.innerHTML = "";
        let messageError = document.createElement("p");
        messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        resultatAddEtudant.appendChild(messageError);
      }
    } else {
      let imageLoad = document.createElement("img");
      imageLoad.src = imageLoadUrl;
      resultatAddEtudant.innerHTML = "";
      resultatAddEtudant.appendChild(imageLoad);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("POST", urlServer + "/etudiant", true);

  //XMLHttpRequest.send(body)
  xhr.send(formData);
};
buttonEtu.addEventListener("click", () => {
  createNewEtudiant();
});

var initializeMatiere = function () {
  matiereEtu.innerHTML = "";
  matiereSend.innerHTML = "";
  matiereReceive.innerHTML = "";
  let optionLoadMatiere = document.createElement("option");
  optionLoadMatiere.innerText = "Loading ...";
  let optionLoadMatiereSend = document.createElement("option");
  optionLoadMatiereSend.innerText = "Loading ...";
  let optionLoadMatiereReceive = document.createElement("option");
  optionLoadMatiereReceive.innerText = "Loading ...";
  let optionErrorMatiere = document.createElement("option");
  let optionErrorMatiereSend = document.createElement("option");
  let optionErrorMatiereReceive = document.createElement("option");
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retourMatiere = JSON.parse(xhr.responseText);
        if (retourMatiere.status == 200) {
          matiereEtu.innerHTML = "";
          matiereSend.innerHTML = "";
          matiereReceive.innerHTML = "";
          if (retourMatiere.matieres.length > 0) {
            let selectMatiereOptionDefault = document.createElement("option");
            selectMatiereOptionDefault.innerText = "Choisir un matiere";
            let selectMatiereOptionDefaultSend =
              document.createElement("option");
            selectMatiereOptionDefaultSend.innerText = "Choisir un matiere";
            let selectMatiereOptionDefaultReceive =
              document.createElement("option");
            selectMatiereOptionDefaultReceive.innerText = "Choisir un matiere";
            matiereEtu.appendChild(selectMatiereOptionDefault);
            matiereSend.appendChild(selectMatiereOptionDefaultSend);
            matiereReceive.appendChild(selectMatiereOptionDefaultReceive);
            retourMatiere.matieres.forEach((matiere) => {
              let matieresOptions = document.createElement("option");
              let matieresOptionsSend = document.createElement("option");
              let matieresOptionsReceive = document.createElement("option");
              matieresOptions.innerText = matiere.nom;
              matieresOptions.value = matiere.id_matiere;
              matiereEtu.appendChild(matieresOptions);

              matieresOptionsSend.innerText = matiere.nom;
              matieresOptionsSend.value = matiere.id_matiere;
              matiereSend.appendChild(matieresOptionsSend);

              matieresOptionsReceive.innerText = matiere.nom;
              matieresOptionsReceive.value = matiere.id_matiere;
              matiereReceive.appendChild(matieresOptionsReceive);
            });
          } else {
            var matiereNone = document.createElement("option");
            matiereNone.innerText = "Aucun matiere créer";
            matiereEtu.appendChild(matiereNone);

            var matiereNoneSend = document.createElement("option");
            matiereNoneSend.innerText = "Aucun matiere créer";
            matiereSend.appendChild(matiereNoneSend);

            var matiereNoneReceive = document.createElement("option");
            matiereNoneReceive.innerText = "Aucun matiere créer";
            matiereReceive.appendChild(matiereNoneReceive);
          }
        } else {
          optionErrorMatiere.innerText = retourMatiere.message;
          matiereEtu.innerHTML = "";
          matiereEtu.appendChild(optionErrorMatiere);

          optionErrorMatiereSend.innerText = retourMatiere.message;
          matiereSend.innerHTML = "";
          matiereSend.appendChild(optionErrorMatiereSend);

          optionErrorMatiereReceive.innerText = retourMatiere.message;
          matiereReceive.innerHTML = "";
          matiereReceive.appendChild(optionErrorMatiereReceive);
        }
      } else {
        optionErrorMatiere.innerHTML = "Error code " + xhr.status;
        matiereEtu.innerHTML = "";
        matiereEtu.appendChild(optionErrorMatiere);

        optionErrorMatiereSend.innerHTML = "Error code " + xhr.status;
        matiereSend.innerHTML = "";
        matiereSend.appendChild(optionErrorMatiereSend);

        optionErrorMatiereReceive.innerHTML = "Error code " + xhr.status;
        matiereReceive.innerHTML = "";
        matiereReceive.appendChild(optionErrorMatiereReceive);
      }
    } else {
      matiereEtu.innerHTML = "";
      matiereEtu.appendChild(optionLoadMatiere);

      matiereSend.innerHTML = "";
      matiereSend.appendChild(optionLoadMatiereSend);

      matiereReceive.innerHTML = "";
      matiereReceive.appendChild(optionLoadMatiereReceive);
    }
  };
  matiereEtu.appendChild(optionLoadMatiere);
  matiereSend.appendChild(optionLoadMatiereSend);
  matiereReceive.appendChild(optionLoadMatiereReceive);
  //XMLHttpRequest.open(method, url, async)
  xhr.open("GET", urlServer + "/matieres", true);

  //XMLHttpRequest.send(body)
  xhr.send(null);
};

// ************** Note etudiant ***********************
var insertNoteEtudiant = function () {
  let etudiantValue = etuEtu.value;
  let matiereValue = matiereEtu.value;
  let note = noteEtu.value;
  let formData = new FormData();
  formData.append("matiere", matiereValue);
  formData.append("note", note);
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retourNote = JSON.parse(xhr.responseText);
        etuResultat.innerHTML = "";
        if (retourNote.status == 200) {
          let messageSuccess = document.createElement("p");
          messageSuccess.className = "text-primary-itu";
          messageSuccess.innerText = retourNote.message;
          etuResultat.appendChild(messageSuccess);
        } else {
          let messageError = document.createElement("p");
          messageError.className = "text-danger";
          messageError.innerText = retourNote.message;
          etuResultat.appendChild(messageError);
        }
      } else {
        etuResultat.innerHTML = "";
        let messageError = document.createElement("p");
        messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        etuResultat.appendChild(messageError);
      }
    } else {
      let imageLoad = document.createElement("img");
      imageLoad.src = imageLoadUrl;
      etuResultat.innerHTML = "";
      etuResultat.appendChild(imageLoad);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("POST", urlServer + "/note/" + etudiantValue, true);

  //XMLHttpRequest.send(body)
  xhr.send(formData);
};
noteButton.addEventListener("click", () => {
  insertNoteEtudiant();
});

// *************** Deliberation **************************
var insertNoteDeliberationEtudiant = function () {
  let etudiantValue = etuDeliberation.value;
  let matiereSendValue = matiereSend.value;
  let matiereReceiveValue = matiereReceive.value;
  let note = noteDeliberation.value;
  let optionValue = optionDeliberation.value;
  let formData = new FormData();
  formData.append("etu", etudiantValue);
  formData.append("matiereSend", matiereSendValue);
  formData.append("matiereReceive", matiereReceiveValue);
  formData.append("note", note);
  formData.append("option", optionValue);
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retourNote = JSON.parse(xhr.responseText);
        etuResultatDeliberation.innerHTML = "";
        if (retourNote.status == 200) {
          let messageSuccess = document.createElement("p");
          messageSuccess.className = "text-primary-itu";
          messageSuccess.innerText = retourNote.message;
          etuResultatDeliberation.appendChild(messageSuccess);
        } else {
          let messageError = document.createElement("p");
          messageError.className = "text-danger";
          messageError.innerText = retourNote.message;
          etuResultatDeliberation.appendChild(messageError);
        }
      } else {
        etuResultatDeliberation.innerHTML = "";
        let messageError = document.createElement("p");
        messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        etuResultatDeliberation.appendChild(messageError);
      }
    } else {
      let imageLoad = document.createElement("img");
      imageLoad.src = imageLoadUrl;
      etuResultatDeliberation.innerHTML = "";
      etuResultatDeliberation.appendChild(imageLoad);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("POST", urlServer + "/deliberation", true);

  //XMLHttpRequest.send(body)
  xhr.send(formData);
};
buttonDeliberation.addEventListener("click", () => {
  insertNoteDeliberationEtudiant();
});


// *************** Payement ecolage **************************
var insertPayementEcolage = function () {
  let etuPayementValue = etuPayement.value;
  let datePayementValue = datePayement.value;
  let montantPayementValue = montantPayement.value;
  let formData = new FormData();
  formData.append("etu", etuPayementValue);
  formData.append("datePayement", datePayementValue);
  formData.append("montant", montantPayementValue);
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retourPayement = JSON.parse(xhr.responseText);
        resultatPayement.innerHTML = "";
        if (retourPayement.status == 200) {
          let messageSuccess = document.createElement("p");
          messageSuccess.className = "text-primary-itu";
          messageSuccess.innerText = retourPayement.message;
          resultatPayement.appendChild(messageSuccess);
        } else {
          let messageError = document.createElement("p");
          messageError.className = "text-danger";
          messageError.innerText = retourPayement.message;
          resultatPayement.appendChild(messageError);
        }
      } else {
        resultatPayement.innerHTML = "";
        let messageError = document.createElement("p");
        messageError.className = "text-danger";
        messageError.innerText = "Error code " + xhr.status;
        resultatPayement.appendChild(messageError);
      }
    } else {
      let imageLoad = document.createElement("img");
      imageLoad.src = imageLoadUrl;
      resultatPayement.innerHTML = "";
      resultatPayement.appendChild(imageLoad);
    }
  };
  //XMLHttpRequest.open(method, url, async)
  xhr.open("POST", urlServer + "/payement-ecolage", true);

  //XMLHttpRequest.send(body)
  xhr.send(formData);
};
buttonPayement.addEventListener("click", () => {
  insertPayementEcolage();
});
