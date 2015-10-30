
<div class="row-fluid"  style="width: 99.7%;height: 600px;overflow-y: auto;float: right;">
    <div class="span12">
<table class="table table-striped" width="400px" style="overflow-y: auto">
    <thead>
    <tr>
        <th>C&oacute;digo</th>
        <th>Nombre</th>
        <th>Nivel</th>
        <th>Debe/Haber</th>
        <th>Agregar</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${planCuentas != null}">
        <g:each var="cuenta" in="${planCuentas}">
            <tr>
                <td>${cuenta.numero}</td>
                <td>${cuenta.descripcion}</td>
                <td>${cuenta.nivel.descripcion}</td>
                <td><select class="span-3 ui-widget-content ui-corner-all" name="razon" id="${'dh_'+cuenta.id}" >
                    <option id="1">Debe</option>
                    <option id="0">Haber</option>
                </select>
                </td>
                <td >
                    <a href="#" class="btn btn-success agregarCuenta" id="agregar_${cuenta.numero}" cuenta="${cuenta.id}">
                        <i class="fa fa-plus"></i>
                        Agregar
                    </a>
                    %{--<div style="width: 70px; text-align: center" class="agregarCuenta fg-button ui-state-default  ui-corner-all " id="agregar_${cuenta.numero}" cuenta="${cuenta.id}" >Agregar</div>--}%
                </td>
            </tr>
        </g:each>
    </g:if>
    </tbody>
</table>
        </div>
</div>


<script type="text/javascript">
    $(function(){
        $(".agregarCuenta").click(function() {

            $.ajax({
                type: "POST",
                url: "${g.createLink(controller: 'gestorContable',action: 'agregarCuenta')}",
                data: "id="+$(this).attr("cuenta")+"&razon="+$("#dh_"+$(this).attr("cuenta")).val()+"&tc="+$("#tipo").val(),
                success: function(msg){
                    $("#agregarCuentas").html(msg)
                    $("#dlgBuscarMov").modal("hide");
                }
            });

        });
    });
</script>