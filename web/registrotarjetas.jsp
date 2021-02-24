<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Sony
--%>
<%@page import="Validaciones.Noeliminacion"%>
<%@page import="Dao.dao_reservas"%>
<%@page import="Dao.dao_aviones"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.Tarjetas"%>
<%@page import="Dao.dao_tarjetas"%>
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
        Tarjetas guar = (Tarjetas) request.getAttribute("destino");/*guardar*/
        Tarjetas guar1 = (Tarjetas) request.getAttribute("destino1");/*si ya existe*/
        Tarjetas eli = (Tarjetas) request.getAttribute("borrar1");/*eliminar*/
        Tarjetas eli2 = (Tarjetas) request.getAttribute("borrar2");/*no eliminar existe*/
        Tarjetas modi = (Tarjetas) request.getAttribute("modi");/*modificar*/
    %>
    <%
        dao_tarjetas tarjetas = new dao_tarjetas();
        Noeliminacion ne=new Noeliminacion();
        dao_aviones a = new dao_aviones();
        dao_reservas r = new dao_reservas();
        Tarjetas modificar = (Tarjetas) request.getAttribute("modificar");
        String tipo = String.valueOf(session.getAttribute("tipo"));

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Tarjetas</title>
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
        <!-- Date picker -->
        <link href="componentes/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
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
                        <%=(modificar == null) ? "Registro" : "Modificacion"%> de tarjetas
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li><a href="registrotarjetas.jsp">Registros de tarjetas</a></li>
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
                                    <h3 class="box-title"><%=(modificar == null) ? "Registro" : "Modificacion"%></h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form id="form-targetas" action="ControladorTarjetas" method="post" class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Nombre del titular</label>
                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getNombre()%>" type="text" class="form-control" name="nombredeltitular" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Fecha de vencimiento</label>
                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getFecha()%>" name="fechadecaducidad" type="date" class="form-control pull-right">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Código</label>
                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getCodigo()%>" name="codseguridad" type="text" class="form-control"  required>
                                            </div>
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
                                    <h3 class="box-title">Listado de tarjetas</h3>
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
                                    <form action="ControladorTarjetas" method="post">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Titular</th>
                                                    <th>Fecha de vencimiento</th>
                                                    <th>Código de seguridad</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Tarjetas registro : tarjetas.listadotarjetas()) {%>
                                                <tr>
                                                    <td><%=registro.getNombre()%></td>
                                                    <td><%=registro.getFecha()%></td>
                                                    <td><%=registro.getCodigo()%></td>
                                                    <td><button value="<%=registro.getIdtarjeta()%>" name="editar" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                        <%if (ne.buscartarjeta(registro.getIdtarjeta()) != null) {%>
                                                        <button value="<%=registro.getIdtarjeta()%>" name="borrar" class="btn btn-danger"><span class="fa fa-remove"></span></button> 
                                                    <%} else {%>
                                                    <button value="<%=registro.getIdtarjeta()%>" name="borrar" class="btn btn-danger"><span class="fa fa-trash"></span></button> 
                                                    <%}%>
                                                    </td>
                                                    <td>
                                                        <%if (ne.buscartarjeta(registro.getIdtarjeta()) != null) {%>
                                                        <span class="badge bg-red">No eliminable</span>
                                                        <%} else {%>
                                                        <span class="badge bg-green-gradient">Eliminable</span>
                                                        <%}%>
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
        <!-- date picker 
        <script src="componentes/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>                -->
        <!-- validaciones -->
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
                    text: "Ingrese un código de seguridad diferente para el registro de la tarjeta",
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
            <%if (modi != null) {%>
                swal({
                    title: "Exito",
                    text: "Registro modificado exitosamente",
                    icon: "success"
                });
            <%}%>
            });
        </script>

        <!-- page script -->
        <script type="text/javascript">
            $(document).ready(function () {
                $("#limpiar").on("click", function () {
                    $('.form-group').removeClass('has-success has-error');
                    $('.glyphicon ').remove();
                    $('.help-block').text("");
                });
            });
        </script>
        <!-- page script -->
        <script>
            $(function () {
                //Date picker
                $('#datepicker').datepicker({
                    autoclose: true
                })

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

