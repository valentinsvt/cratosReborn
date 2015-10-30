<%@ page import="cratos.CuentaBanco" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!cuentaBancoInstance}">
    <elm:notFound elem="CuentaBanco" genero="o" />
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmCuentaBanco" role="form" action="save_ajax" method="POST">
        <g:hiddenField name="id" value="${cuentaBancoInstance?.id}" />


        
        <div class="form-group ${hasErrors(bean: cuentaBancoInstance, field: 'numero', 'error')} required">
            <span class="grupo">
                <label for="numero" class="col-md-3 control-label text-info">
                    Número
                </label>
                <div class="col-md-6">
                    <g:textField name="numero" maxlength="15" required="" class="allCaps form-control required number" value="${cuentaBancoInstance?.numero}"/>
                </div>
                 *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: cuentaBancoInstance, field: 'banco', 'error')} ">
            <span class="grupo">
                <label for="banco" class="col-md-3 control-label text-info">
                    Banco
                </label>
                <div class="col-md-6">
                    <g:select id="banco" name="banco.id" from="${cratos.Banco.list()}" optionKey="id" optionValue="descripcion" value="${cuentaBancoInstance?.banco?.id}" class="many-to-one form-control required" />
                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: cuentaBancoInstance, field: 'tipoCuenta', 'error')} ">
            <span class="grupo">
                <label for="tipoCuenta" class="col-md-3 control-label text-info">
                    Tipo Cuenta
                </label>
                <div class="col-md-6">
                    <g:select id="tipoCuenta" name="tipoCuenta.id" from="${cratos.TipoCuenta.list()}" optionKey="id" optionValue="tipoCuenta" value="${cuentaBancoInstance?.tipoCuenta?.id}" class="many-to-one form-control required" />
                </div>
                  *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: cuentaBancoInstance, field: 'fechaInicio', 'error')} ">
            <span class="grupo">
                <label for="fechaInicio" class="col-md-3 control-label text-info">
                    Fecha Inicio
                </label>
                <div class="col-md-4">
                    <elm:datepicker name="fechaInicio" title="fechaInicio"  class="datepicker form-control" value="${cuentaBancoInstance?.fechaInicio}" />
                </div>

            </span>
        </div>

        <div class="form-group ${hasErrors(bean: cuentaBancoInstance, field: 'fechaFin', 'error')} ">
            <span class="grupo">
                <label for="fechaFin" class="col-md-3 control-label text-info">
                    Fecha Fin
                </label>
                <div class="col-md-4">
                    <elm:datepicker name="fechaFin" title="fechaFin"  class="datepicker form-control" value="${cuentaBancoInstance?.fechaFin}" />
                </div>

            </span>
        </div>

        <div class="form-group ${hasErrors(bean: cuentaBancoInstance, field: 'observaciones', 'error')} ">
            <span class="grupo">
                <label for="observaciones" class="col-md-3 control-label text-info">
                    Observaciones
                </label>
                <div class="col-md-6">
                    <g:textField name="observaciones" maxlength="127" class="allCaps form-control" value="${cuentaBancoInstance?.observaciones}"/>
                </div>
                
            </span>
        </div>
        
    </g:form>

    <script type="text/javascript">
        var validator = $("#frmCuentaBanco").validate({
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