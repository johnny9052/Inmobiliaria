<script src="Resources/public/js/general/home.js" type="text/javascript"></script>

<div class="overlay-search filtroBusquedaBanner">
    <div class="row" style="padding-bottom: 0px !important;">
        <table>
            <tr>
                <td>
                    <button id="btnArriendoFiltroHome" type="button" onclick="cambiarTipoOferta(15, this.id);" class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner">Arriendo</button>
                </td>
                <td>
                    <button id="btnVentaFiltroHome" type="button" onclick="cambiarTipoOferta(16, this.id);" class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner">Venta</button>
                </td>
                <td>
                    <button id="btnVacacionalFiltroHome" type="button" onclick="cambiarTipoOferta(17, this.id);" class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner">Vacacional</button>
                </td>
            </tr>
            <tr>
                <td colspan="3" >
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 67%;">
                                <input id="txtSearchNeighborhoodCity" name="txtSearchNeighborhoodCity" 
                                       class="form-control textoCajaSearch" type="text" value="" autocomplete="off"
                                       placeholder="Ingrese el nombre del barrio o la ciudad" style="float: left"> 
                            </td>
                            <td>
                                <button type="button" class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner" onclick="rapidSearch();">Buscar</button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>


<div class="intro intro-carousel">
    <div id="carousel" class="owl-carousel owl-theme">
        <div class="carousel-item-a intro-item bg-image" style="background-image: url(Resources/public/template/img/slide-1.jpg)">
            <div class="overlay overlay-a"></div>
            <div class="intro-content display-table">

            </div>
        </div>
        <div class="carousel-item-a intro-item bg-image" style="background-image: url(Resources/public/template/img/slide-2.jpg)">
            <div class="overlay overlay-a"></div>
            <div class="intro-content display-table">
            </div>
        </div>
        <div class="carousel-item-a intro-item bg-image" style="background-image: url(Resources/public/template/img/slide-3.jpg)">
            <div class="overlay overlay-a"></div>
            <div class="intro-content display-table">

            </div>
        </div>
    </div>
</div>