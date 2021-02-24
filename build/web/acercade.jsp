<%-- 
    Document   : acercade
    Created on : dic 11, 2018, 3:58:45 p.m.
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Dao.dao_reservas"%>
<%@page import="Validaciones.Noeliminacion"%>
<%@page import="Entidades.Empresas"%>
<%@page import="Dao.dao_empresas"%>
<%@page import="Entidades.Aviones"%>
<%@page import="Dao.dao_aviones"%>
<%@page session="true" %>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);
    try {
        if (session.getAttribute("user") == null) {
            request.getRequestDispatcher("iniciosesion.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.getRequestDispatcher("iniciosesion.jsp").forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
    <%
        dao_aviones avion = new dao_aviones();
        dao_reservas r = new dao_reservas();
        String tipo = String.valueOf(session.getAttribute("tipo"));

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Aviones</title>
        <!--Favicon-->
        <link rel="icon" type="image/png" href="estilos/img/favicon.png">

        <!-- para hacer responsive el diseño -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 4.1.3-->
        <link rel="stylesheet" href="componentes/bootstrap/dist/css/bootstrap.min.css">
        <link href="validator/css/bootstrapValidator.css" rel="stylesheet" type="text/css"/>
        <link href="validator/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome para los iconos y los estilos de letras-->
        <link rel="stylesheet" href="componentes/font-awesome/css/font-awesome.min.css">
        <!-- para los iconos del panel del index para el control de cantidades -->
        <link rel="stylesheet" href="componentes/Ionicons/css/ionicons.min.css">
        <!-- para el diseño de la plantilla. -->
        <link rel="stylesheet" href="estilos/css/AdminLTE.min.css">
        <!-- para el diseño de la plantilla. -->
        <link rel="stylesheet" href="estilos/css/skins/_all-skins.min.css">
        <!--paginacion de las tablas y del filtrado-->
        <link rel="stylesheet" href="componentes/datatables.net-bs/css/dataTables.bootstrap.min.css">
        <!--Para el combo o select-->
        <link href="componentes/select2/dist/css/select2.min.css" rel="stylesheet"/>
        <!-- Google Font -->
        <link href="estilos/slider/carousel.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition skin-yellow sidebar-mini">
        <div class="wrapper">
            <!--llamando al archivo que contiene el menu-->
            <%if (tipo.equals("Administrador")) {%>
            <%@include file="headerAdmin.jsp" %>
            <li>
                <a href="index.jsp">
                    <i class="fa fa-home"></i> <span>Inicio</span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-red"><%=avion.cantaviones()%></small>
                        <small class="label pull-right bg-orange"><%=r.cantreservasnopagadas()%></small>
                        <small class="label pull-right bg-aqua"><%=r.reservasnuevas()%></small>
                    </span>
                </a>
            </li>
            <%@include file="menuyencabezado.jsp" %>
            <%} else if (tipo.equals("Empleado")) {%>
            <%@include file="headerEmpleado.jsp" %>
            <li>
                <a href="index.jsp">
                    <i class="fa fa-home"></i> <span>Inicio</span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-red"><%=avion.cantaviones()%></small>
                        <small class="label pull-right bg-orange"><%=r.cantreservasnopagadas()%></small>
                        <small class="label pull-right bg-aqua"><%=r.reservasnuevas()%></small>
                    </span>
                </a>
            </li>
            <%@include file="menuempleado.jsp" %>
            <%}%>


            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-xs-12">
                            <!-- general form elements -->
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Acerca de los desarrolladores</h3>
                                </div>
                                    <div class="col-md-12">
                                        <!-- USERS LIST -->
                                        <div class="box box-danger">
                                            <!-- /.box-header -->
                                            <div class="box-body no-padding">
                                                <ul class="users-list clearfix">
                                                    <li>
                                                        <img src="estilos/img/0.png" alt="User Image">
                                                        <a class="users-list-name" href="#">Kevin Alexis Jimenez Ruíz</a>
                                                        <span class="users-list">Desarrollador</span>
                                                    </li>
                                                    <li>
                                                        <img src="estilos/img/2.png" alt="User Image">
                                                        <a class="users-list-name" href="#">José Gerardo Zometa Díaz</a>
                                                        <span class="users-list">Desarrollador</span>
                                                    </li>
                                                    <li>
                                                        <img src="estilos/img/3.png" alt="User Image">
                                                        <a class="users-list-name" href="#">Katherine Lorena Peña Siguenza</a>
                                                        <span class="users-list">Desarrollador</span>
                                                    </li>
                                                    <li>
                                                        <img src="estilos/img/4.png" alt="User Image">
                                                        <a class="users-list-name" href="#">Ricardo Osmín Morán Cortéz</a>
                                                        <span class="users-list">Desarrollador</span>
                                                    </li>
                                                    <li>
                                                        <img src="estilos/img/5.png" alt="User Image">
                                                        <a class="users-list-name" href="#">José Saúl Hernández Vásquez</a>
                                                        <span class="users-list">Desarrollador</span>
                                                    </li>
                                                </ul>
                                                <!-- /.users-list -->
                                            </div>
                                            <!-- /.box-body -->
                                        </div>
                                        <!--/.box -->
                                    </div>
                                <!-- /.box-footer -->
                                <div class="box-footer">
                                </div>
                                <!-- /.box-footer -->
                            </div>
                            <!-- /.box -->

                            <!-- Input addon -->
                        </div>
                        <!--/.col (left) -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->

            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <strong>Copyright&copy; 2018 </strong> UES 
            </footer>

            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- jQuery 3 -->
        <script src="componentes/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 4.1.3 -->
        <script src="componentes/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="componentes/fastclick/lib/fastclick.js"></script>
        <!-- para resolver conflictos con los js -->
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <!-- Slimscroll para el slider de los componentes del panel-->
        <script src="componentes/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- complemento del css -->
        <script src=" estilos/js/adminlte.min.js"></script>
        <!-- DataTables -->
        <script src="componentes/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="componentes/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
        <!--para el combo o select-->
        <script src="componentes/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
        <!--sweet alert-->
        <script src="package/dist/sweetalert2.min.js" type="text/javascript"></script>
        <!-- validaciones -->
        <script src="validator/js/bootstrapValidator.js" type="text/javascript"></script>
        <script src="validator/js/validaciones.js" type="text/javascript"></script>
        <!-- mascaras -->
        <script src="validator/js/jquery.mask.js" type="text/javascript"></script>
        <script src="estilos/slider/slick.js" type="text/javascript"></script>
    </body>
</html>
