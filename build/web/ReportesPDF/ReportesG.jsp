<%-- 
    Document   : ReporteA
    Created on : 11-28-2018, 08:30:05 PM
    Author     : Gerardo
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="Conexion.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          conexion conexion = new conexion();
            File reporfile = new File(application.getRealPath("Reportes/Reporte7.jasper"));
            Map parameter = new HashMap();
            String sexo = request.getParameter("sexo");
            parameter.put("sexo", sexo);
            byte[] bytes = JasperRunManager.runReportToPdf(reporfile.getPath(), parameter, conexion.getConexion());
            response.setContentType("application.pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outpouststream = response.getOutputStream();
            outpouststream.write(bytes, 0, bytes.length);
            outpouststream.flush();
            outpouststream.close();
        %>
    </body>
</html>
