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
                                            <table>
                                                <select id="selState" name="state" 
                                                        class="form-control select2" style="width: 100%;"  
                                                        onchange="loadCity(this.value);actualizarMucipioMapa();">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </table>
                                        </div>
                                    </div>     

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-map-marker"></label>
                                            &nbsp;&nbsp;
                                            <label>Municipio</label>
                                            <div>
                                                <select id="selCity" name="city" required class="form-control select2" style="width: 100%;" 
                                                        onchange="loadNeighborhood(this.value);actualizarMucipioMapa();">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>     
                                </div>


                                <div class="row">                            
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-map-marker"></label>
                                            &nbsp;&nbsp;
                                            <label>Barrio</label>
                                            <div>
                                                <select id="selBarrio" name="barrio" required class="form-control select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>     


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-circle"></label>
                                            &nbsp;&nbsp;
                                            <label>Zonas</label>
                                            <div>
                                                <select id="selZone" name="zone" required class="form-control select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>     

                                </div>


                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-home"></label>
                                            &nbsp;&nbsp;
                                            <label>Tipo inmueble</label>
                                            <div>
                                                <select id="selPropertieType" name="propertieType" required class="form-control select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>   


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-handshake-o"></label>
                                            &nbsp;&nbsp;
                                            <label>Tipo oferta</label>
                                            <div>
                                                <select id="selOfferType" name="offerType" 
                                                        class="form-control select2" style="width: 100%;" required>
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>    
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="" class="fa fa-dollar"></label>&nbsp;
                                        <label for="lblvalorMaxInmueble">Valor maximo del inmueble : $ </label>
                                        <label id='lblvalorMaxInmueble'>0</label>
                                        <br>
                                        <table width='100%'>
                                            <tr>
                                                <td>
                                                    $0
                                                </td>
                                                <td>
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
                                        <label for="" class="fa fa-area-chart"></label>&nbsp;
                                        <label for="lblAreaInmueble">Area maxima</label>
                                        <label id='lblAreaInmueble'>0</label> <label>mts2</label>
                                        <br>
                                        <table width='100%'>
                                            <tr>
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
                                    <div class="col-md-6">   
                                        <br>
                                        <button id="btnSave" onclick="listProperties();" type ="button" class="btn btn-primary">Listar</button>
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
                                            <label for="" class="fa fa-hashtag"></label>
                                            &nbsp;&nbsp;
                                            <label>Estrato</label>
                                            <div>
                                                <select id="selStratum" name="estrato" 
                                                        class="form-control select2" style="width: 100%;" required>
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div> 

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="checkbox" id="chkAscensor" name="ascensor"/>
                                            &nbsp;&nbsp;
                                            <label for="chkAscensor" class="fa fa-caret-square-o-up"></label>                                    
                                            <label for="chkAscensor">Tiene ascensor</label>
                                        </div>

                                        <div class="form-group">
                                            <input type="checkbox" id="chkPiscina"  name="piscina"/>
                                            &nbsp;&nbsp;
                                            <label for="chkPiscina" class="fa fa-tint"></label>                                    
                                            <label for="chkPiscina">Tiene piscina</label>
                                        </div>
                                    </div>  
                                </div>


                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-bed"></label>
                                            &nbsp;&nbsp;
                                            <label>Habitaciones</label>
                                            <div>
                                                <select id="selHabitaciones" name="room" 
                                                        class="form-control select2" style="width: 100%;" required>
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                    <option value="1" >1</option>      
                                                    <option value="2" >2</option>      
                                                    <option value="3" >3</option>      
                                                    <option value="4" >4</option>      
                                                    <option value="5" >5</option>      
                                                </select>
                                            </div>
                                        </div>
                                    </div> 

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-bath"></label>
                                            &nbsp;&nbsp;
                                            <label>Baños</label>
                                            <div>
                                                <select id="selBanios" name="bath" 
                                                        class="form-control select2" style="width: 100%;" required>
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                    <option value="1" >1</option>      
                                                    <option value="2" >2</option>      
                                                    <option value="3" >3</option>      
                                                    <option value="4" >4</option>      
                                                    <option value="5" >5</option>      
                                                </select>
                                            </div>
                                        </div>
                                    </div> 
                                </div>




                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-car"></label>
                                            &nbsp;&nbsp;
                                            <label>Parqueaderos</label>
                                            <div>
                                                <select id="selParqueaderos" name="parking" 
                                                        class="form-control select2" style="width: 100%;" required>
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                    <option value="1" >1</option>      
                                                    <option value="2" >2</option>      
                                                    <option value="3" >3</option>      
                                                    <option value="4" >4</option>      
                                                    <option value="5" >5</option>      
                                                </select>
                                            </div>
                                        </div>
                                    </div>                                   
                                </div>


                                <div class="row">
                                    <div class="col-md-6">                                           
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