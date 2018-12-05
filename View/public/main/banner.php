
<header>




    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md fixed-top" style=" background-color: white;">

        <!-- CONTENIDO PERMANENTE-->



        <div class="row">

            <a class="navbar-brand brandingHexagono" href="index.php?page=home"><img src="Resources/public/image/LogoBanner.png" alt="60" width="200" class="left img-responsive"/></a>

            <!-- END CONTENIDO PERMANENTE-->

            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="fa fa-navicon"></span>
            </button>

            <div class="navbar-collapse collapse" id="navbarCollapse" style="">
                <ul class="navbar-nav mr-auto">

                    <a class="p-2" href="index.php?page=home"><font class="textoMenu">INICIO </font></a>
                    <a class="p-2" href="index.php?page=searchPropertie"><font class="textoMenu">BUSCAR UN INMUEBLE</font></a>
                    <a class="p-2" href="index.php?page=consignPropertie"><font class="textoMenu">PUBLICAR INMUEBLE</font></a>
                    <a class="p-2" href="index.php?page=about"><font class="textoMenu">ACERCA DE HÉXAGONO</font></a>                
                    <a class="p-2" href="index.php?page=contact"><font class="textoMenu">CONTACTO</font></a>   


                    <?php
                    if (isset($_SESSION['namePublicHexagon'])) {
                        ?>   

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle textoMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Bienvenid@ <?php echo $_SESSION['namePublicHexagon'] ?>
                            </a>

                            <div class="dropdown-menu seleccionable" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="index.php?page=managementPropertie">
                                    <font class="textoMenu"><i class="fa fa-home">&nbsp</i> 
                                    Gestion inmuebles</font>
                                </a>

                                <a class="dropdown-item seleccionable" href="index.php?page=infoUser">
                                    <font class="textoMenu"><i class="fa fa-user">&nbsp</i> 
                                    Mi informacion</font>
                                </a>

                                <a class="dropdown-item seleccionable" href="index.php?page=pqrs">
                                    <font class="textoMenu"><i class="fa fa-edit">&nbsp</i> 
                                    PQRS</font>
                                </a>

                                <a class="dropdown-item seleccionable" onclick="LogOut();">
                                    <font class="textoMenu"><i class="fa fa-sign-out">&nbsp</i> 
                                    Salir</font>
                                </a>


                            </div>
                        </li>


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





                </ul>

            </div>

        </div>
    </nav>
</header>

<br>
<br>
<br>
<br>
<br>


