<%@ page import="cratos.TipoComprobanteId" %>

<g:if test="${!tipoComprobanteIdInstance}">
    <elm:notFound elem="TipoComprobanteId" genero="o"/>
</g:if>
<g:else>

    <g:if test="${tipoComprobanteIdInstance?.tipoIdentificacion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Tipo Identificacion
            </div>

            <div class="col-md-3">
                ${tipoComprobanteIdInstance?.tipoIdentificacion?.encodeAsHTML()}
            </div>

        </div>
    </g:if>

    <g:if test="${tipoComprobanteIdInstance?.tipoComprobanteSri}">
        <div class="row">
            <div class="col-md-2 text-info">
                Tipo Comprobante Sri
            </div>

            <div class="col-md-3">
                ${tipoComprobanteIdInstance?.tipoComprobanteSri?.encodeAsHTML()}
            </div>

        </div>
    </g:if>

</g:else>