console.log("salgrade");
var employerInput = document.getElementById("employer");
var salaireInput = document.getElementById("sal-input");
var dateUpdateSalaireInput = document.getElementById("input-date-salaire");
var updateSalaireButton = document.getElementById("update-salaire-button");
var salgradeUpdateResultat = document.getElementById(
  "update-salaire-resultat"
);
updateSalaireButton.addEventListener("click", () => {
  let employer = employerInput.value;
  let salaire = salaireInput.value;
  let date = dateUpdateSalaireInput.value;
  let form = new FormData();
  form.append("emp", employer);
  form.append("salaire", salaire);
  form.append("date", date);
  let xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        var retour = JSON.parse(xhr.responseText);
        if (retour.status == 200) {
          salgradeUpdateResultat.innerHTML = "";
          let resultat = document.createElement("p");
          resultat.textContent = retour.message;
          salgradeUpdateResultat.appendChild(resultat);
        } else {
          salgradeUpdateResultat.innerHTML = "";
          let resultat = document.createElement("p");
          resultat.textContent = retour.message;
          salgradeUpdateResultat.appendChild(resultat);
        }
      }
    }
  };
  xhr.open("PUT", "http://localhost:8080/salaire-employer", true);

  xhr.send(form);
});
