<%@ page import="cratos.Empleado" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!empleadoInstance}">
    <elm:notFound elem="Empleado" genero="o" />
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmEmpleado" role="form" action="save" method="POST">
        <g:hiddenField name="id" value="${empleadoInstance?.id}" />
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'porcentajeComision', 'error')} required">
            <span class="grupo">
                <label for="porcentajeComision" class="col-md-2 control-label text-info">
                    Porcentaje Comision
                </label>
                <div class="col-md-2">
                    <g:field name="porcentajeComision" type="number" value="${fieldValue(bean: empleadoInstance, field: 'porcentajeComision')}" class="number form-control  required" required=""/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'foto', 'error')} ">
            <span class="grupo">
                <label for="foto" class="col-md-2 control-label text-info">
                    Foto
                </label>
                <div class="col-md-6">
                    <input type="file" id="foto" name="foto" />
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'estado', 'error')} ">
            <span class="grupo">
                <label for="estado" class="col-md-2 control-label text-info">
                    Estado
                </label>
                <div class="col-md-6">
                    <g:textField name="estado" maxlength="1" class="allCaps form-control" value="${empleadoInstance?.estado}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'fechaFin', 'error')} ">
            <span class="grupo">
                <label for="fechaFin" class="col-md-2 control-label text-info">
                    Fecha Fin
                </label>
                <div class="col-md-4">
                    <elm:datepicker name="fechaFin" title="fechaFin"  class="datepicker form-control" value="${empleadoInstance?.fechaFin}" default="none" noSelection="['': '']" />
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'fechaInicio', 'error')} ">
            <span class="grupo">
                <label for="fechaInicio" class="col-md-2 control-label text-info">
                    Fecha Inicio
                </label>
                <div class="col-md-4">
                    <elm:datepicker name="fechaInicio" title="fechaInicio"  class="datepicker form-control" value="${empleadoInstance?.fechaInicio}" default="none" noSelection="['': '']" />
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'sueldo', 'error')} required">
            <span class="grupo">
                <label for="sueldo" class="col-md-2 control-label text-info">
                    Sueldo
                </label>
                <div class="col-md-2">
                    <g:field name="sueldo" type="number" value="${fieldValue(bean: empleadoInstance, field: 'sueldo')}" class="number form-control  required" required=""/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'cuenta', 'error')} ">
            <span class="grupo">
                <label for="cuenta" class="col-md-2 control-label text-info">
                    Cuenta
                </label>
                <div class="col-md-6">
                    <g:textField name="cuenta" maxlength="12" class="allCaps form-control" value="${empleadoInstance?.cuenta}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'hijo', 'error')} required">
            <span class="grupo">
                <label for="hijo" class="col-md-2 control-label text-info">
                    Hijo
                </label>
                <div class="col-md-2">
                    <g:field name="hijo" type="number" value="${empleadoInstance.hijo}" class="digits form-control required" required=""/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'iess', 'error')} ">
            <span class="grupo">
                <label for="iess" class="col-md-2 control-label text-info">
                    Iess
                </label>
                <div class="col-md-6">
                    <g:textField name="iess" maxlength="13" class="allCaps form-control" value="${empleadoInstance?.iess}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'numero', 'error')} ">
            <span class="grupo">
                <label for="numero" class="col-md-2 control-label text-info">
                    Numero
                </label>
                <div class="col-md-6">
                    <g:textField name="numero" maxlength="10" class="allCaps form-control" value="${empleadoInstance?.numero}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'tipoContrato', 'error')} ">
            <span class="grupo">
                <label for="tipoContrato" class="col-md-2 control-label text-info">
                    Tipo Contrato
                </label>
                <div class="col-md-6">
                    <g:select id="tipoContrato" name="tipoContrato.id" from="${cratos.TipoContrato.list()}" optionKey="id" value="${empleadoInstance?.tipoContrato?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'cargo', 'error')} ">
            <span class="grupo">
                <label for="cargo" class="col-md-2 control-label text-info">
                    Cargo
                </label>
                <div class="col-md-6">
                    <g:select id="cargo" name="cargo.id" from="${cratos.Cargo.list()}" optionKey="id" value="${empleadoInstance?.cargo?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'persona', 'error')} ">
            <span class="grupo">
                <label for="persona" class="col-md-2 control-label text-info">
                    Persona
                </label>
                <div class="col-md-6">
                    <g:select id="persona" name="persona.id" from="${cratos.seguridad.Persona.list()}" optionKey="id" value="${empleadoInstance?.persona?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'canton', 'error')} ">
            <span class="grupo">
                <label for="canton" class="col-md-2 control-label text-info">
                    Canton
                </label>
                <div class="col-md-6">
                    <g:select id="canton" name="canton.id" from="${cratos.Canton.list()}" optionKey="id" value="${empleadoInstance?.canton?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: empleadoInstance, field: 'observaciones', 'error')} ">
            <span class="grupo">
                <label for="observaciones" class="col-md-2 control-label text-info">
                    Observaciones
                </label>
                <div class="col-md-6">
                    <g:textField name="observaciones" maxlength="127" class="allCaps form-control" value="${empleadoInstance?.observaciones}"/>
                </div>
                
            </span>
        </div>
        
    </g:form>

    <script type="text/javascript">
        var validator = $("#frmEmpleado").validate({
            errorClass     : "help-block",
            errorPlacement : function (error, element) {
                if (element.parent().hasClass("input-group")) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
                element.parents(".grupo").addClass('has-error');
            },
            success        : function (label) {
                label.parents(".grupo").removeClass('has-error');
            }
        });
        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                submitForm();
                return false;
            }
            return true;
        });
    </script>

</g:else>