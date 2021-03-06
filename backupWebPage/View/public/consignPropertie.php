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
    </head>
    <body>

        <br>

        <section class="content-header">

        </section>
        <div class="row">
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
            <div class="col-md-10 col-sm-10 col-xs-12" id="containercarusel">
                <div id="divcarusel" class="carousel slide" data-ride="carousel">
                    <ul class="carousel-indicators" id="paginatorcarusel">	
                        <li data-target="#divcarusel" data-slide-to="0" class="active"></li>
                        <li data-target="#divcarusel" data-slide-to="1" class=""></li>
                        <li data-target="#divcarusel" data-slide-to="2" class=""></li>                
                    </ul>

                    <div class="carousel-inner" id="imagesCarusel" style="max-width: 1100px; max-height: 450px">
                        <div class="carousel-item active">
                            <img src="Resources/public/image/ImagenSlidePrincipal.PNG" alt="Hexagono">
                        </div>  
                        <div class="carousel-item ">
                            <img src="Resources/public/image/ImagenSlideArriendo.PNG" alt="Arriendos">
                        </div>
                        <div class="carousel-item ">
                            <img src="Resources/public/image/ImagenSlideVacacional.PNG" alt="vacacional">
                        </div>              
                    </div>
                    <a class="carousel-control-prev" href="#divcarusel" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#divcarusel" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-12"></div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-3">
                <div class="row">

                    <p class="textoContenidoConsignar">Consignar un inmueble en Mubrick, le ayudará a venderlo o arrendarlo en menor tiempo. 
                        Así mismo, reducirá el riesgo que conlleva realizar transacciones inmobiliarias.</p>
                    <h5 class="titulosPrincipales">EN QUE NOS DIFERENCIAMOS</h5><br><br>
                    <P class="textoContenidoConsignar">1) Avalúo gratis, en cinco minutos y de alta confiabilidad.<br><br>

                        2) Fotografía profesional tipo AXXIS. También sin costo.<br><br>

                        3) Promoción en más de 10 portales inmobiliarios, redes sociales, emailing y Google.<br><br>

                        4) Contact center 12 / 7 para recibir, filtrar y registrar los contactos. Aquí contestamos TODAS las llamadas o emails.<br><br>

                        5) Brokers con título profesional, y entrenados en neuroventas, contratos, impuestos, notarías y bancos.<br><br>

                        6) Un solo broker de principio a fin. Nada de desfiles en su casa. <br><br>

                        7) No usamos avisos de ventana; dañan la estética del inmueble y son un riesgo para su seguridad.

                    </P>

                </div>

            </div>
            <div class="col-md-1">

            </div>
            <div class="col-md-5">
                <div class="row">
                    <h5 class="titulosPrincipales">DILIGENCIE ESTE FORMULARIO PARA INICIAR EL PROCESO DE CONSIGNACIÓN.</h5>
                    <P class="textoContenidoConsignar"> Nos comunicaremos con usted en menos de seis horas hábiles.</P>
                </div>
                <div class="row">
                    <div class="" id="FormContainer">

                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10">
                                <div class="form-group">                                                                        
                                    <input id="txtId" name="id" class="form-control identificator"  type="hidden" value="<?php echo isset($_SESSION["identificationPublicHexagon"]) ? $_SESSION["identificationPublicHexagon"] : ""; ?>">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            
                            <div class="col-md-12">
                                <!-- general form elements -->
                                <div class="box box-success">               
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
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

                            <div class="col-md-6">
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
                        </div>                                               

                        <div class="row">
                            <div class="col-md-6">
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

                            <div class="col-md-6">
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
                        </div>


                        <div class="row">
                            <div class="col-md-6">
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
                            <div class="col-md-6">
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
                        </div>

                        <div class="row">
                            <div class="col-md-6">
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
                            <div class="col-md-6">
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
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-map-marker"></label>
                                    &nbsp;&nbsp;
                                    <label>Departamento inmueble</label>
                                    <div>                                        
                                        <select id="selStateResidence" name="stateResidence"  
                                                class="form-control select2" style="width: 100%;" 
                                                onchange="loadCityResidence(this.value);">
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>     

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="" class="fa fa-map-marker"></label>
                                    &nbsp;&nbsp;
                                    <label>Municipio inmueble</label>
                                    <div>
                                        <select id="selCityResidence" name="cityResidence" required class="form-control select2" style="width: 100%;">
                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                        </select>
                                    </div>
                                </div>
                            </div>  
                        </div>

                        <div class="row align-self-sm-end">
                            <div class="col-md-1"></div>
                            <div class="col-md-7"></div>
                            <div class="col-md-4 align-self-sm-end">
                                <button id="btnUpdate" onclick="update();" type="button" class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner">Consignar</button>
                            </div>
                            
                        </div>


<!--                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10">
                                <div class="progress progress-sm active">
                                    <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%">
                                        <span class="sr-only">100% Complete</span>
                                    </div>
                                </div>
                            </div>                      
                            <div class="col-md-1"></div>
                        </div>-->
                    </div>
                </div>
            </div>
            <div class="col-md-1">

            </div>
        </div>

        <br>
        <br>
    </body>
</html>
