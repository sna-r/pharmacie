<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Liste produit</title>
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
            <div class="container-fluid<div class="row justify-content-center">
                <div class="col-12">
                    <h2 class="page-title">Produits</h2>
                    <p></p>
                    <div class="row">
                        <!-- simple table --> <!-- /. col -->
                        <div class="col-md-12">
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <p class="mb-2"><strong>Filtre</strong></p>
                                    <div class="form-row">
                                        <div class="form-group col-4">
                                            <label for="simple-select2">Maladie</label>
                                            <select class="form-control select2 select-maladie" id="simple-select2">
                                                
                                            </select>
                                        </div> <!-- form-group -->
                                        <div class="form-group col-4">
                                            <label for="simple-select2">Type</label>
                                            <select class="form-control select2 select-types" id="simple-select2">
                                                
                                            </select>
                                        </div>
                                        <div class="form-group col-4">
                                            <label for="simple-select2">Categorie</label>
                                            <select class="form-control select2 select-categorie" id="simple-select2">
                                                
                                            </select>
                                        </div>
                                        <!-- form-group -->
                                        <div class="col-4">
                                            
                                        </div>
                                        <div class="col-4">
                                            
                                        </div>
                                        <div class="col-4 categorie-selected">

                                        </div>
                                    </div> <!-- form-row -->
                                </div> <!-- /.card-body -->
                            </div> <!-- /.card -->
                            
                        </div>
                        
                        <div class="col-md-12 my-4">
                            <div class="card shadow">
                                <div class="card-body">
                                    <h5 class="card-title">Liste de tout les produits</h5>
                                    <p class="card-text"></p>
                                    <div class="result-productCTM">
                                   
                                    </div>

                                </div>
                            </div>
                        </div> <!-- simple table -->
                       
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
    <script>
        // categorie
        var categorieSelectedValue = []
        var categorieSelectedKey = []


    </script>
    <script src="${pageContext.request.contextPath}/assets/js/MyJS/resultatTable.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/MyJS/ProduitCTM.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/MyJS/resultatSelect.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/MyJS/MaladieSelect.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/MyJS/CategorieSelect.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/MyJS/TypesSelect.js"></script>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script>
        // categorie
        var categorieSelectedPlace = document.querySelector('.categorie-selected');
        addCategorieSelected();
        function addCategorieSelected() {

            categorieSelectedPlace.innerHTML = ""
            console.log(categorieSelectedValue)
            console.log(categorieSelectedKey)
            let i = 0
            categorieSelectedValue.forEach((categoryValue, index) => {
                let classResult = document.createElement("div");
                classResult.setAttribute("class", "col-12 mb-4")
                classResult.setAttribute("class", "col-12 mb-4")

                let classResultDetails = document.createElement("div");
                classResultDetails.setAttribute("class", "alert alert-secondary alert-dismissible fade show")
                classResultDetails.setAttribute("role", "alert")
                let resultValue = document.createElement("span");
                resultValue.innerText = categoryValue

                let buttonAnnulation = document.createElement("button");
                buttonAnnulation.setAttribute("type", "button")
                buttonAnnulation.setAttribute("class", "close")
                buttonAnnulation.setAttribute("data-dismiss", "alert")
                buttonAnnulation.setAttribute("aria-label", "Close")
                buttonAnnulation.innerHTML = `<span aria-hidden="true">&times;</span>`

                buttonAnnulation.addEventListener("click", () => {
                    categorieSelectedKey.splice(index, 1)
                    categorieSelectedValue.splice(index, 1)
                    addCategorieSelected()
                })

                classResultDetails.appendChild(resultValue);
                classResultDetails.appendChild(buttonAnnulation)
                classResult.append(classResultDetails)
                categorieSelectedPlace.appendChild(classResult);
            })
        }

        // maladie
        var typesSelectedPlace = document.querySelector('.types-selected');
        addTypesSelected();
        function addTypesSelected() {

            typesSelectedPlace.innerHTML = ""
            console.log(typesSelectedValue)
            console.log(typesSelectedKey)
            let i = 0
            typesSelectedValue.forEach((categoryValue, index) => {
                let classResult = document.createElement("div");
                classResult.setAttribute("class", "col-12 mb-4")
                classResult.setAttribute("class", "col-12 mb-4")

                let classResultDetails = document.createElement("div");
                classResultDetails.setAttribute("class", "alert alert-secondary alert-dismissible fade show")
                classResultDetails.setAttribute("role", "alert")
                let resultValue = document.createElement("span");
                resultValue.innerText = categoryValue

                let buttonAnnulation = document.createElement("button");
                buttonAnnulation.setAttribute("type", "button")
                buttonAnnulation.setAttribute("class", "close")
                buttonAnnulation.setAttribute("data-dismiss", "alert")
                buttonAnnulation.setAttribute("aria-label", "Close")
                buttonAnnulation.innerHTML = `<span aria-hidden="true">&times;</span>`

                buttonAnnulation.addEventListener("click", () => {
                    typesSelectedKey.splice(index, 1)
                    typesSelectedValue.splice(index, 1)
                    addTypesSelected()
                })

                classResultDetails.appendChild(resultValue);
                classResultDetails.appendChild(buttonAnnulation)
                classResult.append(classResultDetails)
                typesSelectedPlace.appendChild(classResult);
            })
        }

        // maladie
        var maladieSelectedPlace = document.querySelector('.maladie-selected');
        addMaladieSelected();
        function addMaladieSelected() {

            maladieSelectedPlace.innerHTML = ""
            console.log(maladieSelectedValue)
            console.log(maladieSelectedKey)
            let i = 0
            maladieSelectedValue.forEach((categoryValue, index) => {
                let classResult = document.createElement("div");
                classResult.setAttribute("class", "col-12 mb-4")
                classResult.setAttribute("class", "col-12 mb-4")

                let classResultDetails = document.createElement("div");
                classResultDetails.setAttribute("class", "alert alert-secondary alert-dismissible fade show")
                classResultDetails.setAttribute("role", "alert")
                let resultValue = document.createElement("span");
                resultValue.innerText = categoryValue

                let buttonAnnulation = document.createElement("button");
                buttonAnnulation.setAttribute("type", "button")
                buttonAnnulation.setAttribute("class", "close")
                buttonAnnulation.setAttribute("data-dismiss", "alert")
                buttonAnnulation.setAttribute("aria-label", "Close")
                buttonAnnulation.innerHTML = `<span aria-hidden="true">&times;</span>`

                buttonAnnulation.addEventListener("click", () => {
                    maladieSelectedKey.splice(index, 1)
                    maladieSelectedValue.splice(index, 1)
                    addMaladieSelected()
                })

                classResultDetails.appendChild(resultValue);
                classResultDetails.appendChild(buttonAnnulation)
                classResult.append(classResultDetails)
                maladieSelectedPlace.appendChild(classResult);
            })
        }

        var selectCategorie = document.querySelector('.select-categorie');
        selectCategorie.addEventListener('change', () => {
            let selectedOptionCategorie = selectCategorie.options[selectCategorie.selectedIndex]
            categorieSelectedKey.push(selectedOptionCategorie.value);
            categorieSelectedValue.push(selectedOptionCategorie.text);
            addCategorieSelected();
        })


        window.onload = function () {
            displayMaladie();
            displayTypes();
            displayCategorie();
            displayProductCTM();
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