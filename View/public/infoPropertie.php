
<script src="Resources/public/js/general/infoPropertie.js" type="text/javascript"></script>
<link href="System/Resource/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
<link href="System/Resource/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>



<section class="content">

    <!-----------------CARRUSEL----------------------------------->
    <div class="row">
        <div class="col-md-2 col-sm-1 col-xs-12"></div>
        <div class="col-md-8 col-sm-10 col-xs-12">
            
            <div id="divcarusel" class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#divcarusel" data-slide-to="0" class="active"></li>
                    <li data-target="#divcarusel" data-slide-to="1"></li>
                    <li data-target="#divcarusel" data-slide-to="2"></li>
                </ul>

                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="System/Resource/Images/Properties/1314234_casa1.jpg" alt="Los Angeles"  width="1100px" height="500px">
                    </div>
                    <div class="carousel-item">
                        <img src="System/Resource/Images/Properties/321231_casa2.jpg" alt="Chicago" width="1100px" height="500px">
                    </div>
                    <div class="carousel-item">
                        <img src="System/Resource/Images/Properties/321231_casa4.jpg" alt="New York" width="1100px" height="500px">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#divcarusel" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#divcarusel" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>

        </div>
        <div class="col-md-2 col-sm-1 col-xs-12"></div>
    </div>

    <br>
    <!-----------------END CARRUSEL--------------------------------->

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
</section>



<div class="modal-body" id="FormContainer">
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">                                                                        
                <input id="txtId" name="id" class="form-control identificator"  type="hidden" value="">
            </div>
        </div>
    </div>
</div>