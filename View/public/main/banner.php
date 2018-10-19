<div class="flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white  fixed-top">

    <div class="row">

        <div class="col-md-2">                 
        </div>
        
        <div class="col-md-2">   
            <h5 class="my-0 mr-md-auto font-weight-normal">HEXAGONO</h5>
        </div>

        <div class="col-md-6">
            
            <nav class="my-2 my-md-0 mr-md-3">
                <a class="p-2 text-dark" href="index.php?page=home">Inicio</a>
                <a class="p-2 text-dark" href="index.php?page=searchPropertie">Buscar inmueble</a>
                <a class="p-2 text-dark" href="index.php?page=about">Acerca de</a>
                <a class="p-2 text-dark" href="index.php?page=contact">Contacto</a>


                <?php
                if (isset($_SESSION['namePublicHexagon'])) {
                    ?>      



                    <a href = "#" class = "p-2 text-dark">
                        <i class = "fa fa-user">&nbsp</i>
                        Bienvenido <?php echo $_SESSION['emailPublicHexagon'] ?>
                    </a>


                    <a href="index.php?page=managementPropertie" class="p-2 text-dark">
                        <i class="fa fa-child">&nbsp</i> 
                        Gestion inmuebles
                    </a>

                    <a href="index.php?page=about" class="p-2 text-dark">
                        <i class="fa fa-child">&nbsp</i> 
                        PQRS
                    </a>


                    <a href = "#" class = "p-2 text-dark" onclick="LogOut();">
                        <i class="fa fa-sign-out"></i>                    
                    </a>
                    <?php
                } else {
                    ?>   

                    <a href = "#" class = "p-2 text-dark" data-toggle="modal" data-target="#ModalIdentifyUser">
                        <i class = "fa fa-user">&nbsp</i>
                        Identificarse
                    </a>
                    <?php
                }
                ?>      

            </nav>
        </div>
        <!--      <a class="btn btn-outline-primary" href="https://getbootstrap.com/docs/4.1/examples/pricing/#">Sign up</a>-->
    </div>

</div>




