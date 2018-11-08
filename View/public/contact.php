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
        <br><br><br>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-2 " >
                <label class="btn-lg fa fa-phone  align-self-center"></label>
                <p class="textoContenidoConsignar"> Llámenos al (6) 74545454 y hable con humanos, así, como en los viejos tiempos.</p>
            </div>
            <div class="col-md-2">
                <label class="btn-lg fa fa-whatsapp  align-self-center"></label>
                <p class="textoContenidoConsignar"> Y si no está de ánimo para hablar, entonces escríbanos al WhatsApp 3002680564.</p>
            </div>
            <div class="col-md-2">
                <label class="btn-lg fa fa-at align-self-center"></label>
                <p class="textoContenidoConsignar"> También puede hacerlo a equipo@hexagonogestores.com sin temor a que lo llenemos de spam.</p>
            </div>
            <div class="col-md-2">
                <label class="btn-lg fa fa-coffee align-self-center"></label>
                <p class="textoContenidoConsignar"> O mejor aún, visítenos en la Calle 17 Norte # 11-07. Armenia, Quindío, nos encantaría invitarle un café.</p>
            </div>
            <div class="col-md-2">

            </div>
        </div>
        
        <div class="row">
            <div class="col-md-4">
                
            </div>
            <div class="col-md-4">
                <p class="textoContenidoCentrado">Conozca en este enlace nuestra Política de Tratamiento de Datos, o si lo prefiere envíenos sus inquietudes a través de este formulario.</p>
            </div>   
        </div>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-md-8" id="FormContainer">

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
                        <button id="btnUpdate" onclick="update();" type="button" class="btn-lg btn-primary">Consignar</button>
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
            <div class="col-md-2">

            </div>
        </div>

        <br>
        <br>
    </body>
</html>
