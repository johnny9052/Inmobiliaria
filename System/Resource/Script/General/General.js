$(document).ready(function () {

    try {
        /*Configuraciones basicas del modal, no permite cerrar con click por fuera 
         * del modal, y no se permite cerrarlo con la tecla escape*/
        $.fn.modal.Constructor.DEFAULTS.backdrop = false;
        $.fn.modal.Constructor.DEFAULTS.keyboard = false;

    } catch (exception) {
        console.log("Error configurando los modales" + exception.message);
    }



    try {
        /*Se inicializan los campos de fecha*/
        $('.dateAction').datepicker({
            autoclose: true
        });

        //Se inicializa los campos de tipo hora Timepicker
        $('.timepicker').timepicker({
            showInputs: false,
            showMeridian: false
        });
    } catch (exception) {
        console.log("Error configurando los inputs tipo fecha" + exception.message);
    }

    try {
        /* BOOTSTRAP SLIDER */
        $('.slider').slider();
    } catch (exception) {
        console.log("Error configurando los sliders" + exception.message);
    }

    // https://stackoverflow.com/questions/19639951/how-do-i-change-selected-value-of-select2-dropdown-with-jqgrid
    //$('.select2').select2();// Para colocar el select con autocompletado.     
});




/**
 * Muestra un mensaje en un toast 
 * @param {String} message Mensaje a mostrar en la ventana emergente
 * @param {String} type Tipo de mensaje a mostrar {error,warning,sucess}, si no
 *                 se quiere uno especifico, mandar esta campo como vacio 
 * @param {String} idModalBefore desde donde se llama el toast, este solo se 
 *                 especifica si se quiere que, cuando se cierre el modal que se 
 *                 va a abrir, regrese al modal definido.
 * @returns {void} 
 * @author Johnny Alexander Salazar
 * @version 0.4
 */
function showToast(message, type, idModalBefore) {

    /*Segun el tipo de mensaje, muestra un estilo de Modal*/
    if (message) {
        /*Se quita cualquier estilo previo que pueda tener el mensaje*/
        $("#modal-default").removeClass("modal-danger modal-warning modal-success");
        /*Por cada tipo de mensaje, se especifica un estilo y un titulo al modal*/
        switch (type) {
            case "error":
                $("#lblTituloMensajeModal").html("Error");
                $("#modal-default").addClass("modal-danger");
                break;

            case "warning":
                $("#lblTituloMensajeModal").html("Cuidado");
                $("#modal-default").addClass("modal-warning");
                break;

            case "success":
                $("#lblTituloMensajeModal").html("Exito");
                $("#modal-default").addClass("modal-success");
                break;

            default:
                $("#lblTituloMensajeModal").html("Informacion");
                break;

        }

        /*Se establece el mensaje*/
        $("#lblMessageModal").html(message);

        setTimeout(function () {
            /*Se muestra el modal del mensaje*/
            $('#modal-default').modal('show');
        }, 400);


        /*Cuando el mensaje se cierra,en el caso de que sea de tipo error 
         * regresa al modal anterior*/
        if (type === "error" || (idModalBefore !== "" && idModalBefore !== undefined)) {
            /*Se cierra la ventana actual, si no se especifica uno, calculara el modal 
             * por defecto, el ModalNew. Ademas se indica con false que no limpie los 
             * campos*/
            closeWindow(idModalBefore, false);

            /*Se especifica que hacer cuando el modal del mensaje se ciere*/
            $('#modal-default').on('hide.bs.modal', function (e) {
                setTimeout(function () {
                    /*Se abre el modal previo*/
                    openWindow(idModalBefore);
                    /*Del modal que muestra el mensaje, se desasocia el evento 
                     * que regresa a la ventana previa*/
                    $('#modal-default').unbind();
                }, 400);
            });


        }
    }
}


/**
 * Muestra u oculta una barra de progreso
 * @param {boolena} status Se indica con true y false si se muestra o no la barra de progreso
 * @returns {void} 
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function showLoadBar(status) {
    if (status) {
        $(".progress").show();
    } else {

        $(".progress").hide();
    }
}


/**
 * Ejecuta una funcion por Ajax
 * @param {Array} dataSend Array nombrado con los datos a enviar
 * @param {String} url Paquete y nombre del controlador a ejecutar
 * @param {String} before Codigo javascript que se quiere ejecutar antes de enviar la informacion
 * @param {String} success Codigo javascript que se quiere ejecutar cuando se recibe una respuesta
 * @param {String} idModalOpenFinish Si se desea que cuando se muestre el mensaje, ya sea de error 
 * o de exito, se abra un modal previo, se indica el id de dicho modal
 * @param {String} msgNoAction Si es una ventana emergente, que se abrio desde otra emergente, 
 * se debe especificar su ID, por si sucede un error en esta, no regrese a la ventana original
 * @param {String} server Si el servidor tiene una ruta inicial especifica, se indica en este parametro 
 * @param {String} notShowMessage Si uno no desea que el resultado de esta accion muestre su resultado 
 * en una ventana emergente, indica con true.
 * @returns {void} 
 * @author Johnny Alexander Salazar
 * @version 0.4
 */
