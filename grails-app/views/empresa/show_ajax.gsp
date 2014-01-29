<%@ page import="cratos.Empresa" %>

<g:if test="${!empresaInstance}">
    <elm:notFound elem="Empresa" genero="o"/>
</g:if>
<g:else>

    <g:if test="${empresaInstance?.email}">
        <div class="row">
            <div class="col-md-2 text-info">
                Email
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="email"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.fechaFin}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha Fin
            </div>

            <div class="col-md-3">
                <g:formatDate date="${empresaInstance?.fechaFin}" format="dd-MM-yyyy"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.fechaInicio}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha Inicio
            </div>

            <div class="col-md-3">
                <g:formatDate date="${empresaInstance?.fechaInicio}" format="dd-MM-yyyy"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.telefono}">
        <div class="row">
            <div class="col-md-2 text-info">
                Telefono
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="telefono"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.direccion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Direccion
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="direccion"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.ruc}">
        <div class="row">
            <div class="col-md-2 text-info">
                Ruc
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="ruc"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.nombre}">
        <div class="row">
            <div class="col-md-2 text-info">
                Nombre
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="nombre"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.canton}">
        <div class="row">
            <div class="col-md-2 text-info">
                Canton
            </div>

            <div class="col-md-3">
                ${empresaInstance?.canton?.encodeAsHTML()}
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.tipoEmpresa}">
        <div class="row">
            <div class="col-md-2 text-info">
                Tipo Empresa
            </div>

            <div class="col-md-3">
                ${empresaInstance?.tipoEmpresa?.encodeAsHTML()}
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.sigla}">
        <div class="row">
            <div class="col-md-2 text-info">
                Sigla
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="sigla"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.numeroComprobanteDiario}">
        <div class="row">
            <div class="col-md-2 text-info">
                Numero Comprobante Diario
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="numeroComprobanteDiario"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.numeroComprobanteIngreso}">
        <div class="row">
            <div class="col-md-2 text-info">
                Numero Comprobante Ingreso
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="numeroComprobanteIngreso"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.numeroComprobanteEgreso}">
        <div class="row">
            <div class="col-md-2 text-info">
                Numero Comprobante Egreso
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="numeroComprobanteEgreso"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.prefijoDiario}">
        <div class="row">
            <div class="col-md-2 text-info">
                Prefijo Diario
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="prefijoDiario"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.prefijoEgreso}">
        <div class="row">
            <div class="col-md-2 text-info">
                Prefijo Egreso
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="prefijoEgreso"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.prefijoIngreso}">
        <div class="row">
            <div class="col-md-2 text-info">
                Prefijo Ingreso
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="prefijoIngreso"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.ordenCompra}">
        <div class="row">
            <div class="col-md-2 text-info">
                Orden Compra
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${empresaInstance}" field="ordenCompra"/>
            </div>

        </div>
    </g:if>

    <g:if test="${empresaInstance?.periodosContables}">
        <div class="row">
            <div class="col-md-2 text-info">
                Periodos Contables
            </div>

            <div class="col-md-3">
                <ul>
                    <g:each in="${empresaInstance.periodosContables}" var="p">
                        <li>${p?.encodeAsHTML()}</li>
                    </g:each>
                </ul>
            </div>

        </div>
    </g:if>

</g:else>