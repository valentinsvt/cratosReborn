package cratos.seguridad

class InicioController {

    def index() {
        def usu = Persona.get(session.usuario.id)
        def now = new Date().clearTime()



    }


}
