package cratos

class ProcesoFormaDePago {

    Proceso proceso
    FormaDePago formaDePago

    static mapping = {
        table 'prfp'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'prfp__id'
        id generator: 'identity'
        version false
        columns {
           proceso column: 'prcs__id'
            formaDePago column: 'frpg__id'
        }
    }

    static constraints = {
        proceso(blank:false,nullable: false)
        formaDePago(blank:false,nullable: false)
    }
}
