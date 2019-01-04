<script src="Resources/public/js/general/record.js" type="text/javascript"></script>

<!--/ Intro Single star /-->
<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">¿Por qué publicar su inmueble en Hexagono Gestores Integrales?</h1>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Inicio</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Publicar
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!--/ Intro Single End /-->

<!--/ About Star /-->
<section class="section-about">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="about-img-box">
                    <img src="Resources/public/template/img/slide-about-1.jpg" alt="" class="img-fluid">
                </div>
                <div class="sinse-box">
                    <h3 class="sinse-title">Asesoría Integral
                        <span></span>
                        <br>Inmobiliaria</h3>
                    <p></p>
                </div>
            </div>
            <div class="col-md-12 section-t8">
                <div class="row">
                    <div class="col-md-6 col-lg-5">
                        <img src="Resources/public/template/img/about-2.jpg" alt="" class="img-fluid">
                    </div>
                    <div class="col-lg-2  d-none d-lg-block">
                        <div class="title-vertical d-flex justify-content-start">
                            <span>Propiedades exclusivas</span>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-5 section-md-t3">
                        <div class="title-box-d">
                            <h3 class="title-d">Gestores
                                <span class="color-d">especializados</span> en compra y venta de 
                                <br> inmuebles.</h3>
                        </div>
                        <p class="color-text-a">
                            En Hexágono Gestores Integrales buscamos inmuebles exclusivos, que cumplan con una serie de requisitos para que el comprador y el vendedor queden a gusto con el proceso de arrendamiento, compra y venta. Para de esta manera satisfacer las necesidades de ambas partes, Hexágono te acompaña en un proceso que te ayudará a cumplir con cada uno de estos requerimientos, pero de no ser así, se reserva el derecho de publicación de los inmuebles que no cumplen ellos, dentro de los cuales se incluyen, requisitos legales, estructurales y normativos.
                        </p>
                        <p class="color-text-a">
                            Publica tú inmueble, recibe una calificación del mismo y las observaciones para que sea atractivo para posibles clientes.
                        </p>
                    </div>
                </div>
<!--                <div class="row">
                    <div class="col-md-12 col-lg-12">
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
                </div>-->
            </div>
        </div>
    </div>
</section>
<!--/ About End /-->

<!--/ Team Star /-->
<section class="section-agents section-t8">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title-wrap d-flex justify-content-between">
                    <div class="title-box">
                        <h2 class="title-a">Publicar Inmueble</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="" id="FormContainerRecord">
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
                                <label for="txtAddress">Dirección</label> 
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
                                <label for="txtHomePhone">Teléfono fijo</label>
                                <div class="input-group">                            
                                    <input id="txtPhone" name="phone" class="form-control" type="number" value="" autocomplete="off"
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
                                <label for="txtMobilePhone">Teléfono celular</label>          
                                <div class="input-group">
                                    <input id="txtCelPhone" name="celPhone" class="form-control" type="number" value="" autocomplete="off" required
                                           max="9999999999" maxlength="10" placeholder="Telefono celular (Max 10 digitos)">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="fa fa-at"></label>
                                &nbsp;&nbsp;
                                <label for="txtEmail">Correo electrónico</label>        
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
                                    <select id="selStateRecord" name="state"  
                                            class="form-control select2" style="width: 100%;" 
                                            onchange="loadCityRecord(this.value);">
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
                                    <select id="selCityRecord" name="city" required class="form-control select2" style="width: 100%;">
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
                            <button id="btnSave" onclick="sendContact();" type ="button"  class="btn btn-block btn-primary btn-lg transparencia botonFiltroBusquedaBanner">Consignar</button>
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
    </div>
</section>
<!--/ Team End /-->
