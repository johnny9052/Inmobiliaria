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

        <script defer type="text/javascript" src="Resource/Script/Client/BankReferenceClient.js"></script>
    </head>
    <body>

        <section class="content-header">
            <h1>
                Referencia bancaría                    
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-group"></i> Configuración</a></li>
                <li class="active">Referencia bancaría</li>
            </ol>
        </section>


        <!-- ***************CONTENIDO**************** -->

        <section class="content">
            <div class="row">        
                <div class="col-md-12">
                    <div class="active tab-pane" id="activity">
                        <!-- general form elements -->
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li><a href="" onclick="redirectInfoFilter('Contract/PropertieContract');"data-toggle="tab">Contratos</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Contract/Spouse');"data-toggle="tab">Conyugues</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/DependentPerson');"data-toggle="tab">Dependiente</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/IndependentPerson');"data-toggle="tab">Independiente</a></li>
                                <li class="active"><a href="" data-toggle="tab">Ref. Bancaría</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/ReferenceClient');"data-toggle="tab">Ref. Personal</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane" id="properties">
                                </div>
                                <div class="active tab-pane" id="contracts">
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
                                <div class="tab-pane" id="settings">
                                    <!-- Post -->
                                </div>
                            </div>
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
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#register" data-toggle="tab">Referencia</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="active tab-pane" id="register">
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
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtNumberAccount">Número de cuenta</label>          
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>          
                                                        <input id="txtNumberAccount" name="numberAccount" class="form-control" type="number" value="" autocomplete="off" required
                                                               max="9999999999" maxlength="10" placeholder="número de cuenta">
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="" class="fa fa-bank"></label>
                                                    &nbsp;&nbsp;
                                                    <label>Banco</label>
                                                    <div>
                                                        <select id="selBank" name="bank" 
                                                                class="form-control select2" style="width: 100%;" required>
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtBranchOffice">Sucursal</label>   
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                                        <input id="txtBranchOffice" name="branchOffice" class="form-control" type="text" value="" autocomplete="off" required
                                                               placeholder="Sucursal">
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
                                </div>
                                <div class="tab-pane" id="properties">
                                </div>
                                <div class="tab-pane" id="events">
                                    <!-- Post -->
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


    </body>
</html>
