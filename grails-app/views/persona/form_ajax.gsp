<%@ page import="cratos.seguridad.Persona" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!personaInstance}">
    <elm:notFound elem="Persona" genero="o" />
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmPersona" role="form" action="save" method="POST">
        <g:hiddenField name="id" value="${personaInstance?.id}" />
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'email', 'error')} ">
            <span class="grupo">
                <label for="email" class="col-md-2 control-label text-info">
                    Email
                </label>
                <div class="col-md-6">
                    <g:textField name="email" maxlength="63" class="allCaps form-control" value="${personaInstance?.email}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'telefono', 'error')} ">
            <span class="grupo">
                <label for="telefono" class="col-md-2 control-label text-info">
                    Telefono
                </label>
                <div class="col-md-6">
                    <g:textField name="telefono" maxlength="63" class="allCaps form-control" value="${personaInstance?.telefono}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'direccionReferencia', 'error')} ">
            <span class="grupo">
                <label for="direccionReferencia" class="col-md-2 control-label text-info">
                    Direccion Referencia
                </label>
                <div class="col-md-6">
                    <g:textField name="direccionReferencia" maxlength="127" class="allCaps form-control" value="${personaInstance?.direccionReferencia}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'barrio', 'error')} ">
            <span class="grupo">
                <label for="barrio" class="col-md-2 control-label text-info">
                    Barrio
                </label>
                <div class="col-md-6">
                    <g:textField name="barrio" maxlength="127" class="allCaps form-control" value="${personaInstance?.barrio}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'direccion', 'error')} ">
            <span class="grupo">
                <label for="direccion" class="col-md-2 control-label text-info">
                    Direccion
                </label>
                <div class="col-md-6">
                    <g:textField name="direccion" maxlength="127" class="allCaps form-control" value="${personaInstance?.direccion}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'fechaNacimiento', 'error')} ">
            <span class="grupo">
                <label for="fechaNacimiento" class="col-md-2 control-label text-info">
                    Fecha Nacimiento
                </label>
                <div class="col-md-4">
                    <elm:datepicker name="fechaNacimiento" title="Fecha de Nacimiento"  class="datepicker form-control" value="${personaInstance?.fechaNacimiento}" default="none" noSelection="['': '']" />
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'discapacitado', 'error')} ">
            <span class="grupo">
                <label for="discapacitado" class="col-md-2 control-label text-info">
                    Discapacitado
                </label>
                <div class="col-md-6">
                    <g:select name="discapacitado" from="${personaInstance.constraints.discapacitado.inList}" class="form-control" value="${personaInstance?.discapacitado}" valueMessagePrefix="persona.discapacitado" noSelection="['': '']"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'sexo', 'error')} required">
            <span class="grupo">
                <label for="sexo" class="col-md-2 control-label text-info">
                    Sexo
                </label>
                <div class="col-md-6">
                    <g:select name="sexo" from="${personaInstance.constraints.sexo.inList}" required="" class="form-control required" value="${personaInstance?.sexo}" valueMessagePrefix="persona.sexo"/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} required">
            <span class="grupo">
                <label for="apellido" class="col-md-2 control-label text-info">
                    Apellido
                </label>
                <div class="col-md-6">
                    <g:textField name="apellido" maxlength="31" required="" class="allCaps form-control required" value="${personaInstance?.apellido}"/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
            <span class="grupo">
                <label for="nombre" class="col-md-2 control-label text-info">
                    Nombre
                </label>
                <div class="col-md-6">
                    <g:textField name="nombre" maxlength="31" required="" class="allCaps form-control required" value="${personaInstance?.nombre}"/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'cedula', 'error')} required">
            <span class="grupo">
                <label for="cedula" class="col-md-2 control-label text-info">
                    Cedula
                </label>
                <div class="col-md-6">
                    <g:textField name="cedula" maxlength="10" required="" class="allCaps form-control required" value="${personaInstance?.cedula}"/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'empresa', 'error')} ">
            <span class="grupo">
                <label for="empresa" class="col-md-2 control-label text-info">
                    Empresa
                </label>
                <div class="col-md-6">
                    <g:select id="empresa" name="empresa.id" from="${cratos.Empresa.list()}" optionKey="id" value="${personaInstance?.empresa?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'nacionalidad', 'error')} required">
            <span class="grupo">
                <label for="nacionalidad" class="col-md-2 control-label text-info">
                    Nacionalidad
                </label>
                <div class="col-md-6">
                    <g:select id="nacionalidad" name="nacionalidad.id" from="${cratos.Nacionalidad.list()}" optionKey="id" required="" value="${personaInstance?.nacionalidad?.id}" class="many-to-one form-control"/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'profesion', 'error')} ">
            <span class="grupo">
                <label for="profesion" class="col-md-2 control-label text-info">
                    Profesion
                </label>
                <div class="col-md-6">
                    <g:select id="profesion" name="profesion.id" from="${cratos.Profesion.list()}" optionKey="id" value="${personaInstance?.profesion?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'estadoCivil', 'error')} ">
            <span class="grupo">
                <label for="estadoCivil" class="col-md-2 control-label text-info">
                    Estado Civil
                </label>
                <div class="col-md-6">
                    <g:select id="estadoCivil" name="estadoCivil.id" from="${cratos.EstadoCivil.list()}" optionKey="id" value="${personaInstance?.estadoCivil?.id}" class="many-to-one form-control" noSelection="['null': '']"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'observaciones', 'error')} ">
            <span class="grupo">
                <label for="observaciones" class="col-md-2 control-label text-info">
                    Observaciones
                </label>
                <div class="col-md-6">
                    <g:textField name="observaciones" maxlength="127" class="allCaps form-control" value="${personaInstance?.observaciones}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'libretaMilitar', 'error')} ">
            <span class="grupo">
                <label for="libretaMilitar" class="col-md-2 control-label text-info">
                    Libreta Militar
                </label>
                <div class="col-md-6">
                    <g:textField name="libretaMilitar" class="allCaps form-control" value="${personaInstance?.libretaMilitar}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'login', 'error')} required">
            <span class="grupo">
                <label for="login" class="col-md-2 control-label text-info">
                    Login
                </label>
                <div class="col-md-6">
                    <g:textField name="login" maxlength="15" required="" class="allCaps form-control required" value="${personaInstance?.login}"/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'password', 'error')} required">
            <span class="grupo">
                <label for="password" class="col-md-2 control-label text-info">
                    Password
                </label>
                <div class="col-md-6">
                    <div class="input-group"><span class="input-group-addon"><i class="fa fa-lock"></i></span><g:field type="password" name="password" maxlength="64" required="" class="allCaps form-control required" value="${personaInstance?.password}"/></div>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'autorizacion', 'error')} required">
            <span class="grupo">
                <label for="autorizacion" class="col-md-2 control-label text-info">
                    Autorizacion
                </label>
                <div class="col-md-6">
                    <div class="input-group"><span class="input-group-addon"><i class="fa fa-lock"></i></span><g:field type="password" name="autorizacion" maxlength="255" required="" class="allCaps form-control required" value="${personaInstance?.autorizacion}"/></div>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'sigla', 'error')} required">
            <span class="grupo">
                <label for="sigla" class="col-md-2 control-label text-info">
                    Sigla
                </label>
                <div class="col-md-6">
                    <g:textField name="sigla" maxlength="8" required="" class="allCaps form-control required" value="${personaInstance?.sigla}"/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'activo', 'error')} required">
            <span class="grupo">
                <label for="activo" class="col-md-2 control-label text-info">
                    Activo
                </label>
                <div class="col-md-2">
                    <g:field name="activo" type="number" value="${personaInstance.activo}" class="digits form-control required" required=""/>
                </div>
                 *
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: personaInstance, field: 'fechaPass', 'error')} ">
            <span class="grupo">
                <label for="fechaPass" class="col-md-2 control-label text-info">
                    Fecha Pass
                </label>
                <div class="col-md-4">
                    <elm:datepicker name="fechaPass" title="Fecha de cambio de contraseña"  class="datepicker form-control" value="${personaInstance?.fechaPass}" default="none" noSelection="['': '']" />
                </div>
                
            </span>
        </div>
        
    </g:form>

    <script type="text/javascript">
        var validator = $("#frmPersona").validate({
            errorClass     : "help-block",
            errorPlacement : function (error, element) {
                if (element.parent().hasClass("input-group")) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
                element.parents(".grupo").addClass('has-error');
            },
            success        : function (label) {
                label.parents(".grupo").removeClass('has-error');
            }
        });
        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                submitForm();
                return false;
            }
            return true;
        });
    </script>

</g:else>