function Execute(dataSend, url, before, success, idModalOpenFinish, msgNoAction, server, notShowMessage) {

    console.log("INFO QUE SE ENVIA");
    console.log(dataSend);

    $.ajax({
        type: 'post',
        url: ((server === undefined) ? "" : server) + "Controller/" + url + ".php",
        beforeSend: function () {
            showLoadBar(true);
            if (before !== "") {
                eval(before);
            }
        },
        data: dataSend,
        success: function (data) {
            console.log("RESPUESTA DEL SERVER");
            console.log(data);
            //document.write(data);
            //alert(data);
            showLoadBar(false);

            /*Se reemplaza cualquier tipo de ENTER se que encuentre, ya que esto 
             * afecta la estructura del JSON*/
            var info = eval("(" + data.replace(/\n/ig, "") + ")");

            var response = (info.res !== undefined) ? info.res : info[0].res;
            var msg = (info.msg !== undefined) ? info.msg : "";

            switch (response) {

                case "Success":
                    /*Funcion que refresca la pagina*/
                    if (notShowMessage !== true) {
                        /*Si se indico que se abriera una ventana previa despues de mostrar el modal de 
                         * mensaje final de la accion*/
                        if (idModalOpenFinish !== "" && idModalOpenFinish !== undefined) {
                            showToast(msg, "success", idModalOpenFinish);
                        } else {
                            showToast(msg, "success");
                        }
                    }

                    if (success !== "") {
                        /*Si en la estructura enviada se tienen datos, entonces
                         * se sacan, parseandolos como objetos*/
                        info = (info.data !== undefined || info.data !== "") ? eval("(" + info.data + ")") : info;
                        eval(success);
                    }

                    break;

                case "NotInfo":
                    if (success !== "") {
                        info = "";
                        eval(success);
                    }
                    break;

                case "Error":
                    /*Cierra cualquier modal que se tenga previamente*/
                    $('.modal').modal('hide');
                    /*Muestra un modal de error*/
                    if (notShowMessage !== true) {
                        showToast(msg, "error", idModalOpenFinish);
                    }
                    break;

                case "NoActionFound":
                    if (notShowMessage !== true) {
                        showToast(msgNoAction, "error", idModalOpenFinish);
                    }
                    break;
                case undefined:
                default :
                    /*En el caso de que sea un listar info, buscar o pintar menu*/
                    if (dataSend.action === "list" || dataSend.action === "listfilter" ||
                            dataSend.action === "listbyuser" ||
                            dataSend.action === "menu" || dataSend.action === "search"
                            || dataSend.action === "detail" || dataSend.action.indexOf("load") > -1) {
                        if (success !== "") {
                            eval(success);
                        }
                    }

                    break;
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            showToast("Error detectado: " + textStatus + "\nExcepcion: " + errorThrown, "error");
            showToast("Verifique la ruta del archivo", "error");
        }
    });
}




function executeWithTime(code, time) {
    setTimeout(function () {
        eval(code);
    }, time);

}



/**
 * Ejecuta una peticion al servidor por get, mostrando los resultados en una 
 * nueva pestaña en el navegador
 * @param {Array} dataSend Array nombrado con los datos a enviar
 * @param {String} url Paquete y nombre del controlador a ejecutar
 * @returns {void} 
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function ExecuteNewTab(dataSend, url) {
    url = "Controller/" + url + ".php?" + dataSend;
    var win = window.open(url, '_blank');
    win.focus();
}



/**
 * Scanea un formulario, detecta los input tipo text y password, y añade
 * sus valores a un array para ser enviados por post. Adicionalmente añade por 
 * defecto el valor type mandado por parametro 
 * @param {String} type : Accion que se ejecutara en el server
 * @param {Boolean} status : Determina si escanea los campos del formulario
 * @param {String} form : Id del formulario donde se encuentran los inputs
 * @param {Array} dataPlus : Array de arrays con datos adicionales, la primera posicion
 * de cada objeto en cada posicion del array padre, es el nombre que se le asignara
 * a dichos datos. Recordar que el array padre se llamara datos, por lo que se debe mandar
 * el parametro asi [{datos: arrayQueSeManda }] 
 * @returns {Object} Objeto o array nombrado que se enviara por POST
 * @author Johnny Alexander Salazar
 * @version 0.5
 */
function scanInfo(type, status, form, dataPlus) {
    var arrayParameters = new Array();
    form = defualtForm(form);
    arrayParameters.push(newArg("action", type));

    /*Inputs sencillos*/
    if (status) {
        var campos = '#' + form + ' :input,\n\
                 #' + form + ' select, \n\
                 #' + form + ' textarea';

        $(campos).each(function () {
            var elemento = this;
            /*Si es un radio, retornamos 1 si esta checkeado, 0 si no*/
            if (elemento.type === "checkbox") {
                arrayParameters.push(newArg(elemento.name, (elemento.checked) ? 1 : 0));
            } else {
                /*Si es un radio, retornamos 1 si esta checkeado, 0 si no*/
                if (elemento.type === "textarea") {
                    arrayParameters.push(newArg(elemento.name, elemento.value));
                } else {
                    arrayParameters.push(newArg(elemento.name, elemento.value));
                }
            }
            //alert("detectado");
        });
    }

    //SI EXISTE INFO ADICIONAL
    if (dataPlus !== undefined) {
        if (dataPlus.length > 0) {
            for (var x in dataPlus) {
                var valTemp = new Array();
                for (var y in dataPlus[x].datos) {
                    valTemp.push(dataPlus[x].datos[y]);
                }

                /*Escanea todos los datos adicionados*/
                var nombreData = valTemp.shift();
                arrayParameters.push(newArg(nombreData, valTemp.toString()));

                /*
                 while (valTemp.length > 0) {
                 var nombreData = valTemp.shift();
                 var data = valTemp.shift();
                 arrayParameters.push(newArg(nombreData, data));
                 }*/
            }
        }

    }

    //console.log(arrayToObject(arrayParameters));
    return arrayToObject(arrayParameters);
}




/**
 * Codifica un archivo a base64
 * @param {String} file : Pendiente de documentacion
 * @param {Boolean} callback : Pendiente de documentacion
 * @returns {Object} Pendiente de documentacion
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function base64(file, callback, fileName, urlFile) {

    var coolFile = {};
    function readerOnload(e) {
        var base64 = btoa(e.target.result);
        coolFile.base64 = base64;
        callback(coolFile, fileName, urlFile);
    }
    ;

    var reader = new FileReader();
    reader.onload = readerOnload;

    coolFile.filetype = file.type;
    coolFile.size = file.size;
    coolFile.filename = file.name;
    reader.readAsBinaryString(file);

}




/**
 * Scanea un formulario, detecta los input tipo text y password, y añade
 * sus valores a un array para ser enviados por GET. Adicionalmente añade por 
 * defecto el valor type mandado por parametro. Este se utiliza para mandar los
 * datos por la URL y esperar los resultados en una nueva pestaña del navegador
 * @param {String} type : Accion que se ejecutara en el server
 * @param {String} form : Id del formulario donde se encuentran los inputs
 * @param {Array} dataPlus : Array con datos adicionales, la primera posicion
 * de cada objeto en cada posicion del array, es el nombre que se le asignara
 * a dichos datos
 * @param {Boolean} status : Determina si escanea los campos del formulario
 * @returns {String} listado de variables estructuradas para mandar por la URL
 * @author Johnny Alexander Salazar
 * @version 0.3
 */
function scanInfoNewTab(type, status, form, dataPlus) {
    var arrayParameters = new Array();
    form = defualtForm(form);
    arrayParameters.push(newArg("action", type));

    /*Inputs sencillos*/
    if (status) {
        var campos = '#' + form + ' :input,\n\
                 #' + form + ' select, \n\
                 #' + form + ' textarea';

        $(campos).each(function () {
            var elemento = this;
            /*Si es un radio, retornamos 1 si esta checkeado, 0 si no*/
            if (elemento.type === "checkbox") {
                arrayParameters.push(newArg(elemento.name, (elemento.checked) ? 1 : 0));
            } else {
                arrayParameters.push(newArg(elemento.name, elemento.value));
            }
        });
    }

    //SI EXISTE INFO ADICIONAL
    if (dataPlus !== undefined) {
        if (dataPlus.length > 0) {
            for (var x in dataPlus) {
                var valTemp = new Array();
                for (var y in dataPlus[x].datos) {
                    valTemp.push(dataPlus[x].datos[y]);
                }
                var nombreData = valTemp.shift();
                arrayParameters.push(newArg(nombreData, valTemp.toString()));
            }
        }

    }

    return arrayParameters.join('&');
}



/**
 * Ingresa un codigo html al listado general
 * @param {String-html} info : html con la tabla
 * @param {String} id : Id del contenedor de la lista
 * @author Johnny Alexander Salazar
 * @version 0.3
 */
function buildPaginator(info, id) {
    id = DefaultTableList(id);
    $("#" + id).html(info[0].res);

    try {
        $("#" + id).DataTable({
            'paging': true,
            'lengthChange': true,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': true,
            'bDestroy': true
        });
    } catch (exception) {
        console.log("the table canot be converted");
    }
}

/**
 * Ingresa un codigo angular html al listado general y almacena los datos 
 * para pintar dicha tabla
 * @param {String-html} info : JSON con la tabla y los datos 
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function buildPaginatorFilter(info) {
    /*Se referencia el controlador angular*/
    var scope = angular.element($("#divListController")).scope();
    /*Se almacenan los datos que se puntaran en la tabla*/
    scope.objGeneral = info[0].datos;
    /*Se ejecuta la funcion del controller angular para estructurar la tabla*/
    scope.$apply(function () {
        scope.cargarTabla(info[0].res);
    });
    /*Se ejecuta la funcion del controller angular para definir el buscador*/
    scope.$apply(function () {
        scope.cargarBuscador(info[0].search);
    });
}

