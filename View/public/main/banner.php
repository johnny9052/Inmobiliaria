<header>    
    <div class="navbar navbar-dark bg-dark box-shadow  fixed-top">
        <div class="container d-flex justify-content-between">
            <a href="index.php?page=home" class="navbar-brand d-flex align-items-center">
                <i class="fa fa-genderless">&nbsp</i> 
                <strong>Inicio</strong>
            </a>

            <a href="index.php?page=searchPropertie" class="navbar-brand d-flex align-items-center">
                <i class="fa fa-home">&nbsp</i> 
                <strong>Buscar inmueble</strong>
            </a>

            <a href="index.php?page=about" class="navbar-brand d-flex align-items-center">
                <i class="fa fa-child">&nbsp</i> 
                <strong>Acerca de</strong>
            </a>
            <a href="index.php?page=contact" class="navbar-brand d-flex align-items-center">
                <i class="fa fa-comment-o">&nbsp</i> 
                <strong>Contacto</strong>
            </a>         


            <?php
            if (isset($_SESSION['userpublichexagon'])) {
                ?>      

                <a href = "#" class = "navbar-brand d-flex align-items-center">
                    <i class = "fa fa-user">&nbsp</i>
                    <strong>Bienvenido usuario</strong>
                </a>
                <?php
            } else {
                ?>   

                <a href = "#" class = "navbar-brand d-flex align-items-center" data-toggle="modal" data-target="#ModalIdentifyUser">
                    <i class = "fa fa-user">&nbsp</i>
                    <strong>Identificarse</strong>
                </a>
                <?php
            }
            ?>      


        </div>

    </div>
</header>

