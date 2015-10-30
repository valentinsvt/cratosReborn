<%@ page import="cratos.Transferencia" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    %{--<g:set var="entityName" value="${message(code: 'transferencia.label', default: 'Transferencia')}"/>--}%

    %{--<script type="text/javascript" src="${resource(dir: 'js/jquery/plugins/contextMenu', file: 'jquery.contextMenu.js')}"></script>--}%
    %{--<link rel="stylesheet" href="${resource(dir: 'js/jquery/plugins/contextMenu', file: 'jquery.contextMenu.css')}" type="text/css">--}%

    <title>Lista de Transferencias</title>
</head>

<body>


<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>


<!-- botones -->
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <g:link action="create" class="btn btn-default btnCrear">
            <i class="fa fa-file-o"></i> Crear Transferencia
        </g:link>
    </div>

    <div class="btn-group pull-right col-md-3">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Buscar">
            <span class="input-group-btn">
                <a href="#" class="btn btn-default" type="button">
                    <i class="fa fa-search"></i>&nbsp;
                </a>
            </span>
        </div><!-- /input-group -->
    </div>
</div>


%{--<a href="#list-transferencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%

%{--<div id="list-transferencia" class="content scaffold-list" role="main">--}%
%{--<div class="ui-widget-header ui-corner-all nav navegacion">--}%
%{--<ul style="margin-bottom:0;">--}%
%{--<li><g:link class="create linkButton" action="create" icon="ui-icon-document">Crear Transferencia</g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%

%{--<div class="contenedor">--}%
%{--<h1>Lista de Transferencia</h1>--}%
%{--<g:if test="${flash.message}">--}%
%{--<div class="message ${flash.clase}" role="status"><span class="ss_sprite ${flash.ico}">&nbsp;</span>${flash.message}--}%
%{--</div>--}%
%{--</g:if>--}%

<div class="vertical-container vertical-container-list">
    <p class="css-vertical-text">Lista de Órdenes de Compra</p>

    <div class="linea"></div>

    <table class="table table-condensed table-bordered table-striped table-hover">
       <thead>
        <tr>
            <g:sortableColumn property="fecha" title="Fecha"/>
            <th>Empresa</th>
            <th>Bodega Sale</th>
            <th>Bodega Recibe</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody id="tb-transferencias">
        <g:each in="${transferenciaInstanceList}" status="i" var="transferenciaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}" id="${transferenciaInstance.id}">
                <td><g:formatDate date="${transferenciaInstance.fecha}" format="yyyy-MM-dd"/></td>
                %{--<td>${fieldValue(bean: transferenciaInstance, field: "empresa")}</td>--}%
                %{--<td>${fieldValue(bean: transferenciaInstance, field: "bodegaSale.descripcion")}</td>--}%
                %{--<td>${fieldValue(bean: transferenciaInstance, field: "bodegaRecibe.descripcion")}</td>--}%
                <td>${transferenciaInstance?.empresa?.nombre}</td>
                <td>${transferenciaInstance?.bodegaSale?.descripcion}</td>
                <td>${transferenciaInstance?.bodegaRecibe?.descripcion}</td>
                <td>
                    <g:formatBoolean boolean="${transferenciaInstance.estado == 'N'}" true="No registrado" false="Registrado"/>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<elm:pagination total="${transferenciaInstanceTotal}" params="${params}"/>

%{--<ul id="menu-transferencias" class="contextMenu">--}%
    %{--<li class="show">--}%
        %{--<a href="#show">Ver</a>--}%
    %{--</li>--}%
%{--</ul>--}%

%{--<div class="ui-widget-header pagination" style="padding: 5px;">--}%
    %{--<g:paginate total="${transferenciaInstanceTotal}" prev="Anterior" next="Siguiente" params="${params}"/>--}%
%{--</div>--}%

<script type="text/javascript">
    %{--$(function () {--}%
        %{--$("#tb-transferencias").find("tr").contextMenu({--}%
                    %{--menu : "menu-transferencias"--}%
                %{--},--}%
                %{--function (action, el, pos) {--}%
                    %{--var id = $(el).attr("id");--}%
                    %{--var title, buttons, url, cont;--}%
                    %{--switch (action) {--}%

                        %{--case "show":--}%
%{--//--}%
                            %{--title = "Ver Adquisiciones";--}%
                            %{--buttons = {--}%
                                %{--"Aceptar" : function () {--}%

                                %{--}--}%
                            %{--};--}%
                            %{--var url = "${createLink(controller: 'transferencia', action:'show')}/" + id;--}%

                            %{--location.href = url;--}%

                            %{--break;--}%

                    %{--}--}%
                %{--});--}%
    %{--});--}%
</script>

</body>
</html>
