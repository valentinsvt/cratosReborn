<g:form name="frm-item" action="save" method="post" >
    <g:hiddenField name="id" value="${itemInstance?.id}" />
    <g:hiddenField name="version" value="${itemInstance?.version}" />
    <fieldset class="form">
        <g:render template="form"/>
    </fieldset>
</g:form>

<script type="text/javascript">
    $(function() {
        $("#frm-item").validate();

        $("#frm-item").find("input, select, textarea").keypress(function (evt) {
            if (evt.keyCode == 13) {
                submitForm();
                return false;
            }
            return true;
        });
    });
</script>
