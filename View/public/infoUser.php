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
        <script src="Resources/public/js/general/userData.js" type="text/javascript"></script>
    </head>
    <body>

        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="progress progress-sm active">
                    <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%">
                        <span class="sr-only">100% Complete</span>
                    </div>
                </div>
            </div>                      
            <div class="col-md-1"></div>
        </div>


        <div class="" id="FormContainer">

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">                                                                        
                        <input id="txtId" name="id" class="form-control identificator"  type="hidden" value="<?php echo isset($_SESSION["identificationPublicHexagon"]) ? $_SESSION["identificationPublicHexagon"] : ""; ?>">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-id-card"></label>
                        &nbsp;&nbsp;
                        <label for="selDocumentType">Tipo documento</label>
                        <div class="input-group">
                            <select id="selDocumentType" name="documentType" required class="form-control select2" style="width: 100%;">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>     

                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-id-card"></label>
                        &nbsp;&nbsp;
                        <label for="txtDocumentNumber">Cedula</label>    
                        <div class="input-group">
                            <input id="txtDocumentNumber" name="documentNumber" class="form-control" type="number" value="" autocomplete="off" required
                                   placeholder="Numero de cedula">
                        </div>
                    </div>
                </div>    
                <div class="col-md-1"></div>
            </div>


            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-map-marker"></label>
                        &nbsp;&nbsp;
                        <label>Departamento de expedicion</label>
                        <div>
                            <select id="selStateExpedition" name="stateExpedition" 
                                    class="form-control select2" style="width: 100%;"  
                                    onchange="loadCity(this.value)">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>     

                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-map-marker"></label>
                        &nbsp;&nbsp;
                        <label>Municipio de expedicion</label>
                        <div>
                            <select id="selCityExpedition" name="cityExpedition" required class="form-control select2" style="width: 100%;">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>    
                <div class="col-md-1"></div>
            </div>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-info"></label>
                        &nbsp;&nbsp;
                        <label for="txtFirstName">Primer nombre</label>   
                        <div class="input-group">

                            <input id="txtFirstName" name="firstName" class="form-control" type="text" value="" autocomplete="off" required
                                   placeholder="Primer nombre">
                        </div>
                    </div>
                </div>                       

                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-info"></label>
                        &nbsp;&nbsp;
                        <label for="txtName">Segundo nombre</label>  
                        <div class="input-group">

                            <input id="txtSecondName" name="secondName" class="form-control" type="text" value="" autocomplete="off"
                                   placeholder="Segundo nombre">
                        </div>
                    </div>
                </div>  
                <div class="col-md-1"></div>
            </div>                                               

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-info"></label>
                        &nbsp;&nbsp;
                        <label for="txtFirstLastName">Primer apellido</label>  
                        <div class="input-group">

                            <input id="txtFirstLastName" name="firstLastName" class="form-control" type="text" value="" autocomplete="off" required
                                   placeholder="Primer apellido">
                        </div>
                    </div>
                </div>                       

                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-info"></label>
                        &nbsp;&nbsp;
                        <label for="txtName">Segundo apellido</label>
                        <div class="input-group">

                            <input id="txtSecondLastName" name="secondLastName" class="form-control" type="text" value="" autocomplete="off" 
                                   placeholder="Segundo apellido">
                        </div>
                    </div>
                </div>  
                <div class="col-md-1"></div>
            </div>


            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">                                
                    <div class="form-group">
                        <label class="fa fa-calendar"></label>
                        &nbsp;&nbsp;
                        <label>Fecha de nacimiento</label>
                        <div class="input-group date">

                            <input type="date" name="birthdate" required class="form-control pull-right" id="txtBirthdate">
                        </div>
                    </div>
                </div>


                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-gratipay"></label>
                        &nbsp;&nbsp;
                        <label>Estado civil</label>
                        <div>
                            <select id="selMaritalStatus" name="maritalStatus" required class="form-control select2" style="width: 100%;">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div> 
                <div class="col-md-1"></div>
            </div>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-user"></label>
                        &nbsp;&nbsp;
                        <label>Tipo de persona</label>
                        <div>
                            <select id="selPersonType" name="personType" required class="form-control select2" style="width: 100%;">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>  
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-address-card"></label>
                        &nbsp;&nbsp;
                        <label for="txtAddress">Direccion</label> 
                        <div class="input-group">

                            <input id="txtAddress" name="address" class="form-control" type="text" value="" autocomplete="off" required
                                   placeholder="Direccion de residencia">
                        </div>
                    </div>
                </div>  
                <div class="col-md-1"></div>

            </div>





            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-phone"></label>
                        &nbsp;&nbsp;
                        <label for="txtHomePhone">Telefono fijo</label>
                        <div class="input-group">                            
                            <input id="txtHomePhone" name="homePhone" class="form-control" type="number" value="" autocomplete="off"
                                   max="9999999999" maxlength="10" placeholder="Telefono fijo (Max 10 digitos)">
                        </div>
                    </div>
                </div>     

                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-mobile-phone"></label>
                        &nbsp;&nbsp;
                        <label for="txtMobilePhone">Telefono celular</label>          
                        <div class="input-group">
                            <input id="txtMobilePhone" name="mobilePhone" class="form-control" type="number" value="" autocomplete="off" required
                                   max="9999999999" maxlength="10" placeholder="Telefono celular (Max 10 digitos)">
                        </div>
                    </div>
                </div> 
                <div class="col-md-1"></div>
            </div>


            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="fa fa-at"></label>
                        &nbsp;&nbsp;
                        <label for="txtEmail">Correo electronico</label>        
                        <div class="input-group">

                            <input id="txtEmail" name="email" type="email" class="form-control"  value="" autocomplete="off" required
                                   placeholder="Correo electronico">
                        </div>
                    </div>
                </div>     

                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-intersex"></label>
                        &nbsp;&nbsp;
                        <label>Genero</label>
                        <div>
                            <select id="selGender" name="gender" required class="form-control select2" style="width: 100%;">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div> 
                <div class="col-md-1"></div>
            </div>



            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-map-marker"></label>
                        &nbsp;&nbsp;
                        <label>Departamento de residencia</label>
                        <div>                                        
                            <select id="selStateResidence" name="stateResidence"  
                                    class="form-control select2" style="width: 100%;" 
                                    onchange="loadCityResidence(this.value);">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>     

                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-map-marker"></label>
                        &nbsp;&nbsp;
                        <label>Municipio de residencia</label>
                        <div>
                            <select id="selCityResidence" name="cityResidence" required class="form-control select2" style="width: 100%;">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>  
                <div class="col-md-1"></div>
            </div>




            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa fa-drivers-license"></label>
                        &nbsp;&nbsp;
                        <label>Nivel de profesion</label>
                        <div>
                            <select id="selProfessionNivel" name="professionNivel" 
                                    class="form-control select2" style="width: 100%;" 
                                    onchange="loadProfession(this.value);">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>     

                <div class="col-md-5">
                    <div class="form-group">
                        <label for="" class="fa fa-user-md"></label>
                        &nbsp;&nbsp;
                        <label>Profesion</label>
                        <div>
                            <select id="selProfession" name="profession" required class="form-control select2" style="width: 100%;">
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>   
                <div class="col-md-1"></div>
            </div>


            <div class="row center-block">
                <div class="col-md-5"></div>
                <div class="col-md-4">
                </div>
                <div class="col-md-3">
                    <button id="btnUpdate" onclick="update();" type="button" class="btn-lg btn-primary">Actualizar</button>
                </div>
            </div>


            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="progress progress-sm active">
                        <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%">
                            <span class="sr-only">100% Complete</span>
                        </div>
                    </div>
                </div>                      
                <div class="col-md-1"></div>
            </div>
        </div>
        <br>
        <br>
    </body>
</html>
