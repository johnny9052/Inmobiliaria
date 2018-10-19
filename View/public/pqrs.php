
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
        
        <script src="Resources/public/js/general/pqrs.js" type="text/javascript"></script>

    </head>

    <body>
        <br>
        <br>
        <br>

        <section id="FormContainer">

            <div class="row">
                <div class="col-md-10 col-sm-10 col-xs-12">
                    <div class="form-group">                                                                        
                        <input id="txtId" name="id" class="form-control identificator"  type="hidden" value="">
                    </div>
                </div>            
            </div>

            <div class="row">
                <div class="col-md-10 col-sm-10 col-xs-12">
                    <div class="form-group">                                                                        
                        <input id="txtMatricula" name="matricula" class="form-control identificator"  type="hidden" value="">
                    </div>
                </div>            
            </div>

            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
                <div class="col-md-6 col-sm-6 col-xs-12"> 
                    <label for="txtNameUser">Nombre</label>   
                    <div class="input-group">                    
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" id="txtNameUser" name="name" 
                               placeholder="Ingrese su nombre" required>                    
                    </div>

                </div>  
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
            </div>

            <br>

            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
                <div class="col-md-6 col-sm-6 col-xs-12">  
                    <label for="txtEmailUser">Correo</label>   
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-at"></i></span>
                        </div>
                        <input type="email" class="form-control" id="txtEmailUser" name="email" 
                               placeholder="Ingrese su correo" required>                    
                    </div>

                </div>  
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
            </div>


            <br>

            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
                <div class="col-md-6 col-sm-6 col-xs-12">   
                    <label for="txtPhoneUser">Numero</label>   
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-mobile-phone"></i></span>
                        </div>
                        <input type="number" class="form-control" id="txtPhoneUser" name="phone" 
                               placeholder="Ingrese su numero" required>                    
                    </div>

                </div>  
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
            </div>

            <br>

            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
                <div class="col-md-6 col-sm-6 col-xs-12">  
                    <label for="txtDescription">Mensaje</label>   
                    <div class="form-group">                    
                        <textarea id="txtDescription" name="description" class="form-control" 
                                  name="message" rows="3" placeholder="Ingrese su mensaje" required></textarea>
                    </div>
                </div>                       
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
            </div>

            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
                <div class="col-md-6 col-sm-6 col-xs-12">            
                    <div style="display: none;" class="progress progress-sm active">
                        <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%">
                            <span class="sr-only">100% Complete</span>
                        </div>
                    </div>
                </div>   
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
            </div>

            <br>

            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
                <div class="col-md-6 col-sm-6 col-xs-12">            
                    <div class="newActionButton">                            
                        <button id="btnSave" onclick="sendContact();" type ="button" class="btn btn-primary">Enviar</button>
                    </div>
                </div>   
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
            </div>

        </section>


    </body>
</html>