/**
 * Carga un combo especificado, con los datos que se envian por parametro
 * @param {json} info : Datos que seran agragados
 * @param {int} idSelect : Id del select
 * @author Johnny Alexander Salazar
 * @version 0.3
 */
function buildSelect(info, idSelect) {

    console.log(info);

    var combo = document.getElementById(idSelect);

    while (combo.length > 1) {
        combo.remove(combo.length - 1);
    }

    for (var x in info) {
        combo.options[combo.length] = new Option(info[x].nombre, info[x].id);
    }

    refreshSelect(idSelect, -1);
}


/**
 * Cambia el valor de un select
 * @param {string} id : id del select a refrescar
 * @param {string} val : valor por defecto que sera seleccionado
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function refreshSelect(id, val) {
    $("#" + id).val(val);
    //$('#' + id).material_select('destroy');
    //$('#' + id).material_select();
}



/**
 * Checkea o no un checkbox segun el valor indicado
 * @param {string} id : id del checkbox a refrescar
 * @param {string} data : valor a ser evaluado para que el checkbox sea seleccionado 
 * o no (este puede ser 1 o 0)
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function refreshCheckbox(id, data) {
    $("#" + id).prop('checked', (data === "1") ? true : false);
}


/**
 * Valida todos los inputs required de un formulario (si recibe el parametro
 * tomara el id, si no evaluara el form "fMain"), para determinar si son 
 * validos o no, si no son validos muestra un mensaje emergente con los campos
 * que se solicita que sean llenados
 * @param {String} form id del formulario de lo que se quiere mapear, si no se manda 
 *                 nada entonces se determinara el que es por defecto "FormContainerDistrict". 
 * @param {String} modal id del modal al cual quiere regresar si muestra un mensaje de error, 
 *                 si no se manda nada calculara el modal por defecto "ModalNew". 
 * @returns {boolean} true si es correctamente validado, false si tiene errores
 * en la validacion
 * @author Johnny Alexander Salazar
 * @version 0.5
 */
function validateForm(form, modal) {
    var status = true;
    form = defualtForm(form);
    modal = DefaultModal(modal);

    var campos = '#' + form + ' :input,\n\
                 #' + form + ' select, \n\
                 #' + form + ' textarea';

    $(campos).each(function () {
        var elemento = this;

        /*Si es un select se valida que no sea -1*/
        if (elemento.type === "select-one") {
            if (elemento.value === "-1" && $(elemento).prop('required')) { //es valido?                   
                $(elemento).parent().siblings('label').addClass("colorCampoError");
                status = false; // si no es valido retorne falso                               
            } else {
                $(elemento).parent().siblings('label').removeClass("colorCampoError");
            }
        } else {

            //alert(elemento.id);

            /*Si es cualquier otro elementos diferente a select*/
            if (!elemento.validity.valid) { //es valido?                           
                /*Es necesario el doble parent por el icono de las cajas de texto, 
                 * si se van a quitar los iconos solo seria 1 .parent()*/
                $(elemento).parent().siblings('label').addClass("colorCampoError");
                status = false; // si no es valido retorne falso                               
            } else {
                /*Es necesario el doble parent por el icono de las cajas de texto, 
                 * si se van a quitar los iconos solo seria 1 .parent()*/
                $(elemento).parent().siblings('label').removeClass("colorCampoError");
            }
        }

    });

    if (!status) {
        showToast("Ingrese o valide los datos requeridos", "error", modal);
    }

    return status;
}




/**
 * Prepara un dato para ser añadido al array de datos que seran enviados por 
 * ajax
 * @param {String} key Nombre del dato
 * @param {String} value Valor del dato
 * @returns {String} el dato codificado
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function newArg(key, value) {
    return key + "==" + value;
}



/**
 * Determina si debe o no colocar el form generico, si no recibe
 * un parametro tomara el id como "FormContainer"
 * @param {String} form id del formulario
 * @returns {String} id del form generico si no recibe parametro
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function defualtForm(form) {
    return (form === undefined || form === "") ? 'FormContainer' : form;
}


/**
 * Convierte un array de datos a un objeto, y debe tener separado el nombre de
 * la futura variable y su valor por = 
 * @param {Array} arrayParameters : Array que sera pasado a un objeto
 * @returns {Object} Objeto o array nombrado que se enviara por POST
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function arrayToObject(arrayParameters) {
    var myObj = new Object;
    for (var x in arrayParameters) {
        myObj[((arrayParameters[x]).split("=="))[0]] = ((arrayParameters[x]).split("=="))[1];
    }
    return myObj;
}


/**
 * Limpia los input tipo text, password, label de error, textarea de un formulario, si no recibe
 * un parametro tomara el id como "FormContainer"
 * @param {String} form id del formulario
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function cleanForm(form) {

    form = DefaultModal(form);

    var campos = '#' + form + ' :input,\n\
                 #' + form + ' select, \n\
                 #' + form + ' textarea';


    $(campos).each(function () {
        var elemento = this;
        if (elemento.id !== "txtFlag") {

            if (elemento.value) {
                /*Si es un select, coloca el -1*/
                if (elemento.type === "select-one") {
                    $("#" + elemento.id).val("-1");
                } else {
                    /*Si es un checkbox, lo deselecciona*/
                    if (elemento.type === "checkbox") {
                        $("#" + elemento.id).prop("checked", false);
                    } else {
                        $("#" + elemento.id).val("");
                    }
                }
            }
        }
        /*Si esta pintado como invalido se le quita*/
        $(elemento).parent().siblings('label').removeClass("colorCampoError");
    });

    /*Etiquetas limpiables, la cuales suelen ser etiquetas de texto*/
    var collection = $(".limpiable");
    collection.each(function () {
        try {
            var elemento = this;
            $("#" + elemento.id).html("");
        } catch (exception) {
            console.log("The element not found");
        }
    });

}




/**
 * A partir de los menus de la base de datos, los genera y los pinta en pantalla
 * @param {Array} data JSON con la informacion de la base de datos
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function BuildMenu(data) {

    data = eval(data);
    var padres = new Array();
    /*Se sacan los codigos de los padres*/
    for (var x in data) {
        if (data[x].codpadre === "-1") {
            padres.push({id: data[x].id, nombre: data[x].nombre, prioridad: data[x].prioridad, hijos: ""});
        }
    }

    /*Por cada padre se sacan sus hijos*/
    for (var x in padres) {
        var temp = new Array();
        for (var y in data) {
            if (padres[x].id === data[y].codpadre) {
                temp.push([{id: data[y].id, nombre: data[y].nombre, prioridad: data[y].prioridad, codigo: data[y].codigo}]);
            }
        }
        padres[x].hijos = temp;
    }

    var menu = "";
    /*Se pinta el menu*/
    for (var x in padres) {

        //SI TIENE HIJOS PINTA EL PADRE Y SUS HIJOS
        if (padres[x].hijos.length > 0) {
            //INICIA EL PADRE
            menu += '<li class="no-padding"><ul class="collapsible collapsible-accordion"><li>';
            menu += '<a class="collapsible-header">' + padres[x].nombre + '<i class="mdi-navigation-arrow-drop-down"></i></a>';
            menu += '<div class="collapsible-body"><ul>';
            for (var y in padres[x].hijos) {
                //SE AÑADE CADA HIJO POR CADA PADRE
                menu += '<li><a href="index.php?page=estudiantes">' + padres[x].hijos[y].nombre + '</a></li>';
                //SE CIERRA EL HIJO
            }
            menu += '</ul></div></li></ul></li>';
            //SE CIERRA EL PADRE
        }
    }

    //CERRAR SESION
    menu += '<li class="left"><a href="#" id="btnDesconectar" class="right" onclick="LogOut();">Cerrar sesion<i class="small mdi-action-account-circle"></i></a></li>';
    $("#slide-out").html(menu);
}


