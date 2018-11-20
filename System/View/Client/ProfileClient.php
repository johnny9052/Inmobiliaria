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
                <li><a href="#">Clientes</a></li>
                <li class="active">Perfil cliente</li>
            </ol>
        </section>


        <!-- ***************CONTENIDO**************** -->

        <section class="content">
            <div class="row">
                <div class="col-md-3">

                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div id="divInfoClient" class="box-body box-profile" >
                            <div id="divImageClient">
                                
                            </div>
                            <div class="text-muted text-center" id="lblNameClient">
                            </div>
                            <div class="text-muted text-center" id="lblProfession">

                            </div>
                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>Propiedades</b> 
                                    <div class="pull-right" id="lblNumberProperties">

                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <b>Contratos</b> 
                                    <div class="pull-right" id="lblNumberContracts">

                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <b>Citas pendientes</b> 
                                    <div class="pull-right" id="lblNumberEvents">

                                    </div>
                                </li>
                            </ul>
                            <a onclick="loadInfoClientForm();" class="btn btn-primary btn-block" data-toggle="modal" data-target="#ModalNew">
                                <b>Editar</b>
                            </a>

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
                            <li class="active"><a href="#divInmueblesClientes" data-toggle="tab">Inmuebles</a></li>
                            <li><a href="#divEventosClientes" data-toggle="tab">Citas</a></li>
                            <li><a href="#divTimeLine" data-toggle="tab">Timeline</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="active  tab-pane" id="divInmueblesClientes">

                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="divTimeLine">
                                <!-- The timeline -->
                            </div>
                            <!-- /.tab-pane -->

                            <div id="divEventosClientes" class="tab-pane">

                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div>
                    <!-- /.nav-tabs-custom -->
                </div>
            </div>

        </section>






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
