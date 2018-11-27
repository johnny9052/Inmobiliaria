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

        <script defer type="text/javascript" src="Resource/Script/Contract/Debtor.js"></script>
    </head>
    <body>

        <section class="content-header">
            <h1>
                Deudores                    
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-group"></i> Configuración</a></li>
                <li class="active">Deudor</li>
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
                                <li><a href="" onclick="redirectInfoFilter('Contract/Spouse');"data-toggle="tab">Conyuges</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/DependentPerson');"data-toggle="tab">Dependiente</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/IndependentPerson');"data-toggle="tab">Independiente</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/BankReferenceClient');"data-toggle="tab">Ref. Bancaría</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/ReferenceClient');"data-toggle="tab">Ref. Personal</a></li>
                                <li class="active"><a href="" data-toggle="tab">Deudor</a></li>
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
                        <button onclick="closeWindow();" type="button" class="btn btn-default pull-right" data-dismiss="modal">X</button>
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#register" data-toggle="tab">Información</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Propertie/Propertie');" data-toggle="tab">Inmuebles</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/Event');" data-toggle="tab">Eventos</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="active tab-pane" id="register">
                                    <div class="modal-body" id="FormContainer">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">                                                                        
                                                    <input id="txtId" name="id" class="form-control text-capitalize identificator"  type="hidden" value="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="" class="fa fa-id-card"></label>
                                                    &nbsp;&nbsp;
                                                    <label>Tipo documento</label>
                                                    <div>
                                                        <select id="selDocumentType" name="documentType" required class="form-control text-capitalize select2" style="width: 100%;">
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>     

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtDocumentNumber">Cedula</label>    
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-id-card"></i></span>
                                                        <input id="txtDocumentNumber" name="documentNumber" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                               placeholder="Numero de cedula">
                                                    </div>
                                                </div>
                                            </div>    
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6">                                
                                                <div class="form-group">
                                                    <label>Fecha de expedición</label>
                                                    <div class="input-group date">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-calendar"></i>
                                                        </div>
                                                        <input type="text" name="expeditionDate" required class="form-control text-capitalize pull-right dateAction" id="txtExpeditionDate">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="" class="fa fa-map-marker"></label>
                                                    &nbsp;&nbsp;
                                                    <label>Departamento de expedicion</label>
                                                    <div>
                                                        <select id="selStateExpedition" name="stateExpedition" 
                                                                class="form-control text-capitalize select2" style="width: 100%;"  
                                                                onchange="loadCity(this.value)">
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
                                                    <label>Municipio de expedicion</label>
                                                    <div>
                                                        <select id="selCityExpedition" name="cityExpedition" required class="form-control text-capitalize select2" style="width: 100%;">
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>    
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtFirstName">Primer nombre</label>   
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                                        <input id="txtFirstName" name="firstName" class="form-control text-capitalize" type="text" value="" autocomplete="off" required
                                                               placeholder="Primer nombre">
                                                    </div>
                                                </div>
                                            </div>                       

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtName">Segundo nombre</label>  
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                                        <input id="txtSecondName" name="secondName" class="form-control text-capitalize" type="text" value="" autocomplete="off"
                                                               placeholder="Segundo nombre">
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtFirstLastName">Primer apellido</label>  
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                                        <input id="txtFirstLastName" name="firstLastName" class="form-control text-capitalize" type="text" value="" autocomplete="off" required
                                                               placeholder="Primer apellido">
                                                    </div>
                                                </div>
                                            </div>                       

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtName">Segundo apellido</label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>                                    
                                                        <input id="txtSecondLastName" name="secondLastName" class="form-control text-capitalize" type="text" value="" autocomplete="off" 
                                                               placeholder="Segundo apellido">
                                                    </div>
                                                </div>
                                            </div>     
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtAddressOffice">Dirección laboral</label> 
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-address-card"></i></span>          
                                                        <input id="txtAddressOffice" name="addressOffice" class="form-control text-capitalize" type="text" value="" autocomplete="off" required
                                                               placeholder="Dirección laboral">
                                                    </div>
                                                </div>
                                            </div>                                                
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtOfficePhone">Teléfono laboral</label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>                                              
                                                        <input id="txtOfficePhone" name="officePhone" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                               max="9999999999" maxlength="10" placeholder="Teléfono laboral(Max 10 digitos)">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtHomePhone">Telefono residencia</label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>                                              
                                                        <input id="txtHomePhone" name="homePhone" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                               max="9999999999" maxlength="10" placeholder="Telefono residencia (Max 10 digitos)">
                                                    </div>
                                                </div>
                                            </div>     
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtMobilePhone">Teléfono celular</label>          
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-mobile-phone"></i></span>          
                                                        <input id="txtMobilePhone" name="mobilePhone" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                               max="9999999999" maxlength="10" placeholder="Teléfono celular (Max 10 digitos)">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtEmail">Correo electrónico</label>        
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-at"></i></span>          
                                                        <input id="txtEmail" name="email" type="email" class="form-control"  value="" autocomplete="off" required
                                                               placeholder="Correo electrónico">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtAddress">Dirección residencia</label> 
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-address-card"></i></span>          
                                                        <input id="txtAddress" name="address" class="form-control text-capitalize" type="text" value="" autocomplete="off" required
                                                               placeholder="Dirección residencia">
                                                    </div>
                                                </div>
                                            </div>                                                
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="" class="fa fa-gratipay"></label>
                                                    &nbsp;&nbsp;
                                                    <label>Estado civil</label>
                                                    <div>
                                                        <select id="selMaritalStatus" name="maritalStatus" required class="form-control text-capitalize select2" style="width: 100%;">
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="" class="fa fa-map-marker"></label>
                                                    &nbsp;&nbsp;
                                                    <label>Departamento de residencia</label>
                                                    <div>                                        
                                                        <select id="selStateResidence" name="stateResidence"  
                                                                class="form-control text-capitalize select2" style="width: 100%;" 
                                                                onchange="loadCityResidence(this.value);">
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
                                                    <label>Municipio de residencia</label>
                                                    <div>
                                                        <select id="selCityResidence" name="cityResidence" required class="form-control text-capitalize select2" style="width: 100%;">
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtMonthlyIncome">Ingresos Mensuales</label>   
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                                        <input id="txtMonthlyIncome" name="monthlyIncome" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                               placeholder="Ingresos Mensuales">
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
