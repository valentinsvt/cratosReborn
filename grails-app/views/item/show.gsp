<ol class="property-list item">


<g:if test="${!itemInstance}">
    <elm:notFound elem="Item" genero="o"/>
</g:if>
<g:else>

    <g:if test="${itemInstance?.codigo}">
        <div class="row">
            <div class="col-md-3 text-info">
                Código:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="codigo"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.nombre}">
        <div class="row">
            <div class="col-md-3 text-info">
                Nombre:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="nombre"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.marca}">
        <div class="row">
            <div class="col-md-3 text-info">
                Marca:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="marca.descripcion"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.precioVenta}">
        <div class="row">
            <div class="col-md-3 text-info">
                Precio de Venta:
            </div>

            <div class="col-md-4">
                $ <g:fieldValue bean="${itemInstance}" field="precioVenta"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.precioCosto}">
        <div class="row">
            <div class="col-md-3 text-info">
                Precio de Costo:
            </div>

            <div class="col-md-4">
                $ <g:fieldValue bean="${itemInstance}" field="precioCosto"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.precioUnitario}">
        <div class="row">
            <div class="col-md-3 text-info">
                Precio Unitario:
            </div>

            <div class="col-md-4">
                $ <g:fieldValue bean="${itemInstance}" field="precioUnitario"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.iva}">
        <div class="row">
            <div class="col-md-3 text-info">
                Precio Iva:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="iva"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.ice}">
        <div class="row">
            <div class="col-md-3 text-info">
                Precio Ice:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="ice"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.peso}">
        <div class="row">
            <div class="col-md-3 text-info">
                Peso:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="peso"/>
            </div>

        </div>
    </g:if>


    <g:if test="${itemInstance?.stockMaximo}">
        <div class="row">
            <div class="col-md-3 text-info">
                Stock Máximo:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="stockMaximo"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.stock}">
        <div class="row">
            <div class="col-md-3 text-info">
                Stock:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="stock"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.unidad}">
        <div class="row">
            <div class="col-md-3 text-info">
                Unidad:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="unidad"/>
            </div>

        </div>
    </g:if>

    <g:if test="${itemInstance?.grupo}">
        <div class="row">
            <div class="col-md-3 text-info">
                Grupo:
            </div>

            <div class="col-md-4">
                <g:fieldValue bean="${itemInstance}" field="grupo"/>
            </div>

        </div>
    </g:if>



</g:else>

</ol>
