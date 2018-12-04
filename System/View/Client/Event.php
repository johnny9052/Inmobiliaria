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

        <script defer type="text/javascript" src="Resource/Script/Client/Event.js"></script>
        <script src="Resource/Script/General/Map.js" type="text/javascript"></script>
        <link href="Resource/Style/mapSearch.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <section class="content-header">
            <h1>
                Eventos                    
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-group"></i> Configuracion</a></li>
                <li class="active">Eventos</li>
            </ol>
        </section>


        <!-- ***************CONTENIDO**************** -->

        <section class="content">
            <div class="row">        
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Acciones</h3>
                        </div>

                        <!-- BOTON AÑADIR Y PRIMERA BARRA DE CARGA--> 
                        <div class="box-body">
                            <form role="form">
                                <div class="form-group">

                                    <div class="col-md-2 col-xs-6">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalNew" onclick="showButton(true);">Nuevo registro</button>                                                                
                                    </div>

                                    <div class="col-md-9  col-xs-6">
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
                        <button onclick="closeWindow();" type="button" class="btn btn-default pull-right" data-dismiss="modal">X</button>
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
                                    <label for="" class="fa fa-id-badge"></label>
                                    &nbsp;&nbsp;
                                    <label>Cliente *</label>
                                    <div>
                                        <select id="selClient" name="client" required class="form-control select2" style="width: 100%;">
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-leanpub"></label>
                                    &nbsp;&nbsp;
                                    <label>Tipo Evento *</label>
                                    <div>
                                        <select id="selTypeEvent" name="typeEvent" required class="form-control select2" style="width: 100%;">
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
                                                onchange="actualizarMucipioMapa();">
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
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

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">                                                                        
                                    <input id="txtLatitude" name="latitude" class="form-control identificator"  type="hidden" value="">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">                                                                        
                                    <input id="txtLength" name="length" class="form-control identificator"  type="hidden" value="">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtFirstName">Lugar *</label> 
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                        <input id="txtPlace" name="place" class="form-control" type="text" value="" autocomplete="off" required
                                               placeholder="Lugar">
                                    </div>
                                </div>
                            </div>



                            <div class="col-md-6">                                
                                <div class="form-group">
                                    <label>Fecha de evento *</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" name="dateEvent" required class="form-control pull-right dateAction" id="txtDateEvent">
                                    </div>
                                </div>
                            </div>    
                        </div>                                               

                        <div class="row">                          
                            <div class="bootstrap-timepicker">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Hora evento</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                            <input type="text" name="timeEvent" required class="form-control timepicker"  id="txtTimeEvent">                                            
                                        </div>
                                        <!-- /.input group -->
                                    </div>
                                    <!-- /.form group -->
                                </div>
                                <!-- /.col md-6-->
                            </div>  
                        </div>
                        <div class="row">                           

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-user"></label>
                                    &nbsp;&nbsp;
                                    <label>Empleados</label>
                                    <div id="FormContainerCheckboxEmployees" class="containerPermission">

                                    </div>
                                </div>
                            </div>           
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="txtFirstName">Observaciones *</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-eye"></i></span>                                    
                                        <input id="txtObservations" name="observations" class="form-control" type="text" value="" autocomplete="off" required
                                               placeholder="Observaciones">
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

                        <button onclick="closeWindow();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>

                        <div class="newActionButton">                            
                            <button id="btnSave" onclick="save();" type ="button" class="btn btn-primary">Guardar</button>
                        </div>

                        <div class="updateActionButton">                            
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
        
        <!-- SCRIPT DE MAPAS, ACTIVACION MEDIANTE KEY -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmpRlSVVxIje1GdQb7jlW5QwG-WBfVEnw&libraries=places&callback=myMap"
        async defer></script>


    </body>
</html>
