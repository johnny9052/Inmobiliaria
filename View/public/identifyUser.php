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
        <script src="Resources/public/js/general/identifyUser.js" type="text/javascript"></script>
    </head>
    <body>


        <!-- MODAL PARA ADMINISTRACION DE REGISTROS-->
        <div class="modal fade" id="ModalNewUser" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body" id="FormContainerNewUser">
                        <div class="row" style="text-align: center;">                                                        
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <h2 class="text-light-blue">                        
                                    Registro de usuario
                                </h2>
                            </div>
                        </div>

                        <br>

                        <div class="row">                            
                            <div class="col-md-12 col-sm-12 col-xs-12">                                 
                                <div class="input-group">                    
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <input type="text" class="form-control" id="txtNameUser" name="name" 
                                           placeholder="Ingrese su nombre" required>                    
                                </div>
                            </div>                              
                        </div>

                        <br>

                        <div class="row">                            
                            <div class="col-md-12 col-sm-12 col-xs-12">                                 
                                <div class="input-group">                    
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <input type="text" class="form-control" id="txtLastNameUser" name="lastname" 
                                           placeholder="Ingrese sus apellidos" required>                    
                                </div>
                            </div>                              
                        </div>

                        <br>

                        <div class="row">                            
                            <div class="col-md-12 col-sm-12 col-xs-12">                                  
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-at"></i></span>
                                    </div>
                                    <input type="email" class="form-control" id="txtEmailUser" name="email" 
                                           placeholder="Ingrese su correo" required>                    
                                </div>
                            </div>                              
                        </div>


                        <br>

                        <div class="row">                           
                            <div class="col-md-12 col-sm-12 col-xs-12">                                     
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-mobile-phone"></i></span>
                                    </div>
                                    <input type="number" class="form-control" id="txtPhoneUser" name="phone" 
                                           placeholder="Ingrese su numero" required>                    
                                </div>
                            </div>                              
                        </div>

                        <br>

                        <div class="row">                           
                            <div class="col-md-12 col-sm-12 col-xs-12">                                     
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-asterisk"></i></span>
                                    </div>
                                    <input type="password" class="form-control" id="txtPassword" name="password" 
                                           placeholder="Ingrese su contraseña" required>                    
                                </div>
                            </div>                              
                        </div>

                        <br>


                        <div class="row">                           
                            <div class="col-md-12 col-sm-12 col-xs-12">                                     
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-asterisk"></i></span>
                                    </div>
                                    <input type="password" class="form-control" id="txtPasswordConfirm" name="passwordconfirm" 
                                           placeholder="Ingrese nuevamente su contraseña" required>                    
                                </div>
                            </div>                              
                        </div>

                    </div>

                    <div class="modal-footer">

                        <button type="button" class="btn btn-default pull-left" onclick="goNavigation('ModalNewUser','ModalIdentifyUser')">Cerrar</button>

                        <div class="newActionButton">                            
                            <button id="btnSave" onclick="saveNewUser();" type ="button" class="btn btn-primary">Guardar</button>
                        </div>

                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


        <!-- END MODAL PARA ADMINISTRACION DE REGISTROS-->










        <!-- MODAL PARA ADMINISTRACION DE REGISTROS-->
        <div class="modal fade" id="ModalIdentifyUser" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body" id="FormContainerNewUser">
                        <div class="row" style="text-align: center;">                                                        
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <h2 class="text-light-blue">                        
                                    Identificacion de usuario
                                </h2>
                            </div>
                        </div>
                        <br>
                        <div class="row">                            
                            <div class="col-md-12 col-sm-12 col-xs-12">                                  
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-at"></i></span>
                                    </div>
                                    <input type="email" class="form-control" id="txtEmailUserIdentify" name="email" 
                                           placeholder="Ingrese su correo" required>                    
                                </div>
                            </div>                              
                        </div>


                        <br>

                        <div class="row">                           
                            <div class="col-md-12 col-sm-12 col-xs-12">                                     
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-asterisk"></i></span>
                                    </div>
                                    <input type="password" class="form-control" id="txtPasswordIdentify" name="password" 
                                           placeholder="Ingrese su contraseña" required>                    
                                </div>
                            </div>                              
                        </div>


                    </div>

                    <div class="modal-footer">
                      
                        <button onclick="closeWindow();" type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>

                        <div class="newActionButton">                            
                            <button id="btnSave" onclick="saveNewUser();" type ="button" class="btn btn-primary">Identificarse</button>
                        </div>
                        
                        
                        <button id="btnOpenLogIn" type ="button" class="btn btn-primary" onclick="goNavigation('ModalIdentifyUser','ModalNewUser')">Registrarse</button>

                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


        <!-- END MODAL PARA ADMINISTRACION DE REGISTROS-->


    </body>
</html>
