<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <title>Inmobiliaria Armenia</title>
        <link rel="shortcut icon" type="image/png" href="System/Resource/Images/Public/favicon.png"/>

        <!-- CSS  -->        

        <link href="Resources/public/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link href="Resources/public/css/album.css" rel="stylesheet" type="text/css"/>  

        <link href="Resources/public/css/carousel.css" rel="stylesheet" type="text/css"/>
        
        <link href="System/Resource/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        
        <link href="System/Resource/plugins/bootstrap-slider/slider.css" rel="stylesheet" type="text/css"/>

        <link href="System/Resource/Style/General.css" rel="stylesheet" type="text/css"/>
        <link href="System/Resource/Style/hexagono.css" rel="stylesheet" type="text/css"/>


        <!-- Font Awesome <Esta es utilizada para los iconos de bootstrap> -->
        <link href="Resources/public/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>        
        <!--  Scripts-->
<!--        <script src="Resources/public/js/jquery/code.jquery.com_jquery-3.3.1.slim.min.js" type="text/javascript"></script>-->
        <script src="System/Resource/bower_components/jquery/dist/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>');</script>        
        <script src="Resources/public/js/bootstrap/vendor/popper.min.js" type="text/javascript"></script>        
        <script src="Resources/public/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>        
        
        <script src="System/Resource/plugins/bootstrap-slider/bootstrap-slider.js" type="text/javascript"></script>
        
        <script src="Resources/public/js/bootstrap/vendor/holder.min.js" type="text/javascript"></script>
        
        <script src="System/Resource/bower_components/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="System/Resource/bower_components/fastclick/lib/fastclick.js" type="text/javascript"></script>
        
        <script src="System/Resource/dist/js/adminlte.min.js" type="text/javascript"></script>
        
        <script src="System/Resource/Script/General/General.js" type="text/javascript"></script>
                
        <script src="Resources/public/js/general/cache.js" type="text/javascript"></script>

    </head>
    <body>



        <!-- MASTER PAGE CONTROL  -->
        <?php
        include("View/public/main/banner.php");


        if (isset($_GET['page'])) {
            include("View/public/" . $_GET['page'] . ".php");
        } else {
            include("View/public/home.php");
        }


        include("View/public/main/footer.php");
        ?>                        
        <!--END MASTER PAGE CONTROL  -->







        <!--MODAL GENERICO PARA MOSTRAR MENSAJES -->
        <div class="modal fade" id="modal-default">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                        
                        <h4 class="modal-title" id="lblTituloMensajeModal">Mensaje</h4>
                    </div>
                    <div class="modal-body">
                        <p id="lblMessageModal"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>                        
                    </div>
                </div>                
            </div>            
        </div>
        <!--END MODAL GENERICO PARA MOSTRAR MENSAJES -->


    </body>
</html>
