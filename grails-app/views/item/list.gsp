
<%@ page import="cratos.Item" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Lista de Items</title>

        <script type="text/javascript" src="${resource(dir: 'js/jquery/plugins/contextMenu', file: 'jquery.contextMenu.js')}"></script>
        <link rel="stylesheet" href="${resource(dir: 'js/jquery/plugins/contextMenu', file: 'jquery.contextMenu.css')}" type="text/css">

        <script type="text/javascript" src="${resource(dir: 'js/jquery/plugins/jquery-validation-1.9.0', file: 'jquery.validate.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/jquery/plugins/jquery-validation-1.9.0', file: 'messages_es.js')}"></script>

    </head>
    <body>
    <div class="btn-toolbar toolbar">
        <div class="btn-group">
            <g:link action="form" class="btn btn-default btnCrear">
                <i class="fa fa-file-o"></i> Crear
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

    <table id="tbl-item" class="table table-bordered table-condensed table-hover">
                    <thead>
                        <tr>
                            
                            %{--<g:sortableColumn property="iva" title="${message(code: 'item.iva.label', default: 'Iva')}" />--}%

                            <g:sortableColumn property="codigo" title="Código"/>

                            <g:sortableColumn property="nombre" title="${message(code:'item.nombre.label', default: 'Nombre')}"/>
                            
                            %{--<g:sortableColumn property="peso" title="${message(code: 'item.peso.label', default: 'Peso')}" />--}%
                            
                            %{--<g:sortableColumn property="stockMaximo" title="${message(code: 'item.stockMaximo.label', default: 'Stock Maximo')}" />--}%
                            
                            <g:sortableColumn property="stock" title="${message(code: 'item.stock.label', default: 'Stock Mínimo')}" />
                            
                            <g:sortableColumn property="precioVenta" title="${message(code: 'item.precioVenta.label', default: 'Precio Venta')}" />
                            
                            <g:sortableColumn property="precioCosto" title="${message(code: 'item.precioCosto.label', default: 'Precio Costo')}" />

                            <th style="width: 110px">Acciones</th>
                            
                        </tr>
                    </thead>
                    <tbody id="tb-item">
                        <g:each in="${itemInstanceList}" status="i" var="itemInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}" id="${itemInstance.id}">
                                
                                %{--<td>${fieldValue(bean: itemInstance, field: "iva")}</td>--}%
                                <td>${fieldValue(bean: itemInstance, field: "codigo")}</td>

                                <td>${fieldValue(bean: itemInstance, field: "nombre")}</td>
                                %{--<td>${fieldValue(bean: itemInstance, field: "peso")}</td>--}%
                                
                                %{--<td>${fieldValue(bean: itemInstance, field: "stockMaximo")}</td>--}%
                                
                                <td>${fieldValue(bean: itemInstance, field: "stock")}</td>
                                
                                <td>${fieldValue(bean: itemInstance, field: "precioVenta")}</td>
                                
                                <td>${fieldValue(bean: itemInstance, field: "precioCosto")}</td>

                                <td>
                                    <a class="btn btn-sm btn-info verItem" href="#" rel="tooltip" title="Ver">
                                        <i class="fa fa-laptop"></i></a>

                                    <a class="btn btn-sm btn-success editarItem" href="#" rel="tooltip" title="Editar">
                                    <i class="fa fa-pencil"></i></a>

                                    <a class="btn btn-sm btn-danger eliminarItem" href="#" rel="tooltip" title="Eliminar">
                                        <i class="fa fa-trash-o"></i></a>
                                </td>
                                
                            </tr>
                        </g:each>
                    </tbody>
                </table>
                %{--<g:if test="${itemInstanceList.size() < itemInstanceTotal}">--}%
                    %{--<div class="pagination">--}%
                        %{--<g:paginate total="${itemInstanceTotal}"  prev="Ant." next="Sig." />--}%
                    %{--</div>--}%
                %{--</g:if>--}%
            %{--</div>--}%
        %{--</div>--}%

        %{--<ul id="menu-item" class="contextMenu">--}%
            %{--<li class="show">--}%
                %{--<a href="#show">Ver</a>--}%
            %{--</li>--}%
            %{--<li class="edit">--}%
                %{--<a href="#edit">Editar</a>--}%
            %{--</li>--}%
            %{--<li class="delete">--}%
                %{--<a href="#delete">Eliminar</a>--}%
            %{--</li>--}%
        %{--</ul>--}%

        <div id="dlg-item" style="width: 960px; height: 380px"></div>

        <div id="dlgLoad" class="ui-helper-hidden" style="text-align:center;">
            Cargando.....Por favor espere......<br/><br/>
            <img src="${resource(dir: 'images', file: 'spinner64.gif')}" alt=""/>
        </div>

        <script type="text/javascript">


            //crear

            $(".btnCrear").click(function() {
                createEditRow();
                return false;
            });


            function createEditRow(id) {
                var title = id ? "Editar" : "Crear";
                var data = id ? { id: id } : {};
                $.ajax({
                    type    : "POST",
                    url     : "${createLink(action:'create')}",
                    data    : data,
                    success : function (msg) {
                        var b = bootbox.dialog({
                            id      : "dlgCreateEdit",
                            title   : title + " Año",
                            message : msg,
                            buttons : {
                                cancelar : {
                                    label     : "Cancelar",
                                    className : "btn-primary",
                                    callback  : function () {
                                    }
                                },
                                guardar  : {
                                    id        : "btnSave",
                                    label     : "<i class='fa fa-save'></i> Guardar",
                                    className : "btn-success",
                                    callback  : function () {
                                        return submitForm();
                                    } //callback
                                } //guardar
                            } //buttons
                        }); //dialog
                         setTimeout(function () {
                        b.find(".form-control").not(".datepicker").first().focus()
                    }, 500);
                    } //success
                }); //ajax
            } //createEdit






            function openDlg(url, id, cont, ajax, title, buttons) {
                if (ajax) {
                $("#dlgLoad").dialog("open");
                    $.ajax({
                        async   : false,
                        type    : "POST",
                        url     : url,
                        data    : {
                            id : id
                        },
                        success : function (msg) {
                            $("#dlg-item").html(msg);
                        },
                        complete : function () {
                            $("#dlgLoad").dialog("close");
                        }
                    });
                    $("#dlg-item").dialog("option", "width", 960);
                } else {
                $("#dlg-item").html(cont);
                }
                $("#dlg-item").dialog("option", "title", title);
                $("#dlg-item").dialog("option", "buttons", buttons);
                $("#dlg-item").dialog("open");
            }

            function submitForm() {
                if ($("#frm-item").valid()) {
                    $("#dlgLoad").dialog("open");
                    var data = $("#frm-item").serialize();
                    var url = $("#frm-item").attr("action");
                              console.log(data)
                    $.ajax({
                        type    : "POST",
                        url     : url,
                        data    : data,
                        success : function (msg) {
                            location.reload(true);
                        }
                    });
                }
            }

            $(function () {
                $("#dlgLoad").dialog({
                    modal         : true,
                    autoOpen      : false,
                    closeOnEscape : false,
                    draggable     : false,
                    resizable     : false,
                    zIndex        : 9000,
                    open          : function (event, ui) {
                        $(event.target).parent().find(".ui-dialog-titlebar-close").remove();
                    }
                });

                $("#dlg-item").dialog({
                    modal    : true,
                    autoOpen : false,
                    width    : 960,
                    zIndex   : 1000,
                    position : "center"
                });

                $("th").hover(function () {
                    $(this).addClass("hover");
                    var i = $(this).index();
                    $("#tb-item").find("tr").each(function () {
                        $(this).children().eq(i).addClass("hover");
                    });
                }, function () {
                    $(".hover").removeClass("hover");
                });

                $("#tb-item").find("tr").hover(function () {
                    $(this).addClass("hover");
                }, function () {
                    $(".hover").removeClass("hover");
                });

//                $(".btnNew").button({
                $(".btnCrear").button({
                    icons : {
                        primary : "ui-icon-document"
                    }
                }).click(function () {
                            var id = $(this).attr("id");
                            var url = $(this).attr("href");
                            var title = "Crear Item";
                            var buttons = {
                                "Guardar"  : function () {
                                    submitForm();
                                },
                                "Cancelar" : function () {
                                    $("#dlg-item").dialog("close");
                                }
                            };
                            openDlg(url, id, "", true, title, buttons);
                            return false;
                        });

                $("#tb-item").find("tr").contextMenu({
                            menu : "menu-item"
                        },
                        function (action, el, pos) {
                            $("#dlg-item").html("");
                            var id = $(el).attr("id");
                            var title, buttons, url, cont;
                            switch (action) {
                                case "edit":
                                    title = "Editar Item";
                                    buttons = {
                                        "Guardar"  : function () {
                                            submitForm();
                                        },
                                        "Cancelar" : function () {
                                            $("#dlg-item").dialog("close");
                                        }
                                    };
                                    url = "${createLink(action:'edit')}/" + id;
                                    break;
                                case "show":
                                    title = "Ver Item";
                                    buttons = {
                                        "Aceptar" : function () {
                                            $("#dlg-item").dialog("close");
                                        }
                                    };
                                    url = "${createLink(action:'show')}/" + id;
                                    break;
                                case "delete":
                                    title = "Eliminar Item";
                                    buttons = {
                                        "Aceptar"  : function () {
                                            $("#dlgLoad").dialog("open");
                                            $.ajax({
                                                type    : "POST",
                                                url     : "${createLink(action:'delete')}",
                                                data    : {
                                                    id : id
                                                },
                                                success : function (msg) {
                                                    location.reload(true);
                                                }
                                            });
                                        },
                                        "Cancelar" : function () {
                                            $("#dlg-item").dialog("close");
                                        }
                                    };
                                    cont = "<span style='font-size: 16px;'> Est&aacute; seguro de querer eliminar este Item?";
                                    cont += "<br/>Esta acci&oacute;n es definitiva.</span>"
                                    $("#dlg-item").dialog("option", "width", 360);
                                    break;
                            }
                            openDlg(url, id, cont, action != "delete", title, buttons);
                        });
            });
        </script>
    </body>
</html>
