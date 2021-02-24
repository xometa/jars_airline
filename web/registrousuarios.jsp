<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Ricardo Cortez
--%>

<%@page import="Dao.dao_reservas"%>
<%@page import="Dao.dao_aviones"%>
<%@page import="Validaciones.Noeliminacion"%>
<%@page import="Dao.dao_usuarios"%>
<%@page import="Entidades.Usuarios"%>
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
        Usuarios guar = (Usuarios) request.getAttribute("destino");/*guardar*/
        Usuarios guar1 = (Usuarios) request.getAttribute("destino1");/*si ya existe*/
        Usuarios eli = (Usuarios) request.getAttribute("borrar1");/*eliminar*/
        Usuarios eli2 = (Usuarios) request.getAttribute("borrar2");/*no eliminar existe*/
        Usuarios modi = (Usuarios) request.getAttribute("modi");/*modificar*/
    %>
    <% Dao.dao_usuarios user = new dao_usuarios();
        dao_aviones a = new dao_aviones();
        dao_reservas r = new dao_reservas();
        Usuarios modificar = (Usuarios) request.getAttribute("modificar");
        String tipo = String.valueOf(session.getAttribute("tipo"));
        Noeliminacion ne = new Noeliminacion();
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Usuarios</title>
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
                        <%=(modificar == null) ? "Registro" : "Modificacion"%> de Usuarios
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li><a href="registrousuarios.jsp">Registros de usuarios</a></li>
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
                                <form id="form-usuarios" action="ControladorUsuario" method="post" class="form-horizontal">

                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Nombres</label>
                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getNombre()%>" name="nombre" type="text" class="form-control" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Apellidos</label>

                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getApellido()%>" name="apellido" type="text" class="form-control"  required>
                                            </div>
                                        </div>
                                        <!-- tipo -->
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Sexo</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="sexo" required>
                                                    <option value=" ">Seleccione:</option>
                                                    <option value="Masculino">Masculino</option>
                                                    <option value="Femenino">Femenino</option>
                                                    <option <%=(modificar != null) ? ((modificar.getSexo() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getSexo() : "Femenino"%>">
                                                        <%=(modificar != null) ? modificar.getSexo() : ""%>
                                                    </option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Usuario</label>

                                            <div class="col-sm-6">
                                                <input value="<%=(modificar == null) ? "" : modificar.getNombreusuario()%>" name="nombreusuario" type="text" class="form-control" id="nombre_aerolinea"  required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Contraseña</label>

                                            <div class="col-sm-6">
                                                <%if(modificar == null){%>
                                                <input style="display: block;" value="<%=(modificar == null) ? "" : modificar.getContrasena()%>" name="contrasenia" type="password" class="form-control" >
                                                
                                                <%}else{%>
                                                <input style="display: block;"  name="contrasenia1" type="password" class="form-control">
                                                <%}%>
                                                
                                            </div>
                                        </div>
                                        <!-- tipo -->
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Tipo Usuario</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="tipo" required>
                                                    <option value=" ">Seleccione:</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Empleado">Empleado</option>
                                                    <option <%=(modificar != null) ? ((modificar.getTipo() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getTipo() : "Empleado"%>">
                                                        <%=(modificar != null) ? modificar.getTipo() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <input type="submit" class="btn btn-primary pull-right" name="<%=(modificar == null) ? "guardar" : "modificar"%>" 
                                                       value="<%=(modificar == null) ? "Guardar" : "Modificar"%>" />
                                                <!-- <input type="submit" class="btn btn-primary pull-right" -->
                                                <!--  value="<//(modificar == null) ? "Registrar" : "Modificar"%>"-->
                                                <!-- name="<//(modificar == null) ? "registrar" : "modificar"%>" -->
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
                                    <h3 class="box-title">Listado de Usuarios</h3>
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
                                    <form action="ControladorUsuario" method="post">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Apellidos</th>
                                                    <th>Sexo</th>
                                                    <th>Usuario</th>
                                                    <th>Contraseña</th>
                                                    <th>Tipo Usuario</th>
                                                    <th>Acciones</th>
                                                    <th>Mensaje</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Usuarios registro : user.listadousuarios()) {%>
                                                <tr>

                                                    <td><%= registro.getNombre()%></td>
                                                    <td><%= registro.getApellido()%></td>
                                                    <td><%= registro.getSexo()%></td>
                                                    <td><%= registro.getNombreusuario()%></td>
                                                    <td><%= registro.getContrasena()%></td>
                                                    <td><%if (registro.getTipo().equals("Administrador")) {%>
                                                        <span class="badge bg-green"><%= registro.getTipo()%></span>
                                                        <%} else {%>
                                                        <span class="badge bg-orange"><%= registro.getTipo()%></span>
                                                        <%}%>
                                                    </td>
                                                    <td> <button class="btn btn-success" name="btneditar" value="<%=registro.getIdusuario()%>"><span class="fa fa-edit"></span></button>
                                                            <%if (ne.buscaruser(registro.getIdusuario()) != null) {%>
                                                        <button class="btn btn-pinterest" name="borrar" value="<%=registro.getIdusuario()%>"><span class="fa fa-remove"></span></button> 
                                                            <%} else {%>
                                                        <button class="btn btn-pinterest" name="borrar" value="<%=registro.getIdusuario()%>"><span class="fa fa-trash"></span></button> 
                                                            <%}%>
                                                    </td>
                                                    <td>
                                                        <%if (ne.buscaruser(registro.getIdusuario()) != null) {%>
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
                    text: "El usuario ya ha sido registrado",
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
        <script>
            $(function () {
                $('#example1').DataTable()
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
    </body>
</html>

