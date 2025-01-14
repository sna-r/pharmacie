<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Conseil du mois : Ajouter</title>
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
                <div class="container-fluid<div class=" row justify-content-center">
                    <div class="col-12">
                        <h2 class="page-title">Ajouter un conseil du mois</h2>
                        <p></p>
                        <div class="row">
                            <!-- simple table --> <!-- /. col -->
                            <div class="col-md-12">
                                <form action="/add-conseil-mois-traitement" method="post">
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <p class="mb-2"><strong></strong></p>
                                        <div class="form-row">
                                            <div class="form-group col-6">
                                                <label for="simple-select2">Produit</label>
                                                <select class="form-control select2 select-produits" name="id_produit" id="simple-select2">

                                                </select>
                                            </div>
                                            <div class="form-group col-6">
                                                <label for="example-Date">Date</label>
                                                <input type="month" id="example-Date" name="date" class="form-control">
                                            </div>
                                           
                                            <div class="form-group col-12">
                                                <label for="example-raison">Raison</label>
                                                <textarea type="Date" id="example-raison" name="raison" class="form-control"></textarea>
                                            </div>
                                            <div class="form-group col-12">
                                                <button class="btn btn-primary">Ajouter</button>
                                            </div>
                                        </div> <!-- form-row -->
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
    <script src='${pageContext.request.contextPath}/assets/js/daterangepicker.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/jquery.stickOnScroll.js'></script>
    <script src="${pageContext.request.contextPath}/assets/js/tinycolor-min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/config.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/d3.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/topojson.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datamaps.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datamaps-zoomto.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datamaps.custom.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/Chart.min.js"></script>
    <script>
        /* defind global options */
        Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
        Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/gauge.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/apexcharts.custom.js"></script>
    <script src='${pageContext.request.contextPath}/assets/js/jquery.mask.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/select2.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/jquery.steps.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/jquery.validate.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/jquery.timepicker.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/dropzone.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/uppy.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/quill.min.js'></script>

    <script src="${pageContext.request.contextPath}/assets/js/apps.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.4.min.js"></script>


    <!-- My javascript -->

    <script src="${pageContext.request.contextPath}/assets/js/MyJS/resultatSelect.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/MyJS/ProduitSelect.js"></script>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script>
       
        window.onload = function () {
            displayProduitsSelect();
        };
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'UA-56159088-1');

    </script>
</body>

</html>