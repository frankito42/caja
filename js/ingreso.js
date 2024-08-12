const modalIngresoElement = document.getElementById('modalIngreso')
const modalIngreso = new mdb.Modal(modalIngresoElement)



document.addEventListener("DOMContentLoaded",async function(event) {
    /* FUNCIONES  */
    await listarIngresos()
    document.getElementById("formularioIngreso").addEventListener("submit",async (e)=>{
        e.preventDefault()
        await guardarIngreso()
    })
    document.getElementById("btnModalIngreso").addEventListener("click",(e)=>{
        abrirModal()
    })
    document.getElementById("search").addEventListener("change",async (e)=>{
        await listarIngresosSearch()
    })

});
function abrirModal() {
    modalIngreso.show()
    setTimeout(() => {
        document.getElementById("montoIngreso").focus()
    }, 500);
}


async function guardarIngreso() {
    let fomularioIngreso = new FormData(document.getElementById("formularioIngreso"))
    let response = await fetch('php/ingreso.php',{
        method:"POST",
        body:fomularioIngreso
    });
    response = await response.json();
    console.log(response)
    if(response=="ok"){
        document.getElementById("formularioIngreso").reset()
        document.getElementById("cerrarModalBtn").click()
        toastr.success('Operacion Exitosa')
        await listarIngresos()
    }else{
        toastr.error('Ocurrio un error intente nuevamente')
        
    }
    
}
async function listarIngresos() {
    let response = await fetch('php/listar.php');
    response = await response.json();
    console.log(response)
    dibujar(response)
    
}
async function listarIngresosSearch() {
    let fecha=document.getElementById("search").value
    let response = await fetch('php/listarPorFecha.php?fecha='+fecha);
    response = await response.json();
    console.log(response)
    dibujar(response)
    
}
function dibujar(params) {
    let tr=``
    let ingreso=0
    let egreso=0
    let color=""
    params.forEach(element => {
        if(element.tipo=="Ingreso"){
            ingreso+=parseFloat(element.monto);
            color="background:#d5ffd259;"
        }else if(element.tipo=="Egreso"){
            egreso+=parseFloat(element.monto);
            color="background:#ffd2d259;"
        }
        tr+=`<tr>
            <td style="${color}">${element.tipo} ${element.metodo}</td>
            <td style="${color}">${element.fecha}</td>
            <td style="${color}">$${formatNumberWithCommas(element.monto)}</td>
        </tr>`
    });
    if(params.length==0){
        tr=`<tr><td colspan="3" style="text-align: center;">Sin Datos</td></tr>`
    }
    document.getElementById("tbody").innerHTML=tr
    document.getElementById("ingreso").innerHTML="$"+formatNumberWithCommas(ingreso-egreso)
    document.getElementById("egresos").innerHTML="$"+formatNumberWithCommas(egreso)
}

function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

