<%--
  Created by IntelliJ IDEA.
  User: gato
  Date: 14/02/14
  Time: 12:25 PM
--%>

<div id="valores">

    <div class="fila">
        <label class="izquierda uno"> Porcentaje: </label>

        <g:textField class="form-control izquierda required" name="rubro_porcentaje"  id="rubro_porcentaje" style="width: 100px; margin-bottom: 10px"/>


        <label class="izquierda" style="margin-left: 10px; width: 50px">Valor: </label>
        <g:textField name="rubro_valor" id="rubro_valor" style="width: 90px; margin-bottom: 10px" class="form-control izquierda required"/>
    </div>


<div class="fila" >
    <label class="izquierda dos">IESS:</label>
    <g:checkBox name="rubro_iess" id="rubro_iess" class="form-control izquierda required" checked=""/>
    <label class="izquierda dos">Gravable:</label>
    <g:checkBox name="rubro_gravable" id="rubro_gravable" class=" form-control izquierda required" checked=""/>
    <label class="izquierda dos">Décimo:</label>
    <g:checkBox name="rubro_decimo" id="rubro_decimo" class="form-control izquierda required" checked=""/>

</div>

</div>




<script type="text/javascript">
//    $("#rubros").change(function(){
        if(${rubro?.id != '-1'}){
            $.ajax({
                type    : "POST",
                url     : "${g.createLink(controller: 'rubro',action: 'getDatosRubro')}",
//                data    : "id=" +$("#rubros").val(),
                data    : "id=" +${rubro?.id},

                success : function (msg) {
                    var datos = msg.split(";")

                    $("#rubro_porcentaje").val(datos[1])
                    $("#rubro_valor").val(datos[0])

                    if(datos[2]=="1") {

                        $("#rubro_iess").attr("checked",true)
                    }
                    else{

                        $("#rubro_iess").attr("checked", false)
                    }

                    if(datos[3]=="1") {
                        $("#rubro_gravable").attr("checked",true)
                    }
                    else{
                        $("#rubro_gravable").attr("checked", false)
                    }

                    if(datos[4]=="1"){

                        $("#rubro_decimo").attr("checked",true)
                    }
                    else{
                        $("#rubro_decimo").attr("checked", false)
                    }


                }
            });
        }else{

            $("#rubro_porcentaje").val("")
            $("#rubro_valor").val("")

//            $("#rubro_iess").removeAttr("checked")
            $("#rubro_iess").attr("checked", false)

//            $("#rubro_gravable").removeAttr("checked")
            $("#rubro_gravable").attr("checked", false)

//            $("#rubro_decimo").removeAttr("checked")
            $("#rubro_decimo").attr("checked", false)
        }

//    });
</script>