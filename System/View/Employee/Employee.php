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

        <script defer type="text/javascript" src="Resource/Script/Employee/Employee.js"></script>
    </head>
    <body>

        <section class="content-header">
            <h1>
                Empleados                    
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-group"></i> Configuracion</a></li>
                <li class="active">Empleados</li>
            </ol>
        </section>


        <!-- ***************CONTENIDO**************** -->

        <section class="content">
            <div class="row">        
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="" data-toggle="tab">Gestión Empleado</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Employee/EmployeeExperience');" data-toggle="tab">Experiencia</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Employee/EmployeeFormation');" data-toggle="tab">Formación</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Employee/EmployeeContract');" data-toggle="tab">Contratos</a></li>
                            <li><a href="" onclick="redirectInfoFilter('Client/event');" data-toggle="tab">Eventos</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="active" id="employee">
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
                            <div class="tab-pane" id="experience">

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
                        <h4 class="modal-title">Gestion registro</h4>
                    </div>
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#FormContainer" data-toggle="tab">Empleado</a></li>
                            <li><a href="#FormContainerExperience" data-toggle="tab">Experiencia</a></li>
                            <li><a href="#FormContainerFormation" data-toggle="tab">Formación</a></li>
                            <li><a href="#FormContainerContract" data-toggle="tab">Contratos</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="active tab-pane" id="FormContainer">
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
                                            <label for="" class="fa fa-user-circle-o"></label>
                                            &nbsp;&nbsp;
                                            <label>Tipo Empleado *</label>
                                            <div>
                                                <select id="selTypeEmployee" name="typeEmployee" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtDocumentNumber">Cédula *</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-vcard-o"></i></span>
                                                <input id="txtDocumentNumber" name="documentNumber" class="form-control text-capitalize" type="text" value="" autocomplete="off" required
                                                       placeholder="Numero de cedula">
                                            </div>
                                        </div>
                                    </div>    
                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-map-marker"></label>
                                            &nbsp;&nbsp;
                                            <label>Departamento de expedición</label>
                                            <div>
                                                <select id="selStateExpedition" name="stateExpedition"  
                                                        class="form-control text-capitalize select2" style="width: 100%;" 
                                                        onchange="loadCityExpedition(this.value);">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>     

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-map-marker"></label>
                                            &nbsp;&nbsp;
                                            <label>Municipio de expedición *</label>
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
                                            <label>Fecha de expedición *</label>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="expeditionDate" required class="form-control text-capitalize pull-right dateAction" id="txtExpeditionDate">
                                            </div>
                                        </div>
                                    </div>     
                                </div>

                                <div class="row">
                                    <br>
                                    <div class="col-md-6">
                                        <label for="fileIdentification">Archivo Cédula</label>
                                        <input type="file" accept=".PDF,.pdf"  id="fileIdentification" name="urlfileIdentification" multiple 
                                               onchange="procesarFile(true, 'fileIdentification', objFileIdentification);">
                                    </div>
                                    <div class="col-md-6 panel panel-default" id="lstArchivoCedula" style="text-align: center; margin: 10px; padding: 10px;">                                

                                    </div> 
                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-map-marker"></label>
                                            &nbsp;&nbsp;
                                            <label>Departamento de nacimiento</label>
                                            <select id="selStateBirth" name="stateBirth"  
                                                    class="form-control text-capitalize select2" style="width: 100%;" 
                                                    onchange="loadCityBirth(this.value);">
                                                <option value="-1" selected> -- SELECCIONE --</option>                            
                                            </select>
                                        </div>
                                    </div>     
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-map-marker"></label>
                                            &nbsp;&nbsp;
                                            <label>Municipio de nacimiento *</label>
                                            <div>
                                                <select id="selCityBirth" name="cityBirth" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>     
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtFirstName">Primer nombre *</label>   
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
                                            <label for="txtFirstLastName">Primer apellido *</label>  
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
                                    <div class="col-md-6">                                
                                        <div class="form-group">
                                            <label>Fecha de nacimiento *</label>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="birthdate" required class="form-control text-capitalize pull-right dateAction" id="txtBirthdate">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-gratipay"></label>
                                            &nbsp;&nbsp;
                                            <label>Estado civil</label>
                                            <select id="selMaritalStatus" name="maritalStatus" required class="form-control text-capitalize select2" style="width: 100%;">
                                                <option value="-1" selected> -- SELECCIONE --</option>                            
                                            </select>
                                        </div>
                                    </div>     
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-vcard"></label>
                                            &nbsp;&nbsp;
                                            <label for="txtMilitaryCard">Libreta Militar</label>                                    
                                            <input id="txtMilitaryCard" name="militaryCard" class="form-control text-capitalize" type="text" value="" autocomplete="off"
                                                   placeholder="Número Libreta Militar">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-eyedropper"></label>
                                            &nbsp;&nbsp;
                                            <label>Tipo de sangre *</label>
                                            <div>
                                                <select id="selBloodType" name="bloodType" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <br>
                                    <div class="col-md-6">
                                        <label for="fileMilitaryCard">Archivo libreta militar</label>
                                        <input type="file" accept=".PDF,.pdf"  id="fileMilitaryCard" name="urlfileMilitaryCard" multiple 
                                               onchange="procesarFile(true, 'fileMilitaryCard', objFileMilitaryCard);">
                                    </div>
                                    <div class="col-md-6 panel panel-default" id="lstArchivoLibreta" style="text-align: center; margin: 10px; padding: 10px;">                                

                                    </div> 
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="txtAddress">Direccion *</label> 
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-arrows"></i></span>          
                                            <input id="txtAddress" name="address" class="form-control text-capitalize" type="text" value="" autocomplete="off" required
                                                   placeholder="Direccion de residencia">
                                        </div>
                                    </div>                                                
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtHomePhone">Telefono fijo *</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>                                              
                                                <input id="txtHomePhone" name="homePhone" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                       max="9999999999" maxlength="10" placeholder="Telefono fijo (Max 10 digitos)">
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtMobilePhone">Telefono celular *</label>          
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-mobile-phone"></i></span>          
                                                <input id="txtMobilePhone" name="mobilePhone" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                       max="9999999999" maxlength="10" placeholder="Telefono celular (Max 10 digitos)">
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtEmail">Correo electronico *</label>        
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-at"></i></span>          
                                                <input id="txtEmail" name="email" type="email" class="form-control text"  value="" autocomplete="off" required
                                                       placeholder="Correo electronico">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-intersex"></label>
                                            &nbsp;&nbsp;
                                            <label>Genero *</label>
                                            <div>
                                                <select id="selGender" name="gender" required class="form-control text-capitalize select2" style="width: 100%;">
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
                                            <label>Departamento de residencia</label>
                                            <select id="selStateResidence" name="stateResidence"  
                                                    class="form-control text-capitalize select2" style="width: 100%;" 
                                                    onchange="loadCityResidence(this.value);">
                                                <option value="-1" selected> -- SELECCIONE --</option>                            
                                            </select>
                                        </div>
                                    </div>     

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-map-marker"></label>
                                            &nbsp;&nbsp;
                                            <label>Municipio de residencia *</label>
                                            <div>
                                                <select id="selCity" name="cityResidence" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>     
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa fa-drivers-license"></label>
                                            &nbsp;&nbsp;
                                            <label>Nivel de profesion</label>
                                            <div>
                                                <select id="selProfessionNivel" name="professionNivel" 
                                                        class="form-control text-capitalize select2" style="width: 100%;" 
                                                        onchange="loadProfession(this.value);">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>     

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-user-md"></label>
                                            &nbsp;&nbsp;
                                            <label>Profesion *</label>
                                            <div>
                                                <select id="selProfession" name="profession" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>     
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-blind"></label>
                                            &nbsp;&nbsp;
                                            <label>Fondo de pensiones *</label>
                                            <div>
                                                <select id="selPensionFund" name="pensionFund" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-briefcase"></label>
                                            &nbsp;&nbsp;
                                            <label>Fondo de cesantias *</label>
                                            <div>
                                                <select id="selSeveranceFund" name="severanceFund" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-hospital-o"></label>
                                            &nbsp;&nbsp;
                                            <label>ARL *</label>
                                            <div>
                                                <select id="selArl" name="arl" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-ambulance"></label>
                                            &nbsp;&nbsp;
                                            <label>EPS *</label>
                                            <div>
                                                <select id="selEps" name="eps" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-building-o"></label>
                                            &nbsp;&nbsp;
                                            <label>Caja de compensación *</label>
                                            <div>
                                                <select id="selCompensationBox" name="compensationBox" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="checkbox" id="chkDisability" name="disability"/>
                                            &nbsp;&nbsp;
                                            <label for="chkDisability" class="fa fa-wheelchair-alt"></label>                                    
                                            <label for="chkDisability">Discapacidad</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="" class="fa fa-camera"></label>
                                        &nbsp;&nbsp;
                                        <label for="imageEmployee">Foto empleado</label>
                                        <input type="file" accept=".JPG,.jpg"  id="imageEmployee" name="urlimageEmployee" multiple 
                                               onchange="procesarFile(true, 'imageEmployee', objImageEmployee);">
                                    </div>
                                    <div class="col-md-6 panel panel-default" id="lstArchivoFoto" style="text-align: center; margin: 10px; padding: 10px;">                                

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtContactName">Nombre contacto *</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                                <input id="txtContactName" name="contactName" class="form-control text-capitalize text-capitalize" type="text" value="" autocomplete="off" required
                                                       placeholder="Nombre contacto">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtContactPhone">Telefono contacto *</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>                                              
                                                <input id="txtContactPhone" name="contactPhone" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                       max="9999999999" maxlength="10" placeholder="Telefono contacto (Max 10 digitos)">
                                            </div>
                                        </div>
                                    </div> 
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtContactEmail">Correo contacto *</label>        
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-at"></i></span>          
                                                <input id="txtContactEmail" name="contactEmail" type="email" class="form-control text"  value="" autocomplete="off" required
                                                       placeholder="Correo contacto">
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

                                <div class="row">
                                    <div class="col-md-6" align="left">
                                        <button onclick="limpiarMultimedia();closeWindow();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                                    </div>
                                    <div class="col-md-6" align="right">
                                        <div class="newActionButton" id="newActionButtonEmployee">                            
                                            <button id="btnSave" onclick="save();" type ="button" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                    <div class="col-md-6" align="right">
                                        <div class="updateActionButton" id="updateActionButtonEmployee">                            
                                            <button id="btnUpdate" onclick="update();" type="button" class="btn btn-warning">Editar</button>
                                            <button id="btnSave"   onclick="goNavigation('ModalNew', 'ModalConfirm');" 
                                                    type="button" class="btn btn-danger">Eliminar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="FormContainerExperience">
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
                                            <label for="" class="fa fa-user-circle"></label>
                                            &nbsp;&nbsp;
                                            <label>Empleado *</label>
                                            <div>
                                                <select id="selEmployee" name="employee" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtCompanyName">Empresa *</label>    
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-building"></i></span>
                                                <input id="txtCompanyName" name="companyName" class="form-control text-capitalize" type="text" value="" autocomplete="off" required
                                                       placeholder="Empresa">
                                            </div>
                                        </div>
                                    </div>  
                                </div>

                                <div class="row">
                                    <div class="col-md-6">                                
                                        <div class="form-group">
                                            <label>Fecha de ingreso *</label>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="admissionDate" required class="form-control text-capitalize pull-right dateAction" id="txtAdmissionDate">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">                                
                                        <div class="form-group">
                                            <label>Fecha de salida *</label>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="departureDate" required class="form-control text-capitalize pull-right dateAction" id="txtDepartureDate">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-briefcase"></label>
                                            &nbsp;&nbsp;
                                            <label>Cargo *</label>
                                            <div>                                                                                            
                                                <select id="selPosition" name="position" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>  
                                </div>

                                <div class="row">
                                    <br>
                                    <div class="col-md-6">
                                        <label for="" class="fa fa-paperclip"></label>
                                        &nbsp;&nbsp;
                                        <label for="fileWorkCertificate">Certificado Laboral</label>
                                        <input type="file" accept=".PDF,.pdf"  id="fileWorkCertificate" name="urlWorkCertificate" multiple 
                                               onchange="procesarFile(true, 'fileWorkCertificate', objfileWorkCertificate);">
                                    </div>
                                    <div class="col-md-6 panel panel-default" id="lstArchivoAgregado" style="text-align: center; margin: 10px; padding: 10px;">                                

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

                                <div class="row">
                                    <div class="col-md-6" align="left">
                                        <button onclick="limpiarMultimedia();closeWindow();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                                    </div>
                                    <div class="col-md-6" align="right">
                                        <div class="newActionButton" id="newActionButtonExperience">                            
                                            <button id="btnSave" onclick="saveExperience();" type ="button" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                    <div class="col-md-6" align="right">
                                        <div class="updateActionButton" id="updateActionButtonExperience">                            
                                            <button id="btnUpdate" onclick="update();" type="button" class="btn btn-warning">Editar</button>
                                            <button id="btnSave"   onclick="goNavigation('ModalNew', 'ModalConfirm');" 
                                                    type="button" class="btn btn-danger">Eliminar</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.tab-pane -->

                            <div class="tab-pane" id="FormContainerFormation">
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
                                            <label for="" class="fa fa-user-circle"></label>
                                            &nbsp;&nbsp;
                                            <label>Empleado *</label>
                                            <div>                                                                                            
                                                <select id="selEmployeeFormation" name="employee" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtCompanyName">Institución de educación * </label>    
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-building"></i></span>
                                                <input id="txtEducationInstitute" name="educationInstitute" class="form-control text-capitalize" type="text" value="" autocomplete="off" required
                                                       placeholder="Institucion">
                                            </div>
                                        </div>
                                    </div>  
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-book"></label>
                                            &nbsp;&nbsp;
                                            <label>Nivel educativo</label>
                                            <select id="selProfessionNivelFormation" name="professionNivel" 
                                                    class="form-control text-capitalize select2" style="width: 100%;" 
                                                    onchange="loadProfessionFormation(this.value);">
                                                <option value="-1" selected> -- SELECCIONE --</option>                            
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-black-tie"></label>
                                            &nbsp;&nbsp;
                                            <label>Título *</label>
                                            <div>
                                                <select id="selProfessionFormation" name="profession" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>  
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-calendar-o"></label>
                                            &nbsp;&nbsp;
                                            <label>Periodicidad *</label>
                                            <div>
                                                <select id="selPeriodicity" name="periodicity" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="checkbox" id="chkGraduate" name="graduate"/>
                                            &nbsp;&nbsp;
                                            <label for="chkGraduate" class="fa fa-graduation-cap"></label>                                    
                                            <label for="chkGraduate">Graduado</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-check-circle"></label>
                                            &nbsp;&nbsp;
                                            <label for="txtLevel">Nivel alcanzado</label>                                    
                                            <input id="txtLevel" name="level" class="form-control text-capitalize" type="number" value="" autocomplete="off"
                                                   placeholder="Nivel alcanzado">
                                        </div>
                                    </div>  
                                </div>

                                <div class="row">
                                    <br>
                                    <div class="col-md-6">
                                        <label for="" class="fa fa-paperclip"></label>
                                        &nbsp;&nbsp;
                                        <label for="fileFormation">Diploma, Acta o Certificado</label>
                                        <input type="file" accept=".PDF,.pdf"  id="fileFormation" name="urlfileFormation" multiple 
                                               onchange="procesarFile(true, 'fileFormation', objFileFormation);">
                                    </div>
                                    <div class="col-md-6 panel panel-default" id="lstArchivoAgregado" style="text-align: center; margin: 10px; padding: 10px;">                                

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

                                <div class="row">
                                    <div class="col-md-6" align="left">
                                        <button onclick="limpiarMultimediaFormation();closeWindow();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                                    </div>
                                    <div class="col-md-6" align="right">
                                        <div class="newActionButton" id="newActionButtonFormation">                            
                                            <button id="btnSave" onclick="saveFormation();" type ="button" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                    <div class="col-md-6" align="right">
                                        <div class="updateActionButton" id="updateActionButtonFormation">                            
                                            <button id="btnUpdate" onclick="updateFormation();" type="button" class="btn btn-warning">Editar</button>
                                            <button id="btnSave"   onclick="goNavigation('ModalNew', 'ModalConfirm');" 
                                                    type="button" class="btn btn-danger">Eliminar</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="FormContainerContract">
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
                                            <label for="" class="fa fa-user-circle"></label>
                                            &nbsp;&nbsp;
                                            <label>Empleado *</label>
                                            <div>
                                                <select id="selEmployeeContract" name="employee" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-address-book-o"></label>
                                            &nbsp;&nbsp;
                                            <label>Área *</label>
                                            <div>
                                                <select id="selArea" name="area" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div> 
                                </div>

                                <div class="row">
                                    <div class="col-md-6">                                
                                        <div class="form-group">
                                            <label>Fecha de inicio *</label>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="startDate" required class="form-control text-capitalize pull-right dateAction" id="txtStartDate">
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
                                                <input type="text" name="endDate" class="form-control text-capitalize pull-right dateAction" id="txtEndDate">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="" class="fa fa-file-archive-o"></label>
                                            &nbsp;&nbsp;
                                            <label>Tipo contrato *</label>
                                            <div>
                                                <select id="selContractType" name="contractType" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="selPositionContract" class="fa fa-briefcase"></label>
                                            &nbsp;&nbsp;
                                            <label>Cargo *</label>
                                            <div>
                                                <select id="selPositionContract" name="position" required class="form-control text-capitalize select2" style="width: 100%;">
                                                    <option value="-1" selected> -- SELECCIONE --</option>                            
                                                </select>
                                            </div>
                                        </div>
                                    </div> 
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="txtSalary">Salario *</label>   
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                                <input id="txtSalary" name="salary" class="form-control text-capitalize" type="number" value="" autocomplete="off" required
                                                       placeholder="Salario">
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
                                        <div class="progress progress-sm active">
                                            <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%">
                                                <span class="sr-only">100% Complete</span>
                                            </div>
                                        </div>
                                    </div>                       
                                </div>

                                <div class="row">
                                    <div class="col-md-6" align="left">
                                        <button onclick="limpiarMultimediaContract();closeWindow();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                                    </div>
                                    <div class="col-md-6" align="right">
                                        <div class="newActionButton" id="newActionButtonContract">                            
                                            <button id="btnSave" onclick="saveContract();" type ="button" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                    <div class="col-md-6" align="right">
                                        <div class="updateActionButton" id="updateActionButtonContract">                            
                                            <button id="btnUpdate" onclick="updateContract();" type="button" class="btn btn-warning">Editar</button>
                                            <button id="btnSave"   onclick="goNavigation('ModalNew', 'ModalConfirm');" 
                                                    type="button" class="btn btn-danger">Eliminar</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <!-- /.tab-content -->
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
