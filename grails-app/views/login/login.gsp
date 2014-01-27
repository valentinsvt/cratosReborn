<%--
  Created by IntelliJ IDEA.
  User: luz
  Date: 1/15/14
  Time: 4:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="login">
        <title>Login</title>
    </head>

    <body>
        <elm:flashMessage tipo="${flash.tipo}" icon="${flash.icon}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

        <g:form name="frmLogin" action="validar" class="form-signin well" role="form" style="width: 300px;">
            <h2 class="text-center">Ingreso</h2>
            <input name="login" type="text" class="form-control required" placeholder="Usuario" required autofocus>
            <input name="pass" type="password" class="form-control required" placeholder="Password" required>

            <div class="divBtn">
                <a href="#" class="btn btn-success btn-lg btn-block btn-login">
                    <i class="fa fa-lock"></i> Entrar
                </a>
            </div>
        </g:form>

        <script type="text/javascript">
            var $frm = $("#frmLogin");
            function doLogin() {
                if ($frm.valid()) {
                    $(".btn-login").replaceWith(spinner);
                    $("#frmLogin").submit();
                }
            }
            $(function () {
                $frm.validate();
                $(".btn-login").click(function () {
                    doLogin();
                });
                $("input").keyup(function (ev) {
                    if (ev.keyCode == 13) {
                        doLogin();
                    }
                })
            });
        </script>

    </body>
</html>