<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main"/>
    <title>Rubros</title>
    <style type="text/css">
    .etiqueta {
        width       : 80px;
        height      : 20px;
        line-height : 20px;
        font-weight : bold;
        display     : inline-block;
        margin-left: 5px;
    }
    .margen{
        margin-left: 20px;
    }
    th{
        text-align: center;
    }

    table{
        border-collapse:collapse;
    }
    td,th{
        border: 1px solid #000000;
    }
    .izquierda {
        float: left;

    }
    .fila {
        clear: both;

    }
    .uno{

      width: 150px;

    }

    .dos {
        width: 80px;
        margin-left: 15px;

    }


    </style>
</head>
<body>

<div class="vertical-container vertical-container-list">
    <p class="css-vertical-text">Rubros</p>
    <div class="linea"></div>

    <g:hiddenField name="id" id="${rubroInstance?.id}"/>

    <div class="fila">
        <label class="izquierda uno">Tipo: </label>
      <g:select class="form-control izquierda required" name="tipoRubro.id" from="${tipos}" id="tipoRubro" optionKey="id" style="width: 250px; margin-bottom: 10px" required=""/>

   </div>

    <div class="fila">
        <label class="izquierda uno"> Porcentaje: </label>

        <g:textField class="form-control izquierda required" name="porcentaje"  id="porcentaje" style="width: 50px; margin-bottom: 10px"/>


        <label class="izquierda" style="margin-left: 30px; width: 120px">Valor: </label>
        <g:textField name="valor" id="valor" style="width: 50px; margin-bottom: 10px" class="form-control izquierda required"/>
    </div>

    <div class="fila">
        <label class="izquierda uno">Descripción: </label>
        <g:textField name="descripcion" id="descripcion" style="width: 250px; margin-bottom: 10px" class="form-control required"/>
    </div>

    <div class="fila">
        <label class="izquierda dos">IESS:</label>
        <g:checkBox name="iess" id="iess" class="form-control izquierda required"/>

        <label class="izquierda dos">Gravable:</label>
        <g:checkBox name="gravable" id="gravable" class=" form-control izquierda required"/>

        <label class="izquierda dos">Décimo:</label>
        <g:checkBox name="decimo" id="decimo" class="form-control izquierda required"/>

        <label class="izquierda dos">Editable:</label>
        <g:checkBox name="editable" id="editable" class="form-control izquierda required"/>
    </div>


    <div class="fila" style="margin-top: 40px; margin-bottom: 15px">
        <g:link class="btn agregar btn-success btn-ajax" id="agregar"><i class="fa fa-plus"></i> Agregar</g:link>
        <g:link class="btn lista btn-info btn-ajax" id="lista"><i class="fa fa-list-alt"></i> Lista de Rubros</g:link>

    </div>

    <fieldset style="width: 90%;margin-left: 20px;">
        <legend>Rubros</legend>

        <div id="detalle" style="width: 95%"></div>

        <legend style="margin-top: 20px"></legend>

    </fieldset>

    <div id="errors" style="display: none"></div>
</div>



<script type="text/javascript">


    $(".lista").click(function () {
     location.href="${g.createLink(controller: 'rubro', action: 'list')}"
    });


    $("#tipoRubro").change(function(){

        $.ajax({
            type    : "POST",
            url     : "${g.createLink(controller: 'rubro',action: 'cargaRubros')}",
            data    : "id=" +$("#tipoRubro").val(),
            success : function (msg) {

                $("#detalle").html(msg).show("slide")
            }
        });
    });

    $("#tipoRubro").change()

    $(".agregar").click(function () {


        $.ajax({
           type : "POST",
           url  : "${g.createLink(controller: 'rubro', action: 'saveRubro')}",
           data : {
              tipoRubro : $("#tipoRubro").val(),
              porcentaje : $("#porcentaje").val(),
              valor: $("#valor").val(),
              descripcion : $("#descripcion").val(),
              iess:         $("#iess").is(':checked'),
              gravable     :$("#gravable").is(':checked'),
              decimo       :$("#decimo").is(':checked'),
              editable     :$("#editable").is(':checked')

           },
           success : function (msg) {

//               var part = msg.split('_')
               var part = msg

               console.log("-->" + part)

               if(part == 'OK'){

                   bootbox.alert("Rubro grabado correctamente!")

                   $.ajax({
                       type    : "POST",
                       url     : "${g.createLink(controller: 'rubro',action: 'cargaRubros')}",
                       data    : "id=" +$("#tipoRubro").val(),
                       success : function (msg) {

                           $("#detalle").html(msg)
                       }
                   });



               }else {

                   bootbox.alert("Error al grabar el rubro")

               }





           }



        });

        return false;
    });


</script>
</body>
</html>