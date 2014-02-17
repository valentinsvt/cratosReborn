%{--<g:select name="rubros" id="rubros" from="${rubros}" optionKey="id" optionValue="descripcion" noSelection="['-1':'Seleccione...']"></g:select>--}%
<g:select name="rubros" from="${rubros}" id="rubros" optionKey="id" optionValue="descripcion" class="form-control izquierda"  style="width: 250px; margin-bottom: 10px" noSelection="['-1': 'Seleccione']"/>



<script type="text/javascript">




$("#rubros").change(function () {

   if($("#rubros").val() != '-1'){

       $.ajax({
           type : "POST",
           url  :"${g.createLink(controller: 'rubro', action: 'cargarValores')}",
           data : "id=" + $("#rubros").val(),
           success : function (msg) {

               $("#valores").html(msg).show()
           }

       })



   } else {




       $("#rubro_iess").attr("checked", false);
       $("#rubro_gravable").attr("checked", false);
       $("#rubro_decimo").attr("checked", false);

       $("#rubro_valor").val('');
       $("#rubro_porcentaje").val('');



   }



  });



    %{--$("#rubros").change(function(){--}%
        %{--if($(this).val() != "-1"){--}%
            %{--$.ajax({--}%
                %{--type    : "POST",--}%
                %{--url     : "${g.createLink(controller: 'rubro',action: 'getDatosRubro')}",--}%
                %{--data    : "id=" +$("#rubros").val(),--}%

                %{--success : function (msg) {--}%
                    %{--var datos = msg.split(";")--}%

                    %{--console.log("-->" + msg)--}%

                    %{--$("#rubro_porcentaje").val(datos[1])--}%
                    %{--$("#rubro_valor").val(datos[0])--}%

                    %{--if(datos[2]=="1") {--}%

                         %{--$("#rubro_iess").attr("checked",true)--}%
                    %{--}--}%
                    %{--else{--}%

                        %{--$("#rubro_iess").attr("checked", false)--}%
                    %{--}--}%

                    %{--if(datos[3]=="1") {--}%
                        %{--$("#rubro_gravable").attr("checked",true)--}%
                    %{--}--}%
                    %{--else{--}%
                        %{--$("#rubro_gravable").attr("checked", false)--}%
                    %{--}--}%

                    %{--if(datos[4]=="1"){--}%

                        %{--$("#rubro_decimo").attr("checked",true)--}%
                    %{--}--}%
                    %{--else{--}%
                        %{--$("#rubro_decimo").attr("checked", false)--}%
                    %{--}--}%


                %{--}--}%
            %{--});--}%
        %{--}else{--}%

            %{--$("#rubro_porcentaje").val("")--}%
            %{--$("#rubro_valor").val("")--}%

%{--//            $("#rubro_iess").removeAttr("checked")--}%
            %{--$("#rubro_iess").attr("checked", false)--}%

%{--//            $("#rubro_gravable").removeAttr("checked")--}%
            %{--$("#rubro_gravable").attr("checked", false)--}%

%{--//            $("#rubro_decimo").removeAttr("checked")--}%
            %{--$("#rubro_decimo").attr("checked", false)--}%
        %{--}--}%

    %{--});--}%
</script>