/**
 * Cierra el modal que se especique
 * @param {String} idModal id del modal a cerrar
 * @param {Boolean} clean indica si no se deben limpiar el formulario, si no 
 *                  se desea limpiar el formulario mandar false, si se manda true 
 *                  o no se manda nada, se entendera que SI se quiere limpiar el
 *                  formulario.
 * @param {String} idModalOpen id del modal a abrir despues de cerrar el indicado
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.3
 */
function closeWindow(idModal, clean, idModalOpen) {
    idModal = DefaultModal(idModal);
    $('#' + idModal).modal('hide');

    /*Si se desea limpiar el formulario a cerrar*/
    if (typeof clean === "undefined" || clean === true) {
        cleanForm(idModal);
    }

    /*Si se cierra el modal y se desea abrir uno nuevo*/
    if (typeof idModalOpen !== "undefined" && idModalOpen !== null) {
        setTimeout(function () {
            /*Se abre el modal*/
            openWindow(idModalOpen);
        }, 400);
    }
}


/**
 * Navega entre modales
 * @param {String} close id del modal a cerrar
 * @param {String} open id del modal a abrir
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.4
 */
function goNavigation(close, open) {
    closeWindow(close, false);
    setTimeout(function () {
        openWindow(open);
    }, 400);
}


/**
 * Abre el modal que se especifique
 * @param {String} idModal id del modal a cerrar
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function openWindow(idModal) {
    idModal = DefaultModal(idModal);
    $('#' + idModal).modal('show');
}

/**
 * Retorna el id del modal por defecto si no se le especifica uno 
 * @param {int} idModal : Id del modal
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function DefaultModal(idModal) {
    return (idModal === undefined || idModal === "") ? 'ModalNew' : idModal;
}



/**
 * Retorna el id del paginador por defecto si no se le especifica uno 
 * @param {int} idTable : Id del contenedor
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function DefaultTableList(idTable) {
    return (idTable === undefined || idTable === "") ? 'TblList' : idTable;
}


/**
 * Oculta o muestra las acciones de un formulario segun se necesiten
 * @param {boolean} status : Indica si se muestra las acciones de guardar o de 
 * editar y eliminar
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function showButton(status) {
    if (status) {
        $(".newActionButton").show();
        $(".updateActionButton").hide();
    } else {
        $(".newActionButton").hide();
        $(".updateActionButton").show();
    }
}


/**
 * Redirecciona a otro formulario del sistema
 * @param {string} url : Ruta archivo a abrir
 * @param {string} value : Valor a enviar
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function refreshPage(url, value) {

    var data = "";

    if (value !== "" && value !== undefined) {
        data += "&&idFilter=" + value;
    }

    window.location.href = "Helper/Content/Content.php?page=" + url + data;
}



/**
 * Redirecciona a otro formulario del sistema publico
 * @param {string} url : Ruta archivo a abrir 
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function refreshPagePublic(url) {

    url = (url === undefined || url === "" || url === null) ? "home" : url;

    window.location.href = "index.php?page=" + url;
}



/**
 * Valida si se ha realizado una busqueda previa, validando si el campo por defecto
 * se encuentra bien, o si se especifica por parametro el campo que se desea validar,
 * lo valida
 * @param {string} id : id del campo a validar si se desea uno diferente al que se valida
 * por defecto
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function validateSearch(id) {

    id = (id === undefined || id === "") ? 'txtId' : id;

    if ($("#" + id).val() !== "") {
        return true;
    } else {
        showToast("No se ha realizado una busqueda previa");
        return false;
    }
}




/**
 * Muestra en un modal el detalle de un conjunto de registros
 * @param {string - JSON} info : Informacion en formato JSON que se desea mostrar
 * @param {string} idList : Id de la tabla contenedora
 * @param {string} idModal : Id del modal que se abrira para mostrar el detalle
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function showDetail(info, idList, idModal) {

    idList = (idList === undefined || idList === "") ? 'TblListDetail' : idList;
    idModal = (idModal === undefined || idModal === "") ? 'ModalDetail' : idModal;

    buildPaginator(info, idList);
    openWindow(idModal);

    showButton(false);
}





/**
 * Se encarga de retornar un listado de checkbox estructurados a partir de una 
 * consulta. 
 * @param {string - JSON} info : CHECKBOX en formato JSON que se desea mostrar
 * @param {string} id : Id del div contenedor donde se setearan los checkbox
 * @param {string} nameChecks : Nombre por defecto que se le dara a los checkbox, 
 * los cuales seran seguidos de los id de cada elemento
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function BuildCheckbox(info, id, nameChecks) {
    $("#" + id).html((info.res).replace(/id="/g, 'id="' + nameChecks));
}


/**
 * Se encarga de traer de la DB los checkbox que deben ser seleccionados
 * @param {string} type : Tipo de ejecucion a ser ejecutada en el web service
 * @param {string} name : Nombre de los checkboxes donde se seteara la informacion
 * los cuales seran seguidos de los id de cada elemento
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function CheckCheckboxChecked(type, name) {
    Execute(scanInfo(type, true), 'General/CtlGeneral', '', 'CheckCheckboxCheckedBuild(info,"' + name + '");');
}


/**
 * Se encarga de seleccionar los elementos de los checkbox para ser editados. 
 * @param {string} info : Id de los CHECKBOX que deben ser seleccionados
 * @param {string} name : Nombre de los checkboxes donde se seteara la informacion
 * los cuales seran seguidos de los id de cada elemento
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function CheckCheckboxCheckedBuild(info, name) {


    for (var x in info) {
        $("#" + name + info[x].id).prop('checked', true);
    }
}


/**
 * Escanea un conjunto de checkbox puestos previamente con nombre pre-definido
 * diferenciado por id, y retorna en un array solo los id de los elementos 
 * seleccionados
 * @param {string} nameData : Nombre que se le dara a los datos, esto estara en la primera posicion del array
 * @param {string} prefixCheckbox : Prefijo que tienen los checkbox que quiero escanear 
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function scanCheckboxDinamic(nameData, prefixCheckbox) {
    var temp = new Array();
    temp.push(nameData);

    $(":checked").each(function () {
        var elemento = this;
        if ((elemento.id).includes(prefixCheckbox)) {
            temp.push(elemento.value);
        }
    });

    return temp;
}


/**
 * Limpia una cadena de texto de todos los caracteres especiales
 * @param {string} textToClean : Cadena a limpiar 
 * @return {String} Cadena sin los caracteres especiales
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function cleanText(textToClean) {
    textToClean = textToClean.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');
}


/**
 * Limpia el nombre de un archivo de cualquier caracter que represente un problema 
 * al ser tratado (incluyendo puntos y espacios)
 * @param {string} nombre : Nombre del archivo a limpiar
 * @return {String} Cadena sin los caracteres especiales
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function cleanNameFile(nombre) {
    nombre = ((nombre).replace(/\./g, "_")).replace(/\s/g, "");
    return nombre.replace(/[`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '');
}




/**
 * Reemplaza los guiones bajos por espacios
 * @param {string} nombre : Nombre del archivo a limpiar
 * @return {String} Cadena sin los caracteres especiales
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function setSpacesInText(nombre) {
    nombre = (nombre).replace(/_/g, " ");
    return nombre;
}


/*******************************************************************************/
/*******************************************************************************/
/***********************FILES FILES FILES FILES*********************************/
/*******************************************************************************/


