<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Sony
--%>
<%@page import="Validaciones.Noeliminacion"%>
<%@page import="Entidades.Aviones"%>
<%@page import="Entidades.Vuelo"%>
<%@page import="Dao.dao_vuelos"%>
<%@page import="Dao.dao_aviones"%>
<%@page import="Entidades.CodigoReservas"%>
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
        Reservas guar = (Reservas) request.getAttribute("destino");/*guardar*/
        Reservas guar1 = (Reservas) request.getAttribute("destino1");/*si ya existe*/
        Reservas eli = (Reservas) request.getAttribute("borrar12");/*eliminar*/
        Reservas eli2 = (Reservas) request.getAttribute("borrar2");/*no eliminar existe*/
        Reservas modif = (Reservas) request.getAttribute("modifr");/*modificar*/
    %>
    <%
        dao_pasajeros pasajero = new dao_pasajeros();
        dao_origen origen = new dao_origen();
        dao_destino destino = new dao_destino();
        dao_asientos asiento = new dao_asientos();
        CodigoReservas c = new CodigoReservas();
        dao_reservas reserva = new dao_reservas();
        dao_aviones a = new dao_aviones();
        dao_vuelos vuelo = new dao_vuelos();
        Noeliminacion ne = new Noeliminacion();
        Reservas modificar = (Reservas) request.getAttribute("modificar");
        Vuelo modi = (Vuelo) request.getAttribute("modi");
        String nombreuser = String.valueOf(session.getAttribute("nomuser"));
        String iduser = String.valueOf(session.getAttribute("iduser"));
        String tipo = String.valueOf(session.getAttribute("tipo"));

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Reservas</title>
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
                        Nuevo registro de reservas
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li><a href="registroreservas.jsp">Registros de reservas</a></li>
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
                                <form id="form-reserva" action="ControladorReservas" method="post" class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Pasajero</label>
                                            <div class="col-sm-6">
                                                <select name="idpasajero" class="form-control select2">
                                                    <option value=" ">Seleccione</option>
                                                    <%for (Pasajeros registro : pasajero.listadopasajeros()) {%>
                                                    <option value="<%=registro.getIdpasajero()%>"><%=registro.getNombre() + " " + registro.getApellido()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getPasajeros().concatenar() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getPasajeros().getIdpasajero() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getPasajeros().concatenar() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="col-sm-1" >
                                                <button style="display: block" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default1">
                                                    <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                            <div class="col-sm-2">
                                                <input readonly type="text" style="display: none" class="form-control" value="<%=(modificar == null) ? c.generarCodigo() : modificar.getCodigo()%>" name="codigo"  required>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Clase</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="clase" required>
                                                    <option value=" ">Seleccione</option>
                                                    <option value="Economica">Economica</option>
                                                    <option value="Ejecutiva">Ejecutiva</option>
                                                    <option <%=(modificar != null) ? ((modificar.getClase() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getClase() : "Economica"%>">
                                                        <%=(modificar != null) ? modificar.getClase() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Asiento</label>
                                            <div class="col-sm-6">
                                                <select name="idasiento" class="form-control select2">
                                                    <option value=" ">Seleccione</option>
                                                    <%for (Asientos registro : asiento.listadoasientos()) {%>
                                                    <option value="<%=registro.getIdasiento()%>"><%=registro.getNombre()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getAsientos().getNombre() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getAsientos().getIdasiento() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getAsientos().getNombre() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="col-sm-3" >
                                                <button style="display: block" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default4">
                                                    <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Vuelo</label>
                                            <div class="col-sm-6">
                                                <select name="idvuelo" class="form-control select2" style="display: block;">
                                                    <option value=" ">Seleccione</option>
                                                    <%for (Vuelo registro : vuelo.listadovuelos()) {%>
                                                    <option value="<%=registro.getIdvuelo()%>"><%=registro.getIdvuelo()%></option>
                                                    <%}%>
                                                    <option <%=(modificar != null) ? ((modificar.getVuelo().getIdvuelo() != 0) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getVuelo().getIdvuelo() : "1"%>">
                                                        <%=(modificar != null) ? modificar.getVuelo().getIdvuelo() : ""%>
                                                    </option>
                                                    <option <%=(modi != null) ? ((modi.getIdvuelo() != 0) ? "selected" : "") : ""%>
                                                        value="<%=(modi != null) ? modi.getIdvuelo() : "1"%>">
                                                        <%=(modi != null) ? modi.getIdvuelo() : ""%>
                                                    </option>
                                                </select>
                                            </div>

                                            <div class="col-sm-3" >
                                                <button style="display: block" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-default5">
                                                    <span class="fa fa-plus"></span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Origen</label>
                                            <div class="col-sm-6">
                                                <%if (modi == null) {%>
                                                <input readonly style="display: none;" value="<%=(modi == null) ? "" : modi.getOrigenes().getPais()%>"  type="text" class="form-control pull-right">
                                                <input readonly style="display: block;" value="<%=(modificar == null) ? "" : modificar.getVuelo().getOrigenes().getPais()%>"  type="text" class="form-control pull-right">
                                                <%} else {%>
                                                <input readonly style="display: block;" value="<%=(modi == null) ? "" : modi.getOrigenes().getPais()%>"  type="text" class="form-control pull-right">
                                                <input readonly style="display: none;"  value="<%=(modificar == null) ? "" : modificar.getVuelo().getOrigenes().getPais()%>" type="text" class="form-control pull-right">
                                                <%}%>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Destino</label>
                                            <div class="col-sm-6">
                                                <%if (modi == null) {%>
                                                <input readonly style="display: none;" value="<%=(modi == null) ? "" : modi.getDestinos().getPais()%>"  type="text" class="form-control pull-right">
                                                <input readonly style="display: block;" value="<%=(modificar == null) ? "" : modificar.getVuelo().getDestinos().getPais()%>"  type="text" class="form-control pull-right">
                                                <%} else {%>
                                                <input readonly style="display: block;" value="<%=(modi == null) ? "" : modi.getDestinos().getPais()%>"  type="text" class="form-control pull-right">
                                                <input readonly style="display: none;"  value="<%=(modificar == null) ? "" : modificar.getVuelo().getDestinos().getPais()%>" type="text" class="form-control pull-right">
                                                <%}%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">$ Costo</label>
                                            <div class="col-sm-6">
                                                <%if (modi == null) {%>
                                                <input readonly style="display: none;" value="<%=(modi == null) ? "" : modi.getCosto()%>"  type="text" class="form-control pull-right">
                                                <input readonly style="display: block;" value="<%=(modificar == null) ? "" : modificar.getVuelo().getCosto()%>"  type="text" class="form-control pull-right">
                                                <%} else {%>
                                                <input readonly style="display: block;" value="<%=(modi == null) ? "" : modi.getCosto()%>"  type="text" class="form-control pull-right">
                                                <input readonly style="display: none;"  value="<%=(modificar == null) ? "" : modificar.getVuelo().getCosto()%>" type="text" class="form-control pull-right">
                                                <%}%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Fecha de regreso</label>
                                            <div class="col-sm-6">
                                                <input name="fecharegreso" value="<%=(modificar == null) ? "" : modificar.getFecharegreso()%>"  type="date" class="form-control pull-right">
                                            </div>

                                            <div class="col-sm-2">
                                                <input style="display: none;" id="fechar" name="fechareserva" readonly type="date" class="form-control pull-right">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Estado pago</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="estadopago" required>
                                                    <option value=" ">Seleccione</option>
                                                    <option value="No pagada">No pagada</option>
                                                    <option value="Cancelada">Cancelada</option>
                                                    <option  <%=(modificar != null) ? ((modificar.getEstadopago() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getEstadopago() : "Pagada"%>">
                                                        <%=(modificar != null) ? modificar.getEstadopago() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Estado reserva</label>
                                            <div class="col-sm-6">
                                                <select class="form-control" name="estadoreserva" required>
                                                    <option value=" ">Seleccione</option>
                                                    <option value="Ejecutada">Ejecutada</option>
                                                    <option value="No ejecutada">No ejecutada</option>
                                                    <option  <%=(modificar != null) ? ((modificar.getEstadoreserva() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getEstadoreserva() : "Ejecutada"%>">
                                                        <%=(modificar != null) ? modificar.getEstadoreserva() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Usuario</label>
                                            <div class="col-sm-6">
                                                <input type="text" value="<%=(modificar == null) ? nombreuser : modificar.getUsuarios().concatenar()%>" class="form-control"  name="user" readonly  required>
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" style="display: none" value="<%=(modificar == null) ? iduser : modificar.getUsuarios().getIdusuario()%>" class="form-control"  name="idusuario" readonly required>
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

                <div class="modal fade" id="modal-default1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Registro de Pasajeros</h4>
                            </div>
                            <form id="form-pasajeros-modal" action="ControladorReservas" method="post" class="form-horizontal">
                                <div class="box-body">

                                    <!-- nombre -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Nombres</label>
                                        <div class="col-sm-6">
                                            <input  type="text" class="form-control" name="nombre" required>
                                        </div>
                                    </div>

                                    <!-- apellido -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Apellidos</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="apellido" required>
                                        </div>
                                    </div>

                                    <!-- sexo -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Sexo</label>
                                        <div class="col-sm-6">
                                            <select class="form-control" name="sexo" required>
                                                <option value=" ">Seleccione</option>
                                                <option value="Masculino">Masculino</option>
                                                <option value="Femenino">Femenino</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- edad -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Edad</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="edad"  required>
                                        </div>
                                    </div>

                                    <!-- telefono -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Telefono</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="phone form-control" name="telefono"  required>
                                        </div>
                                    </div>

                                    <!-- direccion -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Dirección</label>
                                        <div class="col-sm-6">
                                            <input  type="text" class="form-control" name="direccion"  required>
                                        </div>
                                    </div>

                                    <!-- correo -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Correo</label>
                                        <div class="col-sm-6">
                                            <input  type="text" class="form-control" name="correo"   required>
                                        </div>
                                    </div>
                                    <!-- tipo -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Tipo documento</label>
                                        <div class="col-sm-6">
                                            <select class="form-control" name="tipodocumento" required>
                                                <option value=" ">Seleccione</option>
                                                <option value="Libreta Militar">Libreta Militar</option>
                                                <option value="Documento de menoridad">Documento de menoridad</option>
                                                <option value="">Nit</option>
                                                <option value="Dui">Dui</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">No Documento</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control pull-right" name="numerodocumento">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Fecha de vencimiento</label>
                                        <div class="col-sm-6">
                                            <input type="date" class="form-control pull-right" name="fechavencimiento">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Nacionalidad</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="nacionalidad"  required>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <button name="btnpasajero" type="submit" class="btn btn-success"><span class="fa fa-save"></span>  Guardar  </button>
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

                <div class="modal fade" id="modal-default4">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Registro de Asientos</h4>
                            </div>
                            <form id="form-asientos-modal" action="ControladorReservas" method="post" class="form-horizontal">
                                <div class="box-body">

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Fila</label>
                                        <div class="col-sm-6">
                                            <input id="fila_" onkeyup="concatenar();" type="text" class="form-control" name="fila"  required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Columna</label>
                                        <div class="col-sm-6">
                                            <input id="columna_" onkeyup="concatenar();" type="text" class="form-control" name="columna"  required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Nombre</label>
                                        <div class="col-sm-6">
                                            <input readonly id="nombre_" onblur="concatenar();" type="text" class="form-control" name="nombre">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <button name="btnasiento" type="submit" class="btn btn-success"><span class="fa fa-save"></span>  Guardar  </button>
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
                <script>
                        function concatenar() {
                        var fil =  document.getElementById("fila_").value;
                        var col =  document.getElementById("columna_").value;
                        document.getElementById("nombre_").value=fil+col;
                    }

                </script>
                <div class="modal fade" id="modal-default5">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Registro de Vuelos</h4>
                            </div>
                            <form id="form-vuelos-modal" action="ControladorReservas" method="post" class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Fecha salida</label>
                                        <div class="col-sm-6">
                                            <input type="date" class="form-control" name="fechasalida"  required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Fecha llegada</label>
                                        <div class="col-sm-6">
                                            <input type="date" class="form-control" name="fechallegada"  required>
                                        </div>
                                    </div>
                                    <div class="bootstrap-timepicker">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Hora salida</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control timepicker" name="horasalida"  required>
                                            </div>
                                        </div></div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Hora llegada</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control timepicker" name="horallegada"  required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Avión</label>
                                        <div class="col-sm-6">
                                            <select name="idavion" class="form-control select2">
                                                <option value=" ">Seleccione</option>
                                                <%for (Aviones registro : a.listadoavionesdisponibles()) {%>
                                                <option value="<%=registro.getIdavion()%>"><%=registro.getNombre()%></option>
                                                <%}%>
                                            </select>
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
                                            </select>
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
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Costo</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="costo"  required>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <button name="btnvuelo" type="submit" class="btn btn-success"><span class="fa fa-save"></span>  Guardar  </button>
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="reset" class="btn btn-warning" data-dismiss="modal"><span class="fa fa-dedent"></span>  Cancelar  </button>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </form>
                    </div>
                    <!-- /.modal-content -->
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                <!-- /.content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Listado de reservas</h3>
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
                                        <table id="example1" class="table dataTable data-table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Código reserva</th>
                                                    <th>Pasajero</th>
                                                    <th>Origen</th>
                                                    <th>Destino</th>
                                                    <th>Clase</th>
                                                    <th>Asiento</th>
                                                    <th>Fecha salida</th>
                                                    <th>Fecha llegada</th>
                                                    <th>Hora salida</th>
                                                    <th>Hora llegada</th>
                                                    <th>Fecha regreso</th>
                                                    <th>Costo</th>
                                                    <th>Estado pago</th>
                                                    <th>Estado reserva</th>
                                                    <th>Usuario</th>
                                                    <th>Acciones</th>
                                                    <th>Mensaje</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%if (tipo.equals("Administrador")) {%>
                                                <%for (Reservas registro : reserva.listadoreservas()) {%>
                                                <tr>
                                                    <td><%=registro.getCodigo()%></td>
                                                    <td><%=registro.getPasajeros().getNombre() + " " + registro.getPasajeros().getApellido()%></td>
                                                    <td><%=registro.getVuelo().getOrigenes().getPais()%></td>
                                                    <td><%=registro.getVuelo().getDestinos().getPais()%></td>
                                                    <td><%=registro.getClase()%></td>
                                                    <td><%=registro.getAsientos().getNombre()%></td>
                                                    <td><%=registro.getVuelo().getFechasalida()%></td>
                                                    <td><%=registro.getVuelo().getFechallegada()%></td>
                                                    <td><%=registro.getVuelo().getHorasalida()%></td>
                                                    <td><%=registro.getVuelo().getHorallegada()%></td>
                                                    <td><%=registro.getFecharegreso()%></td>
                                                    <td><%=registro.getVuelo().getCosto()%></td>
                                                    <%if (registro.getEstadopago().equals("Pagada")) {%>
                                                    <td><span class="badge bg-green"><%=registro.getEstadopago()%></span></td>
                                                        <%} else if (registro.getEstadopago().equals("No pagada")) {%>
                                                    <td><span class="badge bg-orange"><%=registro.getEstadopago()%></span></td>
                                                        <%} else {%>
                                                    <td><span class="badge bg-red"><%=registro.getEstadopago()%></span></td>
                                                        <%}%>
                                                    <td><%=registro.getEstadoreserva()%></td>
                                                    <td><%=registro.getUsuarios().getNombre() + " " + registro.getUsuarios().getApellido()%></td>
                                                    <td><%if (registro.getEstadopago().equals("Pagada")) {%>
                                                        <button disabled name="editar" value="<%=registro.getIdreserva()%>" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                            <%} else {%>
                                                        <button name="editar" value="<%=registro.getIdreserva()%>" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                            <%}%>

                                                        <%if (ne.buscarreserva(registro.getIdreserva()) != null) {%>
                                                        <button name="borrar" value="<%=registro.getIdreserva()%>" class="btn btn-danger"><span class="fa fa-remove"></span></button> 
                                                            <%} else {%>
                                                        <button name="borrar" value="<%=registro.getIdreserva()%>" class="btn btn-danger"><span class="fa fa-trash"></span></button> 
                                                            <%}%>

                                                    </td>
                                                    <td>
                                                        <%if (ne.buscarreserva(registro.getIdreserva()) != null) {%>
                                                        <span class="badge bg-red">No eliminable</span>
                                                        <%} else {%>
                                                        <span class="badge bg-green-gradient">Eliminable</span>
                                                        <%}%>
                                                    </td>
                                                </tr>
                                                <%}%>
                                                <%} else if (tipo.equals("Empleado")) {%>
                                                <%for (Reservas registro : reserva.listadoreservasempleado(Integer.parseInt(iduser))) {%>
                                                <tr>
                                                    <td><%=registro.getCodigo()%></td>
                                                    <td><%=registro.getPasajeros().getNombre() + " " + registro.getPasajeros().getApellido()%></td>
                                                    <td><%=registro.getVuelo().getOrigenes().getPais()%></td>
                                                    <td><%=registro.getVuelo().getDestinos().getPais()%></td>
                                                    <td><%=registro.getClase()%></td>
                                                    <td><%=registro.getAsientos().getNombre()%></td>
                                                    <td><%=registro.getVuelo().getFechasalida()%></td>
                                                    <td><%=registro.getVuelo().getFechallegada()%></td>
                                                    <td><%=registro.getVuelo().getHorasalida()%></td>
                                                    <td><%=registro.getVuelo().getHorallegada()%></td>
                                                    <td><%=registro.getFecharegreso()%></td>
                                                    <td><%=registro.getVuelo().getCosto()%></td>
                                                    <%if (registro.getEstadopago().equals("Pagada")) {%>
                                                    <td><span class="badge bg-green"><%=registro.getEstadopago()%></span></td>
                                                        <%} else if (registro.getEstadopago().equals("No pagada")) {%>
                                                    <td><span class="badge bg-orange"><%=registro.getEstadopago()%></span></td>
                                                        <%} else {%>
                                                    <td><span class="badge bg-red"><%=registro.getEstadopago()%></span></td>
                                                        <%}%>
                                                    <td><%=registro.getEstadoreserva()%></td>
                                                    <td><%=registro.getUsuarios().getNombre() + " " + registro.getUsuarios().getApellido()%></td>
                                                    <td><%if (registro.getEstadopago().equals("Pagada")) {%>
                                                        <button disabled name="editar" value="<%=registro.getIdreserva()%>" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                            <%} else {%>
                                                        <button name="editar" value="<%=registro.getIdreserva()%>" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                            <%}%>

                                                        <%if (ne.buscarreserva(registro.getIdreserva()) != null) {%>
                                                        <button name="borrar" value="<%=registro.getIdreserva()%>" class="btn btn-danger"><span class="fa fa-remove"></span></button> 
                                                            <%} else {%>
                                                        <button name="borrar" value="<%=registro.getIdreserva()%>" class="btn btn-danger"><span class="fa fa-trash"></span></button> 
                                                            <%}%>

                                                    </td>
                                                    <td>
                                                        <%if (ne.buscarreserva(registro.getIdreserva()) != null) {%>
                                                        <span class="badge bg-red">No eliminable</span>
                                                        <%} else {%>
                                                        <span class="badge bg-green-gradient">Eliminable</span>
                                                        <%}%>
                                                    </td>
                                                </tr>
                                                <%}%>
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
        <!--hora-->
        <script src="componentes/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
        <script src="componentes/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="componentes/moment/min/moment.min.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="componentes/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js" type="text/javascript"></script>
        <script src="componentes/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <script src="componentes/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- para resolver conflictos con los js -->
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <!-- Slimscroll para el slider de los componentes del panel-->
        <script src="componentes/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="estilos/js/scrolltable.js" type="text/javascript"></script>
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
        <script src="sweetalert/sweetalert.min.js" type="text/javascript"></script>
        <!-- mascaras -->
        <script src="validator/js/jquery.mask.js" type="text/javascript"></script>
        <!-- para los alerts -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('.phone').mask('(999) 9999-9999');

            });
        </script>
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
                //Timepicker tambien para la hora
                $('.timepicker').timepicker({
                    showInputs: false
                })
            })
        </script>
        <script>
            $(document).ready(function () {
                var now = new Date();
                var day = ("0" + now.getDate()).slice(-2);
                var month = ("0" + (now.getMonth() + 1)).slice(-2);
                var today = now.getFullYear() + "-" + (month) + "-" + (day);
                $("#fechar").val(today);

            });

            $(function () {
                $('.select2').select2();
            });
        </script>
        <script>
            $(function () {
                $('#example1').DataTable();
            });
        </script>
    </body>
</html>


