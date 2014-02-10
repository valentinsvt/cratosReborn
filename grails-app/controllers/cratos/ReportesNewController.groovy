package cratos

import com.lowagie.text.Document
import com.lowagie.text.Element
import com.lowagie.text.PageSize
import com.lowagie.text.Paragraph
import com.lowagie.text.pdf.PdfPCell
import com.lowagie.text.pdf.PdfPTable
import com.lowagie.text.pdf.PdfWriter
import com.lowagie.text.Font;
import java.awt.Color
import com.itextpdf.text.BadElementException

class ReportesNewController {

    def reportesPdfService
    def dbConnectionService

    def index() {}

    def auxiliarPorCliente() {
        if (!params.cli) {
            params.cli = "-1"
        }

        def baos = new ByteArrayOutputStream()
        def name = "reporte_de_" + params.filename.replaceAll(" ", "_") + "_" + new Date().format("ddMMyyyy_hhmm");
//        println "name " + name
        Font fontTitulo = new Font(Font.TIMES_ROMAN, 18, Font.BOLD);
        Font fontSubtitulo = new Font(Font.TIMES_ROMAN, 14, Font.BOLD);
        Font fontInfo = new Font(Font.TIMES_ROMAN, 10, Font.NORMAL);
        Font fontError = new Font(Font.TIMES_ROMAN, 12, Font.BOLDITALIC, new Color(128, 0, 0));
        Font fontEmpresa = new Font(Font.TIMES_ROMAN, 13, Font.BOLDITALIC, new Color(0, 0, 128));
        Font fontCuenta = new Font(Font.TIMES_ROMAN, 12, Font.BOLDITALIC);
        Font fontDatos = new Font(Font.TIMES_ROMAN, 11, Font.NORMAL);
        Font fontDatosHeader = new Font(Font.TIMES_ROMAN, 11, Font.BOLD);
        Document document = reportesPdfService.crearDocumento("v")
        def pdfw = PdfWriter.getInstance(document, baos);

        document.open();
        document.addTitle("Auxiliar por cliente " + new Date().format("dd_MM_yyyy"));
        document.addSubject("Generado por el sistema Cratos");
        document.addKeywords("reporte, cratos," + params.titulo);
        document.addAuthor("Cratos");
        document.addCreator("Tedein SA");
        Paragraph preface = new Paragraph("Auxiliar por cliente", fontTitulo);
        preface.setAlignment(Element.ALIGN_CENTER);
        reportesPdfService.addEmptyLine(preface, 1);
        document.add(preface);

        Paragraph generado = new Paragraph("Generado por: " + session.usuario.nombre + " " + session.usuario.apellido + "   el: " + new Date().format("dd/MM/yyyy hh:mm"), fontInfo)
        reportesPdfService.addEmptyLine(generado, 1);
        generado.setAlignment(Element.ALIGN_RIGHT);
        document.add(generado);

        if (!params.per || !params.cli || !params.emp || params.per == "undefined") {
            String error
            error = "Faltan datos para generar el reporte:\n"
            if (!params.per || params.per == "undefined") {
                error += "\tSeleccione un periodo\n"
            }
            if (!params.cli) {
                error += "\tSeleccione un cliente\n"
            }
            if (!params.emp) {
                error += "\tVerifique su sesión\n"
            }
            Paragraph parError = new Paragraph(error, fontError)
            document.add(parError)
        } else {
            def periodo
            def empresa = Empresa.get(params.emp)
            def cliente = Proveedor.get(params.cli)
            def contabilidad = Contabilidad.get(params.cont)
            def periodosCont = Periodo.findAllByContabilidad(contabilidad, [sort: 'fechaInicio'])
            if (periodosCont.size() == 12) {
                def desdePrint = periodosCont.first().fechaInicio.format("dd-MM-yyyy")
                def desde = periodosCont.first().fechaInicio.format("yyyy-MM-dd")
                def hasta = periodosCont.last().fechaFin.format("yyyy-MM-dd")
                def strPeriodo = "Todos los movimientos"
                if (params.per != -1 && params.per != "-1") {
                    periodo = Periodo.get(params.per)
                    strPeriodo = "Movimientos desde el ${periodo.fechaInicio.format('dd-MM-yyyy')} hasta el ${periodo.fechaFin.format('dd-MM-yyyy')}"
                    desdePrint = periodo.fechaInicio.format("dd-MM-yyyy")
                    desde = periodo.fechaInicio.format("yyyy-MM-dd")
                    hasta = periodo.fechaFin.format("yyyy-MM-dd")
                }
                if (params.cli == "-1" || params.cli == -1) {
                    cliente = Proveedor.list()
                    strPeriodo += " de todos los clientes"
                } else {
                    strPeriodo += " del cliente ${cliente.nombre ? cliente.nombre : cliente.nombreContacto + ' ' + cliente.apellidoContacto}"
                }

                if (!empresa || !cliente) {
                    String error
                    error = "Error de datos al generar el reporte:\n"
                    if (!cliente) {
                        error += "\tNo se encontró el cliente " + params.cli + "\n"
                    }
                    if (!empresa) {
                        error += "\tNo se econtró la empresa " + params.emp + "\n"
                    }
                    Paragraph parError = new Paragraph(error, fontError)
                    document.add(parError)
                } else {
                    Paragraph parSubtitulo = new Paragraph(strPeriodo, fontSubtitulo)
                    parSubtitulo.setAlignment(Element.ALIGN_CENTER);
                    reportesPdfService.addEmptyLine(parSubtitulo, 2)
                    document.add(parSubtitulo)

                    def cn = dbConnectionService.getConnection()
                    def cn2 = dbConnectionService.getConnection()
                    def cn3 = dbConnectionService.getConnection()

                    def sql = "select\n" +
                            "        x.axlr__id              id,\n" +
                            "        u.cnta__id              cuenta_id,\n" +
                            "        u.cntanmro              cuenta_num,\n" +
                            "        u.cntadscr              cuenta_desc,\n" +
                            "        r.prve__id              cli_id,\n" +
                            "        r.prve_ruc              cli_ruc,\n" +
                            "        r.prvenmbr              cli_nombre,\n" +
                            "        r.prvenbct              cli_nombrecontacto,\n" +
                            "        r.prveapct              cli_apellidocontacto,\n" +
                            "        x.axlrfcpg              fecha,\n" +
                            "        p.prcs__id              trans,\n" +
                            "        c.cmpr__id              comp,\n" +
                            "        c.cmprprfj||cmprnmro    compnmro,\n" +
                            "        t.tpcpdscr              tipocomp,\n" +
                            "        x.axlrdscr              descripcion,\n" +
                            "        x.axlrdebe              debe,\n" +
                            "        x.axlrhber              haber\n" +
                            "  from axlr x,\n" +
                            "          asnt s,\n" +
                            "          cmpr c,\n" +
                            "          prcs p,\n" +
                            "          tpcp t,\n" +
                            "          cnta u,\n" +
                            "          prve r\n" +
                            "  where x.asnt__id = s.asnt__id\n" +
                            "          and s.cmpr__id = c.cmpr__id\n" +
                            "          and c.prcs__id = p.prcs__id\n" +
                            "          and c.tpcp__id = t.tpcp__id\n" +
                            "          and s.cnta__id = u.cnta__id\n" +
                            "          and x.prve__id = r.prve__id\n" +
                            "          and u.empr__id = ${params.emp}\n" +
                            "          and c.cmprrgst = 'S'\n" +
                            "          and x.axlrfcpg >= '${desde}'\n" +
                            "          and x.axlrfcpg <= '${hasta}'\n"
                    if (params.cli != -1 && params.cli != "-1") {
                        sql += "          and r.prve__id = ${params.cli}\n"
                    }
                    sql += " order by cuenta_id asc, cli_nombre asc, fecha asc"

                    def cuentaId = null, cliId = null

                    PdfPTable table = null

                    cn.eachRow(sql) { rs ->
                        if (rs.cli_id != cliId) {
                            cliId = rs.cli_id
                            cuentaId = null
                            if (table) {
                                document.add(table)
                            }
                            def strEmpresa = ""
                            if (rs.cli_nombre) {
                                strEmpresa += "Empresa: " + rs.cli_ruc + " " + rs.cli_nombre + " (" + rs.cli_nombrecontacto + " " + rs.cli_apellidocontacto + ")"
                            } else {
                                strEmpresa += "Persona: " + rs.cli_ruc + " " + rs.cli_nombrecontacto + " " + rs.cli_apellidocontacto
                            }
                            def parTituloEmpresa = new Paragraph(strEmpresa, fontEmpresa)
                            document.add(parTituloEmpresa)
                        }
                        if (rs.cuenta_id != cuentaId) {
                            cuentaId = rs.cuenta_id

                            def sql2 = "select\n" +
                                    "        u.cnta__id                    cuenta_id,\n" +
                                    "        x.prve__id                    cli_id,\n" +
                                    "        sum(x.axlrdebe-x.axlrhber)    deberia\n" +
                                    "  from axlr x,\n" +
                                    "          asnt s,\n" +
                                    "          cmpr c,\n" +
                                    "          prcs p,\n" +
                                    "          cnta u\n" +
                                    "  where x.asnt__id = s.asnt__id\n" +
                                    "          and s.cmpr__id = c.cmpr__id\n" +
                                    "          and c.prcs__id = p.prcs__id\n" +
                                    "          and s.cnta__id = u.cnta__id\n" +
                                    "          and u.empr__id = ${params.emp}\n" +
                                    "          and x.prve__id = ${rs.cli_id}\n" +
                                    "          and x.axlrfcpg < '${desde}'\n" +
                                    "  group by cuenta_id, cli_id\n" +
                                    "  order by cuenta_id asc;"

                            def sql3 = "select\n" +
                                    "        u.cnta__id                    cuenta_id,\n" +
                                    "        x.prve__id                    cli_id,\n" +
                                    "        sum(g.pgaxmnto)               pagado\n" +
                                    "  from axlr x,\n" +
                                    "          asnt s,\n" +
                                    "          cmpr c,\n" +
                                    "          prcs p,\n" +
                                    "          cnta u,\n" +
                                    "          pgax g\n" +
                                    "  where x.asnt__id = s.asnt__id\n" +
                                    "          and s.cmpr__id = c.cmpr__id\n" +
                                    "          and c.prcs__id = p.prcs__id\n" +
                                    "          and s.cnta__id = u.cnta__id\n" +
                                    "          and x.axlr__id = g.axlr__id\n" +
                                    "          and u.empr__id = ${params.emp}\n" +
                                    "          and x.prve__id = ${rs.cli_id}\n" +
                                    "          and x.axlrfcpg < '${desde}'\n" +
                                    "  group by cuenta_id, cli_id\n" +
                                    "  order by cuenta_id asc;"

                            def debe = 0
                            def deberia = 0, pagado = 0
                            cn2.eachRow(sql2) { r ->
                                debe += Math.abs(r.deberia.toDouble())
                                deberia += Math.abs(r.deberia.toDouble())
                            }
                            cn3.eachRow(sql3) { r ->
                                debe -= r.pagado.toDouble()
                                pagado += r.pagado.toDouble()
                            }

                            def numero = '$' + util.numero(number: debe)
                            //+ " (" + util.numero(number: deberia) + "-" + util.numero(number: pagado) + ")"

                            def tablaCuenta = new PdfPTable(2);
                            tablaCuenta.setWidthPercentage(100);
                            tablaCuenta.setSpacingBefore(5)
                            reportesPdfService.addCellTabla(tablaCuenta, new Paragraph("Cuenta contable: " + rs.cuenta_num + " " + rs.cuenta_desc, fontCuenta), [borderColor: Color.WHITE, valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_LEFT])
                            reportesPdfService.addCellTabla(tablaCuenta, new Paragraph("Saldo inicial al ${desdePrint}: " + numero, fontCuenta), [borderColor: Color.WHITE, valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_RIGHT])

                            document.add(tablaCuenta)

                            table = new PdfPTable(7)
                            table.setWidthPercentage(100)
                            table.setWidths(reportesPdfService.arregloEnteros([14, 14, 14, 14, 14, 14, 14]))
                            table.setSpacingBefore(5)

                            reportesPdfService.addCellTabla(table, new Paragraph("Fecha", fontDatosHeader), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_CENTER])
                            reportesPdfService.addCellTabla(table, new Paragraph("# comp.", fontDatosHeader), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_CENTER])
                            reportesPdfService.addCellTabla(table, new Paragraph("Descripción", fontDatosHeader), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_CENTER])
                            reportesPdfService.addCellTabla(table, new Paragraph("Debe", fontDatosHeader), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_CENTER])
                            reportesPdfService.addCellTabla(table, new Paragraph("Haber", fontDatosHeader), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_CENTER])
                            reportesPdfService.addCellTabla(table, new Paragraph("Pagado", fontDatosHeader), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_CENTER])
                            reportesPdfService.addCellTabla(table, new Paragraph("Saldo", fontDatosHeader), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_CENTER])
                        }

                        def sql3 = "select\n" +
                                "        u.cnta__id                    cuenta_id,\n" +
                                "        x.prve__id                    cli_id,\n" +
                                "        sum(g.pgaxmnto)               pagado\n" +
                                "  from axlr x,\n" +
                                "          asnt s,\n" +
                                "          cmpr c,\n" +
                                "          prcs p,\n" +
                                "          cnta u,\n" +
                                "          pgax g\n" +
                                "  where x.asnt__id = s.asnt__id\n" +
                                "          and s.cmpr__id = c.cmpr__id\n" +
                                "          and c.prcs__id = p.prcs__id\n" +
                                "          and s.cnta__id = u.cnta__id\n" +
                                "          and x.axlr__id = g.axlr__id\n" +
                                "          and g.axlr__id = x.axlr__id\n" +
                                "          and g.axlr__id = ${rs.id}\n" +
                                "  group by cuenta_id, cli_id\n" +
                                "  order by cuenta_id asc;"
                        def pagado = 0
                        cn3.eachRow(sql3) { r ->
                            pagado += r.pagado.toDouble()
                        }

                        reportesPdfService.addCellTabla(table, new Paragraph(util.fechaConFormato(fecha: rs.fecha, formato: "dd-MM-yyyy").toString(), fontDatos), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_LEFT])
                        reportesPdfService.addCellTabla(table, new Paragraph(rs.compnmro, fontDatos), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_LEFT])
                        reportesPdfService.addCellTabla(table, new Paragraph(rs.descripcion, fontDatos), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_LEFT])
                        reportesPdfService.addCellTabla(table, new Paragraph(util.numero(number: rs.debe).toString(), fontDatos), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_RIGHT])
                        reportesPdfService.addCellTabla(table, new Paragraph(util.numero(number: rs.haber).toString(), fontDatos), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_RIGHT])
                        reportesPdfService.addCellTabla(table, new Paragraph(util.numero(number: pagado).toString(), fontDatos), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_RIGHT])
                        reportesPdfService.addCellTabla(table, new Paragraph(util.numero(number: Math.abs(rs.debe - rs.haber) - pagado).toString(), fontDatos), [valign: Element.ALIGN_MIDDLE, align: Element.ALIGN_RIGHT])
                    }
                    if (table) {
                        document.add(table)
                    }
                }
            } else {
                String error
                error = "Faltan datos para generar el reporte:\n"
                error += "\tLa contabilidad no tiene periodos registrados\n"
                Paragraph parError = new Paragraph(error, fontError)
                document.add(parError)
            }

        }

        document.close();
        pdfw.close()
        byte[] b = baos.toByteArray();
        response.setContentType("application/pdf")
        response.setHeader("Content-disposition", "attachment; filename=" + name)
        response.setContentLength(b.length)
        response.getOutputStream().write(b)
    }

}
