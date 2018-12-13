<script src="Resources/public/js/general/search.js" type="text/javascript"></script>

<div class="click-closed"></div>
<!--/ Form Search Star /-->
<div class="box-collapse">
    <div class="title-box-d">
        <h3 class="title-d">Buscar Inmueble</h3>
    </div>
    <span class="close-box-collapse right-boxed ion-ios-close"></span>
    <div class="box-collapse-wrap form">
        <form class="form-a">
            <div class="row">
                <div class="col-md-12 mb-2">
                    <div class="form-group">
                        <label for="Type">Palabra clave</label>
                        <input type="text" class="form-control form-control-lg form-control-a" placeholder="Palabra clave">
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="Type">Departamento</label>
                        <select class="form-control form-control-lg form-control-a" id="selState" name="state" 
                                onchange="loadCity(this.value);actualizarMucipioMapa();">
                            <option value="-1" selected> Selección opcional</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="city">Ciudad</label>
                        <select id="selCity" name="city" required class="form-control form-control-lg form-control-a"
                                onchange="loadNeighborhood(this.value);actualizarMucipioMapa();">
                            <option value="-1" selected> Selección opcional</option>   
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="barrio">Barrio</label>
                        <select id="selBarrio" name="barrio" required class="form-control form-control-lg form-control-a">
                            <option value="-1" selected> Selección opcional</option> 
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="zone">Zona</label>
                        <select id="selZone" name="zone" required class="form-control form-control-lg form-control-a">
                            <option value="-1" selected> Selección opcional</option> 
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="zone">Tipo inmueble</label>
                        <select id="selPropertieType" name="propertieType" required class="form-control form-control-lg form-control-a">
                            <option value="-1" selected> Selección opcional</option> 
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="zone">Tipo oferta</label>
                        <select id="selOfferType" name="offerType" required class="form-control form-control-lg form-control-a">
                            <option value="-1" selected> Selección opcional</option> 
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <label for="lblvalorMaxInmueble">Valor máximo:$ </label>
                    <label id='lblvalorMaxInmueble'>0</label>
                    <br>
                    <table width='100%'>
                        <tr>
                            <td class="tdImageSearch">
                                <img src="Resources/public/template/img/iconoPrecio.PNG" alt="30" width="30"/>
                            </td>
                            <td>
                                $0
                            </td>
                            <td class="tdSelectSearch">
                                <input value="0" type="range" class="custom-range" min="0" 
                                       max="2500000" step="100000" id="rngValorMaximoInmueble" 
                                       oninput="changeValueRange('rngValorMaximoInmueble','lblvalorMaxInmueble');" 
                                       onchange="changeValueRange('rngValorMaximoInmueble', 'lblvalorMaxInmueble');">
                            </td>
                            <td id="lblValorMaxPosible">
                                $2'500.000
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6 mb-2">
                    <label for="lblAreaInmueble">Área máxima</label>
                    <label id='lblAreaInmueble'>0</label> <label>mts2</label>
                    <br>
                    <table width='100%'>
                        <tr>
                            <td class="tdImageSearch">
                                <img src="Resources/public/template/img/iconoAreaConstruida.PNG" alt="30" width="30"/>
                            </td>
                            <td>
                                0
                            </td>
                            <td>
                                <input value="0" type="range" class="custom-range" min="0" 
                                       max="250" step="5" id="rngAreaInmueble" 
                                       oninput="changeValueRange('rngAreaInmueble','lblAreaInmueble');" 
                                       onchange="changeValueRange('rngAreaInmueble', 'lblAreaInmueble');">
                            </td>
                            <td id="lblAreaMaxPosible">
                                250
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="zone">Estrato</label>
                        <select id="selStratum" name="estrato" required class="form-control form-control-lg form-control-a">
                            <option value="-1" selected> Selección opcional</option> 
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="zone">Parqueaderos</label>
                        <select id="selParqueaderos" name="parking" required class="form-control form-control-lg form-control-a">
                            <option value="-1" selected> Selección opcional</option>
                            <option value="1" >1</option>      
                            <option value="2" >2</option>      
                            <option value="3" >3</option>      
                            <option value="4" >4</option>      
                            <option value="5" >5</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="zone">Habitaciones</label>
                        <select id="selHabitaciones" name="room" required class="form-control form-control-lg form-control-a">
                            <option value="-1" selected> Selección opcional</option>
                            <option value="1" >1</option>      
                            <option value="2" >2</option>      
                            <option value="3" >3</option>      
                            <option value="4" >4</option>      
                            <option value="5" >5</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label for="zone">Baños</label>
                        <select id="selBanios" name="bath" required class="form-control form-control-lg form-control-a">
                            <option value="-1" selected> Selección opcional</option>
                            <option value="1" >1</option>      
                            <option value="2" >2</option>      
                            <option value="3" >3</option>      
                            <option value="4" >4</option>      
                            <option value="5" >5</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label></label>
                        <table class="tableBuscador ">
                            <tr>
                                <td class="tdCheckSearch">
                                    <img src="Resources/public/template/img/iconoAscensor.PNG" alt="25" width="25"/>
                                </td>
                                <td class="tdCheckSearch">
                                    <input class="tdSelectSearch"type="checkbox" id="chkAscensor" name="ascensor"/>
                                </td>
                                <td class="tdTextSearch">
                                    <label for="chkAscensor">Tiene ascensor</label>
                                </td>

                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="form-group">
                        <label></label>
                        <table class="tableBuscador">
                            <tr>
                                <td class="tdCheckSearch">
                                    <img src="Resources/public/template/img/iconoPiscina.PNG" alt="30" width="30"/>
                                </td>
                                <td class="tdCheckSearch">
                                    <input class="tdSelectSearch" type="checkbox" id="chkPiscina"  name="piscina"/>
                                </td>
                                <td class="tdTextSearch">
                                    <label for="chkAscensor">Tiene piscina</label>
                                </td>

                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-12">
                    <button type="button" class="btn btn-b" onclick="rapidSearchGeneral();">Buscar</button>
                </div>
            </div>
        </form>
    </div>
</div>
