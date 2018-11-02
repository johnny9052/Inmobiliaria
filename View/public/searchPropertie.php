<script src="Resources/public/js/general/searchpropertie.js" type="text/javascript"></script>

<main role="main">
    <br>
    <br>
    <div class="album py-5 ">
        <div class="container">
            <div id="FormContainer">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary collapsed-box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Filtros de búsqueda básicos</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                                    </button>
                                </div>
                                <!-- /.box-tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <!-- AQUI VA EL CONTENIDO-->


                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Departamento</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoUbicacion.PNG" alt="1" width="20"/> &nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selState" name="state" 
                                                                class="form-control select2" style="width: 100%;"  
                                                                onchange="loadCity(this.value);actualizarMucipioMapa();">
                                                            <option value="-1" selected> Selecciona</option>                            
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>     

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Municipio</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoUbicacion.PNG" alt="1" width="20"/> &nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selCity" name="city" required class="form-control select2" style="width: 100%;" 
                                                                onchange="loadNeighborhood(this.value);actualizarMucipioMapa();">
                                                            <option value="-1" selected> Selecciona</option>                            
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>     
                                </div>


                                <div class="row">                            
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Barrio</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoSector.PNG" alt="30" width="30"/> &nbsp;&nbsp;&nbsp;
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selBarrio" name="barrio" required class="form-control select2" style="width: 100%;">
                                                            <option value="-1" selected> Selecciona</option>                            
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>     


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Zona</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoSector.PNG" alt="30" width="30"/>
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selZone" name="zone" required class="form-control select2" style="width: 100%;">
                                                            <option value="-1" selected> Selecciona</option>                            
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>     
                                </div>


                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Tipo inmueble</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoTipoInmueble.PNG" alt="30" width="30"/>
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selPropertieType" name="propertieType" required class="form-control select2" style="width: 100%;">
                                                            <option value="-1" selected> Selecciona</option>                            
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>   


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Tipo oferta</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoVentaArriendo.PNG" alt="30" width="30"/>
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selOfferType" name="offerType" 
                                                                class="form-control select2" style="width: 100%;" required>
                                                            <option value="-1" selected> Selecciona </option>                            
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>    
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="lblvalorMaxInmueble">Valor máximo del inmueble : $ </label>
                                        <label id='lblvalorMaxInmueble'>0</label>
                                        <br>
                                        <table width='100%'>
                                            <tr>
                                                <td class="tdImageSearch">
                                                    <img src="Resources/public/image/iconoPrecio.PNG" alt="30" width="30"/>
                                                </td>
                                                <td>
                                                    $0
                                                </td>
                                                <td class="tdSelectSearch">
                                                    <input value="0" type="range" class="custom-range" min="0" 
                                                           max="2500000" step="100000" id="rngValorMaximoInmueble" 
                                                           oninput="changeValueRange('rngValorMaximoInmueble','lblvalorMaxInmueble');" 
                                                           onchange="changeValueRange('rngValorMaximoInmueble', 'lblvalorMaxInmueble');">
                                                </td>
                                                <td id="lblValorMaxPosible">
                                                    $2'500.000
                                                </td>
                                            </tr>
                                        </table>

                                    </div>


                                    <div class="col-md-6">
                                        <label for="lblAreaInmueble">Área máxima</label>
                                        <label id='lblAreaInmueble'>0</label> <label>mts2</label>
                                        <br>
                                        <table width='100%'>
                                            <tr>
                                                <td class="tdImageSearch">
                                                    <img src="Resources/public/image/iconoAreaConstruida.PNG" alt="30" width="30"/>
                                                </td>
                                                <td>
                                                    0 mts2
                                                </td>
                                                <td>
                                                    <input value="0" type="range" class="custom-range" min="0" 
                                                           max="250" step="5" id="rngAreaInmueble" 
                                                           oninput="changeValueRange('rngAreaInmueble','lblAreaInmueble');" 
                                                           onchange="changeValueRange('rngAreaInmueble', 'lblAreaInmueble');">
                                                </td>
                                                <td id="lblAreaMaxPosible">
                                                    250 mts2
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">   
                                        <br>
                                        <button  id="btnSave" onclick="listProperties();" type ="button" class="btn btn-primary">Listar</button>
                                    </div>
                                </div>




                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>                              
                </div>




                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary collapsed-box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Otros filtros de busqueda</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                                    </button>
                                </div>
                                <!-- /.box-tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <!-- AQUI VA EL CONTENIDO-->

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Estrato</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoSector.PNG" alt="30" width="30"/>
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selStratum" name="estrato" 
                                                                class="form-control select2" style="width: 100%;" required>
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Parqueaderos</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoParqueadero.PNG" alt="30" width="30"/>
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selParqueaderos" name="parking" 
                                                                class="form-control select2" style="width: 100%;" required>
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                            <option value="1" >1</option>      
                                                            <option value="2" >2</option>      
                                                            <option value="3" >3</option>      
                                                            <option value="4" >4</option>      
                                                            <option value="5" >5</option>      
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Habitaciones</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoHabitaciones.PNG" alt="30" width="30"/>
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selHabitaciones" name="room" 
                                                                class="form-control select2" style="width: 100%;" required>
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                            <option value="1" >1</option>      
                                                            <option value="2" >2</option>      
                                                            <option value="3" >3</option>      
                                                            <option value="4" >4</option>      
                                                            <option value="5" >5</option>      
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div> 

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Baños</label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdImageSearch">
                                                        <img src="Resources/public/image/iconoBanos.PNG" alt="30" width="30"/>
                                                    </td>
                                                    <td class="tdSelectSearch">
                                                        <select id="selBanios" name="bath" 
                                                                class="form-control select2" style="width: 100%;" required>
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                            <option value="1" >1</option>      
                                                            <option value="2" >2</option>      
                                                            <option value="3" >3</option>      
                                                            <option value="4" >4</option>      
                                                            <option value="5" >5</option>      
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div> 
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label></label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdCheckSearch">
                                                        <img src="Resources/public/image/iconoAscensor.PNG" alt="25" width="25"/>
                                                    </td>
                                                    <td class="tdCheckSearch">
                                                        <input class="tdSelectSearch"type="checkbox" id="chkAscensor" name="ascensor"/>
                                                    </td>
                                                    <td class="tdTextSearch">
                                                        <label for="chkAscensor">Tiene ascensor</label>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label></label>
                                            <table class="tableBuscador">
                                                <tr>
                                                    <td class="tdCheckSearch">
                                                        <img src="Resources/public/image/iconoPiscina.PNG" alt="30" width="30"/>
                                                    </td>
                                                    <td class="tdCheckSearch">
                                                        <input class="tdSelectSearch" type="checkbox" id="chkPiscina"  name="piscina"/>
                                                    </td>
                                                    <td class="tdTextSearch">
                                                        <label for="chkAscensor">Tiene piscina</label>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                </div>


                                <div class="row">
                                    <div class="col-md-12">                                           
                                        <button id="btnSave" onclick="listProperties();" type ="button" class="btn btn-primary">Listar</button>
                                    </div>
                                </div>

                            </div>



                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>                              
            </div>





            <br>

            <div class="row">
                <div class="col-md-12  col-xs-6">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated" 
                             role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" 
                             style="width: 100%"></div>
                    </div>
                </div>
            </div>

            <div class="row" id="lstProperties">

            </div>




            <div class="row pagination-centered text-center" >

                <div class="col-md-4"></div>

                <div class="col-md-4">
                    <div class="btn-group" id="segmentoPaginador">                        
                    </div>
                </div>

                <div class="col-md-4"></div>
            </div>
        </div>
    </div>

</main>


<!-- INICIO VIDEO TOUR Y DESTACADOS-->
<?php
include("View/public/main/videoTourDestacados.php");
?>             
<!-- FIN VIDEO TOUR Y DESTACADOS-->