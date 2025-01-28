<%@ page import="mg.itu.pharmacie.Models.Views.VVenteClient" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Liste des ventes par client</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/simplebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/feather.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dropzone.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/uppy.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery.steps.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/quill.snow.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app-light.css" id="lightTheme" disabled>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app-dark.css" id="darkTheme">
</head>

<body class="vertical dark">
    <div class="wrapper">
        <%@ include file="../Includes/Header-admin.jsp" %>
        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <h2 class="page-title">Liste des ventes par client</h2>
                        <form action="/liste-vente-client" method="get">
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <p class="mb-2"><strong>Rechercher par date</strong></p>
                                    <div class="form-row">
                                        <div class="form-group col-4">
                                            <input type="number" name="anne" class="form-control" placeholder="Année" />
                                        </div>
                                        <div class="form-group col-4">
                                            <input type="number" name="mois" class="form-control" placeholder="Mois" />
                                        </div>
                                        <div class="form-group col-4">
                                            <input type="number" name="jour" class="form-control" placeholder="Jour" />
                                        </div>
                                        <div class="form-group col-12">
                                            <button class="btn btn-primary">Chercher</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="row">
                            <div class="col-12">
                                <div class="card shadow">
                                    <div class="card-body">
                                        <h5 class="card-title">Résultats</h5>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Client</th>
                                                    <th>Produit</th>
                                                    <th>Date vente</th>
                                                    <th>Nombre</th>
                                                    <th>Prix total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% 
                                                    // Récupérer les résultats de la recherche envoyée par le contrôleur
                                                    VVenteClient[] ventes = (VVenteClient[]) request.getAttribute("produits");
                                                    
                                                    if (ventes != null) {
                                                        for (VVenteClient vente : ventes) {
                                                %>
                                                    <tr>
                                                        <td><%= vente.getClient() %></td>
                                                        <td><%= vente.getProduit() %></td>
                                                        <td><%= vente.getDateVente() %></td>
                                                        <td><%= vente.getNombre() %></td>
                                                        <td><%= vente.getPrixTotal() %></td>
                                                    </tr>
                                                <% 
                                                        }
                                                    } else {
                                                %>
                                                    <tr>
                                                        <td colspan="5" class="text-center">Aucune vente trouvée pour cette période.</td>
                                                    </tr>
                                                <% 
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/simplebar.min.js"></script>
    <script src='${pageContext.request.contextPath}/assets/js/daterangepicker.js'></script>
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apps.js"></script>
</body>

</html>
