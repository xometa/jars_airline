/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).on("ready",constructor);
function constructor(){
    sumarinput();
}

function sumarinput(){
    $('#contenido').on('change','#texto,#texto1',function(){
        
        var text=$('#texto').val();
        var text1=$('#texto1').val();
        var result=text+text1;
        $('#texto2').val(text+text1);
    });
}