/**
 * Se mapean el archivo seleccionado, conviertiendolo a base64 y almacenandolo
 * en el objeto respectivo
 * @param {Boolean} unicoArchivo Indica si solo debe mapear 1 solo archivo o si son varios
 * @param {String} idInputFile Id del input tipo file a mapear
 * @param {Object} obj Objeto que contiene las listas a mapear
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.3
 */
function procesarFile(unicoArchivo, idInputFile, obj) {

    /*Si es solo 1 archivo, entonces toma el archivo actual como eliminado, y 
     * se limpian todos los datos*/
    if (unicoArchivo) {
        obj.listFileNameDeleted = obj.listFileName;
        obj.listFileBase64 = new Array();
        obj.listFileName = new Array();
        obj.listFileURL = new Array();
    }

    /*Se capturan todas los archivos seleccionados*/
    var files = $("#" + idInputFile)[0].files;

    /*Por cada archivo, se añade a la lista su nombre, url y se codifica a base64 
     *  para ser almacenados*/
    for (var i = 0; i < files.length; i++) {

        /*Se obtiene el archivo*/
        var file = files[i];

        /*Si se pudo obtener algun archivo*/
        if (file !== undefined) {

            /*Se le quita la extencion*/
            var nombreArchivo = ((file.name).split("."))[0];

            /*Si el archivo que se agrego, es uno que previamente se habia eliminado, 
             * se elimina de la lista de archivos a eliminar*/
            var posDeleted = obj.listFileNameDeleted.indexOf(nombreArchivo);
            /*Si se elimino previamente pero se vuelve a agregar*/
            if (posDeleted !== -1) {
                obj.listFileNameDeleted.splice(posDeleted, 1);
                /*Se limpia el nombre para poder eliminarlo del listado visual*/
            }


            /*Se convierte el archivo seleccionado a BASE64 y se añade la 
             * codificacion a la lista correspondiente*/
            base64(file, function (data, fileName, urlFile) {
                obj.listFileBase64.push((data.base64 !== undefined) ? data.base64 : ""); // prints the base64 string                                                
                obj.listFileName.push(fileName);
                obj.listFileURL.push(urlFile);
            }, cleanNameFile(nombreArchivo), window.URL.createObjectURL(file));
        }
    }
}



/**
 * De una ruta de un archivo, se organiza y solo retorna el nombre del archivo 
 * @param {String} name Ruta del archivo completo.
 * @param {Object} obj Objeto donde se almacenara la informacion del nombre, su
 * codificacion (la cual no existira y la ruta realmente organizada)
 * @returns {String} Nombre limpio del archivo
 * @author Johnny Alexander Salazar
 * @version 0.3
 */
function organizarArchivoCargadoDesdeBD(name, obj, public = false) {
    /*Se deja limpio el nombre, sin path ni nada*/
    var nombreLimpio = (name).split("/");
    nombreLimpio = nombreLimpio[nombreLimpio.length - 1];
    nombreLimpio = (nombreLimpio.split("."))[0];
    nombreLimpio = nombreLimpio.split("_");
    nombreLimpio = nombreLimpio[nombreLimpio.length - 1];
    //nombreLimpio = setSpacesInText(nombreLimpio);
    if (nombreLimpio !== "") {
        /*Se agregan a la lista de archivos*/
        obj.listFileName.push(nombreLimpio);
        obj.listFileBase64.push('NotBase64');
        if (public) {
            obj.listFileURL.push(name);
        } else {
            obj.listFileURL.push(((name).split("System/"))[1]);
        }

    }
    return nombreLimpio;
}



/**
 * Genera un icono que representa un archivo, y lo enlaca a el para poderlo visualizar
 * @param {String} type Tipo del icono a mostrar (pdf, doc)
 * @param {String} url Ruta del archivo al cual se enlazara el archivo
 * @param {String} name Nombre del archivo que aparecera debajo del archivo
 * @returns {String} Codigo html del archivo que enlaza el archivo
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function imageDownloadFile(type, url, name) {

    var iconFile = "";

    switch (type) {
        case "pdf":
            iconFile = "Resource/IconPlatform/pdf.png";
            break;
        case "doc":
            iconFile = "Resource/IconPlatform/doc.png";
            break;
        case "jpg":
            iconFile = "Resource/IconPlatform/jpg.png";
            break;

    }

    var img = "<a target='_blank' href='" + url + "'>\n\
                <img height='60' width='50' src='" + iconFile + "'/></a> <br>  \n\
                <p class='help-block limpiable'>" + name + "</p>";

    return img;
}



/**
 * Agrega a una lista de datos adiciona, la codificacion y el nombre de los
 * archivos que se envien. Este generara por cada uno una variable agregando el 
 * prefijo indicado
 * @param {Object} list Objeto que contiene la lista de datos adicionales
 * @param {Object} obj Objeto que contiene la informacion de los archivos
 * @param {String} prefix Nombre identificador que se le dara a cada uno de las 
 * variables generadas
 * @returns {Void} 
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function addFileNameAndEncodingAndDeletedFiles(list, obj, prefix) {
    /*Se recorre la lista de archivos seleccionados*/
    for (var x = 0; x < obj.listFileBase64.length; x++) {
        /*Por cada uno se obtiene su nombre y codificacion*/
        list.temp.push({datos: ["nameFile" + prefix + x, obj.listFileName[x]]});
        list.temp.push({datos: ["base64File" + prefix + x, obj.listFileBase64[x]]});
    }
    /*Se validan los archivos eliminados y se agregan para eliminarlos en el servidor*/
    for (var y = 0; y < obj.listFileNameDeleted.length; y++) {
        list.temp.push({datos: ["nameFile" + prefix + "Delete" + y, obj.listFileNameDeleted[y]]});
    }
}




/**
 * Se agregan a la lista de archivos eliminados, todos estos elementos para
 * eliminarlos en el servidor
 * @param {Object} list Objeto que contiene la lista de datos adicionales
 * @param {Object} obj Objeto que contiene la informacion de los archivos
 * @param {String} prefix Nombre identificador que se le dara a cada uno de las 
 * variables generadas
 * @returns {Void} 
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function addAllFileNameDeleted(list, obj, prefix) {
    /*Se agregan los que se hayan eliminado temporalmente, para que 
     * elimine los archivos ya cargadas, como los quitados de forma temporal*/
    for (var y = 0; y < obj.listFileNameDeleted.length; y++) {
        obj.listFileName.push(obj.listFileNameDeleted[y]);
    }

    for (var x = 0; x < obj.listFileName.length; x++) {
        list.temp.push({datos: ["nameFile" + prefix + "Delete" + x, obj.listFileName[x]]});
    }
}





