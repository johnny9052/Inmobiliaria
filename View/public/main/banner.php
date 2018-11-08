<div class="flex-column flex-md-row align-items-center p-2 px-md-4 mb-3 bg-white fixed-top">
    <div class="row bannerMenuPadre align-self-md-end" >
        <div class="col-md-2">                 
            <a class="btn btn-xs btn-social-icon btn-facebook"><i class="fa fa-facebook"></i></a>
            <a class="btn btn-xs btn-social-icon btn-instagram"><i class="fa fa-instagram"></i></a>
            <a class="btn btn-xs btn-social-icon btn-linkedin"><i class="fa fa-linkedin"></i></a>
            <a class="btn btn-xs btn-social-icon btn-twitter"><i class="fa fa-twitter"></i></a>
        </div>
        <div class="col-md-1 text-center">

        </div>

        <div class="col-md-8 align-self-md-end bannerMenu ">
            <nav class="my-2 my-md-0 mr-md-3">
                <?php
                if (isset($_SESSION['namePublicHexagon'])) {
                    ?>      

                    <a class="p-2" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <font class="textoMenu"> Bienvenid@ <?php echo $_SESSION['namePublicHexagon'] ?> </font>
                    </a>


                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="index.php?page=managementPropertie">
                            <font class="textoMenu"><i class="fa fa-home">&nbsp</i> 
                            Gestion inmuebles</font>
                        </a>
                        <a class="dropdown-item" href="index.php?page=infoUser">
                            <font class="textoMenu"><i class="fa fa-user">&nbsp</i> 
                            Mi informacion</font>
                        </a>
                        <a class="dropdown-item" href="index.php?page=pqrs">
                            <font class="textoMenu"><i class="fa fa-edit">&nbsp</i> 
                            PQRS</font>
                        </a>

                        <a class="dropdown-item" onclick="LogOut();">
                            <font class="textoMenu"><i class="fa fa-sign-out"></i>&nbsp Salir</font>                 
                        </a>
                    </div>


                    <?php
                } else {
                    ?>   

                    <a href = "#" class = "p-2 text-dark" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#ModalIdentifyUser">
                        <font class="textoMenu "><i class = "fa fa-user">&nbsp</i>
                        INGRESA</font>
                    </a>
                    <?php
                }
                ?> 
            </nav>
        </div>
    </div>

    <div class="row bannerMenuPadre">

        <div class="col-md-1">                 
        </div>

        <div class="col-md-2">
            <a href="index.php?page=home"><img src="Resources/public/image/LogoBanner.PNG" alt="60" width="250" class="left img-responsive"/></a>
        </div>

        <div class="col-md-8 bannerMenu right">
            <nav class="my-2 my-md-0 mr-md-3 align-self-md-end">
                <a class="p-2" href="index.php?page=home"><font class="textoMenu">INICIO </font></a>
                <a class="p-2" href="index.php?page=searchPropertie"><font class="textoMenu">BUSCAR UN INMUEBLE</font></a>
                <a class="p-2" href="index.php?page=consignPropertie"><font class="textoMenu">CONSIGNAR UN INMUEBLE</font></a>
                <a class="p-2" href="index.php?page=about"><font class="textoMenu">ACERCA DE HÉXAGONO</font></a>                
                <a class="p-2" href="index.php?page=contact"><font class="textoMenu">CONTACTO</font></a>                
            </nav>
        </div>
        <div class="col-md-1">                 
        </div>
        <!--      <a class="btn btn-outline-primary" href="https://getbootstrap.com/docs/4.1/examples/pricing/#">Sign up</a>-->
    </div>

</div>




