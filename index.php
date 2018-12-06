<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>EstateAgency Bootstrap Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link rel="shortcut icon" type="image/png" href="System/Resource/Images/Public/favicon.png"/>        


        <!-- Bootstrap CSS File -->
        <link href="Resources/public/template/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- GENERAL -->
        <!-- <link href="System/Resource/Style/General.css" rel="stylesheet" type="text/css"/>-->

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

        <!-- GENERAL WEB -->
        <!-- <link href="Resources/public/css/generalWeb.css" rel="stylesheet" type="text/css"/>        -->

        <!-- HEXAGONO -->
        <link href="System/Resource/Style/hexagono.css" rel="stylesheet" type="text/css"/>


        <!-- DataTables -->
        <link rel="stylesheet" href="System/Resource/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">



        <!-- Bootstrap time Picker -->
        <link rel="stylesheet" href="System/Resource/plugins/timepicker/bootstrap-timepicker.min.css">

        <!-- Libraries CSS Files -->
        <link href="Resources/public/template/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="Resources/public/template/lib/animate/animate.min.css" rel="stylesheet">
        <link href="Resources/public/template/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="Resources/public/template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Main Stylesheet File -->
        <link href="Resources/public/template/css/style.css" rel="stylesheet">


        <!-- JavaScript Libraries -->
        <script src="Resources/public/template/lib/jquery/jquery.min.js"></script>
        <script src="Resources/public/template/lib/jquery/jquery-migrate.min.js"></script>
        <script src="Resources/public/template/lib/popper/popper.min.js"></script>
        <script src="Resources/public/template/lib/bootstrap/js/bootstrap.min.js"></script>

        <script src="System/Resource/dist/js/adminlte.min.js" type="text/javascript"></script>


        <!-- TimePicker -->
        <script src="System/Resource/plugins/timepicker/bootstrap-timepicker.min.js"></script>

        <script src="Resources/public/js/general/cache.js" type="text/javascript"></script>


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


        <script src="Resources/public/template/lib/easing/easing.min.js"></script>
        <script src="Resources/public/template/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="Resources/public/template/lib/scrollreveal/scrollreveal.min.js"></script>
        <!-- Contact Form JavaScript File -->
        <script src="Resources/public/template/contactform/contactform.js"></script>

        <!-- Template Main Javascript File -->
        <script src="Resources/public/template/js/main.js"></script>


        <script src="System/Resource/Script/General/General.js" type="text/javascript"></script>

    </body>
</html>
