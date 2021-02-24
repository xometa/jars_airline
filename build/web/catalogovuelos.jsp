<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Sony
--%>
<%@page import="Dao.dao_pagos"%>
<%@page import="Dao.dao_empresas"%>
<%@page import="Entidades.Empresas"%>
<%@page import="Dao.dao_aviones"%>
<%@page import="Entidades.Aviones"%>
<%@page import="Dao.dao_vuelos"%>
<%@page import="Entidades.Vuelo"%>
<%@page import="Entidades.Reservas"%>
<%@page import="Dao.dao_reservas"%>
<%@page import="Entidades.Asientos"%>
<%@page import="Entidades.Destinos"%>
<%@page import="Entidades.Origenes"%>
<%@page import="Entidades.Pasajeros"%>
<%@page import="Dao.dao_asientos"%>
<%@page import="Dao.dao_destino"%>
<%@page import="Dao.dao_origen"%>
<%@page import="Dao.dao_pasajeros"%>
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
    dao_origen origen = new dao_origen();
    dao_destino destino = new dao_destino();
    dao_reservas reserva = new dao_reservas();
    dao_aviones avion = new dao_aviones();
    dao_empresas aero = new dao_empresas();
    dao_vuelos vuelo = new dao_vuelos();
    String tipo = String.valueOf(session.getAttribute("tipo"));
%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Catalogo Vuelos</title>
        <!--Favicon-->
        <link rel="icon" type="image/png" href="estilos/img/favicon.png">

        <!-- para hacer responsive el diseño -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 4.1.3-->
        <link rel="stylesheet" href="componentes/bootstrap/dist/css/bootstrap.min.css">
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
        <!-- Hora -->
        <link href="componentes/timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css"/>
        <!-- Date picker -->
        <link href="componentes/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
        <!--Para el combo o select-->
        <link href="componentes/select2/dist/css/select2.min.css" rel="stylesheet"/>
        <!-- Google Font -->
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
                        <small class="label pull-right bg-orange"><%=reserva.cantreservasnopagadas()%></small>
                        <small class="label pull-right bg-aqua"><%=reserva.reservasnuevas()%></small>
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
                       <small class="label pull-right bg-orange"><%=reserva.cantreservasnopagadas()%></small>
                        <small class="label pull-right bg-aqua"><%=reserva.reservasnuevas()%></small>
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
                        Vuelos (Origen y Destino)
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li><a href="catalogovuelos.jsp">Catalogo de vuelos</a></li>
                        <li class="active">Vuelos</li>
                    </ol>
                </section>
                <!-- /.content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Listado de vuelos</h3>
                                    <div class="box-tools pull-right">
                                        <!--Botones para minimizar y cerrar-->
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-minus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <form action="ControladorReservas" method="post">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Fecha salida</th>
                                                    <th>Fecha llegada</th>
                                                    <th>Hora salida</th>
                                                    <th>Hora llegada</th>
                                                    <th>Avion</th>
                                                    <th>Origen</th>
                                                    <th>Aeropuerto de origen</th>
                                                    <th>Destino</th>
                                                    <th>Aeropuerto de destino</th>
                                                    <th>Costo</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Vuelo registro : vuelo.listadovuelos()) {%>
                                                <tr>
                                                    <td><%=registro.getFechasalida()%></td>
                                                    <td><%=registro.getFechallegada()%></td>
                                                    <td><%=registro.getHorasalida()%></td>
                                                    <td><%=registro.getHorallegada()%></td>
                                                    <td><%=registro.getAviones().getNombre()%></td>
                                                    <td><span class="badge bg-light-blue"><%=registro.getOrigenes().getPais()%></span></td>
                                                    <td><%=registro.getOrigenes().getNombreaeropuerto()%></td>
                                                    <td><span class="badge bg-orange"><%=registro.getDestinos().getPais()%></span></td>
                                                    <td><%=registro.getDestinos().getNombreaeropuerto()%></td>
                                                    <td><%=registro.getCosto()%></td>
                                                    <td>
                                                        <button name="addvuelo" value="<%=registro.getIdvuelo()%>" class="btn btn-primary"><span class="fa fa-plus"></span></button>
                                                    </td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
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
        <!-- Bootstrap 4.1.3 -->
        <script src="componentes/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="componentes/fastclick/lib/fastclick.js"></script>
        <!-- para resolver conflictos con los js -->
        <script src="estilos/js/scrolltable.js" type="text/javascript"></script>
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
        <!-- date picker -->
        <script src="componentes/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>

        <!--hora-->
        <script src="componentes/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
        <script src="componentes/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="componentes/moment/min/moment.min.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js" type="text/javascript"></script>
        <script src="componentes/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <script src="componentes/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- page script -->
        <script>
            $(function () {
                //Timepicker
                $('.timepicker').timepicker({
                    showInputs: false
                })
            })
        </script>
        <script>
            $(function () {
                //Initialize Select2 Elements
                $('.select2').select2()

                $('#example1').DataTable()
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                })
            })
        </script>
    </body>
</html>

