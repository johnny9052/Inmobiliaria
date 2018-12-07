<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
                aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <a href="index.html"><img src="Resources/public/template/img/logo.png" alt="60" width="300" class="left img-responsive"/></a>
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
                    ?>" href="index.php?page=home">Home</a>
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
                        if ($_GET['page'] === 'property-single') {
                            echo 'active';
                        }
                    }
                    ?>" href="index.php?page=property-single">Property Single</a>
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
            </ul>
        </div>
        <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-expanded="false">
            <span class="fa fa-search" aria-hidden="true"></span>
        </button>
    </div>
</nav>
