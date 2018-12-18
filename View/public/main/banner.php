<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
                aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <a href="index.html"><img src="Resources/public/template/img/logo.png" class="logoBanner left img-responsive"/></a>
        <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-expanded="false">
            <span class="fa fa-search" aria-hidden="true"></span>
        </button>
        <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
            <ul class="navbar-nav">


                <li class="nav-item">
                    <a class="nav-link  <?php
                    if (isset($_GET['page'])) {
                        if ($_GET['page'] === 'home') {
                            echo 'active';
                        }
                    } else {
                        echo 'active';
                    }
                    ?>" href="index.php?page=home">Inicio</a>
                </li>



                <li class="nav-item">
                    <a class="nav-link  <?php
                    if (isset($_GET['page'])) {
                        if ($_GET['page'] === 'about') {
                            echo 'active';
                        }
                    }
                    ?>" href="index.php?page=about">About</a>
                </li>




                <li class="nav-item">
                    <a class="nav-link <?php
                    if (isset($_GET['page'])) {
                        if ($_GET['page'] === 'searchPropertie') {
                            echo 'active';
                        }
                    }
                    ?>" href="index.php?page=searchPropertie">Property</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?php
                    if (isset($_GET['page'])) {
                        if ($_GET['page'] === 'blog-grid') {
                            echo 'active';
                        }
                    }
                    ?>" href="index.php?page=blog-grid">Blog</a>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Pages
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item <?php
                        if (isset($_GET['page'])) {
                            if ($_GET['page'] === 'blog-single') {
                                echo 'active';
                            }
                        }
                        ?>" href="index.php?page=blog-single">Blog Single</a>
                        <a class="dropdown-item <?php
                        if (isset($_GET['page'])) {
                            if ($_GET['page'] === 'agents-grid') {
                                echo 'active';
                            }
                        }
                        ?>" href="index.php?page=agents-grid">Agents Grid</a>
                        <a class="dropdown-item <?php
                        if (isset($_GET['page'])) {
                            if ($_GET['page'] === 'agent-single') {
                                echo 'active';
                            }
                        }
                        ?>" href="index.php?page=agent-single">Agent Single</a>
                    </div>
                </li>


                <li class="nav-item">
                    <a class="nav-link <?php
                    if (isset($_GET['page'])) {
                        if ($_GET['page'] === 'contact') {
                            echo 'active';
                        }
                    }
                    ?>" href="index.php?page=contact">Contact</a>
                </li>




                <?php
                if (isset($_SESSION['namePublicHexagon'])) {
                    ?>   


                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false" id="navbarDropdownMenuLink">
                            Bienvenid@ <?php echo $_SESSION['namePublicHexagon'] ?>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item <?php
                            if (isset($_GET['page'])) {
                                if ($_GET['page'] === 'property-single') {
                                    echo 'active';
                                }
                            }
                            ?>" href="index.php?page=managementPropertie"><i class="fa fa-home">&nbsp</i>Gestion inmuebles</a>
                            <a class="dropdown-item <?php
                            if (isset($_GET['page'])) {
                                if ($_GET['page'] === 'blog-single') {
                                    echo 'active';
                                }
                            }
                            ?>" href="index.php?page=infoUser"><i class="fa fa-user">&nbsp</i> Mi informacion</a>
                            <a class="dropdown-item <?php
                            if (isset($_GET['page'])) {
                                if ($_GET['page'] === 'agents-grid') {
                                    echo 'active';
                                }
                            }
                            ?>" href="index.php?page=pqrs"><i class="fa fa-edit">&nbsp</i> PQRS</a>
                            <a class="dropdown-item <?php
                            if (isset($_GET['page'])) {
                                if ($_GET['page'] === 'agent-single') {
                                    echo 'active';
                                }
                            }
                            ?>" onclick="LogOut();" href="#"><i class="fa fa-sign-out">&nbsp</i>Salir</a>
                        </div>
                    </li>           

                    <?php
                } else {
                    ?>   


                    <li class="nav-item">
                        <a class="nav-link <?php
                        if (isset($_GET['page'])) {
                            if ($_GET['page'] === 'contact') {
                                echo 'active';
                            }
                        }
                        ?>" href="#" data-toggle="modal" data-target="#ModalIdentifyUser"><i class = "fa fa-user">&nbsp</i> Ingresa</a>
                    </li>


                    <?php
                }
                ?> 



            </ul>
        </div>
        <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-expanded="false">
            <span class="fa fa-search" aria-hidden="true"></span>
        </button>
    </div>
</nav>
