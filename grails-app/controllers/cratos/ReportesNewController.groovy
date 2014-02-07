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

    def index() {}

    def auxiliarPorCliente() {

        println "********************--" + params

        def baos = new ByteArrayOutputStream()
        def name = "reporte_de_" + params.filename.replaceAll(" ", "_") + "_" + new Date().format("ddMMyyyy_hhmm");
        println "name " + name
        Font fontTitulo = new Font(Font.TIMES_ROMAN, 12, Font.BOLD);
        Font fontInfo = new Font(Font.TIMES_ROMAN, 10, Font.NORMAL);
        Document document = reportesPdfService.crearDocumento("v")
        def pdfw = PdfWriter.getInstance(document, baos);

        document.open();
        document.addTitle("Reporte de " + params.titulo + " " + new Date().format("dd_MM_yyyy"));
        document.addSubject("Generado por el sistema Cratos");
        document.addKeywords("reporte, cratos," + params.titulo);
        document.addAuthor("Cratos");
        document.addCreator("Tedein SA");
        Paragraph preface = new Paragraph();
        reportesPdfService.addEmptyLine(preface, 1);
        preface.add(new Paragraph("Reporte de " + params.titulo, fontTitulo));
        preface.add(new Paragraph("Generado por el usuario: " + session.usuario + "   el: " + new Date().format("dd/MM/yyyy hh:mm"), fontInfo))
        reportesPdfService.addEmptyLine(preface, 1);
        document.add(preface);



        document.close();
        pdfw.close()
        byte[] b = baos.toByteArray();
        response.setContentType("application/pdf")
        response.setHeader("Content-disposition", "attachment; filename=" + name)
        response.setContentLength(b.length)
        response.getOutputStream().write(b)
    }

}