/*******************************************************************************/
/*******************************************************************************/
/***********************DINAMIC DATA ----DINAMIC DATA***************************/
/*******************************************************************************/


/**
 * Almacena N elementos agregados en una lista, y los retorna en una lista donde
 * su primera posicion contiene el nombre de como sera enviado al server
 * @param {String} nameData Nombre que se le dara a la variable que sera enviada
 * al servidor
 * @param {Object} obj Cbjeto que contiene la lista de datos agregados dinamicamente
 * @returns {Array} Array con los elementos agregados, donde su primera posicion contiene el elemento
 * @author Johnny Alexander Salazar
 * @version 0.3
 */
function prepareDinamicData(nameData, obj) {
    /*Array de datos a agregar*/
    var tempData = new Array();
    /*Nombre de la variable que llegara al server*/
    tempData.push(nameData);
    /*Por cada dato agregado, se asocia al array*/
    for (var y = 0; y < obj.listElements.length; y++) {
        tempData.push(obj.listElements[y]);
    }
    return tempData;
}


/**
 * Almacena cada uno de los elementos devultos por el servidor en un objeto 
 * destinado para tal fin, posteriormente los pinta, enlistadolos con todas 
 * sus respectivas funcionalidades
 * @param {Array} info Array de objetos devueltos por el servidor
 * @param {Object} obj objeto donde se almacenara la informacion devuelta por
 * el servidor, para tener acceso a ella en cualquier momento
 * @param {String} idDiv Id del div donde se setearan los elementos
 * @param {String} prefix Prefijo para la asignacion del ID de cada elemento 
 * agregado en la GUI
 * @returns {Void}
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function listDinamicData(info, obj, idDiv, prefix) {
    /*Se agregan todos los datos a la lista, y se pintan*/   
    for (var x = 0; x < info.length; x++) {
        if (info[x].dinamic_data !== "") {
            obj.listElements.push(info[x].dinamic_data);
        }
    }

    pintarDinamicData(idDiv, obj, prefix);
}


/**
 * Recorre los datos almacenados, enlistandolos y tomando sus posiciones como 
 * referentes para las acciones a realizar sobre ellos
 * @param {String} idDiv Id del div donde se setearan los elementos
 * @param {Object} obj objeto donde se almacenara la informacion devuelta por
 * el servidor, para tener acceso a ella en cualquier momento 
 * @param {String} prefix Prefijo para la asignacion del ID de cada elemento  
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function pintarDinamicData(idDiv, obj, prefix) {
    var lblDataDinamic = "";
    $("#" + idDiv).html("");
    for (var y = 0; y < obj.listElements.length; y++) {
        lblDataDinamic = lblDataDinamic + "<label class='seleccionable' id='" + prefix + y + "' onclick='deleteDinamicData(" + '"' + prefix + y + '","' + prefix + '",' + obj.name + ',"' + idDiv + '"' + ");'>(X)    " + obj.listElements[y] + "</label><br>";
    }
    $("#" + idDiv).html(lblDataDinamic);
}




/**
 * Se almacenan todas las URL de textos agregados, almacenandolos en una lista 
 * @param {String} idInput Id del input file donde se obtendra el archivo a agregar
 * @param {Object} obj Objeto donde se almacenara el elemento agregado
 * @param {String} idDiv Id del div donde se mostrara el elemento
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function addDinamicData(idInput, obj, idDiv) {
    /*Se captura la URL*/
    var dinamicDataFileURL = $("#" + idInput).val();

    /*Si se ha agregado algun dato*/
    if (dinamicDataFileURL !== "" && dinamicDataFileURL !== null) {
        /*Se almacena el dato*/
        obj.listElements.push(dinamicDataFileURL);
        /*Se enlista el dato*/
        pintarDinamicData(idDiv, obj, "Video");
        /*Se limpia el campo del dato ingresado*/
        $("#" + idInput).val("");
        console.log(obj.listElements);
    } else {

    }
}




/**
 * Se elimina un elemento listado a partir de su posicion
 * @param {String} pos posicion del elemento  que se desea eliminar
 * @param {String} prefix Prefijo del nombre del elemento a buscar para eliminar
 * @param {Object} obj donde se tiene el elemento almacenado a eliminar
 * @param {String} divId Id del div donde se debe repintar los elementos, sin 
 * contener el elemento eliminado
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function deleteDinamicData(pos, prefix, obj, divId) {

    /*Se obtiene la posicion del dato a eliminar*/
    pos = (pos.split(prefix))[1];

    if (pos !== -1) {
        obj.listElements.splice(pos, 1);
    }

    /*Repinta los datos para actualizar sus posiciones*/
    pintarDinamicData(divId, obj, prefix);
}


/*******************************************************************************/
/*******************************************************************************/
/***********************MULTIPLE FILES -- MULTIPLE FILES************************/
/*******************************************************************************/


/**
 * Se listan diferentes archivos multiples en a 2 columnas
 * @param {Array} info Lista de objetos devueltos por el servidor
 * @param {Object} obj Objeto donde se almacenara la lista de archivos devueltos 
 * por el servidor
 * @param {String} idColumnOne Id del div referente a la primera columna donde se 
 * pintara la informacion
 * @param {String} idColumnTwo Id del div referente a la segunda columna donde se 
 * pintara la informacion
 * @param {String} typeFile Tipo de archivo que se pintara{"doc","pdf","image"}
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function listFilesTwoColumns(info, obj, idColumnOne, idColumnTwo, typeFile, public = false) {

    /*Variables que representan el codigo HTML de ambas columnas*/
    var lblFiles = "";
    var lblFiles2 = "";

    if (info !== undefined && info !== "" && info !== null) {
        for (var x = 0; x < info.length; x++) {
            organizarArchivoCargadoDesdeBD(info[x].url_file, obj, public);
        }
    }

    for (var y = 0; y < obj.listFileName.length; y++) {
        /*Se arma la cadena,tomando como referencias el nombre del archivo sin 
         * espacios ni caracteres especiales*/
        if (y % 2 === 0) {
            lblFiles = lblFiles + "<a target='_blank' href='" + obj.listFileURL[y] + "'><img  id='output_" + cleanNameFile(obj.listFileName[y]) + "' height='60' width='50'/></a><br>";
            lblFiles = lblFiles + "<label class='seleccionable panel panel-default' id='" + obj.listFileName[y] + "' onclick='deleteMultipleFiles(" + '"' + obj.listFileName[y] + '",' + obj.name + ',"' + idColumnOne + '","' + idColumnTwo + '"' + ");'>(X)    " + obj.listFileName[y] + "</label><br>";
        } else {
            lblFiles2 = lblFiles2 + "<a target='_blank' href='" + obj.listFileURL[y] + "'><img  id='output_" + cleanNameFile(obj.listFileName[y]) + "' height='60' width='50'/></a><br>";
            lblFiles2 = lblFiles2 + "<label class='seleccionable panel panel-default' id='" + obj.listFileName[y] + "' onclick='deleteMultipleFiles(" + '"' + obj.listFileName[y] + '",' + obj.name + ',"' + idColumnOne + '","' + idColumnTwo + '"' + ");'>(X)    " + obj.listFileName[y] + "</label><br>";
        }
    }

    /*Se añade el nuevo archvio a la lista de archivos disponibles*/
    $("#" + idColumnOne).html(lblFiles);
    $("#" + idColumnTwo).html(lblFiles2);
    cargarMiniaturasFile(obj, typeFile);
}



