<%@ page import="cratos.TipoPersona" %>

<g:if test="${!tipoPersonaInstance}">
    <elm:notFound elem="TipoPersona" genero="o"/>
</g:if>
<g:else>

    <g:if test="${tipoPersonaInstance?.codigo}">
        <div class="row">
            <div class="col-md-2 text-info">
                Código
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${tipoPersonaInstance}" field="codigo"/>
            </div>

        </div>
    </g:if>

    <g:if test="${tipoPersonaInstance?.descripcion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Descripción
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${tipoPersonaInstance}" field="descripcion"/>
            </div>

        </div>
    </g:if>

</g:else>