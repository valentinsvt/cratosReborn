package cratos
import org.codehaus.groovy.grails.web.i18n.ParamsAwareLocaleChangeInterceptor
import org.springframework.web.context.request.RequestContextHolder;
class GestorContableService {
//    static scope = "session"
    def session = RequestContextHolder.currentRequestAttributes().getSession()
    boolean transactional = true
    def buscadorService
    def cuentas=[]
    def tipo
    def tiempo
    void vaciarLista(){
        session.cuentas=[]
        this.cuentas=[]
    }
    List ordenarLista(lista){
       println "ordenar lista!!!!"
        def genera= new Genera()
        def i=0
        def j=0
         while(j<lista.size()){
            i=j
            while(i<lista.size()){
                if(lista[j].tipoComprobante.id>lista[i].tipoComprobante.id){
                    genera=lista[j]
                    lista[j]=lista[i]
                    lista[i]=genera
                    genera=null
                }
                i++
            }
            j++
        }
        println "lista ordenada "+lista.size()
        return lista
    }

  def cambiaTipoComprobante(tipo){
    this.cuentas.each{
      it.tipoComprobante=tipo
    }
      this.tipo = tipo.id
      println "tipo service  "+this.tipo

  }

}
