<g:form name="frm-fechaSri" action="save" method="post" >
    <g:hiddenField name="id" value="${fechaSriInstance?.id}" />
    <g:hiddenField name="version" value="${fechaSriInstance?.version}" />
    <fieldset class="form">
        <g:render template="form"/>
    </fieldset>
</g:form>

<script type="text/javascript">
    $(function() {
        $("#frm-fechaSri").validate();

        $("#frm-fechaSri").find("input, select, textarea").keypress(function (evt) {
            if (evt.keyCode == 13) {
                submitForm();
                return false;
            }
            return true;
        });
    });
</script>
