<%@ page contentType="text/html" %>

<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Parámetros</title>

        <style type="text/css">
        .tab-content {
            background : #EFE4D1;
            height     : 600px;
        }

        .descripcion {
            margin-left : 20px;
            font-size   : 12px;
        }
        </style>

    </head>

    <body>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="active"><a href="#generales" data-toggle="tab">Generales</a></li>
            <li><a href="#empresa" data-toggle="tab">Empresa</a></li>
            <li><a href="#activos" data-toggle="tab">Activos fijos y facturación</a></li>
            <li><a href="#nomina" data-toggle="tab">Nómina</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content ui-corner-bottom">
            <div class="tab-pane active" id="generales">
                <div>
                    <g:link controller="nivel" action="list">Nivel</g:link> de detalle de las cuentas contables y de
                    presupuesto (partidas)
                    <a href="#" class="btn btn-xs btn-default" data-toggle="collapse" data-target="#nivelCuenta">
                        <i class="fa fa-plus-square"></i>
                    </a>

                    <div id="nivelCuenta" class="collapse descripcion">
                        <p>Nivel de detalle de las cuentas contables y de las partidas presupuestarias.<br/>
                            Se aplica al plan o catálogo de cuentas y al catálogo presupuestario</p>
                    </div>
                </div>
            </div>

            <div class="tab-pane" id="empresa">prof</div>

            <div class="tab-pane" id="activos">mess</div>

            <div class="tab-pane" id="nomina">sett</div>
        </div>

    </body>
</html>