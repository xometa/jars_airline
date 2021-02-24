<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Sony
--%>
<%@page import="Dao.dao_reservas"%>
<%@page import="Validaciones.Noeliminacion"%>
<%@page import="Entidades.Empresas"%>
<%@page import="Dao.dao_empresas"%>
<%@page import="Entidades.Aviones"%>
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
        Aviones guar = (Aviones) request.getAttribute("destino");/*guardar*/
        Aviones guar1 = (Aviones) request.getAttribute("destino1");/*si ya existe*/
        Aviones eli = (Aviones) request.getAttribute("borrar1");/*eliminar*/
        Aviones eli2 = (Aviones) request.getAttribute("borrar2");/*no eliminar existe*/
        Aviones modi = (Aviones) request.getAttribute("modi");/*modificar*/
    %>
    <%        
        dao_empresas aero = new dao_empresas();
        dao_aviones avion = new dao_aviones();
        dao_reservas r = new dao_reservas();
        Aviones modificar = (Aviones) request.getAttribute("modificar");
        String tipo = String.valueOf(session.getAttribute("tipo"));
        Noeliminacion ne=new Noeliminacion();

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
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <%=(modificar == null) ? "Registro" : "Modificacion"%> de aviones
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li><a href="registroavion.jsp">Registros de aviones</a></li>
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
                                    <%--<h3 class="box-title"><%=(modificar == null) ? "Registro" : "Modificacion"%></h3>--%>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <form id="form-aviones" action="ControladorAviones" method="post" class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Nombre</label>
                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getNombre()%>" type="text" class="form-control" name="nombre" id="nombre"  required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Modelo</label>
                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getModelo()%>" type="text" class="form-control" name="modelo" id="modelo"  required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Serie</label>
                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getNumserie()%>" type="text" class="form-control" name="serie" id="serie"  required>
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Capacidad</label>
                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getCapacidad()%>" type="text" class="form-control" name="capacidad" id="capacidad"  required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Estado</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="estado" id="estado" required>
                                                    <option value=" ">Seleccione</option>
                                                    <option value="Disponible">Disponible</option>
                                                    <option value="No disponible">No disponible</option>
                                                    <option value="Mantenmiento">Mantenmiento</option>

                                                    <option <%=(modificar != null) ? ((modificar.getEstado() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getEstado() : "Disponible"%>">
                                                        <%=(modificar != null) ? modificar.getEstado() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Empresa</label>
                                            <div class="col-sm-6">
                                                <select class="form-control select2" name="aerolinea" id="aerolinea">
                                                    <option value=" ">Seleccione</option>
                                                    <%for (Empresas registro : aero.listaempresas()) {%>
                                                    <option value="<%=registro.getIdempresa()%>"><%=registro.getNombreempresa()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getAerolineas().getNombreempresa() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getAerolineas().getIdempresa() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getAerolineas().getNombreempresa() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                            <%if (aero.listaempresas().size() > 0) {%>
                                            <div class="col-sm-3" >
                                                <button style="display: block" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default">
                                                    <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                            <%} else {%>
                                            <div class="col-sm-3" >
                                                <button style="display: block" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default">
                                                    <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                            <%}%>
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
                <div class="modal fade" id="modal-default">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Registro de Empresas</h4>
                            </div>
                            <form id="modal-form-aerolinea" action="ControladorAviones" method="post" class="form-horizontal">
                                <div class="modal-body">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Nombre de la empresa</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name="nombreaerolinea" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">RUC</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="rc form-control" name="ruc"  required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Teléfono</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="phone form-control" name="telefono" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <button name="registrar" type="submit" class="btn btn-success pull-right"><span class="fa fa-save"></span>  Registrar</button>
                                        </div>
                                        <div class="col-sm-3">
                                            <button id="cancelar-modal" name="cancelar" type="reset" class="btn btn-warning"><span class="fa fa-dedent"></span> Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Listado de aviones</h3>
                                    <div class="box-tools pull-right">
                                        <!--Botones para minimizar y cerrar-->
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-minus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <form action="ControladorAviones" method="post">
                                        <table id="example1" class="table table-bordered table-striped" >
                                            <thead>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Modelo</th>
                                                    <th>Serie</th>
                                                    <th>Capacidad</th>
                                                    <th>Estado</th>
                                                    <th>Empresa</th>
                                                    <th>Acciones</th>
                                                    <th>Mensaje</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Aviones registro : avion.listadoaviones()) {%>
                                                <tr>
                                                    <td><%=registro.getNombre()%></td>
                                                    <td><%=registro.getModelo()%></td>
                                                    <td><%=registro.getNumserie()%></td>
                                                    <td><%=registro.getCapacidad()%></td>
                                                    <td><%if (registro.getEstado().equals("Disponible")) {%>
                                                        <span class="badge bg-green"><%=registro.getEstado()%></span>
                                                        <%} else if (registro.getEstado().equals("No disponible")) {%>
                                                        <span class="badge bg-orange"><%=registro.getEstado()%></span>
                                                        <%} else {%>
                                                        <span class="badge bg-blue-gradient "><%=registro.getEstado()%></span>
                                                        <%}%>
                                                    </td>
                                                    <td><%=registro.getAerolineas().getNombreempresa()%></td>
                                                    <td><button name="editar" value="<%=registro.getIdavion()%>" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                        
                                                        <%if (ne.buscaravion(registro.getIdavion()) != null) {%>
                                                        <button name="borrar" value="<%=registro.getIdavion()%>" class="btn btn-danger"><span class="fa fa-remove"></span></button> 
                                                        <%} else {%>
                                                        <button name="borrar" value="<%=registro.getIdavion()%>" class="btn btn-danger"><span class="fa fa-trash"></span></button> 
                                                        <%}%>
                                                    </td>
                                                    <td>
                                                        <%if (ne.buscaravion(registro.getIdavion()) != null) {%>
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
                    text: "El avión ya ha sido registrado",
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
                    $('.glyphicon').remove();
                    $('.help-block').text("");/*valores de los textos de los mensajes en limpio*/
                });

                $("#cancelar-modal").on("click", function () {
                    $('.form-group').removeClass('has-success has-error');
                    $('.glyphicon').remove();
                    $('.help-block').text("");/*valores de los textos de los mensajes en limpio*/
                });

                $(document).ready(function () {
                    $('.phone').mask('(999) 9999-9999');
                });

                $(document).ready(function () {
                    $('.rc').mask('9999999999999');
                });
            });
        </script>
        <script>
            $(function () {
                //Initialize Select2 Elements
                $('.select2').select2();
            });
        </script>
    </body>
</html>

