
<%@ page import="cratos.seguridad.Persona" %>

<g:if test="${!personaInstance}">
    <elm:notFound elem="Persona" genero="o" />
</g:if>
<g:else>

    <g:if test="${personaInstance?.email}">
        <div class="row">
            <div class="col-md-2 text-info">
                Email
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="email"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.telefono}">
        <div class="row">
            <div class="col-md-2 text-info">
                Telefono
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="telefono"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.direccionReferencia}">
        <div class="row">
            <div class="col-md-2 text-info">
                Direccion Referencia
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="direccionReferencia"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.barrio}">
        <div class="row">
            <div class="col-md-2 text-info">
                Barrio
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="barrio"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.direccion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Direccion
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="direccion"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.fechaNacimiento}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha Nacimiento
            </div>
            
            <div class="col-md-3">
                <g:formatDate date="${personaInstance?.fechaNacimiento}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.discapacitado}">
        <div class="row">
            <div class="col-md-2 text-info">
                Discapacitado
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="discapacitado"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.sexo}">
        <div class="row">
            <div class="col-md-2 text-info">
                Sexo
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="sexo"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.apellido}">
        <div class="row">
            <div class="col-md-2 text-info">
                Apellido
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="apellido"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.nombre}">
        <div class="row">
            <div class="col-md-2 text-info">
                Nombre
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="nombre"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.cedula}">
        <div class="row">
            <div class="col-md-2 text-info">
                Cedula
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="cedula"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.empresa}">
        <div class="row">
            <div class="col-md-2 text-info">
                Empresa
            </div>
            
            <div class="col-md-3">
                ${personaInstance?.empresa?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.nacionalidad}">
        <div class="row">
            <div class="col-md-2 text-info">
                Nacionalidad
            </div>
            
            <div class="col-md-3">
                ${personaInstance?.nacionalidad?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.profesion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Profesion
            </div>
            
            <div class="col-md-3">
                ${personaInstance?.profesion?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.estadoCivil}">
        <div class="row">
            <div class="col-md-2 text-info">
                Estado Civil
            </div>
            
            <div class="col-md-3">
                ${personaInstance?.estadoCivil?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.observaciones}">
        <div class="row">
            <div class="col-md-2 text-info">
                Observaciones
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="observaciones"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.libretaMilitar}">
        <div class="row">
            <div class="col-md-2 text-info">
                Libreta Militar
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="libretaMilitar"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.login}">
        <div class="row">
            <div class="col-md-2 text-info">
                Login
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="login"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.password}">
        <div class="row">
            <div class="col-md-2 text-info">
                Password
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="password"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.autorizacion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Autorizacion
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="autorizacion"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.sigla}">
        <div class="row">
            <div class="col-md-2 text-info">
                Sigla
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="sigla"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.activo}">
        <div class="row">
            <div class="col-md-2 text-info">
                Activo
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${personaInstance}" field="activo"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${personaInstance?.fechaPass}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha Pass
            </div>
            
            <div class="col-md-3">
                <g:formatDate date="${personaInstance?.fechaPass}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
</g:else>