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

        <script defer type="text/javascript" src="Resource/Script/Client/Client.js"></script>
    </head>
    <body>

        <section class="content-header">
            <h1>
                Clientes                    
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-group"></i> Configuracion</a></li>
                <li class="active">Clientes</li>
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
                                    <label>Tipo documento</label>
                                    <select id="selDocumentType" name="documentType" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtDocumentNumber">Cedula</label>                                    
                                    <input id="txtDocumentNumber" name="documentNumber" class="form-control" type="number" value="" autocomplete="off" required
                                           placeholder="Numero de cedula">
                                </div>
                            </div>    


                        </div>




                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Departamento de expedicion</label>
                                    <select id="selStateExpedition" name="stateExpedition" 
                                            class="form-control select2" style="width: 100%;"  
                                            onchange="loadCity(this.value)">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Municipio de expedicion</label>
                                    <select id="selCityExpedition" name="cityExpedition" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>     
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtFirstName">Primer nombre</label>                                    
                                    <input id="txtFirstName" name="firstName" class="form-control" type="text" value="" autocomplete="off" required
                                           placeholder="Primer nombre">
                                </div>
                            </div>                       

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtName">Segundo nombre</label>                                    
                                    <input id="txtSecondName" name="secondName" class="form-control" type="text" value="" autocomplete="off"
                                           placeholder="Segundo nombre">
                                </div>
                            </div>     
                        </div>                                               

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtFirstLastName">Primer apellido</label>                                    
                                    <input id="txtFirstLastName" name="firstLastName" class="form-control" type="text" value="" autocomplete="off" required
                                           placeholder="Primer apellido">
                                </div>
                            </div>                       

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtName">Segundo apellido</label>                                    
                                    <input id="txtSecondLastName" name="secondLastName" class="form-control" type="text" value="" autocomplete="off" 
                                           placeholder="Segundo apellido">
                                </div>
                            </div>     
                        </div>


                        <div class="row">

                            <div class="col-md-6">                                
                                <div class="form-group">
                                    <label>Fecha de nacimiento</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" name="birthdate" required class="form-control pull-right dateAction" id="txtBirthdate">
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Estado civil</label>
                                    <select id="selMaritalStatus" name="maritalStatus" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>     



                        </div>



                        <div class="row">


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tipo de cliente</label>
                                    <select id="selClientType" name="clientType" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>    


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tipo de persona</label>
                                    <select id="selPersonType" name="personType" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>   

                        </div>




                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="txtAddress">Direccion</label>                                    
                                    <input id="txtAddress" name="address" class="form-control" type="text" value="" autocomplete="off" required
                                           placeholder="Direccion de residencia">
                                </div>
                            </div>                                                
                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtHomePhone">Telefono fijo</label>                                    
                                    <input id="txtHomePhone" name="homePhone" class="form-control" type="number" value="" autocomplete="off" required
                                           max="9999999999" maxlength="10" placeholder="Telefono fijo (Max 10 digitos)">
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtMobilePhone">Telefono celular</label>                                    
                                    <input id="txtMobilePhone" name="mobilePhone" class="form-control" type="number" value="" autocomplete="off" required
                                           max="9999999999" maxlength="10" placeholder="Telefono celular (Max 10 digitos)">
                                </div>
                            </div>     
                        </div>


                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtEmail">Correo electronico</label>                                    
                                    <input id="txtEmail" name="email" type="email" class="form-control"  value="" autocomplete="off" required
                                           placeholder="Correo electronico">
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Genero</label>
                                    <select id="selGender" name="gender" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>     
                        </div>



                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Departamento de residencia</label>
                                    <select id="selStateResidence" name="stateResidence"  
                                            class="form-control select2" style="width: 100%;" 
                                            onchange="loadCityResidence(this.value);">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Municipio de residencia</label>
                                    <select id="selCityResidence" name="cityResidence" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>     
                        </div>




                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Nivel de profesion</label>
                                    <select id="selProfessionNivel" name="professionNivel" 
                                            class="form-control select2" style="width: 100%;" 
                                            onchange="loadProfession(this.value);">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Profesion</label>
                                    <select id="selProfession" name="profession" required class="form-control select2" style="width: 100%;">
                                        <option value="-1" selected> -- SELECCIONE --</option>                            
                                    </select>
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














    </body>
</html>
