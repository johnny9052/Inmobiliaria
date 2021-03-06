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

        <script defer type="text/javascript" src="Resource/Script/Client/Pqrs.js"></script>
    </head>
    <body>

        <section class="content-header">
            <h1>
                PQRS                    
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-group"></i>Clientes</a></li>
                <li class="active">PQRS</li>
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
                        <h4 class="modal-title">Gestión PQRS</h4>
                    </div>

                    <div class="modal-body" id="FormContainer">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">                                                                        
                                    <input id="txtId" name="id" class="form-control identificator"  type="hidden" value="">
                                    <input id="txtNombre" name="name" class="form-control identificator"  type="hidden" value="">
                                    <input id="txtCorreo" name="email" class="form-control identificator"  type="hidden" value="">
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-list"></label>
                                    &nbsp;&nbsp;
                                    <label>Tipo</label>
                                    <div>
                                        <select id="selTypePQRS" name="typePQRS" required class="form-control select2" style="width: 100%;" disabled
                                                <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>  
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-black-tie"></label>
                                    &nbsp;&nbsp;
                                    <label>Cliente</label>
                                    <div>
                                        <select id="selClient" name="client" required class="form-control select2" style="width: 100%;" disabled
                                                <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtDatePQRS">Fecha</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar-check-o"></i></span>
                                        <input id="txtDatePQRS" name="datePQRS" class="form-control" type="text" value="" autocomplete="off" required
                                               placeholder="Fecha PQRS"  disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtTimePQRS">Hora</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                        <input id="txtTimePQRS" name="timePQRS" class="form-control" type="text" value="" autocomplete="off" required
                                               placeholder="Hora PQRS" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="" class="fa fa-commenting"></label>
                                    &nbsp;&nbsp;
                                    <label>Descripción PQRS</label>
                                    <textarea id="txtDescription" name="descriptionPQRS" class="form-control" rows="3" placeholder="Descripcion" disabled></textarea>
                                </div>
                            </div>                       
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="" class="fa fa-comments"></label>
                                    &nbsp;&nbsp;
                                    <label>Respuesta *</label>
                                    <div>
                                        <textarea id="txtResponse" required name="givenResponse" class="form-control" rows="3" placeholder="Respuesta"></textarea>
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
                            <button id="btnUpdate" onclick="update();" type="button" class="btn btn-warning">Responder</button>
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














    </body>
</html>
