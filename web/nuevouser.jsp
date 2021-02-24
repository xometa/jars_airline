<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Sony
--%>

<%@page import="Dao.dao_reservas"%>
<%@page import="Dao.dao_destino"%>
<%@page import="Dao.dao_aviones"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        dao_aviones aviones = new dao_aviones();
        dao_destino destino = new dao_destino();
        dao_reservas reserva = new dao_reservas();
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Nuevo Usuario</title>
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
        <link href="estilos/img.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="estilos/css/AdminLTE.min.css">
        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition login-page" style="background: #fff;">
        <div class="box-body">
            <div class="col-md-12">
                <!-- Widget: user widget style 1 -->
                <div class="box box-widget widget-user">
                    <!-- Add the bg color to the header using any of the bg-* classes -->
                    <div class="widget-user-header bg-danger" style="width: 100%;height: 500px;">
                        <div class="login-logo">
                            <a href="index.jsp"><b>JARS</b> AIRLINE</a>

                            <h3 class="widget-user-username">Has tus reservas en</h3>
                            <h5 class="widget-user-desc">nuestros establecimientos</h5>
                        </div>
                    </div>
                    <!--<div class="widget-user-image">
                        <img class="img-circle" src="estilos/img/1.jpg" alt="User Avatar">
                    </div>-->
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header"><%=aviones.cantidadAvionesDisponibles()%></h5>
                                    <span class="description-text">Aviones disponibles</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header"><%=destino.cantidadestino()%></h5>
                                    <span class="description-text">Paises de destino</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4">
                                <div class="description-block">
                                    <h5 class="description-header"><%=reserva.reservasnuevas()%></h5>
                                    <span class="description-text">Reservas nuevas</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                </div>
                <!-- /.widget-user -->
            </div>
            <!-- /.col -->
            <div class="login-box">
                <div class="login-box-body">

                    <p class="login-box-msg">Nuevo Usuario</p>

                    <form id="form-newuser" action="ControladorUsuario" method="post">
                        <div class="form-group has-feedback">
                            <input type="text" id="con1" name="nombre" class="form-control" placeholder="Nombres">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" id="con1" name="apellido" class="form-control" placeholder="Apellidos">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <select class="form-control" name="sexo" required>
                                <option>Sexo</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>

                            </select>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="text" name="usuario" class="form-control" placeholder="Usuario">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" name="contra" class="form-control" placeholder="Contraseña">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <select class="form-control" name="tipo" required>
                                <option>Tipo usuario</option>
                                <option value="Administrador">Administrador</option>
                                <option value="Empleado">Empleado</option>
                            </select>
                        </div>
                        <div class="row">
                            <!-- /.col -->
                            <div class="col-xs-4">
                                <button type="submit" name="guardarnewuser" class="btn btn-primary btn-block btn-flat"><span class="fa fa-save"></span> Guardar</button>
                            </div>
                            <!-- /.col -->
                            <!-- /.col -->
                            <div class="col-xs-4">  
                                <button id="limpiar" type="reset" name="limpiar" class="btn btn-default btn-block btn-flat"><span class="fa fa-undo"></span> Limpiar</button>
                            </div>
                            <div class="col-xs-4">  
                                <button type="submit" name="regresarinicio" class="btn bg-navy btn-flat"><span class="fa fa-arrow-circle-left"></span> Volver</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </div>
                <!-- /.login-box-body -->
            </div>
        </div>
        <!-- /.row -->
        <!-- jQuery 3 -->
        <script src="componentes/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 4.1.3 -->
        <script src="componentes/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- validaciones -->
        <script src="validator/js/bootstrapValidator.js" type="text/javascript"></script>
        <script src="validator/js/validaciones.js" type="text/javascript"></script>

    </body>
</html>

