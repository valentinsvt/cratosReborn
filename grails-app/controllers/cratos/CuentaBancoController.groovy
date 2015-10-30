package cratos


class CuentaBancoController extends cratos.seguridad.Shield {

    static allowedMethods = [save: "POST", delete: "POST", save_ajax: "POST", delete_ajax: "POST"]

    def index() {
        redirect(action: "list", params: params)
    } //index

    def list() {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def cuentaBancoInstanceList = CuentaBanco.list(params)
        def cuentaBancoInstanceCount = CuentaBanco.count()
        if (cuentaBancoInstanceList.size() == 0 && params.offset && params.max) {
            params.offset = params.offset - params.max
        }
        cuentaBancoInstanceList = CuentaBanco.list(params)
        return [cuentaBancoInstanceList: cuentaBancoInstanceList, cuentaBancoInstanceCount: cuentaBancoInstanceCount]
    } //list

    def show_ajax() {
        if (params.id) {
            def cuentaBancoInstance = CuentaBanco.get(params.id)
            if (!cuentaBancoInstance) {
                notFound_ajax()
                return
            }
            return [cuentaBancoInstance: cuentaBancoInstance]
        } else {
            notFound_ajax()
        }
    } //show para cargar con ajax en un dialog

    def form_ajax() {
        def cuentaBancoInstance = new CuentaBanco(params)
        if (params.id) {
            cuentaBancoInstance = CuentaBanco.get(params.id)
            if (!cuentaBancoInstance) {
                notFound_ajax()
                return
            }
        }
        return [cuentaBancoInstance: cuentaBancoInstance]
    } //form para cargar con ajax en un dialog

    def save_ajax() {
        params.each { k, v ->
            if (v != "date.struct" && v instanceof java.lang.String) {
                params[k] = v.toUpperCase()
            }
        }

        def cuentaBancoInstance = new CuentaBanco()
        if (params.id) {
            cuentaBancoInstance = CuentaBanco.get(params.id)
            if (!cuentaBancoInstance) {
                notFound_ajax()
                return
            }
        } //update
        cuentaBancoInstance.properties = params
        if (!cuentaBancoInstance.save(flush: true)) {
            def msg = "NO_No se pudo ${params.id ? 'actualizar' : 'crear'} CuentaBanco."
            msg += renderErrors(bean: cuentaBancoInstance)
            render msg
            return
        }
        render "OK_${params.id ? 'Actualización' : 'Creación'} de CuentaBanco exitosa."
    } //save para grabar desde ajax

    def delete_ajax() {
        if (params.id) {
            def cuentaBancoInstance = CuentaBanco.get(params.id)
            if (cuentaBancoInstance) {
                try {
                    cuentaBancoInstance.delete(flush: true)
                    render "OK_Eliminación de CuentaBanco exitosa."
                } catch (e) {
                    render "NO_No se pudo eliminar CuentaBanco."
                }
            } else {
                notFound_ajax()
            }
        } else {
            notFound_ajax()
        }
    } //delete para eliminar via ajax

    protected void notFound_ajax() {
        render "NO_No se encontró CuentaBanco."
    } //notFound para ajax

}
