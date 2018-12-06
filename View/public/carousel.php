<script src="Resources/public/js/general/home.js" type="text/javascript"></script>

<div class="intro intro-carousel">
    <div id="carousel" class="owl-carousel owl-theme">
        <div class="carousel-item-a intro-item bg-image" style="background-image: url(Resources/public/template/img/slide-1.jpg)">
            <div class="overlay overlay-a"></div>
            <div class="intro-content display-table">
                <div class="table-cell">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="intro-body">
                                    <p class="intro-title-top">Doral, Florida
                                        <br> 78345</p>
                                    <h1 class="intro-title mb-4">
                                        <span class="color-b">204 </span> Mount
                                        <br> Olive Road Two</h1>
                                    <p class="intro-subtitle intro-price">
                                        <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item-a intro-item bg-image" style="background-image: url(Resources/public/template/img/slide-2.jpg)">
            <div class="overlay overlay-a"></div>
            <div class="intro-content display-table">
                <div class="table-cell">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="intro-body">
                                    <p class="intro-title-top">Doral, Florida
                                        <br> 78345</p>
                                    <h1 class="intro-title mb-4">
                                        <span class="color-b">204 </span> Rino
                                        <br> Venda Road Five</h1>
                                    <p class="intro-subtitle intro-price">
                                        <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item-a intro-item bg-image" style="background-image: url(Resources/public/template/img/slide-3.jpg)">
            <div class="overlay overlay-a"></div>
            <div class="intro-content display-table">
                <div class="table-cell">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="intro-body">
                                    <p class="intro-title-top">Doral, Florida
                                        <br> 78345</p>
                                    <h1 class="intro-title mb-4">
                                        <span class="color-b">204 </span> Alira
                                        <br> Roan Road One</h1>
                                    <p class="intro-subtitle intro-price">
                                        <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</div>
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