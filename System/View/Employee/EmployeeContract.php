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

        <script defer type="text/javascript" src="Resource/Script/Employee/EmployeeContract.js"></script>
    </head>
    <body>

        <section class="content-header">
            <h1>
                Contrato empleado
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-group"></i> Configuracion</a></li>
                <li class="active">Contrato empleado</li>
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
                        <h4 class="modal-title">Gestión contrato empleado</h4>
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
                                    <label>Empleado</label>
                                    <select id="selEmployee" name="employee" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Área</label>
                                    <select id="selArea" name="area" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
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
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tipo contrato</label>
                                    <select id="selContractType" name="contractType" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Cargo</label>
                                    <select id="selPosition" name="position" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtSalary">Salario</label>   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                        <input id="txtSalary" name="salary" class="form-control" type="number" value="" autocomplete="off" required
                                               placeholder="Salario">
                                    </div>
                                </div>
                            </div>  
                        </div>

                        <div class="row">
                            <br>
                            <div class="col-md-6">
                                <label for="fileContract">Archivo contrato</label>
                                <input type="file" accept=".PDF,.pdf"  id="fileContract" name="urlContract" multiple 
                                       onchange="procesarArchivo();"><br>                            
                            </div>
                            <div class="col-md-6" id="lstArchivoAgregado">

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














    </body>
</html>
