<main role="main">
    <section class="jumbotron bg-light">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtName">Nombre</label>                                    
                    <input id="txtName" name="name" class="form-control" type="text" value="" autocomplete="off" required
                           placeholder="Nombre del rol">
                </div>
            </div>                       
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label>Descripcion</label>
                    <textarea id="txtDescription" name="description" class="form-control" rows="3" placeholder="Descripcion"></textarea>
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
        
        <br>

        <div class="newActionButton">                            
            <button id="btnSave" onclick="save();" type ="button" class="btn btn-primary">Enviar</button>
        </div>
    </section>
</main>