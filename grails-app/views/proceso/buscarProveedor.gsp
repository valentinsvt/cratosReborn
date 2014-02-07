<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<table class="table table-striped">
    <thead>
    <tr>
        <th></th>
        <th>RUC</th>
        <th>Nombre</th>
        <th>Tipo</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${provs}" var="p">
        <tr>
            <td>
                <a href="#" class="btn_bsc btn btn-azul" id="${p.id}" ruc="${p.ruc}" title="seleccionar">
                    <i class="fa fa-check"></i>
                </a>
            </td>
            <td>${p.ruc}</td>
            <td>${p.nombre}</td>
            <td>${p.tipoProveedor?.descripcion}</td>
        </tr>
    </g:each>
    </tbody>

</table>

<script type="text/javascript">
    $(".btn_bsc").click(function(){
        $("#prov").val($(this).attr("ruc"))
        $("#prov_id").val($(this).attr("id"))
        $('#modal-proveedor').modal('hide')
    });
</script>