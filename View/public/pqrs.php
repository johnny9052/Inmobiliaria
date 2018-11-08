
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
        <br>    
        <br>
        <br>


        <div class="row">
            <div class="col-md-1">

            </div>
            <div class="col-md-10 content-header">
                <h1>
                    Generar PQRS                    
                </h1>

                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-cube"></i> Perfil</a></li>
                    <li class="active">PQRS</li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-md-1">

            </div>
            <div class="col-md-10">
                <!-- general form elements -->
                <div class="box box-success">               
                </div>
            </div>
        </div>

        <section id="FormContainer">
            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
                <div class="col-md-6 col-sm-6 col-xs-12">  
                    <div class="form-group">
                        <label for="" class="fa fa-inbox"></label>
                        &nbsp;&nbsp;
                        <label>Tipo PQRS</label>
                        <div>
                            <select id="selPRQSType" name="pqrstype" 
                                    class="form-control select2" style="width: 100%;" required>
                                <option value="-1" selected> -- SELECCIONE --</option>                            
                            </select>
                        </div>
                    </div>
                </div>     
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
            </div>

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
                        <button id="btnSave" onclick="savePQRS();" type ="button" class="btn btn-primary">Enviar</button>
                    </div>
                </div>   
                <div class="col-md-3 col-sm-3 col-xs-12"></div>
            </div>

            <br>

        </section>


    </body>
</html>