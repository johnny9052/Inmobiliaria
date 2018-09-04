
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


        <script src="Resources/public/js/general/infoPropertie.js" type="text/javascript"></script>

        <script src="System/Resource/Script/General/Map.js" type="text/javascript"></script>
        <link href="System/Resource/Style/mapSearch.css" rel="stylesheet" type="text/css"/>


        <link href="System/Resource/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="System/Resource/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    </head>
    <body>


        <section class="content">

            <!-----------------CARRUSEL----------------------------------->
            <div class="row">
                <div class="col-md-2 col-sm-1 col-xs-12"></div>
                <div class="col-md-8 col-sm-10 col-xs-12" id="containercarusel">

                </div>
                <div class="col-md-2 col-sm-1 col-xs-12"></div>
            </div>

            <br>
            <!-----------------END CARRUSEL--------------------------------->


            <div class="row">
                <div class="col-md-2 col-sm-1 col-xs-12"></div>
                <div class="col-md-8 col-sm-10 col-xs-12">
                    <h2 class="text-light-blue" id="lblTituloBarrio">                        
                    </h2>
                </div>
                <div class="col-md-2 col-sm-1 col-xs-12"></div>
            </div>

            <div class="row">
                <div class="col-md-2 col-sm-1 col-xs-12"></div>
                <div class="col-md-8 col-sm-10 col-xs-12">
                    <h5 id="lblDescripcion">                        
                    </h5>
                </div>
                <div class="col-md-2 col-sm-1 col-xs-12"></div>
            </div>

            <br>


            <!-----------------CARACTERSITICAS PLUS-------------------------->
            <div id="divIconPlusContainer">
                <div class="row">
                    <div class="col-1">            
                    </div>

                    <div class="col-10" id="divIconosPlus">            
                        <div class="row text-center">
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-aqua">
                                    <span class="info-box-icon"><i class="fa fa-bed"></i></span>

                                    <div class="info-box-content text-center">
                                        <span class="info-box-text">Habitaciones</span>
                                        <span class="info-box-number" id="lblRoom"></span>                          
                                    </div>                        
                                </div>                    
                            </div>

                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-aqua">
                                    <span class="info-box-icon"><i class="fa fa-bath"></i></span>

                                    <div class="info-box-content text-center">
                                        <span class="info-box-text">Baños</span>
                                        <span class="info-box-number" id="lblBath"></span>
                                    </div>                        
                                </div>                    
                            </div>

                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-aqua">
                                    <span class="info-box-icon"><i class="fa fa-automobile"></i></span>
                                    <div class="info-box-content text-center">
                                        <span class="info-box-text">Parqueaderos</span>
                                        <span class="info-box-number" id="lblParking"></span>
                                    </div>                        
                                </div>                    
                            </div>

                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="info-box bg-aqua">
                                    <span class="info-box-icon"><i class="fa fa-area-chart"></i></span>
                                    <div class="info-box-content text-center">
                                        <span class="info-box-text">Area total</span>
                                        <span class="info-box-number" id="lblTotalArea"></span> 
                                    </div>
                                </div>
                            </div>                
                        </div>           
                    </div>


                    <div class="col-1">            
                    </div>
                </div>



            </div>

        </div>
        <!-------------END CARACTERSITICAS PLUS-------------------------->


        <div class="row">
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h2>Caracteristicas</h2>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="box-group" id="accordionCharacteristics">

                            <!--                    <div class="panel box box-primary">
                                                    <div class="box-header with-border">
                                                        <div class="row">
                                                            <h3 class="box-title text-light-blue col-md-5 col-sm-12 col-xs-12">
                                                                Administracion
                                                            </h3>
                                                            <h5 class="box-title col-md-5 col-sm-12 col-xs-12" id="lblAdministrationCost">
                            
                                                            </h5>
                                                        </div>
                                                    </div>                            
                                                </div>                    -->

                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>

        <div class="row">
            <div class="col-md-2 col-sm-2 col-xs-12"></div>
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div id="googleMap" style="width:100%;height:400px;"></div>
            </div>                                         
            <div class="col-md-2 col-sm-2 col-xs-12"></div>
        </div>
    </section>

    <br>

    <section id="FormContainer">

        <div class="row">
            <div class="col-md-2 col-sm-1 col-xs-12"></div>
            <div class="col-md-8 col-sm-10 col-xs-12">
                <h2 class="text-light-blue">                        
                    Contactanos y agenda una cita
                </h2>
            </div>
            <div class="col-md-2 col-sm-1 col-xs-12"></div>
        </div>

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
                <div class="progress progress-sm active">
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


    <!-- END MODAL DE CONFIRMACION-->

    <!-- SCRIPT DE MAPAS, ACTIVACION MEDIANTE KEY -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmpRlSVVxIje1GdQb7jlW5QwG-WBfVEnw&libraries=places&callback=myMap"
    async defer></script>


</body>
</html>
