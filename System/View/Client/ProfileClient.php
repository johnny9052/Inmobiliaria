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

        <script defer type="text/javascript" src="Resource/Script/Client/ProfileClient.js"></script>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <section class="content-header">
            <h1>
                Perfil Usuario
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Examples</a></li>
                <li class="active">User profile</li>
            </ol>
        </section>


        <!-- ***************CONTENIDO**************** -->

        <section class="content">
            <div class="row">
                <div class="col-md-3">

                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle" src="../Resources/public/image/fotoPerfil.png" class="img-circle" alt="Foto cliente">

                            <div class="text-muted text-center" id="lblNameClient"></div>
                            <div class="text-muted text-center" id="lblProfession"></div>


                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>Propiedades</b> <div class="pull-right" id="lblNumberProperties"></div>
                                </li>
                                <li class="list-group-item">
                                    <b>Contratos</b> <div class="pull-right" id="lblNumberContracts"></div>
                                </li>
                                <li class="list-group-item">
                                    <b>Citas pendientes</b> <div class="pull-right" id="lblNumberEvents"></div>
                                </li>
                            </ul>

                            <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                    <!-- About Me Box -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Acerca de</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <strong><i class="fa fa-map-marker margin-r-5"></i> Ubicación</strong>

                            <div class="text-muted" id="lblCity"></div> 

                            <hr>

                            <strong><i class="fa fa-mobile-phone margin-r-5"></i> Teléfonos</strong>

                            <div class="text-muted" id="lblPhone"></div> 

                            <hr>

                            <strong><i class="fa fa-envelope-o margin-r-5"></i> Correo Electrónico</strong>

                            <div class="text-muted" id="lblEmail"></div> 

                            <hr>

                            <strong><i class="fa fa-user margin-r-5"></i> Tipo persona</strong>

                            <div class="text-muted" id="lblPersonType"></div> 

                            <hr>

                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
                            <li><a href="#timeline" data-toggle="tab">Timeline</a></li>
                            <li><a href="#settings" data-toggle="tab">Settings</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="divEventosClientes" class="active tab-pane" id="activity">
                                
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="timeline">
                                <!-- The timeline -->
                                <ul class="timeline timeline-inverse">
                                    <!-- timeline time label -->
                                    <li class="time-label">
                                        <span class="bg-red">
                                            10 Feb. 2014
                                        </span>
                                    </li>
                                    <!-- /.timeline-label -->
                                    <!-- timeline item -->
                                    <li>
                                        <i class="fa fa-envelope bg-blue"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                                            <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                                            <div class="timeline-body">
                                                Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                                                weebly ning heekya handango imeem plugg dopplr jibjab, movity
                                                jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                                                quora plaxo ideeli hulu weebly balihoo...
                                            </div>
                                            <div class="timeline-footer">
                                                <a class="btn btn-primary btn-xs">Read more</a>
                                                <a class="btn btn-danger btn-xs">Delete</a>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- END timeline item -->
                                    <!-- timeline item -->
                                    <li>
                                        <i class="fa fa-user bg-aqua"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                                            <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
                                            </h3>
                                        </div>
                                    </li>
                                    <!-- END timeline item -->
                                    <!-- timeline item -->
                                    <li>
                                        <i class="fa fa-comments bg-yellow"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                                            <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                                            <div class="timeline-body">
                                                Take me to your leader!
                                                Switzerland is small and neutral!
                                                We are more like Germany, ambitious and misunderstood!
                                            </div>
                                            <div class="timeline-footer">
                                                <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- END timeline item -->
                                    <!-- timeline time label -->
                                    <li class="time-label">
                                        <span class="bg-green">
                                            3 Jan. 2014
                                        </span>
                                    </li>
                                    <!-- /.timeline-label -->
                                    <!-- timeline item -->
                                    <li>
                                        <i class="fa fa-camera bg-purple"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                                            <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                                            <div class="timeline-body">
                                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                            </div>
                                        </div>
                                    </li>
                                    <!-- END timeline item -->
                                    <li>
                                        <i class="fa fa-clock-o bg-gray"></i>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.tab-pane -->

                            <div class="tab-pane" id="settings">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label for="inputName" class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputName" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName" class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputName" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                                        <div class="col-sm-10">
                                            <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-danger">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div>
                    <!-- /.nav-tabs-custom -->
                </div>
            </div>

            <div class="row">        
                <div class="col-md-12">
                    <div class="active tab-pane" id="activity">
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
            </div>
        </section>




        <!-- MODAL PARA ADMINISTRACION DE REGISTROS-->
        <div class="modal fade" id="ModalNew" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#register" data-toggle="tab">Información</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Propertie/Propertie');" data-toggle="tab">Inmuebles</a></li>
                                <li><a href="" onclick="redirectInfoFilter('Client/Event');" data-toggle="tab">Eventos</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="active tab-pane" id="register">
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
                                                    <label for="" class="fa fa-id-card"></label>
                                                    &nbsp;&nbsp;
                                                    <label>Tipo documento</label>
                                                    <div>
                                                        <select id="selDocumentType" name="documentType" required class="form-control select2" style="width: 100%;">
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>     

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtDocumentNumber">Cedula</label>    
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-id-card"></i></span>
                                                        <input id="txtDocumentNumber" name="documentNumber" class="form-control" type="number" value="" autocomplete="off" required
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

                                            <div class="col-md-6">
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
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtFirstName">Primer nombre</label>   
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                                        <input id="txtFirstName" name="firstName" class="form-control" type="text" value="" autocomplete="off" required
                                                               placeholder="Primer nombre">
                                                    </div>
                                                </div>
                                            </div>                       

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtName">Segundo nombre</label>  
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                                        <input id="txtSecondName" name="secondName" class="form-control" type="text" value="" autocomplete="off"
                                                               placeholder="Segundo nombre">
                                                    </div>
                                                </div>
                                            </div>     
                                        </div>                                               

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtFirstLastName">Primer apellido</label>  
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>
                                                        <input id="txtFirstLastName" name="firstLastName" class="form-control" type="text" value="" autocomplete="off" required
                                                               placeholder="Primer apellido">
                                                    </div>
                                                </div>
                                            </div>                       

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtName">Segundo apellido</label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info"></i></span>                                    
                                                        <input id="txtSecondLastName" name="secondLastName" class="form-control" type="text" value="" autocomplete="off" 
                                                               placeholder="Segundo apellido">
                                                    </div>
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
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="" class="fa fa-user"></label>
                                                    &nbsp;
                                                    <label>Tipo de persona</label>
                                                    <div>
                                                        <select id="selPersonType" name="personType" required class="form-control select2" style="width: 100%;">
                                                            <option value="-1" selected> -- SELECCIONE --</option>                            
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>   

                                        </div>




                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtAddress">Direccion</label> 
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-address-card"></i></span>          
                                                        <input id="txtAddress" name="address" class="form-control" type="text" value="" autocomplete="off" required
                                                               placeholder="Direccion de residencia">
                                                    </div>
                                                </div>
                                            </div>                                                
                                        </div>



                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtHomePhone">Telefono fijo</label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>                                              
                                                        <input id="txtHomePhone" name="homePhone" class="form-control" type="number" value="" autocomplete="off" required
                                                               max="9999999999" maxlength="10" placeholder="Telefono fijo (Max 10 digitos)">
                                                    </div>
                                                </div>
                                            </div>     

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtMobilePhone">Telefono celular</label>          
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-mobile-phone"></i></span>          
                                                        <input id="txtMobilePhone" name="mobilePhone" class="form-control" type="number" value="" autocomplete="off" required
                                                               max="9999999999" maxlength="10" placeholder="Telefono celular (Max 10 digitos)">
                                                    </div>
                                                </div>
                                            </div>     
                                        </div>


                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtEmail">Correo electronico</label>        
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-at"></i></span>          
                                                        <input id="txtEmail" name="email" type="email" class="form-control"  value="" autocomplete="off" required
                                                               placeholder="Correo electronico">
                                                    </div>
                                                </div>
                                            </div>     

                                            <div class="col-md-6">
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
                                        </div>



                                        <div class="row">

                                            <div class="col-md-6">
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

                                            <div class="col-md-6">
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
                                        </div>




                                        <div class="row">

                                            <div class="col-md-6">
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

                                            <div class="col-md-6">
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
                                        </div>


                                        <div class="row">                           
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="" class="fa fa-user"></label>
                                                    &nbsp;&nbsp;
                                                    <label>Tipo Cliente</label>
                                                    <div id="FormContainerCheckboxClientType" class="containerPermission">

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
                                    </div>
                                </div>
                                <div class="tab-pane" id="properties">
                                </div>
                                <div class="tab-pane" id="events">
                                    <!-- Post -->
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
