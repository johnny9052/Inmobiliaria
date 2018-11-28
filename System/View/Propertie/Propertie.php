<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>

        <script defer type="text/javascript" src="Resource/Script/Propertie/Propertie.js"></script>
        <script src="Resource/Script/General/Map.js" type="text/javascript"></script>
        <link href="Resource/Style/mapSearch.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <section class="content-header">
            <h1>
                Inmuebles                    
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-cube"></i> Inmuebles</a></li>
                <li class="active">Inmuebles</li>
            </ol>
        </section>

        <!-- ***************CONTENIDO**************** -->

        <section class="content">

            <div class="row">
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">Acciones</h3>
                        </div>

                        <!-- BOTON AÑADIR Y PRIMERA BARRA DE CARGA--> 
                        <div class="box-body">
                            <form role="form">
                                <div class="form-group">

                                    <div class="col-md-3 col-xs-12">
                                        <button type="button" class="btn btn-primary verdeExaudi" data-toggle="modal" data-target="#ModalNew" onclick="showButton(true);">Nuevo registro</button>                                                                                                                                           
                                        <a class="btn btn-social-icon btn-primary" onclick="executeSubmit('frmPDF');"><i class="fa fa-print" style="color: white"></i></a>
                                        <a class="btn btn-social-icon btn-primary" onclick="executeSubmit('frmCSV');"><i class="fa fa-file-excel-o" style="color: white"></i></a>
                                    </div>

                                    <div class="col-md-8  col-xs-12">
                                        <div class="progress progress-sm active">
                                            <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%">
                                                <span class="sr-only">100% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>


                        <!-- END BOTON AÑADIR Y PRIMERA BARRA DE CARGA-->


                        <div class="box-body table-responsive">
                            <table id="TblList" class="table table-bordered table-striped table-hover">


                            </table>
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">

                        </div>               
                    </div>
                </div>
            </div>
        </section>




        <!-- MODAL PARA ADMINISTRACION DE REGISTROS-->
        <div class="modal fade" id="ModalNew" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button onclick="closeWindowToFilterPropertie();list();" type="button" class="btn btn-default pull-right" data-dismiss="modal">X</button>
                        <h4 class="modal-title">Gestion registro</h4>                        
                    </div>

                    <div class="modal-body" id="FormContainer">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">                                                                        
                                    <input id="txtId" name="id" class="form-control identificator"  type="hidden" value="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtMatriculaInmobiliaria">Matricula inmobiliaria</label>  
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-hashtag"></i></span>
                                        <input id="txtMatriculaInmobiliaria" name="matriculaInmobiliaria" 
                                               class="form-control" type="text" value="" 
                                               autocomplete="off" required
                                               placeholder="Matricula inmobiliaria">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-user"></label>
                                    &nbsp;&nbsp;
                                    <label>Cliente</label>
                                    <div>
                                        <select id="selClient" name="client" 
                                                class="form-control select2" style="width: 100%;" required>
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-circle"></label>
                                    &nbsp;&nbsp;
                                    <label>Estado</label>
                                    <div>
                                        <select id="selStatus" name="status" required class="form-control select2" style="width: 100%;">
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>
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
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-star"></label>
                                    &nbsp;&nbsp;
                                    <label>Tipo de destacado</label>
                                    <div>
                                        <select id="selOutstandingType" name="outstandingType" 
                                                class="form-control select2" style="width: 100%;" required>
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
                                <div class="form-group">
                                    <label for="txtPrice">Precio</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                        <input id="txtPrice" name="precio" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Precio del inmueble">
                                    </div>
                                </div>
                            </div>                       

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtAdministrationCost">Costo administracion</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                        <input id="txtAdministrationCost" name="administrationCost" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Costo de administracion">
                                    </div>
                                </div>
                            </div>    
                        </div>
                        <div class="row">
                            <div class="col-md-6">                                
                                <div class="form-group">
                                    <label>Fecha de recepcion</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" name="receptionDate" 
                                               required class="form-control pull-right dateAction" 
                                               id="txtReceptionDate">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">                                
                                <div class="form-group">
                                    <label>Fecha de publicacion</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" name="publicationDate" 
                                               required class="form-control pull-right dateAction" 
                                               id="txtPublicationDate">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtRoom">Habitaciones</label>          
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-bed"></i></span>
                                        <input id="txtRoom" name="room" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Numero de habitaciones">
                                    </div>
                                </div>
                            </div>                       

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtBath">Baños</label>  
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-bath"></i></span>
                                        <input id="txtBath" name="bath" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Numero de baños">
                                    </div>
                                </div>
                            </div>    
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtParking">Parqueaderos</label>    
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-automobile"></i></span>
                                        <input id="txtParking" name="parking" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Numero de parqueaderos">
                                    </div>
                                </div>
                            </div>                       

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtTotalArea">Area total</label> 
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                        <input id="txtTotalArea" name="totalArea" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Area total (mts)2">
                                    </div>
                                </div>
                            </div>    
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtAreasWithoutBalconies">Areas sin balcones</label>                                    
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-area-chart"></i></span>
                                        <input id="txtAreasWithoutBalconies" name="areasWithoutBalconies" class="form-control" type="number" value="" autocomplete="off"
                                               placeholder="Areas sin balcones">
                                    </div>
                                </div>
                            </div>                       

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtBuildYear">Año de construccion</label>    
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input id="txtBuildYear" name="buildYear" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Año de construccion" max="9999">
                                    </div>
                                </div>
                            </div>    
                        </div>



                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtNumeroPiso">Numero piso</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-building"></i></span>
                                        <input id="txtNumeroPiso" name="numeroPiso" class="form-control" type="number" value="" autocomplete="off"
                                               placeholder="Numero piso" max="999">
                                    </div>
                                </div>
                            </div>  
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkChimenea" name="chimenea"/>
                                    &nbsp;&nbsp;
                                    <label for="chkChimenea" class="fa fa-fire"></label>                                    
                                    <label for="chkChimenea">Tiene chimenea</label>

                                </div>
                            </div>   


                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkEstudio" name="estudio"/>
                                    &nbsp;&nbsp;
                                    <label for="chkEstudio" class="fa fa-cube"></label>                                    
                                    <label for="chkEstudio">Tiene estudio</label>
                                </div>
                            </div>  
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkDeposito"  name="deposito"/>
                                    &nbsp;&nbsp;
                                    <label for="chkDeposito" class="fa fa-cube"></label>                                    
                                    <label for="chkDeposito">Tiene deposito</label>
                                </div>
                            </div>   


                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkZonaRopas"  name="zonaRopas"/>
                                    &nbsp;&nbsp;
                                    <label for="chkZonaRopas" class="fa fa-tint"></label>                                    
                                    <label for="chkZonaRopas">Tiene zona de ropas</label>
                                </div>
                            </div>  
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkParqueaderoVisitante" name="parqueaderoVisitante"/>
                                    &nbsp;&nbsp;
                                    <!--<label class="material-icons">&#xe54f;</label>-->
                                    <label for="chkParqueaderoVisitante" class="fa fa-car"></label>      
                                    <label for="chkParqueaderoVisitante">Tiene parqueadero visitante</label>
                                </div>
                            </div>   


                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkAscensor" name="ascensor"/>
                                    &nbsp;&nbsp;
                                    <label for="chkAscensor" class="fa fa-caret-square-o-up"></label>                                    
                                    <label for="chkAscensor">Tiene ascensor</label>
                                </div>
                            </div>  
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkTerraza"  name="terraza"/>
                                    &nbsp;&nbsp;
                                    <label for="chkTerraza" class="fa fa-cloud"></label>                                    
                                    <label for="chkTerraza">Tiene terraza</label>
                                </div>
                            </div>   


                            <div class="col-md-6">
                                <div class="form-group">                                    
                                    <input type="checkbox" id="chkTransportePublicoCercano" name="transportePublicoCercano"/>
                                    &nbsp;&nbsp;
                                    <label for="chkTransportePublicoCercano" class="fa fa-bus"></label>                                    
                                    <label for="chkTransportePublicoCercano">Tiene transporte publico cercano</label>
                                </div>
                            </div>  
                        </div>






                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkSalonComunal"  name="salonComunal"/>
                                    &nbsp;&nbsp;
                                    <label for="chkSalonComunal" class="fa fa-comments"></label>                                    
                                    <label for="chkSalonComunal">Tiene salon comunal</label>
                                </div>
                            </div>   


                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkSauna"  name="sauna"/>
                                    &nbsp;&nbsp;
                                    <label for="chkSauna" class="fa fa-tint"></label>                                    
                                    <label for="chkSauna">Tiene sauna</label>
                                </div>
                            </div>  
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkTurco"  name="turco"/>
                                    &nbsp;&nbsp;
                                    <label for="chkTurco" class="fa fa-tint"></label>                                    
                                    <label for="chkTurco">Tiene turco</label>
                                </div>
                            </div>   


                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkJacuzzi" name="jacuzzi"/>
                                    &nbsp;&nbsp;
                                    <label for="chkJacuzzi" class="fa fa-tint"></label>                                    
                                    <label for="chkJacuzzi">Tiene Jacuzzi</label>
                                </div>
                            </div>  
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkZonaInfantil"  name="zonaInfantil"/>
                                    &nbsp;&nbsp;
                                    <label for="chkZonaInfantil" class="fa fa-envira"></label>                                    
                                    <label for="chkZonaInfantil">Tiene zonas infantiles</label>
                                </div>
                            </div>   


                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkJardines" name="jardines"/>
                                    &nbsp;&nbsp;
                                    <label for="chkJardines" class="fa fa-child"></label>                                    
                                    <label for="chkJardines">Tiene jardines</label>
                                </div>
                            </div>  
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkDuplex"  name="duplex"/>
                                    &nbsp;&nbsp;
                                    <label for="chkDuplex" class="fa fa-home"></label>                                    
                                    <label for="chkDuplex">Es duplex</label>
                                </div>
                            </div>   


                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkPuertaSeguridad" name="puertaSeguridad"/>
                                    &nbsp;&nbsp;
                                    <label for="chkPuertaSeguridad" class="fa fa-expeditedssl"></label>                                    
                                    <label for="chkPuertaSeguridad">Tiene puerta de seguridad</label>
                                </div>
                            </div>  
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkGimnasio"  name="gimnasio"/>
                                    &nbsp;&nbsp;
                                    <label for="chkGimnasio" class="fa fa-users"></label>                                    
                                    <label for="chkGimnasio">Tiene gimnasio</label>
                                </div>
                            </div>   

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkPrecioNegociable"  name="precioNegociable"/>
                                    &nbsp;&nbsp;
                                    <label for="chkPrecioNegociable" class="fa fa-dollar"></label>                                    
                                    <label for="chkPrecioNegociable">Precio negociable</label>
                                </div>
                            </div>   
                        </div>







                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkPiscina"  name="piscina"/>
                                    &nbsp;&nbsp;
                                    <label for="chkPiscina" class="fa fa-tint"></label>                                    
                                    <label for="chkPiscina">Tiene piscina</label>
                                </div>
                            </div>   

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkZonaMascotas"  name="zonaMascotas"/>
                                    &nbsp;&nbsp;
                                    <label for="chkZonaMascotas" class="fa fa-github-alt"></label>
                                    <label for="chkZonaMascotas">Tiene zona de mascotas</label>
                                </div>
                            </div>   
                        </div>




                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkParqueaderoCubierto"  name="parqueaderoCubierto"/>
                                    &nbsp;&nbsp;
                                    <label for="chkParqueaderoCubierto" class="	fa fa-university"></label>                                    
                                    <label for="chkParqueaderoCubierto">Tiene parqueadero cubierto</label>
                                </div>
                            </div>   

                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="checkbox" id="chkAmoblado"  name="amoblado"/>
                                    &nbsp;&nbsp;
                                    <label for="chkAmoblado" class="fa fa-codepen"></label>
                                    <label for="chkAmoblado">Es amoblado</label>
                                </div>
                            </div>   
                        </div>




                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-map-marker"></label>
                                    &nbsp;&nbsp;
                                    <label>Departamento</label>
                                    <div>
                                        <select id="selState" name="state" 
                                                class="form-control select2" style="width: 100%;"  
                                                onchange="loadCity(this.value);actualizarMucipioMapa();">
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
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
                                        <select id="selBarrio" name="barrio" class="form-control select2" style="width: 100%;">
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>     


                            <div class="col-md-6">
                                <div class="form-group seleccionable">
                                    <br>
                                    <label for="" class="fa fa-plus-square seleccionable"></label>
                                    &nbsp;&nbsp;
                                    <label class="seleccionable" id="lblNuevoBarrio" onclick="validarMunicipioSeleccionado();">
                                        Agregar nuevo barrio al municipio
                                    </label>   
                                </div>
                            </div>     

                        </div>





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
                                    <label for="" class="fa fa-circle-thin"></label>
                                    &nbsp;&nbsp;
                                    <label>Tipo de piso</label>
                                    <div>
                                        <select id="selFloorType" name="floorType" 
                                                class="form-control select2" style="width: 100%;" required>
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtAvaluoCatastral">Avaluo catastral</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                        <input id="txtAvaluoCatastral" name="avaluoCatastral" 
                                               class="form-control" type="number" value="" 
                                               autocomplete="off" required
                                               placeholder="Avaluo catastral">
                                    </div>
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-circle-o"></label>
                                    &nbsp;&nbsp;
                                    <label>Tipo de cortina</label>
                                    <div>
                                        <select id="selCurtainType" name="curtainType" required class="form-control select2" style="width: 100%;">
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>     
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-expeditedssl"></label>
                                    &nbsp;&nbsp;
                                    <label>Tipo de vigilancia</label>
                                    <div>
                                        <select id="selVigilanceType" name="vigilanceType" 
                                                class="form-control select2" style="width: 100%;" required>
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
                                    <label for="" class="fa fa-area-chart"></label>
                                    &nbsp;&nbsp;
                                    <label>Tipo de vista</label>
                                    <div>
                                        <select id="selViewType" name="viewType" 
                                                class="form-control select2" style="width: 100%;" required>
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="selKitchenType" class="fa fa-cutlery"></label>
                                    &nbsp;&nbsp;
                                    <label>Tipo de cocina</label>
                                    <div>
                                        <select id="selKitchenType" name="kitchenType" 
                                                class="form-control select2" style="width: 100%;" required>
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-cutlery"></label>
                                    &nbsp;&nbsp;
                                    <label>Estructura de la cocina</label>
                                    <div>
                                        <select id="selKitchenStructure" name="kitchenStructure" 
                                                class="form-control select2" style="width: 100%;" required>
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>  
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="" class="fa fa-info"></label>
                                    &nbsp;&nbsp;
                                    <label>Descripción</label>
                                    <textarea id="txtLinderos" name="linderos" class="form-control" rows="3" placeholder="Linderos"></textarea>
                                </div>
                            </div>                       
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtDireccionCarrera">Carrera</label>  
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                        <input id="txtDireccionCarrera" name="direccionCarrera" 
                                               class="form-control" type="text" value="" 
                                               autocomplete="off"
                                               placeholder="Carrera del inmueble. Ej: 14 Norte">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtDireccionCalle">Calle</label>  
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                        <input id="txtDireccionCalle" name="direccionCalle" 
                                               class="form-control" type="text" value="" 
                                               autocomplete="off"
                                               placeholder="Calle del inmueble. Ej: 10">
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtDireccionNumero">Número</label>  
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                        <input id="txtDireccionNumero" name="direccionNumero" 
                                               class="form-control" type="text" value="" 
                                               autocomplete="off"
                                               placeholder="Número. Ej:06">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtDireccionInformacionAdicional">Informacion Adicional</label>  
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                        <input id="txtDireccionInformacionAdicional" name="direccionInformacionAdicional" 
                                               class="form-control" type="text" value="" 
                                               autocomplete="off" required
                                               placeholder="Información adicional del inmueble">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <input id="pac-input" class="controls" type="text" placeholder="Search Box">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div id="googleMap" style="width:100%;height:400px;"></div>
                            </div>                                                                                                                                     
                        </div>

                        <hr />

                        <div class="row">
                            <br>
                            <div class="col-md-12">
                                <label for="fileImagen">Imagenes del inmueble</label>
                                <input type="file" accept=".JPEG,.PNG,.jpg"  id="fileImagen" name="urlImage" multiple 
                                       onchange="processMultipleFile('fileImagen', objFilePropertie, 'lstImagenesAgregadas', 'lstImagenesAgregadas2');">
                                <br>                                                            
                                <button id="btnAddVideo" onclick="eliminarTodasLasImagenes();" type ="button" class="btn btn-primary">Eliminar imagenes</button>
                            </div>                            
                        </div>


                        <div class="row panel panel-default" style="text-align: center; margin: 10px; padding: 10px;">
                            <br>
                            <div class="col-md-1" >

                            </div>                           
                            <div class="col-md-5" id="lstImagenesAgregadas">

                            </div>                           

                            <div class="col-md-5" id="lstImagenesAgregadas2">

                            </div>                           
                            <div class="col-md-1" >

                            </div>                           

                        </div>

                        <hr />

                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label for="txtUrlVideo">URL Video</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-video-camera"></i></span>
                                        <input id="txtUrlVideo" name="urlvideo" class="form-control" type="text" value="" autocomplete="off"
                                               placeholder="URL del video">
                                    </div>
                                    <br>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <br>
                                    <button id="btnAddVideo" onclick="addDinamicData('txtUrlVideo', objURLVideosPropertie, 'lstVideosAgregados');" type ="button" class="btn btn-primary">Agregar video</button>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10 panel panel-default" id="lstVideosAgregados" style="text-align: center; margin: 10px; padding: 10px;">
                            </div>                            
                            <div class="col-md-1"></div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <div class="progress progress-sm active">
                                    <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%">
                                        <span class="sr-only">100% Complete</span>
                                    </div>
                                </div>
                            </div>                       
                        </div>


                    </div>


                    <div class="modal-footer">

                        <button onclick="closeWindowToFilterPropertie();limpiarMultimedia();deleteMarkers();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>

                        <div class="newActionButton">                            
                            <button id="btnSave" onclick="save();" type ="button" class="btn btn-primary">Guardar</button>
                        </div>

                        <div class="updateActionButton">                                                        
                            <button id="btnExportPDF" onclick="executeSubmit('frmPDFPropertie');" type="button" class="btn btn-primary">PDF</button>
                            <button id="btnUpdate" onclick="update();" type="button" class="btn btn-warning">Editar</button>
                            <button id="btnSave"   onclick="goNavigation('ModalNew', 'ModalConfirm');" 
                                    type="button" class="btn btn-danger">Eliminar</button>
                        </div>

                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


        <!-- END MODAL PARA ADMINISTRACION DE REGISTROS-->





        <!-- MODAL PARA ADMINISTRACION DE NUEVOS BARRIOS-->
        <div class="modal fade" id="ModalNewDistrict" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                       
                        <h4 class="modal-title">Gestion registro barrios</h4>
                    </div>

                    <div class="modal-body" id="FormContainerDistrict"> 

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="txtNameDistrict">Nombre</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                        <input id="txtNameDistrict" name="nameDistrict" class="form-control" type="text" value="" autocomplete="off" required
                                               placeholder="Nombre del barrio">
                                    </div>
                                </div>
                            </div>                       
                        </div>                       

                        <div class="row">
                            <div class="col-md-12">
                                <div class="progress progress-sm active">
                                    <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%">
                                        <span class="sr-only">100% Complete</span>
                                    </div>
                                </div>
                            </div>                       
                        </div>


                    </div>


                    <div class="modal-footer">

                        <button onclick="closeWindow('ModalNewDistrict', false, 'ModalNew'); list();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>

                        <div class="">                            
                            <button id="btnSave" onclick="saveNewDistrict();" type ="button" class="btn btn-primary">Guardar</button>
                        </div>

                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


        <!-- END MODAL PARA ADMINISTRACION DE BARRIOS-->



        <!-- MODAL DE CONFIRMACION-->
        <div class="modal modal-warning fade" id="ModalConfirm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                        
                        <h4 class="modal-title">Confirmar</h4>
                    </div>
                    <div class="modal-body">
                        <p>¿Seguro que desea eliminar el registro?</p>
                    </div>
                    <div class="modal-footer">
                        <button onclick="goNavigation('ModalConfirm', 'ModalNew');" type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cancelar</button>
                        <button onclick="deleteInfo();" type="button" class="btn btn-outline">Aceptar</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <!-- END MODAL DE CONFIRMACION-->


        <!--FORM GENERACION DE PDF-->
        <form id="frmPDF" name="formPDF" method="post" 
              action="Controller/Propertie/CtlPropertie.php" target="_blank">
            <input type="hidden" name="id" value="" id="txtIdPDF">
            <input type="hidden" name="action" value="generatePDFList">        
        </form>   
        <!--END FORM GENERACION DE PDF-->   



        <!--FORM GENERACION DE PDF-->
        <form id="frmPDFPropertie" name="formPDFPropertie" method="post" 
              action="Controller/Propertie/CtlPropertie.php" target="_blank">
            <input type="hidden" name="id" value="" id="txtIdPDFPropertie">
            <input type="hidden" name="action" value="generatePDF">        
        </form>   
        <!--END FORM GENERACION DE PDF-->   


        <!--FORM GENERACION DE PDF-->
        <form id="frmCSV" name="frmCSV" method="post" 
              action="Controller/Propertie/CtlPropertie.php" target="_blank">            
            <input type="hidden" name="action" value="reportCSVList">        
        </form>   
        <!--END FORM GENERACION DE PDF-->   


        <!-- SCRIPT DE MAPAS, ACTIVACION MEDIANTE KEY -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmpRlSVVxIje1GdQb7jlW5QwG-WBfVEnw&libraries=places&callback=myMap"
        async defer></script>
    </body>
</html>
