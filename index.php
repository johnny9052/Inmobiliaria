<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>EstateAgency Bootstrap Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

        <!-- Bootstrap CSS File -->
        <link href="Resources/public/template/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Libraries CSS Files -->
        <link href="Resources/public/template/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="Resources/public/template/lib/animate/animate.min.css" rel="stylesheet">
        <link href="Resources/public/template/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="Resources/public/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Main Stylesheet File -->
        <link href="Resources/public/template/css/style.css" rel="stylesheet">


    </head>

    <body>

        <!-- BUSCADOR -->  
        <?php
        include("View/public/main/search.php");
        ?>
        <!-- END BUSCADOR -->  


        <!-- BANNER MENU -->
        <?php
        include("View/public/main/banner.php");
        ?>
        <!-- END BANNER MENU -->


        <!-- MASTER PAGE CONTROL  -->
        <?php
        if (isset($_GET['page'])) {

//            if (($_GET['page'] === 'infoUser' || $_GET['page'] === 'managementPropertie' ||
//                    $_GET['page'] === 'pqrs')) {
//                if (isset($_SESSION['identificationPublicHexagon'])) {
//                    include("View/public/" . $_GET['page'] . ".php");
//                } else {
//                    include("View/public/home.php");
//                }
//            } else {
//                include("View/public/" . $_GET['page'] . ".php");
//            }

            include("View/public/" . $_GET['page'] . ".php");
        } else {
            include("View/public/home.php");
        }
        ?>                        
        <!--END MASTER PAGE CONTROL  -->



        <!-- FOOTER -->
<?php
include("View/public/main/footer.php");
?>
        <!-- END FOOTER -->


        <!-- BARRA DE CARGA -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        <div id="preloader"></div>
        <!--END BARRA DE CARGA -->

        <!-- JavaScript Libraries -->
        <script src="Resources/public/template/lib/jquery/jquery.min.js"></script>
        <script src="Resources/public/template/lib/jquery/jquery-migrate.min.js"></script>
        <script src="Resources/public/template/lib/popper/popper.min.js"></script>
        <script src="Resources/public/template/lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="Resources/public/template/lib/easing/easing.min.js"></script>
        <script src="Resources/public/template/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="Resources/public/template/lib/scrollreveal/scrollreveal.min.js"></script>
        <!-- Contact Form JavaScript File -->
        <script src="Resources/public/template/contactform/contactform.js"></script>

        <!-- Template Main Javascript File -->
        <script src="Resources/public/template/js/main.js"></script>

    </body>
</html>
