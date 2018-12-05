
<br><br>
<script src="Resources/public/js/general/home.js" type="text/javascript"></script>
<!-- INICIO DEL CARRUSEL-->
<div class="row rowCarrusel">
    <div class="col-md-1 col-sm-1 col-xs-12"></div>
    <div class="col-md-10 col-sm-10 col-xs-12" id="containercarusel">
        <div id="divcarusel" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators" id="paginatorcarusel">	
                <li data-target="#divcarusel" data-slide-to="0" class="active"></li>
                <li data-target="#divcarusel" data-slide-to="1" class=""></li>
                <li data-target="#divcarusel" data-slide-to="2" class=""></li>                
            </ul>

            <div class="carousel-inner" id="imagesCarusel" style="max-width: 1100px; max-height: 450px; min-height: 250px;">
                <div class="carousel-item active">
                    <img src="Resources/public/image/banner1.jpg" alt="Hexagono">
                </div>  
                <div class="carousel-item ">
                    <img src="Resources/public/image/banner2.jpg" alt="Arriendos">
                </div>
                <div class="carousel-item ">
                    <img src="Resources/public/image/banner3.jpg" alt="vacacional">
                </div>              
            </div>
            <a class="carousel-control-prev" href="#divcarusel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#divcarusel" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>


            <div class="filtroBusquedaBanner">
                <div class="row" style="padding-bottom: 0px !important;">



                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <table>
                            <tr>
                                <td>
                                    <button id="btnArriendoFiltroHome" type="button" onclick="cambiarTipoOferta('arriendo', this.id);" class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner">Arriendo</button>
                                </td>
                                <td>
                                    <button id="btnVentaFiltroHome" type="button" onclick="cambiarTipoOferta('venta', this.id);" class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner">Venta</button>
                                </td>

                                <td>
                                    <button id="btnVacacionalFiltroHome" type="button" onclick="cambiarTipoOferta('vacacional', this.id);" class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner">Vacacional</button>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3" >
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 80%;">
                                                <input id="txtSearchNeighborhoodCity" name="txtSearchNeighborhoodCity" 
                                                       class="form-control" type="text" value="" autocomplete="off"
                                                       placeholder="Ingrese el nombre del barrio o la ciudad" style="float: left"> 
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-block btn-primary btn-lg transparencia" onclick="rapidSearch();">Buscar</button>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </div>                    


                </div>
            </div>



        </div>
    </div>
    <div class="col-md-1 col-sm-1 col-xs-12"></div>
</div>
<!-- FIN DEL CARRUSEL-->



<!-- INICIO SECCION CENTRAL-->
<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h3 class="titulosPrincipales">NUESTRA SECCIÓN INMOBILIARIA EN COLOMBIA</h3>
    <small>Encuentra tu inmueble, a continuación selecciona la región en donde quieres buscar</small>
</div>
<!-- FIN SECCION CENTRAL-->

<br>


<!-- INICIO IMAGENES DE LAS CIUDADES PRINCIPALES-->
<section >
    <div class="container marketing">
        
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-12" style="text-align: center;">
                <img class="" src="Resources/public/image/risaralda.jpg" alt="Generic placeholder image" width="240" height="140">
                <br>
                <label>Risaralda</label>                
            </div>            
            <div class="col-lg-3 col-md-6 col-sm-12" style="text-align: center;">
                <img class="" src="Resources/public/image/Quindio.jpg" alt="Generic placeholder image" width="240" height="140">
                <br>
                <label>Quindío</label>
                <br>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12" style="text-align: center;">
                <img class="" src="Resources/public/image/Caldas.jpg" alt="Generic placeholder image" width="240" height="140">            
                <br>
                <label>Caldas</label>
                <br>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12" style="text-align: center;">
                <img class="" src="Resources/public/image/Vacaciones.jpg" alt="Generic placeholder image" width="240" height="140">
                <br>
                <label>Vacacionales</label>
                <br>
            </div>
        </div>
    </div>
</section>
<!-- FIN IMAGENES DE LAS CIUDADES PRINCIPALES-->

<br>


<!-- INICIO VIDEO TOUR Y DESTACADOS-->
<?php
include("View/public/main/videoTourDestacados.php");
?>             
<!-- FIN VIDEO TOUR Y DESTACADOS-->


<div class="row">
    <div class="col-md-1 col-sm-1 col-xs-12"></div>
    <div class="col-md-10 col-sm-10 col-xs-12">
        <hr>
    </div>
    <div class="col-md-1 col-sm-1 col-xs-12"></div>
</div>

<div class="row">

    <div class="col-md-1 col-sm-1 col-xs-12">

    </div>

    <div class="col-md-10 col-sm-1 col-xs-12">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-1 col-xs-12">
                    <img src="Resources/public/image/patrocinio1.PNG" alt=""/>
                </div>

                <div class="col-md-3 col-sm-1 col-xs-12">
                    <img src="Resources/public/image/socio1.PNG" alt=""/>
                </div>

                <div class="col-md-3 col-sm-1 col-xs-12">
                    <img src="Resources/public/image/patrocinio1.PNG" alt=""/>
                </div>

                <div class="col-md-3 col-sm-1 col-xs-12">
                    <img src="Resources/public/image/socio1.PNG" alt=""/>
                    <br><br><br>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-1 col-sm-1 col-xs-12"></div>
</div>
