/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#tHead").html('<th>Nombre</th><th>cedula</th><th>Sexo</th>');
    consultarPersonas();
});

function consultarPersonas(){
    $.ajax({
        url:"PersonasServlet",
        data:{
            accion: "buscarPersonas"
        },
        error: function(){
            alert("error al cargar la base de datos");
        },
        success: function(data){
            alert(data);
            var datos = '';
            for(var i=0;i<data.length;i++){
                datos += "<tr>";
                datos += "<td>"+ data[i].nombre +"</td>" + "<td>"+ data[i].pkCedula +"</td>" + "<td>"+ data[i].sexo +"</td>";
                datos += "</tr>";
            }
            $('#tBody').html(datos);
        },
        type: "POST",
        dataType: "json"
    });
}

