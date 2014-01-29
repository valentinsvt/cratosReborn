package cratos

import org.springframework.dao.DataIntegrityViolationException

class GrupoController extends cratos.seguridad.Shield {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
//
//    def list() {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [grupoInstanceList: Grupo.list(params), grupoInstanceTotal: Grupo.count()]
//    }

    def create() {
        [grupoInstance: new Grupo(params)]
    }

    def save() {
        def grupoInstance
        if (params.id) {
            grupoInstance = Grupo.get(params.id)
            if (!grupoInstance) {
                flash.message = "No se encontr&oacute; Grupo a modificar"
                render "NO"
                return
            }
            grupoInstance.properties = params
        } else {
            grupoInstance = new Grupo(params)
        }
        if (!grupoInstance.save(flush: true)) {
            render "NO"
            println grupoInstance.errors
            flash.message = "Ha ocurrido un error al guardar Grupo"
            return
        }

        flash.message = "Grupo guardado exitosamente"
//    redirect(action: "show", id: grupoInstance.id)
        render "OK"
    }

    def show() {
        def grupoInstance = Grupo.get(params.id)
        if (!grupoInstance) {
            flash.message = "No se encontr&oacute; Grupo a mostrar"
//            redirect(action: "list")
            render "NO"
            return
        }

        [grupoInstance: grupoInstance]
    }

    def edit() {
        def grupoInstance = Grupo.get(params.id)
        if (!grupoInstance) {
            flash.message = "No se encontr&oacute; Grupo a modificar"
//            redirect(action: "list")
            render "NO"
            return
        }

        [grupoInstance: grupoInstance]
    }

    def delete() {
        def grupoInstance = Grupo.get(params.id)
        if (!grupoInstance) {
            flash.message = "No se encontr&oacute; Grupo a eliminar"
            render "NO"
//            redirect(action: "list")
            return
        }

        try {
            grupoInstance.delete(flush: true)
            flash.message = "Grupo eliminado exitosamente"
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = "Ha ocurrido un error al eliminar Grupo"
//            redirect(action: "show", id: params.id)
        }
        render "OK"
    }

    /* ************************ COPIAR DESDE AQUI ****************************/

    def list() {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def grupoInstanceList = Grupo.list(params)
        def grupoInstanceCount = Grupo.count()
        if (grupoInstanceList.size() == 0 && params.offset && params.max) {
            params.offset = params.offset - params.max
        }
        grupoInstanceList = Grupo.list(params)
        return [grupoInstanceList: grupoInstanceList, grupoInstanceCount: grupoInstanceCount]
    } //list

    def show_ajax() {


        if (params.id) {
            def grupoInstance = Grupo.get(params.id)
            if (!grupoInstance) {
                notFound_ajax()
                return
            }
            return [grupoInstance: grupoInstance]
        } else {
            notFound_ajax()
        }
    } //show para cargar con ajax en un dialog

    def form_ajax() {
        def grupoInstance = new Grupo(params)
        if (params.id) {
            grupoInstance = Grupo.get(params.id)
            if (!grupoInstance) {
                notFound_ajax()
                return
            }
        }
        return [grupoInstance: grupoInstance]
    } //form para cargar con ajax en un dialog

    def save_ajax() {

        println("params:" + params)

//        params.each { k, v ->
//            if (v != "date.struct" && v instanceof java.lang.String) {
//                params[k] = v.toUpperCase()
//            }
//        }

        //nuevo

        def persona

//        params.descripcion = params.descripcion.toUpperCase()
//        params.codigo = params.codigo.toUpperCase()
//        params.empresa = session.empresa


        //original
        def grupoInstance = new Grupo()

        if (params.id) {
            grupoInstance = Grupo.get(params.id)
            grupoInstance.properties = params
            if (!grupoInstance) {
                notFound_ajax()
                return
            }
        }else {

            grupoInstance = new Grupo()
            grupoInstance.properties = params
//            grupoInstance.estado = '1'
//            grupoInstance.empresa = session.empresa


        } //update


        if (!grupoInstance.save(flush: true)) {
            def msg = "NO_No se pudo ${params.id ? 'actualizar' : 'crear'} Grupo."
            msg += renderErrors(bean: grupoInstance)
            render msg
            return
        }
        render "OK_${params.id ? 'Actualización' : 'Creación'} de Grupo."
    } //save para grabar desde ajax



    def delete_ajax() {
        if (params.id) {
            def grupoInstance = Grupo.get(params.id)
            if (grupoInstance) {
                try {
                    grupoInstance.delete(flush: true)
                    render "OK_Eliminación de Grupo."
                } catch (e) {
                    render "NO_No se pudo eliminar el Grupo"
                }
            } else {
                notFound_ajax()
            }
        } else {
            notFound_ajax()
        }
    } //delete para eliminar via ajax

    protected void notFound_ajax() {
        render "NO_No se encontró Grupo."
    } //notFound para ajax


}
