<%@ page import="cratos.seguridad.Persona" %>

<g:if test="${!personaInstance}">
    <elm:notFound elem="Persona" genero="o"/>
</g:if>
<g:else>

    <g:if test="${personaInstance?.empresa}">
        <div class="row">
            <div class="col-md-3 text-info">
                Empresa
            </div>

            <div class="col-md-5">
                ${personaInstance?.empresa?.nombre}
            </div>

        </div>
    </g:if>

    <g:if test="${personaInstance?.cedula}">
        <div class="row">
            <div class="col-md-3 text-info">
                Cédula
            </div>

            <div class="col-md-5">
                <g:fieldValue bean="${personaInstance}" field="cedula"/>
            </div>

        </div>
    </g:if>

    <g:if test="${personaInstance?.nombre}">
        <div class="row">
            <div class="col-md-3 text-info">
                Nombre
            </div>

            <div class="col-md-5">
                <g:fieldValue bean="${personaInstance}" field="nombre"/>
            </div>

        </div>
    </g:if>

    <g:if test="${personaInstance?.apellido}">
        <div class="row">
            <div class="col-md-3 text-info">
                Apellido
            </div>

            <div class="col-md-5">
                <g:fieldValue bean="${personaInstance}" field="apellido"/>
            </div>

        </div>
    </g:if>

    <g:if test="${personaInstance?.sigla}">
        <div class="row">
            <div class="col-md-3 text-info">
                Sigla
            </div>

            <div class="col-md-5">
                <g:fieldValue bean="${personaInstance}" field="sigla"/>
            </div>

        </div>
    </g:if>

    <g:if test="${personaInstance?.fechaNacimiento}">
        <div class="row">
            <div class="col-md-3 text-info">
                Fecha Nacimiento
            </div>

            <div class="col-md-5">
                <g:formatDate date="${personaInstance?.fechaNacimiento}" format="dd-MM-yyyy"/>
            </div>

        </div>
    </g:if>

    <g:if test="${personaInstance?.email}">
        <div class="row">
            <div class="col-md-3 text-info">
                E-mail
            </div>

            <div class="col-md-5">
                <g:fieldValue bean="${personaInstance}" field="email"/>
            </div>

        </div>
    </g:if>

    <g:if test="${personaInstance?.telefono}">
        <div class="row">
            <div class="col-md-3 text-info">
                Teléfono
            </div>

            <div class="col-md-5">
                <g:fieldValue bean="${personaInstance}" field="telefono"/>
            </div>

        </div>
    </g:if>

    <g:if test="${personaInstance?.login}">
        <div class="row">
            <div class="col-md-3 text-info">
                Login
            </div>

            <div class="col-md-5">
                <g:fieldValue bean="${personaInstance}" field="login"/>
            </div>

        </div>
    </g:if>

%{--<g:if test="${personaInstance?.activo}">--}%
    <div class="row">
        <div class="col-md-3 text-info">
            Activo
        </div>

        <div class="col-md-5">
            ${personaInstance.activo == 1 ? "SI" : "NO"}
        </div>

    </div>
%{--</g:if>--}%

</g:else>