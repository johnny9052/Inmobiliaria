<script src="Resources/public/js/general/searchPropertie.js" type="text/javascript"></script>

<!--/ Intro Single star /-->
<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">Inmuebles disponibles</h1>
                    <span class="color-text-a">Aprovecha!</span>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.php?page=home">Inicio</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Inmuebles
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!--/ Intro Single End /-->

<!--/ Property Grid Star /-->
<section class="property-grid grid">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="grid-option">
                    <form>
                        <select id="selOfferTypeGeneral" name ="offerTypeGeneral" class="custom-select" onchange="searchOfferType();">
                            <option value="-1" selected> Mostrar todo</option> 
                        </select>
                    </form>
                </div>
            </div>
        </div>
        <div class="row" id="lstProperties">
            
        </div>

        <div class="row">
            <div class="col-sm-12">
                <nav class="pagination-a">
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">
                                <span class="ion-ios-arrow-back"></span>
                            </a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item next">
                            <a class="page-link" href="#">
                                <span class="ion-ios-arrow-forward"></span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>
<!--/ Property Grid End /-->
