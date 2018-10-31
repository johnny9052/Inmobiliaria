<script src="Resources/public/js/general/videoTourDestacado.js" type="text/javascript"></script>

<div class="row">
    <div class="col-md-2 col-sm-1 col-xs-12"></div>

    <div class="col-md-3 col-sm-12 col-xs-12">
        <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">
            <h3 class="titulosPrincipales">Video Tour</h3>            
            <iframe 
                width="330" height="185" src="https://www.youtube.com/embed/6KpqL5Ke8nU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>                    
            </iframe>

        </div>
    </div>

    <div class="col-md-5 col-sm-12 col-xs-12">
        <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">
            <table width="100%">
                <tr>
                    <td><h3>Destacados</h3></td>

                    <td id="segmentoPaginadorDestacado" class="tituloDestacado">
                        <img src="Resources/public/image/iconoAnterior.PNG" alt="1" width="30" onclick="repaginarDestacado(-2)"/>
                        <img src="Resources/public/image/iconoSiguiente.PNG" alt="1" width="30" onclick="repaginarDestacado(2)"/>
                    </td>
                </tr>
            </table>
            <hr>

            <table id="tblInmueblesDestacados">
            </table>


        </div>
    </div>


    <div class="col-md-2 col-sm-1 col-xs-12"></div>
</div>
