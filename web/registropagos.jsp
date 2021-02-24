<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Sony
--%>
<%@page import="Dao.dao_aviones"%>
<%@page import="Entidades.Tarjetas"%>
<%@page import="Entidades.Reservas"%>
<%@page import="Dao.dao_tarjetas"%>
<%@page import="Dao.dao_reservas"%>
<%@page import="Entidades.Pagos"%>
<%@page import="Dao.dao_pagos"%>
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
        Pagos guar = (Pagos) request.getAttribute("destino");/*guardar*/
        Pagos guar1 = (Pagos) request.getAttribute("destino1");/*si ya existe*/
        Pagos eli = (Pagos) request.getAttribute("borrar1");/*eliminar*/
        Pagos eli2 = (Pagos) request.getAttribute("borrar2");/*no eliminar existe*/
        Pagos modif = (Pagos) request.getAttribute("modi");/*modificar*/
    %>
    <%
        dao_reservas reserva = new dao_reservas();
        dao_tarjetas tarjeta = new dao_tarjetas();
        dao_aviones a = new dao_aviones();
        dao_pagos pago = new dao_pagos();
        Pagos modificar = (Pagos) request.getAttribute("modificar");
        String tipo = String.valueOf(session.getAttribute("tipo"));
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Pagos</title>
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
                        <small class="label pull-right bg-red"><%=a.cantaviones()%></small>
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
                        Nuevo pago
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li><a href="registropagos.jsp">Registros de pagos</a></li>
                        <li class="active">Nuevo registro</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-12">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Registro</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form id="form-pagos" action="ControladorPagosReservas" method="post" class="form-horizontal">
                                    <div class="box-body">

                                        <!-- nombre -->
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Forma de Pago</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="formapago">
                                                    <option selected="selected" value=" ">Seleccione</option>
                                                    <option value="Credito">Crédito</option>
                                                    <option value="Contado">Contado</option>
                                                    <option <%=(modificar != null) ? ((modificar.getFormapago()!= null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getFormapago() : "Contado"%>">
                                                        <%=(modificar != null) ? modificar.getFormapago() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Titular</label>
                                            <div class="col-sm-6">
                                                <select class="form-control select2" name="titular">
                                                    <option selected="selected" value=" ">Seleccione</option>
                                                    <%for (Tarjetas registro : tarjeta.listadotarjetas()) {%>
                                                    <option value="<%=registro.getIdtarjeta()%>" ><%=registro.getNombre()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getTarjetas().getNombre() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getTarjetas().getIdtarjeta() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getTarjetas().getNombre() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Reserva</label>
                                            <div class="col-sm-6">
                                                <select class="form-control select2" name="reserva">
                                                    <option value=" ">Seleccione</option>
                                                    <%for (Reservas registro : reserva.listadoreservasnopagadas()) {%>
                                                    <option value="<%=registro.getIdreserva()%>" ><%=registro.getCodigo()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getReservas().getCodigo() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getReservas().getIdreserva() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getReservas().getCodigo() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Costo</label>
                                            <div class="col-sm-6">
                                                <input type="text" value="<%=(modificar == null) ? "" : modificar.getCosto()%>" class="form-control" name="costo"  required>
                                            </div>
                                        </div>
                                        <!-- /.box-footer -->
                                        <div class="box-footer">
                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <input type="submit" class="btn btn-primary pull-right" name="<%=(modificar == null) ? "guardar" : "modificar"%>" 
                                                           value="<%=(modificar == null) ? "Guardar" : "Modificar"%>" />
                                                </div>
                                                <div class="col-sm-3">
                                                    <button id="limpiar" name="limpiar" type="reset" class="btn btn-warning"><span class="fa fa-dedent"></span> Limpiar</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.box-footer -->
                                    </div>
                                </form>
                            </div>
                            <!-- /.box -->

                            <!-- Input addon -->
                        </div>
                        <!--/.col (left) -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
               <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Listado de pagos</h3>
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
                                    <form action="ControladorPagosReservas" method="post">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Forma de pago</th>
                                                    <th>Costo</th>
                                                    <th>Titular</th>
                                                    <th>Reserva</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Pagos registro : pago.listadopagos()) {%>
                                                <tr>
                                                    <td><%=registro.getFormapago()%></td>
                                                    <td><%=registro.getCosto()%></td>
                                                    <td><%=registro.getTarjetas().getNombre()%></td>
                                                    <td><%=registro.getReservas().getCodigo()%></td>
                                                    <%if (registro.getReservas().getEstadopago().equals("Pagada")) {%>
                                                    <td><span class="badge bg-green"><%=registro.getReservas().getEstadopago()%></span></td>
                                                        <%} else {%>
                                                    <td><span class="badge bg-orange"><%=registro.getReservas().getEstadopago()%></span></td>
                                                        <%}%>
                                                    <td><button disabled value="<%=registro.getIdpago()%>" name="editar" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                        <button disabled value="<%=registro.getIdpago()%>" name="borrar" class="btn btn-danger"><span class="fa fa-remove"></span></button> </td>
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
        <!--validaciones-->
        <script src="validator/js/bootstrapValidator.js" type="text/javascript"></script>
        <script src="validator/js/validaciones.js" type="text/javascript"></script>
        <script src="sweetalert/sweetalert.min.js" type="text/javascript"></script>
        <!-- para los alerts -->
        <script type="text/javascript">
            $(document).ready(function () {
            <%if (guar != null) {%>
                swal({
                    title: "Exito",
                    text: "Registro guardado exitosamente",
                    icon: "success"
                });
            <%}%>
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
            <%if (guar1 != null) {%>
                swal({
                    title: "Error",
                    text: "La empresa o el número de RUC ya ha sido registrado",
                    icon: "warning"
                });
            <%}%>
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
            <%if (eli != null) {%>
                swal({
                    title: "Exito",
                    text: "Registro eliminado exitosamente",
                    icon: "success"
                });
            <%}%>
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
            <%if (eli2 != null) {%>
                swal({
                    title: "Error",
                    text: "El registro no se puede eliminar",
                    icon: "error"
                });
            <%}%>
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
            <%if (modif != null) {%>
                swal({
                    title: "Exito",
                    text: "Registro modificado exitosamente",
                    icon: "success"
                });
            <%}%>
            });
        </script>


        <!-- page script -->
        <script>
            $(function () {

                //Initialize Select2 Elements
                $('.select2').select2();
                $('#example1').DataTable();
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': true,
                    'info': true,
                    'autoWidth': false
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#limpiar").on("click", function () {
                    $('.form-group').removeClass('has-success has-error');
                    $('.glyphicon ').remove();
                    $('.help-block').text("");
                });
            });
        </script>
    </body>
</html>

