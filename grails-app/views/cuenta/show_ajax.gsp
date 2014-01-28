
<%@ page import="cratos.Cuenta" %>

<g:if test="${!cuentaInstance}">
    <elm:notFound elem="Cuenta" genero="o" />
</g:if>
<g:else>

    <g:if test="${cuentaInstance?.auxiliar}">
        <div class="row">
            <div class="col-md-2 text-info">
                Auxiliar
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaInstance}" field="auxiliar"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.movimiento}">
        <div class="row">
            <div class="col-md-2 text-info">
                Movimiento
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaInstance}" field="movimiento"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.descripcion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Descripcion
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaInstance}" field="descripcion"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.padre}">
        <div class="row">
            <div class="col-md-2 text-info">
                Padre
            </div>
            
            <div class="col-md-3">
                ${cuentaInstance?.padre?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.numero}">
        <div class="row">
            <div class="col-md-2 text-info">
                Numero
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaInstance}" field="numero"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.empresa}">
        <div class="row">
            <div class="col-md-2 text-info">
                Empresa
            </div>
            
            <div class="col-md-3">
                ${cuentaInstance?.empresa?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.cuentaBanco}">
        <div class="row">
            <div class="col-md-2 text-info">
                Cuenta Banco
            </div>
            
            <div class="col-md-3">
                ${cuentaInstance?.cuentaBanco?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.nivel}">
        <div class="row">
            <div class="col-md-2 text-info">
                Nivel
            </div>
            
            <div class="col-md-3">
                ${cuentaInstance?.nivel?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.presupuesto}">
        <div class="row">
            <div class="col-md-2 text-info">
                Presupuesto
            </div>
            
            <div class="col-md-3">
                ${cuentaInstance?.presupuesto?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.estado}">
        <div class="row">
            <div class="col-md-2 text-info">
                Estado
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaInstance}" field="estado"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.retencion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Retencion
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaInstance}" field="retencion"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.impuesto}">
        <div class="row">
            <div class="col-md-2 text-info">
                Impuesto
            </div>
            
            <div class="col-md-3">
                ${cuentaInstance?.impuesto?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${cuentaInstance?.resultado}">
        <div class="row">
            <div class="col-md-2 text-info">
                Resultado
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${cuentaInstance}" field="resultado"/>
            </div>
            
        </div>
    </g:if>
    
</g:else>