/**
 * Se pinta un icono por cada archivo cargado, o si es una imagen la miniatura de 
 * esta
 * @param {Object} obj Objeto que contiene los elementos a pintar su miniatura
 * @param {String} typeFile Tipo de archivo en el cual se pintara su miniatura{"doc","pdf","image"} 
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function cargarMiniaturasFile(obj, typeFile) {
    for (var i = 0; i < obj.listFileURL.length; i++) {
        /*Se obtiene el archivo*/
        var url = obj.listFileURL[i];
        if (url !== undefined && url !== "") {
            var output = document.getElementById('output_' + obj.listFileName[i]);
            if (typeFile) {
                switch (typeFile) {
                    case "pdf":
                        output.src = "Resource/IconPlatform/pdf.png";
                        break;

                    case "doc":
                        output.src = "Resource/IconPlatform/doc.png";
                        break;
                }
            } else {
                output.src = url;
            }

        }
    }
}



/**
 * Se elimina un archivo a partir de su id, cuando este fue agregado junto a 
 * multiples archivos
 * @param {String} id id del archivo a eliminar, el cual es su nombre
 * @param {Object} obj objeto donde se tienen almancenados los diferentes archivos agregados
 * @param {String} idColumnOne id primera columna donde se repintadar los archivos 
 * sin el eliminado
 * @param {String} idColumnTwo id primera columna donde se repintadar los archivos
 * sin el eliminado
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function deleteMultipleFiles(id, obj, idColumnOne, idColumnTwo) {
    /*Se obtiene la posicion del archivo en la lista a partir de su nombre*/
    var pos = obj.listFileName.indexOf(id);

    /*Se agrega a la lista de nombres el nombre del archivo*/
    obj.listFileNameDeleted.push(id);

    /*Si la encuentra*/
    if (pos !== -1) {
        /*La elimina de las listas de los nombre sy las codificaciones*/
        obj.listFileBase64.splice(pos, 1);
        obj.listFileName.splice(pos, 1);
        obj.listFileURL.splice(pos, 1);
        /*Se limpia el nombre para poder eliminarlo del listado visual*/

    }

    listFilesTwoColumns('', obj, idColumnOne, idColumnTwo);
}






/**
 * Se mapean todos los archivos seleccionadas, convirtiendolas a base64, y 
 * almacenandolas en una lista
 * @param {String} idInputFile id del input donde se seleccionaron los archivos
 * @param {Object} obj objeto donde se almacenaran los diferentes archivos seleccionados
 * @param {String} idColumnOne id primera columna donde se repintadar los archivos
 * @param {String} idColumnTwo id primera columna donde se repintadar los archivos 
 * @returns {void}
 * @author Johnny Alexander Salazar
 * @version 0.2
 */
function processMultipleFile(idInputFile, obj, idColumnOne, idColumnTwo) {

    /*Cadena donde se almacenara los archivos que se listen, y representan 
     * las 2 columnas*/
    var lblFiles = "";
    var lblFiles2 = "";

    /*Se capturan todos los archivos seleccionadas*/
    var files = $("#" + idInputFile)[0].files;

    /*Por cada archivo, se añade a la cadena, se codifica a bas64 y se obtiene su 
     * nombre para ser almacenados*/
    for (var i = 0; i < files.length; i++) {

        /*Se obtiene el archivo*/
        var file = files[i];

        /*Si se pudo obtener algun archivo*/
        if (file !== undefined) {
            /*Se determina el nombre del archivo, antecediendo el numero del archivo, si existen archivos 
             * previos se obtiene su cantidad, y se sigue aumentando, sino, solo te toma el valor i del 
             * archivo*/
            var nombreArchivo = "File" + ((obj.listFileName.length > 0) ? obj.listFileName.length + 1 + i : i) + ((file.name).split("."))[0];
            if (i % 2 === 0) {
                /*Se arma la cadena,tomando como referencias el nombre del archivo sin 
                 * espacios ni caracteres especiales*/
                lblFiles = lblFiles + "<a target='_blank' href='" + window.URL.createObjectURL(file) + "'><img  id='output_" + cleanNameFile(nombreArchivo) + "' height='60' width='50'/></a><br>";
                lblFiles = lblFiles + "<label class='seleccionable panel panel-default' id='" + cleanNameFile(nombreArchivo) + "' onclick='deleteMultipleFiles(" + '"' + cleanNameFile(nombreArchivo) + '",' + obj.name + ',"' + idColumnOne + '","' + idColumnTwo + '"' + ");'>(X)    " + setSpacesInText(nombreArchivo) + "</label><br>";
                /*Se agrega a la lista de nombres el nombre del archivo*/
            } else {
                lblFiles2 = lblFiles2 + "<a target='_blank' href='" + window.URL.createObjectURL(file) + "'><img  id='output_" + cleanNameFile(nombreArchivo) + "' height='60' width='50'/></a><br>";
                lblFiles2 = lblFiles2 + "<label class='seleccionable panel panel-default' id='" + cleanNameFile(nombreArchivo) + "' onclick='deleteMultipleFiles(" + '"' + cleanNameFile(nombreArchivo) + '",' + obj.name + ',"' + idColumnOne + '","' + idColumnTwo + '"' + ");'>(X)    " + setSpacesInText(nombreArchivo) + "</label><br>";
            }

            /*Si el archivo que se agrego, es una que previamente se habia eliminado, 
             * se elimina de la lista de archivos a eliminar*/
            var posDeleted = obj.listFileNameDeleted.indexOf(nombreArchivo);

            /*Si se elimino previamente pero se vuelve a agregar*/
            if (posDeleted !== -1) {
                obj.listFileNameDeleted.splice(posDeleted, 1);
                /*Se limpia el nombre para poder eliminarlo del listado visual*/
            }

            /*Se convierte el archivo seleccionado a BASE64 y se añade la codificacion 
             * a la lista correspondiente*/

            base64(file, function (data, fileName, urlFile) {
                obj.listFileBase64.push((data.base64 !== undefined) ? data.base64 : ""); // prints the base64 string                                                
                obj.listFileName.push(fileName);
                obj.listFileURL.push(urlFile);
                cargarMiniaturasFile(obj);
            }, cleanNameFile(nombreArchivo), window.URL.createObjectURL(file));
        }
    }

    /*Se añade el nuevo archivo a la lista de archivos disponibles*/
    $("#" + idColumnOne).html($("#" + idColumnOne).html() + lblFiles);
    $("#" + idColumnTwo).html($("#" + idColumnTwo).html() + lblFiles2);
    console.log(obj.listFileBase64);

}





/**
 * Returna una variable por get
 * @param {String} sParam Nombre del parametro get
 * @returns {String}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
}



/**
 * Redirecciona a otra pagina del sistema interno, enviando una variable de 
 * filtro para filtrar la informacion del formulario destino
 * @param {String} page Ruta de la pagina a cargar
 * @returns {String}
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function redirectInfoFilter(page) {
    var id = $("#txtId").val();
    refreshPage(page, id);
}




/*https://css-tricks.com/simple-social-sharing-links/*/
/*https://codepen.io/Huskie/pen/wKphk*/

