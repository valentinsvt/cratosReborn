<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>${(gestorInstance) ? 'Editar gestor contable' : 'Nuevo gestor contable'}</title>
    <style type="text/css">
    .fila {
        width  : 800px;
        height : 40px;
    }

    .label {
        width       : 80px;
        float       : left;
        height      : 30px;
        line-height : 30px;
        color: #000000;
        font-size: 12px;
    }

    .campo {
        width  : 670px;
        float  : right;
        height : 30px;
    }
    </style>
</head>
<body>
<g:if test="${flash.message}">
    <div class="alert ${flash.tipo == 'error' ? 'alert-danger' : flash.tipo == 'success' ? 'alert-success' : 'alert-info'} ${flash.clase}">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <g:if test="${flash.tipo == 'error'}">
            <i class="fa fa-warning fa-2x pull-left"></i>
        </g:if>
        <g:elseif test="${flash.tipo == 'success'}">
            <i class="fa fa-check-square fa-2x pull-left"></i>
        </g:elseif>
        <g:elseif test="${flash.tipo == 'notFound'}">
            <i class="icon-ghost fa-2x pull-left"></i>
        </g:elseif>
        <p>
            ${flash.message}
        </p>
    </div>
</g:if>
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <a href="#" id="btnGuardar" class="btn btn-azul">
            <i class="fa fa-disk"></i>
            Guardar
        </a>
        <g:link class="btn btn-default" action="index">
            <i class="fa fa-close"></i>
            Cancelar
        </g:link>
    </div>
</div>
<div class="vertical-container" style="margin-top: 25px;color: black">
    <p class="css-vertical-text">Descripción</p>
    <div class="linea"></div>
    <g:form action="save" class="frmGestor" controller="gestorContable">
        <div id="contenido" style="margin-left: 20px;">
            <input type="hidden" name="id" value="${gestorInstance?.id}"/>
            <div class="fila">
                <div class="label">
                    Nombre:
                </div>

                <div class="campo">
                    <input name="nombre" type="text" value="${gestorInstance?.nombre}" maxlength="127" style="width:700px;" class="form-control required"/>
                </div>
            </div>

            <div class="fila">
                <div class="label">
                    Descripción:
                </div>

                <div class="campo">
                    <input name="descripcion" type="textArea" value="${gestorInstance?.descripcion}" maxlength="255"  style="width:700px;" class="form-control required"/>
                </div>
            </div>

            <div class="fila">
                <div class="label">
                    Observaciones:
                </div>

                <div class="campo">
                    <input name="observaciones" type="textArea" value="${gestorInstance?.observaciones}"  maxlength="125" style="width:700px;" class="form-control required"/>
                </div>
            </div>

            <div class="fila">
                <div class="label">
                    Fuente:
                </div>

                <div class="campo">
                    <g:select name="fuente.id" type="select" campo="fuente" from="${cratos.Fuente.list([sort: 'descripcion'])}" label="Fuente: "
                              value="${gestorInstance?.fuente?.id}" optionKey="id" optionValue="descripcion" class="form-control required" style="width: 200px" ></g:select>
                </div>
            </div>

            <div class="fila">
                <div class="label">
                    Tipo:
                </div>

                <div class="campo">
                    <g:select name="tipoCom" type="select" campo="tipo" from="${cratos.TipoComprobante.list([sort: 'descripcion'])}" label="Tipo comprobante: " value="${tipoCom?.id}"
                              optionKey="id" id="tipo" class="form-control required" optionValue="descripcion" style="width: 200px"></g:select>
                </div>
            </div>


            <div style="margin-left: 50px">
            </div>
        </div>
    </g:form>
</div>
<div class="vertical-container" style="margin-top: 25px;height: 500px">
    <p class="css-vertical-text">Movimientos</p>
    <div class="linea"></div>
    <g:render template="busquedaCuentas"/>
</div>
<script type="text/javascript">
    $(function () {
        $(".btn").button()
        var band = 1
        $("#buscar").click(function () {
            $.ajax({
                type    : "POST",
                url     : "${g.createLink(controller: 'gestorContable',action: 'buscarCuentas')}",
                data    : "nombre=" + $('#nombreBus').val() + "&codigo=" + $("#codigoBus").val(),
                success : function (msg) {
                    $('#divPlanCuentas').html(" ")
                    $('#divPlanCuentas').html(msg);
                    var b = true

                }
            })
        });
        $("#tipo").change(function () {
            $.ajax({
                type    : "POST",
                url     : "${g.createLink(controller: 'gestorContable',action: 'cambiarComprobante')}",
                data    : "tc=" + $(this).val(),
                success : function (msg) {
                    $("#agregarCuentas").html(msg)

                }
            })
        });

        $("#txtBusca").bind('keyup', function (event) {
            var keyCode = event.which;
            if (keyCode == 13) {
                enviar();
            }
            if ($(this).val().length >= 0 && $("#error").parent().is(":visible")) {
                $("#error").html("").parent().hide("slide");
            }
        });

        $("#buscarGestor").click(function () {
            enviar();
        });

        function enviar() {
            $.ajax({
                type    : "POST",
                url     : "buscarGestor",
                data    : $(".buscarGestor").serialize(),
                success : function (msg) {
                    $("#divLista").html(msg).show("slide");
                    tablas();
                }
            });
        }

        $("#guardar").click(function () {
//            console.log($(".frmGestor2"))
            $(".frmGestor").submit()
            return false

        });

    });
</script>
</body>
</html>


