
<%@ page import="cratos.Contabilidad" %>

<g:if test="${!contabilidadInstance}">
    <elm:notFound elem="Contabilidad" genero="o" />
</g:if>
<g:else>

    <g:if test="${contabilidadInstance?.fechaCierre}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha Cierre
            </div>
            
            <div class="col-md-3">
                <g:formatDate date="${contabilidadInstance?.fechaCierre}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${contabilidadInstance?.fechaInicio}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha Inicio
            </div>
            
            <div class="col-md-3">
                <g:formatDate date="${contabilidadInstance?.fechaInicio}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${contabilidadInstance?.prefijo}">
        <div class="row">
            <div class="col-md-2 text-info">
                Prefijo
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${contabilidadInstance}" field="prefijo"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${contabilidadInstance?.descripcion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Descripcion
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${contabilidadInstance}" field="descripcion"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${contabilidadInstance?.institucion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Institucion
            </div>
            
            <div class="col-md-3">
                ${contabilidadInstance?.institucion?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${contabilidadInstance?.presupuesto}">
        <div class="row">
            <div class="col-md-2 text-info">
                Presupuesto
            </div>
            
            <div class="col-md-3">
                <g:formatDate date="${contabilidadInstance?.presupuesto}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
</g:else>