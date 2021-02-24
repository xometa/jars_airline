<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Sony
--%>
<%@page import="Validaciones.Noeliminacion"%>
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
        Vuelo guar = (Vuelo) request.getAttribute("destino");/*guardar*/
        Vuelo guar1 = (Vuelo) request.getAttribute("destino1");/*si ya existe*/
        Vuelo eli = (Vuelo) request.getAttribute("borrar1");/*eliminar*/
        Vuelo eli2 = (Vuelo) request.getAttribute("borrar2");/*no eliminar existe*/
        Vuelo modi = (Vuelo) request.getAttribute("modi");/*modificar*/
    %>
    <%
        Noeliminacion ne = new Noeliminacion();
        dao_origen origen = new dao_origen();
        dao_destino destino = new dao_destino();
        dao_reservas reserva = new dao_reservas();
        dao_aviones avion = new dao_aviones();
        dao_empresas aero = new dao_empresas();
        dao_vuelos vuelo = new dao_vuelos();
        Vuelo modificar = (Vuelo) request.getAttribute("modificar");
        String tipo = String.valueOf(session.getAttribute("tipo"));
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Vuelos</title>
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
                        Nuevo registro de vuelos
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li><a href="registrovuelos.jsp">Registros de vuelos</a></li>
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
                                <form id="form-vuelos" action="ControladorVuelo" method="post" class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Fecha salida</label>
                                            <div class="col-sm-6">
                                                <input type="date" class="form-control" value="<%=(modificar == null) ? "" : modificar.getFechasalida()%>" name="fechasalida"  required>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Fecha llegada</label>
                                            <div class="col-sm-6">
                                                <input type="date" class="form-control" value="<%=(modificar == null) ? "" : modificar.getFechallegada()%>" name="fechallegada"  required>
                                            </div>
                                        </div>
                                        <div class="bootstrap-timepicker">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Hora salida</label>
                                                <div class="col-sm-6">
                                                    <input type="text" class="form-control timepicker" value="<%=(modificar == null) ? "" : modificar.getHorasalida()%>" name="horasalida"  required>
                                                </div>
                                            </div></div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Hora llegada</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control timepicker" value="<%=(modificar == null) ? "" : modificar.getHorallegada()%>" name="horallegada"  required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Avión</label>
                                            <div class="col-sm-6">
                                                <select name="idavion" class="form-control select2">
                                                    <option value=" ">Seleccione</option>
                                                    <%for (Aviones registro : avion.listadoavionesdisponibles()) {%>
                                                    <option value="<%=registro.getIdavion()%>"><%=registro.getNombre()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getAviones().getNombre() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getAviones().getIdavion() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getAviones().getNombre() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="col-sm-3" >
                                                <button style="display: block" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default1">
                                                    <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Origen</label>
                                            <div class="col-sm-6">
                                                <select name="idorigen" class="form-control select2">
                                                    <option value=" ">Seleccione</option>
                                                    <%for (Origenes registro : origen.listadoorigenes()) {%>
                                                    <option value="<%=registro.getIdorigen()%>"><%=registro.getPais() + " , " + registro.getNombreaeropuerto()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getOrigenes().getPais() + " , " + modificar.getOrigenes().getNombreaeropuerto() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getOrigenes().getIdorigen() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getOrigenes().getPais() + " , " + modificar.getOrigenes().getNombreaeropuerto() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="col-sm-3" >
                                                <button style="display: block" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default2">
                                                    <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Destino</label>
                                            <div class="col-sm-6">
                                                <select name="iddestino" class="form-control select2">
                                                    <option value=" ">Seleccione</option>
                                                    <%for (Destinos registro : destino.listadodestinos()) {%>
                                                    <option value="<%=registro.getIddestino()%>"><%=registro.getPais() + " , " + registro.getNombreaeropuerto()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getDestinos().getPais() + " , " + modificar.getDestinos().getNombreaeropuerto() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getDestinos().getIddestino() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getDestinos().getPais() + " , " + modificar.getDestinos().getNombreaeropuerto() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="col-sm-3" >
                                                <button style="display: block" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default3">
                                                    <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Costo</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" value="<%=(modificar == null) ? "" : modificar.getCosto()%>" name="costo"  required>
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
                                                <button name="limpiar" id="limpiar" type="reset" class="btn btn-warning"><span class="fa fa-dedent"></span> Limpiar</button>
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


                <div class="modal fade" id="modal-default1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Registro de Aviones</h4>
                            </div>
                            <form id="form-aviones-modal" action="ControladorVuelo" method="post" class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="nombre" class="col-sm-3 control-label">Nombre</label>
                                        <div class="col-sm-6">
                                            <input  type="text" class="form-control" name="nombre" id="nombre"  required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="nombre" class="col-sm-3 control-label">Modelo</label>
                                        <div class="col-sm-6">
                                            <input  type="text" class="form-control" name="modelo" id="nombre"  required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="nombre" class="col-sm-3 control-label">Serie</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="serie" id="nombre"  required>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="nombre" class="col-sm-3 control-label">Capacidad</label>
                                        <div class="col-sm-6">
                                            <input  type="text" class="form-control" name="capacidad" id="nombre"  required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Estado</label>
                                        <div class="col-sm-6">
                                            <select class="form-control" name="estado" required>
                                                <option value=" ">Seleccione</option>
                                                <option value="Disponible">Disponible</option>
                                                <option value="No disponible">No disponible</option>
                                                <option value="Mantenmiento">Mantenmiento</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Empresa</label>
                                        <div class="col-sm-6">
                                            <select class="form-control select2" name="aerolinea">
                                                <option value=" ">Seleccione</option>
                                                <%for (Empresas registro : aero.listaempresas()) {%>
                                                <option value="<%=registro.getIdempresa()%>"><%=registro.getNombreempresa()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <button name="btnavion" type="submit" class="btn btn-success"><span class="fa fa-save"></span>  Guardar  </button>
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="reset" class="btn btn-warning" data-dismiss="modal"><span class="fa fa-dedent"></span>  Cancelar  </button>
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

                <div class="modal fade" id="modal-default2">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Registro de Origen</h4>
                            </div>
                            <form id="form-origen-modal" action="ControladorVuelo" method="post" class="form-horizontal">
                                <div class="box-body">

                                    <!-- nombre -->
                                    <div class="form-group">
                                        <label for="nombre" class="col-sm-4 control-label">Nombre del Aeropuerto</label>
                                        <div class="col-sm-6">
                                            <input type="text"  class="form-control" name="nombreaeropuerto" id="nombre"  required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">País</label>
                                        <div class="col-sm-6">
                                            <select class="form-control select2" name="pais">
                                                <option value=" " selected="selected">Alabama</option>
                                                <option>Alaska</option>
                                                <option>California</option>
                                                <option>Delaware</option>
                                                <option>Tennessee</option>
                                                <option>Texas</option>
                                                <option>Washington</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- edad -->
                                    <div class="form-group">
                                        <label for="edad" class="col-sm-4 control-label">Ciudad</label>
                                        <div class="col-sm-6">
                                            <input type="text"  class="form-control" name="ciudad" id="edad"  required>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <button name="btnorigen" type="submit" class="btn btn-success"><span class="fa fa-save"></span>  Guardar  </button>
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="reset" class="btn btn-warning" data-dismiss="modal"><span class="fa fa-dedent"></span>  Cancelar  </button>
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

                <div class="modal fade" id="modal-default3">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Registro de Destino</h4>
                            </div>
                            <form id="form-destino-modal" action="ControladorVuelo" method="post" class="form-horizontal">
                                <div class="box-body">

                                    <!-- nombre -->
                                    <div class="form-group">
                                        <label for="nombre" class="col-sm-4 control-label">Nombre del Aeropuerto</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="nombreaeropuerto" id="nombre"  required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">País</label>
                                        <div class="col-sm-6">
                                            <select class="form-control select2" name="pais">
                                                <option value=" " selected="selected">Alabama</option>
                                                <option>Alaska</option>
                                                <option>California</option>
                                                <option>Delaware</option>
                                                <option>Tennessee</option>
                                                <option>Texas</option>
                                                <option>Washington</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- edad -->
                                    <div class="form-group">
                                        <label for="edad" class="col-sm-4 control-label">Ciudad</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="ciudad" id="edad"  required>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <button name="btndestino" type="submit" class="btn btn-success"><span class="fa fa-save"></span>  Guardar  </button>
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="reset" class="btn btn-warning" data-dismiss="modal"><span class="fa fa-dedent"></span>  Cancelar  </button>
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
                                    <form action="ControladorVuelo" method="post">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Fecha salida</th>
                                                    <th>Fecha llegada</th>
                                                    <th>Hora salida</th>
                                                    <th>Hora llegada</th>
                                                    <th>Avion</th>
                                                    <th>Origen</th>
                                                    <th>Destino</th>
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
                                                    <td><%=registro.getOrigenes().getPais()%></td>
                                                    <td><%=registro.getDestinos().getPais()%></td>
                                                    <td><%=registro.getCosto()%></td>
                                                    <td><button name="btneditar" value="<%=registro.getIdvuelo()%>" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                            <%if (ne.buscarvuelos(registro.getIdvuelo()) != null) {%>
                                                        <button name="borrar" value="<%=registro.getIdvuelo()%>" class="btn btn-danger"><span class="fa fa-remove"></span></button> 
                                                            <%} else {%>
                                                        <button name="borrar" value="<%=registro.getIdvuelo()%>" class="btn btn-danger"><span class="fa fa-trash"></span></button> 
                                                            <%}%>
                                                    </td>
                                                    <td>
                                                        <%if (ne.buscarvuelos(registro.getIdvuelo()) != null) {%>
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
        <!--validaciones-->
        <script src="validator/js/bootstrapValidator.js" type="text/javascript"></script>
        <script src="validator/js/validaciones.js" type="text/javascript"></script>
        <!--hora-->
        <script src="componentes/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
        <script src="componentes/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="componentes/moment/min/moment.min.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js" type="text/javascript"></script>
        <script src="componentes/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <script src="componentes/iCheck/icheck.min.js" type="text/javascript"></script>
        <script src="sweetalert/sweetalert.min.js" type="text/javascript"></script>
        <!-- para los alerts -->
        <script type="text/javascript">
            $(document).ready(function () {
                $("#limpiar").on("click", function () {
                    $('.form-group').removeClass('has-success has-error');
                    $('.glyphicon ').remove();
                    $('.help-block').text("");
                });
            });
        </script>
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
                    text: "El vuelo ya esta registrado ya ha sido registrado",
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

