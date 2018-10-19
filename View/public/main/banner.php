<div class="flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white  fixed-top">

    <div class="row bannerMenuPadre">

        <div class="col-md-2">                 
        </div>

        <div class="col-md-2">
            <img src="Resources/public/image/LogoBanner.PNG" alt="60" width="200" />
        </div>

        <div class="col-md-6 align-self-md-end bannerMenu">

            <nav class="my-2 my-md-0 mr-md-3">
                <a class="p-2" href="index.php?page=home"><font class="textoMenu">Inicio </font></a>
                <a class="p-2" href="index.php?page=searchPropertie"><font class="textoMenu">Buscar inmueble</font></a>
                <a class="p-2" href="index.php?page=about"><font class="textoMenu">Acerca de</font></a>                


                <?php
                if (isset($_SESSION['namePublicHexagon'])) {
                    ?>      



                    <a href = "#" class = "p-2 text-dark">
                        <font class="textoMenu"><i class = "fa fa-user">&nbsp</i>
                        Bienvenido <?php echo $_SESSION['emailPublicHexagon'] ?></font>
                    </a>


                    <a href="index.php?page=managementPropertie" class="p-2 text-dark">
                        <font class="textoMenu"><i class="fa fa-child">&nbsp</i> 
                        Gestion inmuebles</font>
                    </a>

                    <a href="index.php?page=pqrs" class="p-2 text-dark">
                        <font class="textoMenu"><i class="fa fa-child">&nbsp</i> 
                        PQRS</font>
                    </a>


                    <a href = "#" class = "p-2 text-dark" onclick="LogOut();">
                        <font class="textoMenu"><i class="fa fa-sign-out"></i>   </font>                 
                    </a>
                    <?php
                } else {
                    ?>   

                    <a href = "#" class = "p-2 text-dark" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#ModalIdentifyUser">
                        <font class="textoMenu"><i class = "fa fa-user">&nbsp</i>
                        Identificarse</font>
                    </a>
                    <?php
                }
                ?>      

            </nav>
        </div>
        <!--      <a class="btn btn-outline-primary" href="https://getbootstrap.com/docs/4.1/examples/pricing/#">Sign up</a>-->
    </div>

</div>




