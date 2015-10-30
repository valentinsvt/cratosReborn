
<%@ page import="cratos.CuentaBanco" %>

<g:if test="${!cuentaBancoInstance}">
    <elm:notFound elem="CuentaBanco" genero="o" />
</g:if>
<g:else>

    <g:if test="${cuentaBancoInstance?.fechaFin}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha Fin
            </div>
            
            <div class="col-md-3">
                <g:formatDate date="${cuentaBancoInstance?.fechaFin}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.fechaInicio}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha Inicio
            </div>
            
            <div class="col-md-3">
                <g:formatDate date="${cuentaBancoInstance?.fechaInicio}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.numero}">
        <div class="row">
            <div class="col-md-2 text-info">
                Numero
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaBancoInstance}" field="numero"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.tipoCuenta}">
        <div class="row">
            <div class="col-md-2 text-info">
                Tipo Cuenta
            </div>
            
            <div class="col-md-3">
                ${cuentaBancoInstance?.tipoCuenta?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.banco}">
        <div class="row">
            <div class="col-md-2 text-info">
                Banco
            </div>
            
            <div class="col-md-3">
                ${cuentaBancoInstance?.banco?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.observaciones}">
        <div class="row">
            <div class="col-md-2 text-info">
                Observaciones
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaBancoInstance}" field="observaciones"/>
            </div>
            
        </div>
    </g:if>
    
</g:else>