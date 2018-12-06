/* global getDataCache */

$(document).ready(function () {
    validarCacheUser();
    validarCacheIp();
});


function validarCacheUser() {
    if ((getDataCache('userhexagono')).data === "" || (getDataCache('userhexagono')).data === undefined) {
        console.log("No existe cache");
        setDataCache('userhexagono', generateToken());
    } else {
        console.log("Existe cache " + (getDataCache('userhexagono')).data);
    }
}


function validarCacheIp() {
    if ((getDataCache('userhexagonoip')).data === "" || (getDataCache('userhexagonoip')).data === undefined) {
        console.log("No existe ip");
        saveIpCache("userhexagonoip");
    } else {
        console.log("Existe cache " + (getDataCache('userhexagonoip')).data);
    }


}
