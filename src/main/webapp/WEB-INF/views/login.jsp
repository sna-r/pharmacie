<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Login</title>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/simplebar.css">
    <!-- Fonts CSS -->
    
    <!-- Icons CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/feather.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app-light.css" id="lightTheme" disabled>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app-dark.css" id="darkTheme">
</head>

<body class="dark ">
    <div class="wrapper vh-100">
        <div class="row align-items-center h-100">
            <form class="col-lg-3 col-md-4 col-10 mx-auto text-center" method="post" action="login-traitement">
                <h1 class="h1 mb-3">Connection</h1>
                <div class="form-group">
                    <label for="inputEmail" class="sr-only">Login</label>
                    <input type="text" id="inputEmail" name="login" class="form-control form-control-lg" placeholder="entrer le login"
                        required="" autofocus="">
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="sr-only">Mot de passe</label>
                    <input type="password" name="mdp" id="inputPassword" class="form-control form-control-lg"
                        placeholder="entrer le mot de passe" required="">
                </div>
                
                <button class="btn btn-lg btn-primary btn-block" type="submit">Connecter</button>
                <br>
            </form>
        </div>
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
    <script src="${pageContext.request.contextPath}/assets/js/apps.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'UA-56159088-1');
    </script>
</body>

</html>
</body>

</html>