function sharedContentFacebook() {
    var facebookWindow = window.open('https://www.facebook.com/sharer/sharer.php?u=' + document.URL, 'facebook-popup', 'height=350,width=600');
    if (facebookWindow.focus) {
        facebookWindow.focus();
    }
}



/*https://css-tricks.com/simple-social-sharing-links/*/
/*https://codepen.io/Huskie/pen/wKphk*/
function sharedContentTwitter() {
    var twitterWindow = window.open('https://twitter.com/share?url=' + document.URL, 'twitter-popup', 'height=350,width=600');
    if (twitterWindow.focus) {
        twitterWindow.focus();
    }
}



/*https://css-tricks.com/simple-social-sharing-links/*/
/*https://codepen.io/Huskie/pen/wKphk*/
function sharedContentLinkedIn(tituloPublicacion, contenidoPublicacion, empresaPublicacion) {

    var url = "https://www.linkedin.com/shareArticle" +
            "?mini=true" +
            "&url=" + document.URL +
            "&title=" + tituloPublicacion +
            "&summary=" + contenidoPublicacion +
            "&source=" + empresaPublicacion;


    console.log(url);

    var LinkedWindow = window.open(url, 'linkedin-popup', 'height=350,width=600');
    if (LinkedWindow.focus) {
        LinkedWindow.focus();
    }
}



function executeSubmit(idForm) {
    document.getElementById(idForm).submit();
}




function generateToken() {
    // set the length of the string
    var stringLength = 15;
    // list containing characters for the random string
    var stringArray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '?'];

    var rndString = "";
    // build a string with random characters
    for (var i = 1; i < stringLength; i++) {
        var rndNum = Math.ceil(Math.random() * stringArray.length) - 1;
        rndString = rndString + stringArray[rndNum];
    }
    return rndString;
}


function setDataCache(nameVar, data) {
    /*Se crea un objeto con la info recuperada*/
    var obj = {
        data: data
    };
    localStorage[nameVar] = JSON.stringify(obj); // only strings
}


function getDataCache(nameVar) {
    try {
        return JSON.parse(localStorage[nameVar]);
    } catch (Exception) {
        return "";
    }
}



function getBrowserName() {
    if ((navigator.userAgent.indexOf("Opera") || navigator.userAgent.indexOf('OPR')) != -1)
    {
        return ('Opera');
    } else if (navigator.userAgent.indexOf("Chrome") != -1)
    {
        return ('Chrome');
    } else if (navigator.userAgent.indexOf("Safari") != -1)
    {
        return ('Safari');
    } else if (navigator.userAgent.indexOf("Firefox") != -1)
    {
        return ('Firefox');
    } else if ((navigator.userAgent.indexOf("MSIE") != -1) || (!!document.documentMode == true)) //IF IE > 10
    {
        return ('IE');
    } else
    {
        return ('unknown');
    }
}




function getNameOperativeSystem() {
    var OSName = "Unknown";
    if (window.navigator.userAgent.indexOf("Windows NT 10.0") != -1)
        OSName = "Windows 10";
    if (window.navigator.userAgent.indexOf("Windows NT 6.2") != -1)
        OSName = "Windows 8";
    if (window.navigator.userAgent.indexOf("Windows NT 6.1") != -1)
        OSName = "Windows 7";
    if (window.navigator.userAgent.indexOf("Windows NT 6.0") != -1)
        OSName = "Windows Vista";
    if (window.navigator.userAgent.indexOf("Windows NT 5.1") != -1)
        OSName = "Windows XP";
    if (window.navigator.userAgent.indexOf("Windows NT 5.0") != -1)
        OSName = "Windows 2000";
    if (window.navigator.userAgent.indexOf("Mac") != -1)
        OSName = "Mac/iOS";
    if (window.navigator.userAgent.indexOf("X11") != -1)
        OSName = "UNIX";
    if (window.navigator.userAgent.indexOf("Linux") != -1)
        OSName = "Linux";

    return OSName;
}



function saveIpCache(nameVar) {
    $.getJSON('https://json.geoiplookup.io/', function (data) {
        //alert(JSON.stringify(data, null, 2));        
        setDataCache(nameVar, data.ip);
    });
}


function getDeviceType() {
    if (/Mobi|Android/i.test(navigator.userAgent)) {
        return "mobile";
    } else {
        return "not mobile";
    }
}


function replaceText(cadena, find, replace) {
    return cadena.replace(new RegExp(find, 'g'), replace);
}









/*************GENERACION DE REPORTES************************************/



function buildDashboardBarByCategory(columnsName, data, idDivGoal, labelAxisX, labelAxisY) {

    var colorScale = d3.scale.category10();

    return c3.generate({
        bindto: '#' + idDivGoal,
        data: {
            columns: [
                data
            ],
            type: 'bar',
            order: 'asc',
            labels: true,
            color: function (inColor, data) {
                if (data.index !== undefined) {
                    return colorScale(data.index);
                }

                return inColor;
            }
        },
        legend: {
            show: false
        },
        zoom: {
            enabled: false
        },
        axis: {
            y: {
                label: {
                    text: labelAxisY,
                    position: 'outer-middle'
                            // inner-top : default
                            // inner-middle
                            // inner-bottom
                            // outer-top
                            // outer-middle
                            // outer-bottom
                }
            },
            x: {
                type: 'category',
                categories: columnsName,
                label: {
                    text: labelAxisX,
                    position: 'outer-center'
                            // inner-right : default
                            // inner-center
                            // inner-left
                            // outer-right
                            // outer-center
                            // outer-left
                }
            }
        },
        tooltip: {
            show: false
        },
    });

}









function buildDashboardArea(columnsName, arrayToArrayData, idDivGoal, labelAxisX, labelAxisY) {

    return c3.generate({
        bindto: '#' + idDivGoal,
        data: {
            columns: arrayToArrayData,
            type: 'area-spline'
        },
        axis: {
            y: {
                label: {
                    text: labelAxisY,
                    position: 'outer-middle'
                            // inner-top : default
                            // inner-middle
                            // inner-bottom
                            // outer-top
                            // outer-middle
                            // outer-bottom
                }
            },
            x: {
                type: 'category',
                categories: columnsName,
                label: {
                    text: labelAxisX,
                    position: 'outer-center'
                            // inner-right : default
                            // inner-center
                            // inner-left
                            // outer-right
                            // outer-center
                            // outer-left
                }
            }
        }
    });

}







function scanDataLabelDinamic(nameData, prefixLabel, split = false, charactersSplit) {
    var temp = new Array();
    temp.push(nameData);

    $(".dinamicLabelData").each(function () {
        var elemento = this;
        if ((elemento.id).includes(prefixLabel)) {

            if (split) {
                temp.push(((elemento.html()).split(charactersSplit)))[0];
            } else {
                temp.push(elemento.html());
            }
        }
    });

    return temp;
}






/**
 * Mueve la vista de la pagina web a un punto determinado 
 * @param {String} eleID id del elemento que se enfocara en la pagina web
 * @returns {void} 
 * @author Johnny Alexander Salazar
 * @version 0.1
 */
function moverScrollView(eleID) {
    var e = document.getElementById(eleID);
    if (!!e && e.scrollIntoView) {
        e.scrollIntoView();
    }
}