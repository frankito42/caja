document.addEventListener("DOMContentLoaded", function(event) {
    /* FUNCIONES  */
    document.getElementById("formularioIngreso").addEventListener("submit",(e)=>{
        e.preventDefault()
        guardarIngreso()
    })

});


async function guardarIngreso() {
    let fomularioIngreso = new FormData(document.getElementById("formularioIngreso"))
    let response = await fetch('php/ingreso.php',{
        method:"POST",
        body:fomularioIngreso
    });
    response = await response.json();
    console.log(response)
   /*  dibujarPublicaciones(response) */

}