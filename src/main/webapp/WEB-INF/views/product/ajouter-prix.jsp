<%@ page import="mg.itu.pharmacie.Models.Views.VProduitSelect, mg.itu.pharmacie.Models.Views.VClient" %>
<%
    // Recuperer les produits et les clients depuis les attributs du modèle
    VProduitSelect[] produits = (VProduitSelect[]) request.getAttribute("produits");
    
%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Ajouter Vente</title>
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

<body class="vertical  dark  ">

    <div class="wrapper">
        <%@ include file="../Includes/Header-admin.jsp" %>
        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <h2 class="page-title">Modification de prix</h2>
                        <p></p>
                        <div class="row">
                            <div class="col-md-12">
                                <form action="/modifier-prix-produit" method="post">
                                    <div class="card shadow mb-4">
                                        <div class="card-body">
                                            <p class="mb-2"><strong>Modifier prix</strong></p>
                                            <div class="form-row">
                                                <!-- Selecteur Produit -->
                                                <div class="form-group col-6">
                                                    <label for="produit-select">Produit</label>
                                                    <select class="form-control select2" name="id_produit" id="produit-select">
                                                        <option value="">Selectionner un produit</option>
                                                        <% for (VProduitSelect produit : produits) { %>
                                                            <option value="<%= produit.getId_produit() %>">
                                                                <%= produit.getNom_produit() %>
                                                            </option>
                                                        <% } %>
                                                    </select>
                                                    
                                                </div>
                                                <div class="form-group col-6">
                                                    <label for="nombre-vente">Prix</label>
                                                    <input type="number" name="prix" id="nombre-vente" class="form-control">
                                                </div>
                                                
                                                <!-- Selecteur Client -->
                                            </div>

                                          
                                            <div class="form-row">
                                                <div class="form-group col-12">
                                                    <button class="btn btn-primary" type="submit">Modifier le prix</button>
                                                </div>
                                            </div>
                                        </div> <!-- /.card-body -->
                                    </div> <!-- /.card -->
                                </form>
                            </div>
                        </div> <!-- end section -->
                    </div>
                </div> <!-- .row -->
            </div> <!-- .container-fluid -->
        </main> <!-- main -->
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/simplebar.min.js"></script>
    <script src='${pageContext.request.contextPath}/assets/js/select2.min.js'></script>
    <script src="${pageContext.request.contextPath}/assets/js/apps.js"></script>
</body>

</html>
