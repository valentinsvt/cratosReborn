<%@ page import="cratos.Presupuesto" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Transacciones contables</title>
</head>
<body>
<g:if test="${flash.message}">
    <div class="alert ${flash.tipo == 'error' ? 'alert-danger' : flash.tipo == 'success' ? 'alert-success' : 'alert-info'} ${flash.clase}">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <g:if test="${flash.tipo == 'error'}">
            <i class="fa fa-warning fa-2x pull-left"></i>
        </g:if>
        <g:elseif test="${flash.tipo == 'success'}">
            <i class="fa fa-check-square fa-2x pull-left"></i>
        </g:elseif>
        <g:elseif test="${flash.tipo == 'notFound'}">
            <i class="icon-ghost fa-2x pull-left"></i>
        </g:elseif>
        <p>
            ${flash.message}
        </p>
    </div>
</g:if>
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <g:link class="btn btn-primary" action="nuevoProceso">
            <i class="fa fa-file-o"></i> Nueva transacción contable
        </g:link>
    </div>
</div>
<div class="vertical-container-no-padding" style="margin-top: 25px;color: black;min-height: 460px">
    <div style="width: 1000px;float: left">
        <bsc:buscador name="proceso.id"  accion="listar" campos="${campos}" label="Transacción" tipo="lista"/>
    </div>
</div>
</body>
</html>
