console.log('salgrade');
var losalInput = document.getElementById('losal')
var hisalInput = document.getElementById('hisal')
var gradeInput = document.getElementById("grade");
var dateUpdateGradeInput = document.getElementById("input-date-modification");
var updateSalgradeButton = document.getElementById("update-salgrade");
var salgradeUpdateResultat = document.getElementById("salgrade-update-resultat")
updateSalgradeButton.addEventListener('click', () => {
    let losal = losalInput.value
    let hisal = hisalInput.value;
    let grade = gradeInput.value;
    let date = dateUpdateGradeInput.value;
    let form = new FormData()
        form.append("losal", losal)
        form.append("hisal", hisal)
        form.append("date", date)
        form.append("grade", grade)
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                var retour = JSON.parse(xhr.responseText);
                if (retour.status == 200) {
                    salgradeUpdateResultat.innerHTML = ""
                    let resultat = document.createElement('p')
                    resultat.textContent = retour.message
                    salgradeUpdateResultat.appendChild(resultat)
                } else {
                    salgradeUpdateResultat.innerHTML = "";
                    let resultat = document.createElement("p");
                    resultat.textContent = retour.message;
                    salgradeUpdateResultat.appendChild(resultat);
                }
            }
        }
    }
    xhr.open(
      "PUT",
      "http://localhost:8080/salgrade",
      true
    );

    xhr.send(form); 
})
