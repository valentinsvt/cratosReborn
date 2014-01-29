<%@ page import="cratos.TipoComprobanteSri; cratos.SustentoTributario" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main"/>
    <title>Transacciones</title>
    <style type="text/css">
    .etiqueta {
        width       : 100px;
        height      : 20px;
        line-height : 20px;
        font-weight : bold;
        display     : inline-block;
    }
    .number{
        text-align: right;
    }
    .filaFP {
        width          : 95%;
        height         : 20px;
        border-bottom  : 1px solid black;
        margin         : 10px;
        vertical-align : middle;
        text-align     : left;
        line-height    : 10px;
        padding-left   : 10px;
        padding-bottom : 20px;
        font-size      : 10px;
    }

    .span-rol {
        padding-right : 10px;
        padding-left  : 10px;
        height        : 16px;
        line-height   : 16px;
        background    : #FFBD4C;
        margin-right  : 5px;
        font-weight   : bold;
        font-size     : 12px;
    }

    .span-eliminar {
        padding-right : 10px;
        padding-left  : 10px;
        height        : 16px;
        line-height   : 16px;
        background    : rgba(255, 2, 10, 0.35);
        margin-right  : 5px;
        font-weight   : bold;
        font-size     : 12px;
        cursor        : pointer;
        float         : right;
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
        <g:if test="${!registro}">
            <a href="#" class="btn btn-azul" id="guardarProceso">
                <i class="fa fa-save"></i>
                Guardar
            </a>
        </g:if>
        <g:if test="${params.id}">
            <g:if test="${proceso.adquisicion == null && proceso.fact == null && proceso.transferencia == null}">
                <a href="#" class="btn btn-success" id="registrarProceso">
                    <i class="fa fa-register"></i>
                    Registrar
                </a>
            </g:if>
        </g:if>
        <g:link class="btn btn-default" action="index">
            Cancelar
        </g:link>
        <g:if test="${proceso}">
        %{--todo cambiar esto para que no solo sea por link--}%
            <g:link class="btn btn-danger" id="${proceso?.id}" action="borrarProceso">
                <i class="fa fa-basket"></i>
                Borrar Proceso
            </g:link>
        </g:if>
    </div>
</div>
<g:form name="procesoForm" action="save" method="post" class="frmProceso">
    <div class="vertical-container" style="margin-top: 25px;color: black;padding-bottom: 10px">
        <p class="css-vertical-text">Descripción</p>
        <div class="linea"></div>

        <input type="hidden" name="id" value="${proceso?.id}" id="idProceso"/>
        <input type="hidden" name="empleado.id" value="${session.usuario.id}"/>
        <input type="hidden" name="periodoContable.id" value="${session?.contabilidad?.id}"/>
        <input type="hidden" name="data" id="data" value="${session?.contabilidad?.id}"/>
        <div style="padding: 0.7em; margin-top:5px; display: none;" class="ui-state-error ui-corner-all" id="divErrores">
            <span style="float: left; margin-right: .3em;" class="ui-icon ui-icon-alert"></span>
            <span style="font-weight: solid;" id="spanError">Se encontraron los siguientes errores:</span>

            <ul id="listaErrores"></ul>
        </div>


        <div class="row">
            <div class="col-xs-2 negrilla">
                Gestor:
            </div>
            <div class="col-xs-3 negrilla">
                <g:select class="form-control required" name="gestor.id" from="${cratos.Gestor.findAllByEstadoAndEmpresa('A', session.empresa, [sort: 'nombre'])}"
                          label="Proceso tipo: " value="${proceso?.gestor?.id}" optionKey="id" optionValue="nombre" title="Proceso tipo"/>
            </div>
            <div class="col-xs-2 negrilla">
                Tipo de transacción:
            </div>
            <div class="col-xs-3 negrilla">
                <g:select class="form-control required cmbRequired" name="tipoProceso"  id="tipoProceso" from="${tiposProceso}"
                          label="Proceso tipo: " value="${proceso?.tipoProceso}" optionKey="key" optionValue="value" title="Tipo de la transacción"/>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-2 negrilla">
                Fecha:
            </div>
            <div class="col-xs-3 negrilla">
                <elm:datepicker name="fecha"  title="Fecha de registro a la contabilidad " class="datepicker form-control required" value="${proceso?.fecha}"  maxDate="new Date()" style="width: 80px; margin-left: 5px" />
            </div>
            <div class="col-xs-2 negrilla">
                Proveedor:
            </div>
            <div class="col-xs-4 negrilla">
                <input type="text" name="proveedor.ruc" class="form-control  label-shared" id="prov" disabled="true" value="${proceso?.proveedor?.ruc}" title="El proveedor o cliente"/>
                <a href="#" id="btn_buscar" class="btn btn-azul">
                    <i class="fa fa-search"></i>
                    Buscar
                </a>
                <input type="hidden" name="proveedor.id" id="prov_id" value="${proceso?.proveedor?.id}">
            </div>
        </div>
        <div class="row">
            <div class="col-xs-2 negrilla">
                Sustento Tributario:
            </div>
            <div class="col-xs-5 negrilla">
                <g:select class=" form-control required cmbRequired" name="sustentoTributario.id" id="sustento" from="${SustentoTributario.list([sort:'codigo'])}" title="Necesario solo si la transacción debe reportarse al S.R.I." optionKey="id" optionValue="descripcion"   noSelection="${['-1':'No aplica']}" />
            </div>
            <div class="col-xs-2 " style="font-size: 10px;">
                Necesario solo si la transacción debe reportarse al S.R.I.
            </div>
        </div>
        <div class="row">
            <div class="col-xs-2 negrilla">
                Tipo de documento:
            </div>
            <div class="col-xs-5 negrilla">
                <g:select class="form-control cmbRequired" name="tipoComprobanteSri.id" id="tipoComprobante" from="${TipoComprobanteSri.list([sort:'codigo'])}" optionKey="id" title="Tipo del documento a registrar" optionValue="descripcion"  noSelection="${['-1':'No aplica']}" />
            </div>
            <div class="col-xs-2 " style="font-size: 10px">
                Tipo del documento a registrar.
            </div>
        </div>
        <div class="row">
            <div class="col-xs-2 negrilla">
                Descripción:
            </div>
            <div class="col-xs-3 negrilla">
                <textArea style='height:40px;width: 700px;resize: none' maxlength="255" name="descripcion" id="descripcion" title="La descripción de la transacción contable" class="form-control required cmbRequired"  >${proceso?.descripcion}</textArea>
            </div>
        </div>
    </div>
    <div class="vertical-container" style="margin-top: 25px;color: black;padding-bottom: 10px;">
        <p class="css-vertical-text">Valores</p>
        <div class="linea"></div>
        <g:set var="iva" value="${cratos.ParametrosAuxiliares.list().first().iva}"/>
        <div class="row" style="font-size: 12px">
            <div class="col-xs-2 negrilla" style="width: 120px">
                Base imponible IVA ${iva}%:
            </div>
            <div class="col-xs-2 negrilla">
                <input type="text" name="baseImponibleIva" id="baseImponibleIva" size="7" value="${proceso?.baseImponibleIva ?: 0.00}" class="required  number form-control" validate="required number"/>
            </div>
            <div class="col-xs-2 negrilla" style="width: 120px">
                Base imponible IVA 0%:
            </div>
            <div class="col-xs-2 negrilla">
                <input type="text" name="baseImponibleIva0" size="7" value="${proceso?.baseImponibleIva0 ?: 0.00}" class="required number form-control" validate="required number"/>
            </div>
            <div class="col-xs-2 negrilla" style="width: 120px">
                Base imponible no aplica IVA:
            </div>
            <div class="col-xs-2 negrilla">
                <input type="text" name="baseImponibleNoIva" size="7" value="${proceso?.baseImponibleNoIva ?: 0.00}" class="required number form-control" validate="required number"/>
            </div>
        </div>


        <div class="row" style="font-size: 12px">
            <div class="col-xs-2 negrilla" style="width: 120px">
                IVA generado:
            </div>
            <div class="col-xs-2 negrilla">
                <input type="text" name="ivaGenerado" id="ivaGenerado"  value="${proceso?.ivaGenerado}" class="required number form-control" validate="required number"/>
            </div>
            <div class="col-xs-2 negrilla" style="width: 120px">
                ICE generado:
            </div>
            <div class="col-xs-2 negrilla"  >
                <input type="text" name="iceGenerado"  value="${proceso?.iceGenerado ?: 0.00}" class="required number form-control" validate="required number"/>
            </div>
        </div>
        <div class="row" style="font-size: 12px">
            <div class="col-xs-2 negrilla" style="width: 140px">
                Documento:
            </div>
            <div class="col-xs-4 negrilla">
                <input type="text" name="facturaEstablecimiento" id="establecimiento" size="3" maxlength="3" value="${proceso?.facturaEstablecimiento}" class=" digits form-control label-shared " validate=" number"
                       title="El número de establecimiento del documento "/>
                <input type="text" name="facturaPuntoEmision" id="emision" size="3" maxlength="3" value="${proceso?.facturaPuntoEmision}" class=" digits form-control label-shared " validate=" number"
                       title="El número de punto de emisión del documento"/>
                <input type="text" name="facturaSecuencial" id="secuencial" size="10" maxlength="9" value="${proceso?.facturaSecuencial}" class=" digits form-control label-shared " validate=" number"
                       title="El número de secuencia del documento" />
            </div>
            <div class="col-xs-3 negrilla" style="width: 140px">
                <a href="#" id="abrir-fp" class="btn btn-azul">
                    <i class="fa fa-credit-card"></i>
                    Registrar formas de pago
                </a>
            </div>
        </div>

    </div>
</g:form>
<g:if test="${proceso}">
    <div class="vertical-container" style="margin-top: 25px;color: black;min-height: 250px">
        <p class="css-vertical-text">Asientos contables</p>
        <div class="linea"></div>
        <div id="registro" style="float:left; margin-left: 40px;border: black solid 1px; margin-bottom: 25px;padding: 10px;display: none;margin-top: 15px;">
        </div>
    </div>
</g:if>

<!-- Modal -->
<div class="modal fade" id="modal-formas-pago" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Formas de pago</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-2 negrilla" style="width: 140px">
                        Tipo de pago:
                    </div>
                    <div class="col-xs-4 negrilla" style="margin-left: -20px" >
                        <g:select name="tipoPago.id" id="comboFP" class=" form-control" from="${cratos.TipoPago.list()}" label="Tipo de pago: " optionKey="id"  optionValue="descripcion" />
                    </div>
                    <div class="col-xs-1 negrilla" style="width: 140px">
                        <a href="#" id="agregarFP" class="btn btn-azul">
                            <i class="fa fa-plus"></i>
                            Agregar
                        </a>
                    </div>
                </div>
                <div class="ui-corner-all" style="height: 170px;border: 1px solid #000000;width: 80%;margin-left: 5px;margin-top: 20px" id="detalle-fp"></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar y continuar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="modal-proveedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel-proveedor">Formas de pago</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-2 negrilla" style="width: 140px">
                        <select id="tipoPar" style="margin-right: 5px;" class="form-control">
                            <option value="1">RUC</option>
                            <option value="2">Nombre</option>
                        </select>
                    </div>
                    <div class="col-xs-4 negrilla" style="margin-left: -20px" >
                        <input type="text" id="parametro" class="form-control" style="margin-right: 10px;">
                    </div>
                    <div class="col-xs-1 negrilla" style="width: 140px">
                        <a href="#" id="buscar" class="btn btn-azul">
                            <i class="fa fa-search"></i>
                            Buscar
                        </a>
                    </div>
                </div>
                <div class="ui-corner-all" style="height: 400px;border: 1px solid #000000;width: 95%;margin-left: 0px;margin-top: 20px;overflow-y: auto" id="resultados"></div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">

    function validateNum($elm) {
        var val = parseFloat($elm.val());
        $elm.val(number_format(val, 2, ".", ""));
    }
    function validateInt($elm) {
        var val = parseInt($elm.val());
        $elm.val(val);
    }

    function calculaIva() {
        var iva = ${iva};
        var val = parseFloat($("#baseImponibleIva").val());

        var total = (iva / 100) * val;

        $("#ivaGenerado").val(number_format(total, 2, ".", ""));
    }

    $(function () {

        $("#abrir-fp").click(function(){
            $('#modal-formas-pago').modal('show')
        })

        $("#btn_buscar").click(function(){
            $('#modal-proveedor').modal('show')
        })

        $("#agregarFP").click(function(){
            var band = true
            var message
            if ($(".filaFP").size() == 5) {
                message = "<b>Ya ha asignado el máximo de 5 formas de  pago</b>"
                band = false
            }
            if ($(".fp-"+$("#comboFP").val()).size() >0) {
                message = "<b>Ya ha asignado la forma de pago "+$("#comboFP option:selected").text()+ " previamente.</b>"
                band = false
            }
            if (band) {
                var div = $("<div class='filaFP ui-corner-all'>")
                var span = $("<span class='span-eliminar ui-corner-all' title='Click para eliminar'>Eliminar</span>")
                div.html($("#comboFP option:selected").text())
                div.append(span)
                div.addClass("fp-"+$("#comboFP").val())
                div.attr("fp",$("#comboFP").val())
                span.bind("click", function () {
                    $(this).parent().remove()
                })
                $("#detalle-fp").append(div)
            }else{
                bootbox.alert(message)
            }
        });
        /*todo cambiar la validacion del form que esta haciendo huevadas, gaurdar proceso..... move on*/
        $("#guardarProceso").click(function() {
            openLoader("Validando")
            var bandData
            var band
            var error=""
            var info=""
            $("#listaErrores").html("")
            if($("#fecha_input").val().length<10){
                error+="<li>Seleccione la fecha de registro</li>"
            }
            if($("#descripcion").val().length<10){
                error+="<li>Llene el campo Descripción</li>"
            }
            if($("#tipoProceso").val()=="-1"){
                error+="<li>Seleccione el tipo de la transacción</li>"
            }else{
                if($("#tipoProceso").val()=="C" || $("#tipoProceso").val()=="V" ){

                    if($("#sustento").val()=="-1"){
                        error+="<li>Seleccione un sustento tributario (Necesario si el tipo de transacción es Compras o Ventas)</li>"
                    }
                    if($("#tipoComprobante").val()=="-1"){
                        error+="<li>Seleccione el tipo de documento a registrar (Necesario si el tipo de transacción es Compras o Ventas)</li>"
                    }else{
                        if($("#establecimiento").val().length<3){
                            error+="<li>Ingrese el número de establecimiento del documento</li>"
                        }
                        if($("#emision").val().length<3){
                            error+="<li>Ingrese el número de emisión del documento</li>"
                        }
                        if($("#secuencial").val().length<1){
                            error+="<li>Ingrese el número de secuencia del documento</li>"
                        }
                    }
                }
            }
            if($(".filaFP").size() <1){
                info+="No ha asignado formas de pago para la transacción contable"
                bandData=false
            }
            if(bandData){
                var data =""
                $(".filaFP").each(function(){
                    data+=$(this).attr("fp")+";"

                })
                $("#data").val(data)

            }
            if(error!=""){
                $("#listaErrores").append(error)
                $("#listaErrores").show()
                $("#divErrores").show()
            }

            closeLoader()

//            else{
//                msg+="</b>"
//                bootbox.alert(msg)
//            }
//                $(".frmProceso").submit();


        });
        calculaIva();

        $("#baseImponibleIva").keyup(function () {
            calculaIva();
        });

//                $(".digits").keyup(function () {
//                    validateInt($(this));
//                });

        $(".number").keyup(function () {
            validateNum($(this));
        });

        $("#procesoForm").validate({
            errorLabelContainer : "#listaErrores",
            wrapper             : "li",
            invalidHandler      : function (form, validator) {
                var errors = validator.numberOfInvalids();
//                        console.log("**" + errors);
                if (errors) {
                    var message = errors == 1
                            ? 'Se encontró 1 error.'
                            : 'Se encontraron ' + errors + ' errores';
                    $("#divErrores").show();
                    $("#spanError").html(message);

                } else {
                    $("#divErrores").hide();

                }
            }
        });

//        $("#guardarProceso").click(function () {
//            if ($("#procesoForm").valid()) {
//                $.box({
//                    imageClass : "box_info",
//                    text       : "Por favor espere",
//                    title      : "Procesando",
//                    iconClose  : false,
//                    dialog     : {
//                        resizable     : false,
//                        draggable     : false,
//                        closeOnEscape : false,
//                        buttons       : { }
//                    }
//                });
//            }
//        });



        $("#buscar").click(function () {

            $.ajax({
                type    : "POST",
                url     : "${g.createLink(controller: 'proceso',action: 'buscarProveedor')}",
                data    : "par=" + $("#parametro").val() + "&tipo=" + $("#tipoPar").val(),
                success : function (msg) {
                    //$("#registro").html(msg).show("slide");

                    $("#resultados").html(msg).show("slide")
                }
            });

        });

        $("#registrarProceso").click(function () {
            if (confirm("Está seguro?")) {
                var d = $.box({
                    imageClass : "box_info",
                    text       : "Por favor espere",
                    title      : "Procesando",
                    iconClose  : false,
                    dialog     : {
                        resizable     : false,
                        draggable     : false,
                        closeOnEscape : false,
                        buttons       : { }
                    }
                });
                $.ajax({
                    type    : "POST",
                    url     : "${g.createLink(controller: 'proceso',action: 'registrar')}",
                    data    : "id=" + $("#idProceso").val(),
                    success : function (msg) {
                        //$("#registro").html(msg).show("slide");
                        $("#auth").dialog("close");
                        location.reload(true);
                    },
                    error   : function () {
                        $.box({
                            imageClass : "box_info",
                            text       : "Ha ocurrido un error. Por favor revise el gestor y los valores del proceso.",
                            title      : "Alerta",
                            iconClose  : false,
                            dialog     : {
                                resizable     : false,
                                draggable     : false,
                                closeOnEscape : false,
                                buttons       : {
                                    "Aceptar" : function () {
                                        d.dialog("close");
                                    }
                                }
                            }
                        });

                    }
                });

            }
        });
    });
</script>


<g:if test="${proceso}">
    <script type="text/javascript">
        //                console.log("entro")

        $.ajax({
            type    : "POST",
            url     : "${g.createLink(action: 'cargaComprobantes')}",
            data    : "proceso=" + $("#idProceso").val(),
            success : function (msg) {
                $("#registro").html(msg).show("slide");
            }
        });

    </script>
</g:if>
</body>

</html>
