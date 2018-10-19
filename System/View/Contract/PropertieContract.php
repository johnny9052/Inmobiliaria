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

        <script defer type="text/javascript" src="Resource/Script/Contract/PropertieContract.js"></script>
    </head>
    <body>

        <section class="content-header">
            <h1>
                Contrato Inmueble
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-group"></i> Configuración</a></li>
                <li class="active">Contrato Inmueble</li>
            </ol>
        </section>


        <!-- ***************CONTENIDO**************** -->

        <section class="content">
            <div class="row">        
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="" data-toggle="tab">Contratos</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Contract/Spouse');"data-toggle="tab">Conyugues</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Client/DependentPerson');"data-toggle="tab">Dependiente</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Client/IndependentPerson');"data-toggle="tab">Independiente</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Client/BankReferenceClient');"data-toggle="tab">Ref. Bancaría</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Client/ReferenceClient');"data-toggle="tab">Ref. Personal</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Contract/Debtor');"data-toggle="tab">Deudor</a></li>
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
        </section>




        <!-- MODAL PARA ADMINISTRACION DE REGISTROS-->
        <div class="modal fade" id="ModalNew" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                       
                        <h4 class="modal-title">Gestión contrato inmueble</h4>
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
                                    <label for="" class="fa fa-home"></label>
                                    &nbsp;&nbsp;
                                    <label>Inmueble</label>
                                    <select id="selPropertie" name="propertie" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">                                
                                <div class="form-group">
                                    <label>Fecha de firma</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" name="firmDate" required class="form-control pull-right dateAction" id="txtFirmDate">
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-6">                                
                                <div class="form-group">
                                    <label>Fecha de inicio</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" name="startDate" required class="form-control pull-right dateAction" id="txtStartDate">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">                                
                                <div class="form-group">
                                    <label>Fecha de terminación</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" name="endDate" class="form-control pull-right dateAction" id="txtEndDate">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtContractValue">Valor Contrato</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                        <input id="txtContractValue" name="contractValue" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Valor contrato">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtTermContract">Plazo contrato</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                        <input id="txtTermContract" name="termContract" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Plazo contrato">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtWayPay">Forma de pago</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                        <input id="txtWayPay" name="wayPay" class="form-control" type="text" value="" autocomplete="off" required
                                               placeholder="Forma de pago">
                                    </div>
                                </div>
                            </div> 
                        </div>


                        <div class="row">
                            <br>
                            <div class="col-md-6">
                                <label for="" class="fa fa-paperclip"></label>
                                &nbsp;&nbsp;
                                <label for="fileContract">Archivo contrato</label>
                                <input type="file" accept=".PDF,.pdf"  id="fileContract" name="urlContract" multiple 
                                       onchange="procesarFile(true, 'fileContract', objFileContract);">
                            </div>
                            <div class="col-md-6 panel panel-default" id="lstArchivoAgregado" style="text-align: center; margin: 10px; padding: 10px;">                                

                            </div>                           
                        </div>

                        <div class="row">                           
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="" class="fa fa-user"></label>
                                    &nbsp;&nbsp;
                                    <label>Objetos Contrato</label>
                                    <div id="FormContainerCheckboxContractType" class="containerPermission">

                                    </div>
                                </div>
                            </div>           
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-user"></label>
                                    &nbsp;&nbsp;
                                    <label>Deudor</label>
                                    <div>
                                        <select id="selDebtor" name="debtor" 
                                                class="form-control select2" style="width: 100%;" required>
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-md-1">
                                <br>
                                <button onclick="agregarDeudorContrato()">+</button>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <div id="listDebtor">
                                        
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

                        <button onclick="limpiarMultimedia();closeWindow();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>

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
