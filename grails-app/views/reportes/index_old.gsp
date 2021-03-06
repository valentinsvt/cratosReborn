<%@ page import="cratos.Cuenta; cratos.Periodo" contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main">
        <title>Reportes</title>

        <style type="text/css">
        .lista, .desc {
            float       : left;
            min-height  : 150px;
            margin-left : 25px;
        }

        .lista {
            width : 700px;
        }

        .desc {
            width : 265px;
        }

        .link {
            font-weight     : bold;
            text-decoration : none;
        }

        .noBullet {
            list-style : none;
            margin     : 1em;
            padding    : 0;
        }

        .noBullet li {
            margin-bottom : 10px;
        }

        .linkHover {
            text-decoration : overline underline;
        }

        .uno {

            float      : left;
            width      : 150px;
            margin-top : 10px;
        }

        .dos {

            float      : left;
            width      : 250px;
            margin-top : 10px;
        }

        .fila {
            height : 40px;
        }
        </style>

    </head>

    <body>
        <div id="list-empresa" class="content scaffold-list" role="main">
            <div class="nav navegacion" style="background: #ffffff; box-shadow: none;">

            </div>
            <g:if test="${msn}">
                <div style="width: 800px;line-height: 30px;height: 30px;padding-left: 10px;">
                    ${msn}
                </div>
            </g:if>


            <div class="contenedor">
                <h1>Reportes</h1>
                <g:if test="${flash.message}">
                    <div class="message ${flash.clase}" role="status"><span class="ss_sprite ${flash.ico}">&nbsp;</span>${flash.message}
                    </div>
                </g:if>



                <div class="ui-widget-content ui-corner-all lista">
                    <ul class="noBullet">
                        <li text="plcn">
                            %{--<g:link controller="reportes" action="planDeCuentas"  file="Plan_de_Cuentas.pdf" class="link"--}%
                            %{--dialog="dlgContabilidad">--}%
                            %{--Plan de cuentas--}%
                            %{--</g:link>--}%

                            <a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#planCuentas">
                                Plan de Cuentas
                            </a>

                            Plan de cuentas o catálogo de cuentas de la contabilidad.
                        </li>

                        <li text="gscn">
                            %{--<g:link controller="reportes" action="gestorContable" file="Gestor_Contable.pdf" class="link"--}%
                            %{--dialog="dlgContabilidad">--}%
                            %{--Gestor contable--}%
                            %{--</g:link>--}%

                            <a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#gestorContable">
                                Gestor Contable
                            </a>

                            Sirve para determinar las cuentas que son afectadas en un proceso contable

                        </li>

                        <li text="cmpr">
                            %{--<g:link controller="reportes" action="comprobante" file="Comprobante.pdf" class="link"--}%
                            %{--dialog="dlgComprobante">--}%
                            %{--Comprobante--}%
                            %{--</g:link>--}%

                            <a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#comprobante">
                                Comprobante
                            </a>

                            Permite imprimir un comprobante

                        </li>

                        <li text="blcm">
                            %{--<g:link controller="reportes" action="balanceComprobacion" file="Balance_Comprobacion.pdf" class="link"--}%
                            %{--dialog="dlgContabilidadPeriodo">--}%
                            %{--Balance de comprobaci&oacute;n--}%
                            %{--</g:link>--}%

                            <a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#balance">
                                Balance de Comprobación
                            </a>
                            Muestra el balance de comprobaci&oacute;n en detalle a todos los niveles
                        </li>

                        <li text="stfn">
                            %{--<g:link controller="reportes2" action="situacionFinanciera" file="Situacion_Financiera.pdf" class="link"--}%
                            %{--dialog="dlgContabilidadPeriodo">--}%
                            %{--Estado de situaci&oacute;n financiera--}%
                            %{--</g:link>--}%

                            <a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#situacion">
                                Estado de Situación Financiera
                            </a>


                            Conocido anteriormente como Balance General
                        </li>

                        <li text="rsin">
                            %{--<g:link controller="reportes2" action="estadoDeResultados" file="Estado_Resultado_Integral.pdf" class="link"--}%
                            %{--dialog="dlgContabilidadPeriodo">--}%
                            %{--Estado del resultado integral--}%
                            %{--</g:link>--}%

                            <a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#integral">
                                Estado del Resultado Integral
                            </a>

                            Este reporte se conocía como Estado de Pérdidas y Ganancias
                        </li>




                        %{--<li text="fldf">--}%
                        %{--<g:link controller="reportes" action="flujoEfectivo" file="Estado_Flujos_Efectivo.pdf" class="link"--}%
                        %{--dialog="dlgContabilidadPeriodo">--}%
                        %{--Estado de flujos de efectivo--}%
                        %{--</g:link>--}%

                        %{--<a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#flujo">--}%
                        %{--Estado de flujos de efectivo--}%
                        %{--</a>--}%

                        %{--Estado de flujo de efectivo en función del año anterior--}%
                        %{--</li>--}%

                        %{--<li text="patr">--}%
                        %{--<g:link controller="reportes" action="cambiosPatrimonio" file="Estado_Cambios_Patrimonio.pdf" class="link"--}%
                        %{--dialog="dlgContabilidadPeriodo">--}%
                        %{--Estado de Cambios en el Patrimonio--}%
                        %{--</g:link>--}%

                        %{--<a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#patrimonio">--}%
                        %{--Estado de Cambios en el Patrimonio--}%
                        %{--</a>--}%



                        %{--Estado de cambios en el patrimonio durante el ejercicio fiscal--}%
                        %{--</li>--}%

                        %{--<li text="pags">--}%
                        %{--<g:link controller="reportes2" action="reportePagos" file="Pagos.pdf" class="link"--}%
                        %{--dialog="dlgPagos">--}%
                        %{--Pagos--}%
                        %{--</g:link>--}%
                        %{--Pagos--}%
                        %{--</li>--}%

                        <li text="auct">
                            %{--<g:link controller="reportes" action="auxiliaresContables" file="Auxiliar_Contable.pdf" class="link"--}%
                            %{--dialog="dlgAuxiliarContable">--}%
                            %{--Libro mayor--}%
                            %{--</g:link>--}%
                            <a href="#" class="link btn btn-info btn-ajax" data-target="#auxiliar" data-toggle="modal">
                                Libro Mayor
                            </a>
                            Auxiliar Contable
                        </li>

                        <li text="axcl">
                            %{--<g:link controller="reportes3" action="auxiliarPorCliente" file="Auxiliar_Cliente.pdf" class="link"--}%
                            %{--dialog="dlgAuxiliarCliente">--}%
                            %{--Auxiliar por Cliente--}%
                            %{--</g:link>--}%
                            <a href="#" class="link btn btn-info btn-ajax" data-target="#cliente" data-toggle="modal">
                                Auxiliar por Cliente
                            </a>
                            Auxiliar por cliente
                        </li>

                        <li text="blgn">
                            %{--<g:link controller="reportes3" action="balanceGeneralAuxiliares" file="Balance_general.pdf" class="link"--}%
                            %{--dialog="dlgContabilidadPeriodo">--}%
                            %{--Balance general con auxiliares--}%
                            %{--</g:link>--}%
                            <a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#balanceAuxiliares">
                                Balance general con auxiliares
                            </a>
                            Balance general con auxiliares, o Estado de situación financiera
                        </li>

                        %{--<li text="fact">--}%

                        %{--<g:link controller="reportes" action="reporteFacturacion" file="Reporte_Ventas_Facturacion.pdf" class="link" dialog="dlgVentasFacturacion">--}%

                        %{--Ventas Facturación--}%
                        %{--</g:link>--}%

                        %{--Reporte de Ventas Facturación--}%

                        %{--</li>--}%

                        %{--<li text="vnts">--}%
                        %{--<g:link controller="reportes3" action="reporteCxP" file="Cuentas_por_pagar.pdf" class="link"--}%
                        %{--dialog="dlgcxp">--}%
                        %{--Cuentas por pagar--}%
                        %{--</g:link>--}%
                        %{--Reporte de cuentas por pagar--}%
                        %{--</li>--}%

                        <li text="balg">
                            %{--<g:link controller="reportes" action="balanceG" file="balanceG.pdf" class="link"--}%
                            %{--dialog="balanceDialog">--}%
                            %{--Balance--}%
                            %{--</g:link>--}%

                            <a href="#" class="link btn btn-info btn-ajax" data-toggle="modal" data-target="#general">
                                Balance General
                            </a>

                            Balance General
                        </li>

                    </ul>
                </div>

                <div class="desc">
                    <div id="plcn" class="notice ui-helper-hidden ui-corner-all">
                        <h1>Plan de cuentas</h1><br>

                        <p>Se fija un catálogo de cuentas para cada periodo contable. Usualmente, el catálogo se conserva
                        de un período a otro, si hubieran cambios, se debe indicar las nuevas cuentas y su relación con las
                        cuentas del periodo anterior.
                        </p>

                        <p>Reporta el plan de cuentas con sus números de cuenta, cuenta padre, nivel y descripción o nombre de la cuenta.</p>

                        <p>El sistema requiere que se seleccione la contabilidad o período contable.</p>
                    </div>

                    <div id="gscn" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Gestor</h1><br>

                        <p>Para cada proceso contable es necesario definir las cuentas que van a participar.</p>

                        <p>El gestor permite la creación de comprobantes y asientos contables en forma automática.</p>

                        <p>Se reprotan todos los gestores contables que se hallen activos en el sistema.</p>
                    </div>

                    <div id="prsp" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Presupuesto</h1><br>

                        <p>Para cada una de las partidas se fija un presupuesto es una estructura jeráquica</p>

                        <p>El reporte requiere de la selección del periodo presupuestario.</p>

                        <p>Se muestra el número de la partida, el nombre y el valor asignado.</p>
                    </div>

                    <div id="cmpr" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Comprobante</h1><br>

                        <p>Reporta los comprobantes registrados en el sistema.</p>

                        <p>Se requiere del número de comprobante o de la descripción. El reporteador cuenta con un buscador para ayudarle
                        a localizar el comprobante a imprimir</p>

                        <p>Use el botón "Buscar" para acceder al buscador. Se puede ingreasar parte del concepto del comprobante o el número.</p>

                        <p>Desde la lista de comprobantes, use el botón marcado con un visto para seleccionarlo.</p>
                    </div>

                    <div id="blcm" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Balance de Comprobaci&oacute;n</h1><br>

                        <p>Reporte el Balance de Comprobación para un mes determinado.</p>

                        <p>Este reporte muestra el total de los movimientos al debe y haber de todas las cuentas de movimiento, y
                        presenta también los saldos deudor o acreedor de cada una de ellas.</p>

                        <p>El reporte es hasta la fecha final del periodo seleccionado.</p>
                    </div>

                    <div id="stfn" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Situaci&oacute;n Financiera</h1><br>

                        <p>Este reporte muesta el resultado del ejercicio financiero. Anteriormente era conocido como Balance General</p>

                        <p>No es necesario cerrar la contabilidad para obtener este reporte. En el caso de períodos contables anteriores,
                        el resultado queda registrado dentro de la cuenta de utilidades correspondiente</p>
                    </div>

                    <div id="rsin" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Resultado Integral</h1><br>

                        <p>En este reporte se detallan todos los ingresos y egresos que han existido dentro del periodo contable, con lo
                        cual se llega de determinar la utilidad del período</p>

                        <p>El valor final reportado es el resultado de utilidades</p>
                    </div>

                    <div id="fldf" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Flujo de Efectivo</h1><br>

                        <p>El reporte de Flujo de Efectivo muestra el efectivo generado por la actividad operacional, el generado por
                        las actividades de inversión y el generado por las actividades de financiamiento.</p>

                        <p>El valor final muestra el aumento neto del efectivo y sus valores al inicio y fin del período.</p>
                    </div>

                    <div id="patr" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Cambios en el Patrimonio</h1><br>

                        <p>El reporte muestra las variaciones sufridas en el patrimonio con respecto al inicio de periodo contable.</p>

                        <p>Los cambios visualizados son: aumentos y disminuciones patrimoniales y los saldos finales.</p>
                    </div>

                    <div id="pags" class="notice ui-helper-hidden ui-corner-all ">
                        <h1>Pagos</h1><br>

                        <p>Pagos.</p>
                    </div>

                    <div id="auct" class="notice ui-helper-hidden ui-corner-all">
                        <h1>Auxiliares Contables</h1><br>

                        <p>Auxiliares Contables</p>

                    </div>

                    <div id="axcl" class="notice ui-helper-hidden ui-corner-all">
                        <h1>Auxiliares por Cliente</h1><br>

                        <p>Auxiliares por Cliente</p>

                    </div>

                    <div id="blgn" class="notice ui-helper-hidden ui-corner-all">
                        <h1>Balance general con auxiliares</h1><br>

                        <p>Balance general con auxiliares, o estado de situación financiera</p>

                    </div>

                    <div id="fact" class="notice ui-helper-hidden ui-corner-all">

                        <h1>Ventas Facturación</h1><br>

                        <p>Reporte de Ventas Facturación</p>

                    </div>

                </div>
            </div>
        </div>




        %{--//dialog de contabilidad--}%

        <div class="modal fade" id="planCuentas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Plan de Cuentas - Elegir Contabilidad</h4>
                    </div>

                    <div class="modal-body fila" style="margin-bottom: 30px">
                        <label class="uno">Contabilidad:</label>
                        <g:select name="contCuentas" id="contCuentas"
                                  from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                  optionKey="id" optionValue="descripcion"
                                  class="ui-widget-content ui-corner-all dos"/>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarPlan btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>

        %{--dialog de gestor contable--}%

        <div class="modal fade" id="gestorContable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalGestor">Gestor Contable - Elegir Contabilidad</h4>
                    </div>

                    <div class="modal-body fila" style="margin-bottom: 30px">
                        <label class="uno">Contabilidad:</label>
                        <g:select name="contContable" id="contContable"
                                  from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                  optionKey="id" optionValue="descripcion"
                                  class="ui-widget-content ui-corner-all dos"/>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarGestor btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>

        %{--dialog comprobante--}%

        <div class="modal fade" id="comprobante" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalComprobante">Comprobante</h4>
                    </div>

                    <div class="modal-body">
                        <div class="fila">
                            <label class="uno">Contabilidad:</label>

                            <g:select name="contComp" id="contComp"
                                      from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                      optionKey="id" optionValue="descripcion"
                                      class="ui-widget-content ui-corner-all dos"/>
                        </div>

                        <div class="fila">

                            <label class="uno">Tipo:</label>

                            <g:select class="dos" name="compTipo" from="${cratos.TipoComprobante.list()}" optionKey="id" optionValue="descripcion"/>
                        </div>

                        <div class="fila">
                            <label class="uno">Número:</label>
                            <g:textField type="text" class="ui-widget-content ui-corner-all dos" name="compNum"/>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarComprobante btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>

        %{--dialog balance--}%
        <div class="modal fade" id="balance" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalBalance">Balance</h4>
                    </div>

                    <div class="modal-body" id="bodyBalance">
                        <div class="fila">
                            <label class="uno">Contabilidad:</label>
                            <g:select name="contP" id="contP"
                                      from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                      optionKey="id" optionValue="descripcion"
                                      class="ui-widget-content ui-corner-all dos"/>
                        </div>

                        <div id="divPeriodo" class="fila">
                            <label class="uno">Período:</label>

                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarBalance btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>


        %{--dialog situacion financiera--}%
        <div class="modal fade" id="situacion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalSituacion">Situación Financiera</h4>
                    </div>

                    <div class="modal-body" id="bodySituacion">
                        <div class="fila">
                            <label class="uno">Contabilidad:</label>
                            <g:select name="contP8" id="contP8"
                                      from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                      optionKey="id" optionValue="descripcion"
                                      class="ui-widget-content ui-corner-all dos"/>
                        </div>

                        <div id="divPeriodo8" class="fila">
                            <label class="uno">Período:</label>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarSituacion btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>

        %{--dialog resultado Integral--}%


        <div class="modal fade" id="integral" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalIntegral">Estado del Resultado Integral</h4>
                    </div>

                    <div class="modal-body" id="bodyIntegral">
                        <div class="fila">
                            <label class="uno">Contabilidad:</label>

                            <g:select name="contP9" id="contP9"
                                      from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                      optionKey="id" optionValue="descripcion"
                                      class="ui-widget-content ui-corner-all dos"/>
                        </div>

                        <div id="divPeriodo9" class="fila">
                            <label class="uno">Período:</label>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarIntegral btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>


        %{--dialog auxiliar contable--}%


        <div class="modal fade" id="auxiliar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalAuxiliar">Estado del Resultado Integral</h4>
                    </div>

                    <div class="modal-body" id="bodyAuxiliar">
                        <div class="fila">
                            <label class="uno">Contabilidad:</label>

                            <g:select name="contP3" id="contP3"
                                      from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                      optionKey="id" optionValue="descripcion"
                                      class="ui-widget-content ui-corner-all dos"/>
                        </div>

                        <div id="divPeriodo3" class="fila">
                            <label class="uno">Periodo:</label>

                        </div>

                        <div id="divCuenta3" class="fila">
                            <label class="uno">Cuenta:</label>
                            <g:select name="cnta3" from="${cratos.Cuenta.findAllByEmpresa(session.empresa, [sort: 'numero'])}"
                                      optionKey="id" class="ui-widget-content ui-corner-all dos"/>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                            </button>
                            <button type="button" class="btn btnAceptarAuxiliar btn-success"><i class="fa fa-print"></i> Aceptar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        %{--dialog auxiliar por cliente--}%


        <div class="modal fade" id="cliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalAuxCliente">Auxiliar por Cliente</h4>
                    </div>

                    <div class="modal-body" id="bodyAuxCliente">
                        <div class="fila">
                            <label class="uno">Contabilidad:</label>
                            <g:select name="contP4" id="contP4"
                                      from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                      optionKey="id" optionValue="descripcion"
                                      class="ui-widget-content ui-corner-all dos"/>
                        </div>

                        <div id="divPeriodo4" class="fila">
                            <label class="uno">Periodo:</label>
                        </div>

                        <div id="divCliente" class="fila">
                            <label class="uno">Clientes:</label>
                            <g:select name="listaClientes" from="${clientes}" optionValue="nombre" optionKey="id" class="dos"/>

                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarAuxCliente btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>

        %{--dialog balance x auxiliares--}%

        <div class="modal fade" id="balanceAuxiliares" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalBalanceAux">Auxiliar por Cliente</h4>
                    </div>

                    <div class="modal-body" id="bodyBalanceAux">

                        <div class="fila">
                            <label class="uno">Contabilidad:</label>
                            <g:select name="contP0" id="contP0"
                                      from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                      optionKey="id" optionValue="descripcion"
                                      class="ui-widget-content ui-corner-all dos"/>
                        </div>

                        <div id="divPeriodo0" class="fila">
                            <label class="uno">Periodo:</label>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarBalanceAux btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>







        %{--dialog flujo efectivo--}%


        %{--<div class="modal fade" id="flujo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--}%
        %{--<div class="modal-dialog">--}%
        %{--<div class="modal-content">--}%
        %{--<div class="modal-header">--}%
        %{--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--}%
        %{--<h4 class="modal-title" id="modalFlujo">Estado de Flujos de Efectivo</h4>--}%
        %{--</div>--}%
        %{--<div class="modal-body" id="bodyFlujo">--}%
        %{--<div>--}%
        %{--Contabilidad:--}%
        %{--<g:select name="contP7" id="contP7"--}%
        %{--from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"--}%
        %{--optionKey="id" optionValue="descripcion"--}%
        %{--class="ui-widget-content ui-corner-all"/>--}%
        %{--</div>--}%

        %{--<div id="divPeriodo7">--}%
        %{--Período:--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--<div class="modal-footer">--}%
        %{--<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>--}%
        %{--<button type="button" class="btn btnAceptarFlujo btn-success"><i class="fa fa-print"></i> Aceptar</button>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%

        %{--dialog patrimonio--}%


        %{--<div class="modal fade" id="patrimonio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--}%
        %{--<div class="modal-dialog">--}%
        %{--<div class="modal-content">--}%
        %{--<div class="modal-header">--}%
        %{--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--}%
        %{--<h4 class="modal-title" id="modalPatrimonio">Estado de Flujos de Efectivo</h4>--}%
        %{--</div>--}%
        %{--<div class="modal-body" id="bodyPatrimonio">--}%
        %{--<div>--}%
        %{--Contabilidad:--}%
        %{--<g:select name="contP7" id="contP7"--}%
        %{--from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"--}%
        %{--optionKey="id" optionValue="descripcion"--}%
        %{--class="ui-widget-content ui-corner-all"/>--}%
        %{--</div>--}%

        %{--<div id="divPeriodo7">--}%
        %{--Período:--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--<div class="modal-footer">--}%
        %{--<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>--}%
        %{--<button type="button" class="btn btnAceptarPatrimonio btn-success"><i class="fa fa-print"></i> Aceptar</button>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%

        %{--dialog balance general--}%

        <div class="modal fade" id="general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="modalGeneral">Balance General</h4>
                    </div>

                    <div class="modal-body" id="bodyGeneral">

                        <div style="margin-bottom: 10px;">
                            Antes de generar este reporte asegurese de configurar las cuentas para el cálculo de resultados <a href="${g.createLink(controller: 'cuenta', action: 'cuentaResultados')}" style="color: blue">Aquí</a>
                        </div>

                        <div class="fila">
                            <label class="uno">Contabilidad:</label>
                            <g:select name="contP6" id="contP6"
                                      from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                                      optionKey="id" optionValue="descripcion"
                                      class="ui-widget-content ui-corner-all dos"/>
                        </div>

                        <div id="divPeriodo6" class="fila">
                            <label class="uno">Periodo:</label>
                        </div>

                        <div class="fila">
                            <label class="uno">Nivel:</label>
                            <select id="nivel" class="dos">
                                <option value="1,2">DOS</option>
                                <option value="1,2,3">TRES</option>
                                <option value="1,2,3,4">CUATRO</option>
                                <option value="1,2,3,4,5">CINCO</option>
                            </select>
                        </div>

                        <div class="fila">
                            Mostrar cuentas con saldo cero? <input type="checkbox" id="cero" value="1" checked="true">
                        </div>

                        <div class="fila">
                            <label class="uno">Firma:</label>
                            <input type="text" id="firma1" class="dos">
                        </div>

                        <div class="fila">
                            <label class="uno">Firma:</label>
                            <input type="text" id="firma2" class="dos">
                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar
                        </button>
                        <button type="button" class="btn btnAceptarGeneral btn-success"><i class="fa fa-print"></i> Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>





        %{--<div id="dlgContabilidad" class="ui-helper-hidden">--}%
        %{--Contabilidad:--}%
        %{--<g:select name="cont" from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"--}%
        %{--optionKey="id" optionValue="descripcion"--}%
        %{--class="ui-widget-content ui-corner-all"/>--}%
        %{--</div>--}%

        %{--<div id="dlgComprobante" class="ui-helper-hidden">--}%
        %{--Contabilidad:--}%
        %{--<g:select name="compCont" from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"--}%
        %{--optionKey="id" optionValue="descripcion"--}%
        %{--class="ui-widget-content ui-corner-all"/><br/>--}%
        %{--Tipo: <g:select name="compTipo" from="${cratos.TipoComprobante.list()}" optionKey="id" optionValue="descripcion"/>--}%
        %{--Número: <g:textField type="text" class="ui-widget-content ui-corner-all" name="compNum"/>--}%
        %{--</div>--}%

        <div id="dlgcxp" class="ui-helper-hidden">

            Desde: <elm:datepicker class="field ui-corner-all" title="Desde" name="fechaIncio" format="yyyy-MM-dd"
                                   style="width: 80px" id="desde"/>
            Hasta: <elm:datepicker class="field ui-corner-all" title="Hasta" name="fechaFin" format="yyyy-MM-dd"
                                   style="width: 80px" id="hasta"/>
        </div>


        <div id="dlgPagos" class="ui-helper-hidden">

            <div>

                Proveedor <g:select name="proveedorPagos" from="${cratos.Proveedor.findAllByEmpresa(session.empresa, [sort: 'nombre'])}" optionKey="id"/>

            </div>

            Desde: <elm:datepicker class="field ui-corner-all" title="Desde" name="fechaIncio" format="yyyy-MM-dd"
                                   style="width: 80px" id="desdePagos"/>
            Hasta: <elm:datepicker class="field ui-corner-all" title="Hasta" name="fechaFin" format="yyyy-MM-dd"
                                   style="width: 80px" id="hastaPagos"/>

        </div>




        %{--<div id="dlgContabilidadPeriodo" class="ui-helper-hidden">--}%
        %{--<div>--}%
        %{--Contabilidad:--}%
        %{--<g:select name="contP" id="contP"--}%
        %{--from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"--}%
        %{--optionKey="id" optionValue="descripcion"--}%
        %{--class="ui-widget-content ui-corner-all"/>--}%
        %{--</div>--}%

        %{--<div id="divPeriodo">--}%
        %{--Periodo:--}%
        %{--</div>--}%
        %{--</div>--}%

        <div id="dlgContabilidadPeriodoCuenta" class="ui-helper-hidden">
            <div>
                Contabilidad:
                <g:select name="contP2" id="contP2"
                          from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                          optionKey="id" optionValue="descripcion"
                          class="ui-widget-content ui-corner-all"/>
            </div>

            <div id="divPeriodo2">
                Periodo:
            </div>

            <div id="divCuenta">
                Cuenta:

            </div>
        </div>

        %{--<div id="dlgAuxiliarContable" class="ui-helper-hidden">--}%
        %{--<div>--}%
        %{--Contabilidad:--}%
        %{--<g:select name="contP3" id="contP3"--}%
        %{--from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"--}%
        %{--optionKey="id" optionValue="descripcion"--}%
        %{--class="ui-widget-content ui-corner-all"/>--}%
        %{--</div>--}%

        %{--<div id="divPeriodo3">--}%
        %{--Periodo:--}%

        %{--</div>--}%

        %{--<div id="divCuenta3">--}%
        %{--Cuenta:--}%
        %{--<g:select name="cnta3" from="${cratos.Cuenta.findAllByEmpresa(session.empresa, [sort: 'numero'])}"--}%
        %{--optionKey="id" style="width: 750px;"--}%
        %{--class="ui-widget-content ui-corner-all"/>--}%

        %{--</div>--}%
        %{--</div>--}%

        %{--<div id="dlgAuxiliarCliente" class="ui-helper-hidden">--}%
        %{--<div>--}%
        %{--Contabilidad:--}%
        %{--<g:select name="contP4" id="contP4"--}%
        %{--from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"--}%
        %{--optionKey="id" optionValue="descripcion"--}%
        %{--class="ui-widget-content ui-corner-all"/>--}%
        %{--</div>--}%

        %{--<div id="divPeriodo4">--}%
        %{--Periodo:--}%
        %{--</div>--}%

        %{--<div id="divCliente">--}%
        %{--<bsc:buscador name="proveedor.id" value="" accion="listarClientes" campos="${camposCliente}" label="Proveedor" tipo="buscador"/>--}%
        %{--<a href="#" id="btnTodosPrv">Todos</a>--}%
        %{--</div>--}%
        %{--</div>--}%


        <div id="dlgVentasFacturacion" class="ui-helper-hidden">
            <div>
                Contabilidad:
                <g:select name="contP5" id="contP5"
                          from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"
                          optionKey="id" optionValue="descripcion"
                          class="ui-widget-content ui-corner-all"/>
            </div>

            <div id="divPeriodo5">
                Periodo:

            </div>

            <div id="divCuentaVentasFact">

                <g:set var="hijos" value="${cratos.Cuenta.findAllByPadre(Cuenta.get(1518))}"/>
                <g:set var="hijos2" value="${cratos.Cuenta.findAllByNumeroIlike("4.%")}"/>

                Cuenta:
                <g:select name="cuentasVentasFact"
                          optionKey="id" style="width: 750px;"
                          class="ui-widget-content ui-corner-all" from="${hijos2}"/>

            </div>

            %{--<div id="balanceDialog" class="ui-helper-hidden">--}%
            %{--<div style="margin-bottom: 10px;">--}%
            %{--Antes de generar este reporte asegurese de configurar las cuentas para el cálculo de resultados <a href="${g.createLink(controller: 'cuenta',action: 'cuentaResultados')}" style="color: blue">Aquí</a>--}%
            %{--</div>--}%
            %{--<div>--}%
            %{--Contabilidad:--}%
            %{--<g:select name="contP6" id="contP6"--}%
            %{--from="${cratos.Contabilidad.findAllByInstitucion(session.empresa, [sort: 'fechaInicio'])}"--}%
            %{--optionKey="id" optionValue="descripcion"--}%
            %{--class="ui-widget-content ui-corner-all"/>--}%
            %{--</div>--}%

            %{--<div id="divPeriodo6">--}%
            %{--Periodo:--}%
            %{--</div>--}%
            %{--<div>--}%
            %{--Nivel:--}%
            %{--<select id="nivel">--}%
            %{--<option value="1,2">DOS</option>--}%
            %{--<option value="1,2,3">TRES</option>--}%
            %{--<option value="1,2,3,4">CUATRO</option>--}%
            %{--<option value="1,2,3,4,5">CINCO</option>--}%
            %{--</select>--}%
            %{--</div>--}%
            %{--<div>--}%
            %{--Mostrar cuentas con saldo cero? <input type="checkbox" id="cero" value="1" checked="true">--}%
            %{--</div>--}%
            %{--<div>--}%
            %{--Firma: <input type="text" id="firma1">--}%
            %{--</div>--}%
            %{--<div>--}%
            %{--Firma: <input type="text" id="firma2">--}%
            %{--</div>--}%
            %{--</div>--}%

        </div>

        <script type="text/javascript">

            //nuevo

            //antiguo
            var actionUrl = "";

            function updateCuenta() {
                var per = $("#periodo2").val();
                ////console.log(per);
                $.ajax({
                    type    : "POST",
                    url     : "${createLink(controller: 'reportes2', action:'updateCuenta')}",
                    data    : {
                        per : per
                    },
                    success : function (msg) {
                        $("#divCuenta").html(msg);
                    }
                });
            }

            function updatePeriodo(cual) {
                var cont = $("#contP" + cual).val();

                console.log("cont" + cont);

                $.ajax({
                    type    : "POST",
                    url     : "${createLink(action:'updatePeriodo')}",
                    data    : {
                        cont : cont,
                        cual : cual
                    },
                    success : function (msg) {
                        $("#divPeriodo" + cual).html(msg);
                    }
                });

//                console.log(cont);
            }
            $(function () {

                $(".link").hover(
                        function () {
                            $(this).addClass("linkHover");
                            $(".notice").hide();
                            var id = $(this).parent().attr("text");
                            $("#" + id).show();
                        },
                        function () {
                            $(this).removeClass("linkHover");
                            $(".notice").hide();
                        }).click(function () {
                            var url = $(this).attr("href");
                            var file = $(this).attr("file");

                            var dialog = $.trim($(this).attr("dialog"));

                            var cont = $.trim($(this).text());

                            $("#" + dialog).dialog("option", "title", cont);
                            $("#" + dialog).dialog("open");

                            actionUrl = "${createLink(controller:'pdf',action:'pdfLink')}?filename=" + file + "&url=" + url;

//                            console.log(actionUrl);

                            %{--<g:link action="pdfLink" controller="pdf" params="[url: g.createLink(controller: 'reportes', action: 'planDeCuentas'), filename: 'Plan_de_Cuentas.pdf']">--}%
                            %{--plan de cuentas--}%
                            %{--</g:link>--}%

//                            console.log(url, file);

                            return false;
                        });

                $("#contP").change(function () {
                    updatePeriodo("");
                });
                $("#contP2").change(function () {
                    updatePeriodo("2");
                });
                $("#contP3").change(function () {
                    updatePeriodo("3");
                });
                $("#contP4").change(function () {
                    updatePeriodo("4");
                });
                $("#contP5").change(function () {
                    updatePeriodo("5");
                });
                $("#contP6").change(function () {
                    updatePeriodo("6");
                });

                $("#contP7").change(function () {
                    updatePeriodo("7");
                });
                $("#contP8").change(function () {
                    updatePeriodo("8");
                });
                $("#contP9").change(function () {
                    updatePeriodo("9");
                });

                $("#contP0").change(function () {
                    updatePeriodo("0");
                });

                $(".btnAceptarPlan").click(function () {

                    var cont = $("#contCuentas").val()

                    url = "${g.createLink(controller:'reportes' , action: 'planDeCuentas')}?cont=" + cont + "Wempresa=${session.empresa.id}";
                    location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=plan de cuentas.pdf"

                });

                $(".btnAceptarGestor").click(function () {
                    var cont = $("#contContable").val()
                    url = "${g.createLink(controller:'reportes' , action: 'gestorContable')}?cont=" + cont + "Wempresa=${session.empresa.id}";
                    location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=gestor contable.pdf"
                });
                $(".btnAceptarComprobante").click(function () {
                    var cont = $("#contComp").val()
                    var tipo = $("#compTipo").val();
                    var num = $("#compNum").val();
                    $.ajax({
                        type    : "POST",
                        url     : "${createLink(controller: 'reportes3', action: 'reporteComprobante')}",
                        data    : {
                            cont : cont,
                            tipo : tipo,
                            num  : num
                        },
                        success : function (msg) {
                            var parts = msg.split("_");
                            if (parts[0] != "NO") {
                                var url = actionUrl + "?id=" + msg;
                                location.href = url;
                            } else {
                                alert(parts[1]);
                            }
                        }
                    });
                });

                $(".btnAceptarBalance").click(function () {
                    var cont = $("#contP").val();
                    var per = $("#periodo").val();
                    url = "${g.createLink(controller:'reportes' , action: 'balanceComprobacion')}?cont=" + cont + "Wempresa=${session.empresa.id}" + "Wper=" + per;
                    location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=balanceComprobacion.pdf"
                });

                $(".btnAceptarSituacion").click(function () {

                    var cont = $("#contP8").val();
                    var per = $("#periodo8").val();
                    url = "${g.createLink(controller:'reportes2' , action: 'situacionFinanciera')}?cont=" + cont + "Wempresa=${session.empresa.id}" + "Wper=" + per;
                    location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=situacionFinanciera.pdf"
                });

                $(".btnAceptarIntegral").click(function () {

                    var cont = $("#contP9").val();
                    var per = $("#periodo9").val();
                    url = "${g.createLink(controller:'reportes2' , action: 'estadoDeResultados')}?cont=" + cont + "Wempresa=${session.empresa.id}" + "Wper=" + per;
                    location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=resultadoIntegral.pdf"

                });

                %{--$(".btnAceptarFlujo").click(function () {--}%

                %{--var cont = $("#contP7").val();--}%
                %{--var per = $("#periodo7").val();--}%
                %{--url = "${g.createLink(controller:'reportes' , action: 'flujoEfectivo')}?cont=" + cont + "Wempresa=${session.empresa.id}" + "Wper=" + per;--}%
                %{--location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=resultadoIntegral.pdf"--}%

                %{--});--}%

                %{--$(".btnAceptarPatrimonio").click(function () {--}%

                %{--var cont = $("#contP7").val();--}%
                %{--var per = $("#periodo7").val();--}%
                %{--url = "${g.createLink(controller:'reportes' , action: 'cambiosPatrimonio')}?cont=" + cont + "Wempresa=${session.empresa.id}" + "Wper=" + per;--}%
                %{--location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=patrimonio.pdf"--}%

                %{--});--}%

                $(".btnAceptarAuxiliar").click(function () {
                    var cont = $("#contP3").val();
                    var per = $("#periodo3").val();
                    var cnta = $("#cnta3").val();
                    if (per != null) {
                        url = "${g.createLink(controller:'reportes' , action: 'auxiliaresContables')}?cont=" + cont + "Wemp=${session.empresa.id}" + "Wper=" + per + "Wcnta=" + cnta;
                        location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=auxiliares.pdf"
                    }
                });

                $(".btnAceptarAuxCliente").click(function () {
                    var cont = $("#contP4").val();
                    var per = $("#periodo4").val();
                    var cli = $("#listaClientes").val();
                    url = "${g.createLink(controller:'reportes3' , action: 'auxiliarPorCliente')}?cont=" + cont + "Wemp=${session.empresa.id}" + "Wper=" + per + "Wcli=" + cli;
                    location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=auxiliaresXcliente.pdf"
                });

                $(".btnAceptarBalanceAux").click(function () {
                    var cont = $("#contP0").val();
                    var per = $("#periodo0").val();
                    url = "${g.createLink(controller:'reportes3' , action: 'balanceGeneralAuxiliares')}?cont=" + cont + "Wemp=${session.empresa.id}" + "Wper=" + per;
                    location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=balancexAuxiliar.pdf"
                });

                $(".btnAceptarGeneral").click(function () {
                    var cont = $("#contP6").val();
                    var per = $("#periodo6").val();
                    var ceros = "1"
                    var firma1 = $("#firma1").val()
                    var firma2 = $("#firma2").val()
                    firma1 = $.trim(firma1)
                    firma1 = firma1.replace(new RegExp(" ", "g"), "_");
                    firma2 = $.trim(firma2)
                    firma2 = firma2.replace(new RegExp(" ", "g"), "_");
//                            console.log(firma1,firma2)
                    if ($("#cero").attr("checked") != "checked") {
                        ceros = "0"
                    }
                    url = "${g.createLink(controller:'reportes' , action: 'balanceG')}?contabilidad=" + cont + "Wperiodo=" + per + "Wempresa=${session.empresa.id}Wnivel=" + $("#nivel").val() + "Wceros=" + ceros + "Wfirma1=" + firma1 + "Wfirma2=" + firma2;
//                            console.log(url)
                    location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=BalanceG.pdf"
                });

                %{--$("#dlgContabilidad").dialog({--}%
                %{--modal     : true,--}%
                %{--resizable : false,--}%
                %{--autoOpen  : false,--}%
                %{--buttons   : {--}%
                %{--"Aceptar"  : function () {--}%
                %{--var cont = $("#cont").val();--}%
                %{--var url = actionUrl + "?cont=" + cont + "Wemp=${session.empresa.id}";--}%
                %{--location.href = url;--}%
                %{--},--}%
                %{--"Cancelar" : function () {--}%
                %{--$("#dlgContabilidad").dialog("close");--}%
                %{--}--}%
                %{--}--}%
                %{--});--}%

                $("#dlgcxp").dialog({
                    modal    : true,
                    width    : 400,
                    height   : 300,
                    title    : "Reporte de Cuentas por pagar",
                    autoOpen : false,
                    buttons  : {
                        "Ver" : function () {
                            var desde = $("#desde").val()
                            var hasta = $("#hasta").val()
                            url = "${g.createLink(controller:'reportes3' , action: 'reporteCxP')}?fechaInicio=" + desde + "WfechaFin=" + hasta + "Wempresa=${session.empresa.id}";
                            location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=cuentas_por_pagar.pdf"
                        }
                    }
                });

                $("#plcn").dialog({
                    modal    : true,
                    width    : 400,
                    height   : 300,
                    title    : "Reporte de Cuentas por pagar",
                    autoOpen : false,
                    buttons  : {
                        "Ver" : function () {
                            var desde = $("#desde").val()
                            var hasta = $("#hasta").val()
                            url = "${g.createLink(controller:'reportes3' , action: 'reporteCxP')}?fechaInicio=" + desde + "WfechaFin=" + hasta + "Wempresa=${session.empresa.id}";
                            location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=cuentas_por_pagar.pdf"
                        }
                    }

                });

                $("#dlgPagos").dialog({
                    modal    : true,
                    width    : 400,
                    height   : 300,
                    title    : "Reporte de Pagos",
                    autoOpen : false,
                    buttons  : {
                        "Ver" : function () {
                            var desde = $("#desdePagos").val()
                            var hasta = $("#hastaPagos").val()
                            var prove = $("#proveedorPagos").val()

//                            console.log("prove" + prove)

                            url = "${g.createLink(controller:'reportes2' , action: 'reportePagos')}?fechaInicio=" + desde + "WfechaFin=" + hasta + "Wempresa=${session.empresa.id}" + "Wprove=" + prove;
                            location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=Pagos.pdf"
                        }
                    }
                });

                %{--$("#dlgContabilidadPeriodo").dialog({--}%
                %{--modal     : true,--}%
                %{--resizable : false,--}%
                %{--autoOpen  : false,--}%
                %{--width     : 400,--}%
                %{--open      : function () {--}%
                %{--updatePeriodo("");--}%
                %{--},--}%
                %{--buttons   : {--}%
                %{--"Aceptar"  : function () {--}%
                %{--var cont = $("#contP").val();--}%
                %{--var per = $("#periodo").val();--}%
                %{--var url = actionUrl + "?cont=" + cont + "Wper=" + per + "Wemp=${session.empresa.id}";--}%
                %{--//                            console.group("URL");--}%
                %{--//                            console.log(actionUrl);--}%
                %{--//                            console.log(url);--}%
                %{--//                            console.groupEnd();--}%
                %{--location.href = url;--}%
                %{--},--}%
                %{--"Cancelar" : function () {--}%
                %{--$("#dlgContabilidadPeriodo").dialog("close");--}%
                %{--}--}%
                %{--}--}%
                %{--});--}%

                $("#dlgContabilidadPeriodoCuenta").dialog({
                    modal     : true,
                    resizable : false,
                    autoOpen  : false,
                    width     : 400,
                    open      : function () {
                        updatePeriodo("2");

                    },
                    buttons   : {
                        "Aceptar"  : function () {
                            var cont = $("#contP2").val();
                            var per = $("#periodo2").val();
                            var cta = $("#cuenta2").val();

                            var url = actionUrl + "?cont=" + cont + "Wper=" + per + "Wemp=${session.empresa.id}Wcta=" + cta;
                            location.href = url;
                        },
                        "Cancelar" : function () {
                            $("#dlgContabilidadPeriodoCuenta").dialog("close");
                        }
                    }
                });

                %{--$("#dlgAuxiliarContable").dialog({--}%
                %{--modal     : true,--}%
                %{--resizable : false,--}%
                %{--autoOpen  : false,--}%
                %{--width     : 850,--}%
                %{--open      : function () {--}%

                %{--updatePeriodo("3");--}%
                %{--},--}%
                %{--buttons   : {--}%
                %{--"Aceptar"  : function () {--}%
                %{--var cont = $("#contP3").val();--}%
                %{--var per = $("#periodo3").val();--}%
                %{--var cnta = $("#cnta3").val();--}%

                %{--if (per != null) {--}%
                %{--//--}%
                %{--//                    console.log("contabilidad:" + cont);--}%
                %{--//                    console.log("periodo:" + per);--}%
                %{--//                    console.log("cuenta:" + cnta);--}%

                %{--var url = actionUrl + "?cont=" + cont + "Wper=" + per + "Wemp=${session.empresa.id}Wcnta=" + cnta;--}%
                %{--location.href = url;--}%

                %{--}--}%
                %{--else {--}%

                %{--console.log("entro")--}%
                %{--$.box({--}%
                %{--imageClass : "box_error",--}%
                %{--title      : "Alerta",--}%
                %{--text       : "Ingrese el período!",--}%
                %{--iconClose  : false,--}%
                %{--dialog     : {--}%
                %{--draggable : false,--}%
                %{--resizable : false,--}%
                %{--buttons   : {--}%
                %{--"Aceptar" : function () {--}%
                %{--}--}%
                %{--}--}%
                %{--}--}%
                %{--});--}%
                %{--}--}%

                %{--},--}%
                %{--"Cancelar" : function () {--}%

                %{--$("#dlgAuxiliarContable").dialog("close");--}%
                %{--}--}%


                %{--}--}%


                %{--});--}%

                %{--$("#dlgComprobante").dialog({--}%
                %{--resizable : false,--}%
                %{--autoOpen  : false,--}%
                %{--modal     : true,--}%
                %{--width     : 400,--}%
                %{--buttons   : {--}%
                %{--"Aceptar"  : function () {--}%
                %{--var cont = $("#compCont").val();--}%
                %{--var tipo = $("#compTipo").val();--}%
                %{--var num = $("#compNum").val();--}%

                %{--$.ajax({--}%
                %{--type    : "POST",--}%
                %{--url     : "${createLink(controller: 'reportes3', action: 'reporteComprobante')}",--}%
                %{--data    : {--}%
                %{--cont : cont,--}%
                %{--tipo : tipo,--}%
                %{--num  : num--}%
                %{--},--}%
                %{--success : function (msg) {--}%
                %{--var parts = msg.split("_");--}%
                %{--if (parts[0] != "NO") {--}%
                %{--var url = actionUrl + "?id=" + msg;--}%
                %{--location.href = url;--}%
                %{--} else {--}%
                %{--alert(parts[1]);--}%
                %{--}--}%
                %{--}--}%
                %{--});--}%

                %{--//                            location.href = url;--}%
                %{--},--}%
                %{--"Cancelar" : function () {--}%
                %{--$("#dlgComprobante").dialog("close");--}%
                %{--}--}%
                %{--}--}%
                %{--});--}%

                %{--$("#dlgAuxiliarCliente").dialog({--}%
                %{--resizable : false,--}%
                %{--autoOpen  : false,--}%
                %{--modal     : true,--}%
                %{--width     : 400,--}%
                %{--buttons   : {--}%
                %{--"Aceptar"  : function () {--}%
                %{--var cont = $("#cont").val();--}%
                %{--var per = $("#periodo").val();--}%
                %{--var url = actionUrl + "?cont=" + cont + "Wper=" + per + "Wemp=${session.empresa.id}";--}%
                %{--//                            console.group("URL");--}%
                %{--//                            console.log(actionUrl);--}%
                %{--//                            console.log(url);--}%
                %{--//                            console.groupEnd();--}%
                %{--location.href = url;--}%
                %{--},--}%
                %{--"Cancelar" : function () {--}%
                %{--$("#dlgAuxiliarCliente").dialog("close");--}%
                %{--}--}%
                %{--}--}%
                %{--});--}%

                %{--$("#dlgAuxiliarCliente").dialog({--}%
                %{--resizable : false,--}%
                %{--autoOpen  : false,--}%
                %{--modal     : true,--}%
                %{--width     : 400,--}%
                %{--buttons   : {--}%
                %{--"Aceptar"  : function () {--}%
                %{--var cont = $("#contP4").val();--}%
                %{--var per = $("#periodo4").val();--}%
                %{--var cli = $("#hidVal").val();--}%
                %{--var url = actionUrl + "?cont=" + cont + "Wper=" + per + "Wcli=" + cli + "Wemp=${session.empresa.id}";--}%
                %{--//                            console.group("URL");--}%
                %{--//                            console.log(actionUrl);--}%
                %{--//                            console.log(url);--}%
                %{--//                            console.groupEnd();--}%
                %{--location.href = url;--}%
                %{--},--}%
                %{--"Cancelar" : function () {--}%
                %{--$("#dlgAuxiliarCliente").dialog("close");--}%
                %{--}--}%
                %{--}--}%
                %{--});--}%

                $("#btnTodosPrv").button().click(function () {
                    $("#hidVal").val("-1");
                    $("#txtValor").val("Todos");
                    return false;
                });

                $("#dlgVentasFacturacion").dialog({
                    modal     : true,
                    resizable : false,
                    autoOpen  : false,
                    width     : 850,
                    open      : function () {

                        updatePeriodo("5");
                    },
                    buttons   : {
                        "Aceptar"  : function () {
                            var cont = $("#contP5").val();
                            var per = $("#periodo5").val();
                            var cnta = $("#cuentasVentasFact").val();

                            if (per != null) {
//
//                    console.log("contabilidad:" + cont);
//                    console.log("periodo:" + per);
//                    console.log("cuenta:" + cnta);

                                var url = actionUrl + "?cont=" + cont + "Wper=" + per + "Wemp=${session.empresa.id}Wcnta=" + cnta;
                                location.href = url;

                            }
                            else {

//                        console.log("entro")
                                $.box({
                                    imageClass : "box_error",
                                    title      : "Alerta",
                                    text       : "Ingrese el período!",
                                    iconClose  : false,
                                    dialog     : {
                                        draggable : false,
                                        resizable : false,
                                        buttons   : {
                                            "Aceptar" : function () {
                                            }
                                        }
                                    }
                                });
                            }

                        },
                        "Cancelar" : function () {

                            $("#dlgVentasFacturacion").dialog("close");
                        }


                    }


                });

                %{--$("#balanceDialog").dialog({--}%
                %{--modal     : true,--}%
                %{--resizable : false,--}%
                %{--autoOpen  : false,--}%
                %{--width     : 400,--}%
                %{--open      : function () {--}%
                %{--updatePeriodo("6");--}%
                %{--},--}%
                %{--buttons   : {--}%
                %{--"Aceptar"  : function () {--}%
                %{--var cont = $("#contP6").val();--}%
                %{--var per = $("#periodo6").val();--}%
                %{--var ceros = "1"--}%
                %{--var firma1=$("#firma1").val()--}%
                %{--var firma2=$("#firma2").val()--}%
                %{--firma1=$.trim(firma1)--}%
                %{--firma1=firma1.replace(new RegExp(" ","g"),"_");--}%
                %{--firma2=$.trim(firma2)--}%
                %{--firma2=firma2.replace(new RegExp(" ","g"),"_");--}%
                %{--//                            console.log(firma1,firma2)--}%
                %{--if($("#cero").attr("checked")!="checked"){--}%
                %{--ceros="0"--}%
                %{--}--}%
                %{--url = "${g.createLink(controller:'reportes' , action: 'balanceG')}?contabilidad=" + cont + "Wperiodo=" + per + "Wempresa=${session.empresa.id}Wnivel="+$("#nivel").val()+"Wceros="+ceros+"Wfirma1="+firma1+"Wfirma2="+firma2;--}%
                %{--//                            console.log(url)--}%
                %{--location.href = "${g.createLink(action: 'pdfLink',controller: 'pdf')}?url=" + url + "&filename=BalanceG.pdf"--}%


                %{--},--}%
                %{--"Cancelar" : function () {--}%
                %{--$("#balanceDialog").dialog("close");--}%
                %{--}--}%
                %{--}--}%
                %{--});--}%

            });
        </script>
    </body>
</html>