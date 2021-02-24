<%-- 
    Document   : index
    Created on : 10-17-2018, 04:56:16 PM
    Author     : Sony
--%>

<%@page import="Dao.dao_pagos"%>
<%@page import="Dao.dao_reservas"%>
<%@page import="Dao.dao_aviones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    dao_aviones a = new dao_aviones();
    dao_reservas r = new dao_reservas();
    dao_pagos p = new dao_pagos();
    String tipo = String.valueOf(session.getAttribute("tipo"));
%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Inicio</title>
        <!--Favicon-->
        <link rel="icon" type="image/png" href="estilos/img/favicon.png">
        <!-- para hacer responsive el diseño -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 4.1.3 -->
        <link rel="stylesheet" href="componentes/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome para los iconos y los estilos de letras-->
        <link rel="stylesheet" href="componentes/font-awesome/css/font-awesome.min.css">
        <!-- para los iconos del panel del index para el control de cantidades -->
        <link rel="stylesheet" href="componentes/Ionicons/css/ionicons.min.css">
        <!-- diseño y estilos -->
        <link rel="stylesheet" href="estilos/css/AdminLTE.min.css">
        <!-- para el diseño de la plantilla. -->
        <link rel="stylesheet" href="estilos/css/skins/_all-skins.min.css">
        <link href="package/dist/sweetalert2.css" rel="stylesheet" type="text/css"/>
        <link href="package/dist/sweetalert2.min.css" rel="stylesheet" type="text/css"/>

        <!-- Google fuentes -->
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
                        <small class="label pull-right bg-red"><%=a.cantaviones()%></small>
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
                        <small class="label pull-right bg-red"><%=a.cantaviones()%></small>
                        <small class="label pull-right bg-orange"><%=r.cantreservasnopagadas()%></small>
                        <small class="label pull-right bg-aqua"><%=r.reservasnuevas()%></small>
                    </span>
                </a>
            </li>
            <%@include file="menuempleado.jsp" %>
            <%}%>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Inicio
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li class="active">Inicio</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3><%=r.reservasnuevas()%></h3>

                                    <p>Nuevas Reservas</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-android-globe"></i>
                                </div>
                                
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>$ <%=p.ingresos()%></h3>

                                    <p>Ingresos Totales</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-social-usd"></i>
                                </div>
                                
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3><%=r.cantreservasnopagadas()%></h3>

                                    <p>Reservas no Pagadas</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-android-list"></i>
                                </div>
                                
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3><%=a.cantaviones()%></h3>

                                    <p>Total de Aviones Registrados</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-android-plane"></i>
                                </div>
                                
                            </div>
                        </div>
                        <!-- ./col -->
                    </div>
                    <!-- /.row -->
                    <!-- Main row -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <strong>Copyright &copy; 2018 </strong> UES
            </footer>
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- jQuery 3 -->
        <script src="componentes/jquery/dist/jquery.min.js"></script>
        <!-- para resolver conflictos con los js -->
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <!-- Bootstrap 4.1.3 -->
        <script src="componentes/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- Slimscroll para el slider de los componentes del panel-->
        <script src="componentes/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="componentes/fastclick/lib/fastclick.js"></script>
        <!-- complemento del css diseño -->
        <script src="estilos/js/adminlte.min.js"></script>
    </body>
</html>

