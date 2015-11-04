
<%@ page import="cratos.CuentaBanco" %>

<g:if test="${!cuentaBancoInstance}">
    <elm:notFound elem="CuentaBanco" genero="o" />
</g:if>
<g:else>

    <g:if test="${cuentaBancoInstance?.fechaFin}">
        <div class="row">
            <div class="col-md-3 text-info">
                Fecha Fin
            </div>
            
            <div class="col-md-5">
                <g:formatDate date="${cuentaBancoInstance?.fechaFin}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.fechaInicio}">
        <div class="row">
            <div class="col-md-3 text-info">
                Fecha Inicio
            </div>
            
            <div class="col-md-5">
                <g:formatDate date="${cuentaBancoInstance?.fechaInicio}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.numero}">
        <div class="row">
            <div class="col-md-3 text-info">
                Número
            </div>
            
            <div class="col-md-5">
                <g:fieldValue bean="${cuentaBancoInstance}" field="numero"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.tipoCuenta}">
        <div class="row">
            <div class="col-md-3 text-info">
                Tipo Cuenta
            </div>
            
            <div class="col-md-5">
                ${cuentaBancoInstance?.tipoCuenta?.tipoCuenta?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.banco}">
        <div class="row">
            <div class="col-md-3 text-info">
                Banco
            </div>
            
            <div class="col-md-5">
                ${cuentaBancoInstance?.banco?.descripcion?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaBancoInstance?.observaciones}">
        <div class="row">
            <div class="col-md-3 text-info">
                Observaciones
            </div>
            
            <div class="col-md-5">
                <g:fieldValue bean="${cuentaBancoInstance}" field="observaciones"/>
            </div>
            
        </div>
    </g:if>
    
</g:else>