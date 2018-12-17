<html>
    <head>
        <meta charset="UTF-8">
        <title></title>


        <script src="Resources/public/js/general/infoPropertie.js" type="text/javascript"></script>

        <script src="System/Resource/Script/General/Map.js" type="text/javascript"></script>
        <link href="System/Resource/Style/mapSearch.css" rel="stylesheet" type="text/css"/>


        <link href="System/Resource/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="System/Resource/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    </head>
    <body>


        <!--/ Intro Single star /-->
        <section class="intro-single">
            <div class="container">
                <div class="row" id="datosTitulo">
                    <div class="col-md-12 col-lg-8">
                        <div class="title-single-box">
                            <h1 class="title-single" id="lblTituloBarrio"></h1>
                            <span class="color-text-a" id="lblState"></span>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-4">
                        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="index.html">Inicio</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="property-grid.html">Inmueble</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page" id="lblMatricula">

                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!--/ Intro Single End /-->

        <!--/ Property Single Star /-->

        <section class="property-single nav-arrow-b">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="carouselImages">

                        </div>
                        <div class="row justify-content-between">
                            <div class="col-md-6 col-lg-5">
                                <div class="property-price d-flex justify-content-center foo">
                                    <div class="card-header-c d-flex">
                                        <div class="card-box-ico"
                                             <span class="ion-money" id="lblValue"></span>
                                        </div>

                                    </div>
                                </div>
                                <div class="property-summary">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="title-box-d section-t4">
                                                <h3 class="title-d">Información inmueble</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="summary-list">
                                        <ul class="list">
                                            <li class="d-flex justify-content-between">
                                                <strong>Id Inmueble:</strong>
                                                <span id="lblMatricula2"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Departamento:</strong>
                                                <span id="lblStateList"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Ciudad:</strong>
                                                <span id="lblCity"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Tipo Inmueble:</strong>
                                                <span id="lblPropertieType"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Tipo Oferta:</strong>
                                                <span id="lblOfferType"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Area:</strong>
                                                <span id="lblTotalArea">
                                                </span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Habitaciones:</strong>
                                                <span id="lblRoom"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Baños:</strong>
                                                <span id="lblBath"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Parqueaderos:</strong>
                                                <span id="lblParking"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Costo Administración:</strong>
                                                <span id="lblAdminVal"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Año de construcción:</strong>
                                                <span id="lblConstructionYear"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Número de piso:</strong>
                                                <span id="lblFloorNumber"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Estrato:</strong>
                                                <span id="lblStratum"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Tipo Cortina:</strong>
                                                <span id="lblCurtainType"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Tipo Vigilancia:</strong>
                                                <span id="lblSurveillanceType"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Zona:</strong>
                                                <span id="lblZoneList"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Tipo Vista:</strong>
                                                <span id="lblViewType"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Tipo Cocina:</strong>
                                                <span id="lblKitchenType"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Estructura Cocina:</strong>
                                                <span id="lblKitchenStructure"></span>
                                            </li>
                                            <li class="d-flex justify-content-between">
                                                <strong>Tipo Piso:</strong>
                                                <span id="lblFloorType"></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-7 section-md-t3">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="title-box-d">
                                            <h3 class="title-d">Descripción Inmueble</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="property-description">
                                    <p class="description color-text-a" id="lblDescription">
                                    </p>
                                </div>
                                <div class="row section-t3">
                                    <div class="col-sm-12">
                                        <div class="title-box-d">
                                            <h3 class="title-d">Datos adicionales</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="amenities-list color-text-a">
                                    <ul class="list-a no-margin divSinEspacio" id="divCheck">

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-10 offset-md-1">
                        <ul class="nav nav-pills-a nav-pills mb-3 section-t3" id="pills-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="pills-map-tab" data-toggle="pill" href="#pills-map" role="tab" aria-controls="pills-map"
                                   aria-selected="false">Ubicación</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="pills-video-tab" data-toggle="pill" href="#pills-video" role="tab"
                                   aria-controls="pills-video" aria-selected="true">Video</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-map" role="tabpanel" aria-labelledby="pills-map-tab">
                                <div id="googleMap" style="width:100%;height:460px;"></div>
                            </div>
                            <div class="tab-pane fade " id="pills-video" role="tabpanel" aria-labelledby="pills-video-tab">
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/ Property Single End /-->

        <section class="property-single nav-arrow-b">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row section-t3">
                            <div class="col-sm-12">
                                <div class="title-box-d">
                                    <h3 class="title-d">Agente de contacto</h3>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-lg-4">
                                <img src="Resources/public/template/img/agent-4.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <div class="property-agent">
                                    <h4 class="title-agent">Anabella Geller</h4>
                                    <p class="color-text-a">
                                        Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
                                        dui. Quisque velit nisi,
                                        pretium ut lacinia in, elementum id enim.
                                    </p>
                                    <ul class="list-unstyled">
                                        <li class="d-flex justify-content-between">
                                            <strong>Phone:</strong>
                                            <span class="color-text-a">(222) 4568932</span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>Mobile:</strong>
                                            <span class="color-text-a">777 287 378 737</span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>Email:</strong>
                                            <span class="color-text-a">annabella@example.com</span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>Skype:</strong>
                                            <span class="color-text-a">Annabela.ge</span>
                                        </li>
                                    </ul>
                                    <div class="socials-a">
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <a href="#">
                                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="#">
                                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="#">
                                                    <i class="fa fa-instagram" aria-hidden="true"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="#">
                                                    <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="#">
                                                    <i class="fa fa-dribbble" aria-hidden="true"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4">
                                <div class="property-contact">
                                    <form class="form-a">
                                        <div class="row">
                                            <div class="col-md-12 mb-1">
                                                <div class="form-group">
                                                    <input type="text" class="form-control form-control-lg form-control-a" id="inputName"
                                                           placeholder="Name *" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-1">
                                                <div class="form-group">
                                                    <input type="email" class="form-control form-control-lg form-control-a" id="inputEmail1"
                                                           placeholder="Email *" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-1">
                                                <div class="form-group">
                                                    <textarea id="textMessage" class="form-control" placeholder="Comment *" name="message" cols="45"
                                                              rows="8" required></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-a">Send Message</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="FormContainerContact">
            <div class="row">
                <div class="col-md-10 col-sm-10 col-xs-12">
                    <div class="form-group">                                                                        
                        <input id="txtId" name="id" class="form-control identificator"  type="hidden" value="">
                    </div>
                </div>            
            </div>
            <div class="row">
                <div class="col-md-10 col-sm-10 col-xs-12">
                    <div class="form-group">                                                                        
                        <input id="txtMatricula" name="matricula" class="form-control identificator"  type="hidden" value="">
                    </div>
                </div>            
            </div>
        </section>
        
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmpRlSVVxIje1GdQb7jlW5QwG-WBfVEnw&libraries=places&callback=myMap" async defer></script>
    </body>
</html>