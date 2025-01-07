<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font/font.min.css">
</head>
<body>
    <header class="header-list">
        <ul>
            <li><a href="/note-itu" >Resultat des etudiants</a></li>
            <li><a href="/list?type=etudiant" >Liste etudiant</a></li>
            <li><a href="/list?type=matiere" >Liste matiere</a></li>
            <li><a href="/list?type=note" >Liste note</a></li>
            <li><a href="/list?type=resultat_ecolage">Ecolage</a></li>
        </ul>
    </header>
    <main>
        <%= (String) request.getAttribute("result")%>
    </main>
</body>

</html>