<%-- 
    Document   : registropersonas
    Created on : 10-17-2018, 05:02:26 PM
    Author     : Sony
--%>
<%@page import="Validaciones.Noeliminacion"%>
<%@page import="Dao.dao_aviones"%>
<%@page import="Dao.dao_reservas"%>
<%@page import="Entidades.Origenes"%>
<%@page import="Dao.dao_origen"%>
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
        Origenes guar = (Origenes) request.getAttribute("destino");/*guardar*/
        Origenes guar1 = (Origenes) request.getAttribute("destino1");/*si ya existe*/
        Origenes eli = (Origenes) request.getAttribute("borrar1");/*eliminar*/
        Origenes eli2 = (Origenes) request.getAttribute("borrar2");/*no eliminar existe*/
        Origenes modi = (Origenes) request.getAttribute("modi");/*modificar*/
    %>
    <%
        dao_origen origen = new dao_origen();
        dao_aviones a = new dao_aviones();
        dao_reservas r = new dao_reservas();
        Noeliminacion ne = new Noeliminacion();
        Origenes modificar = (Origenes) request.getAttribute("modificar");
        String tipo = String.valueOf(session.getAttribute("tipo"));
    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JARS Airline | Origenes</title>
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
                        Nuevo registro de país de origen
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Inicio</a></li>
                        <li><a href="registroorigen.jsp">Registros de país de origen</a></li>
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
                                <form id="form-origen" action="ControladorOrigenes" method="post" class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="nombre" class="col-sm-3 control-label">Nombre del Aeropuerto</label>
                                            <div class="col-sm-6">
                                                <input type="text" value="<%=(modificar == null) ? "" : modificar.getNombreaeropuerto()%>" class="form-control" name="nombreaeropuerto" id="nombre"  required>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">País</label>
                                            <div class="col-sm-6">
                                                <select class="form-control select2" name="pais">
                                                    <option value="">Seleccione</option>
                                                    <option value="Afganistán ">Afganistán </option>
                                                    <option value="Akrotiri ">Akrotiri </option>
                                                    <option value="Albania ">Albania </option>
                                                    <option value="Alemania ">Alemania </option>
                                                    <option value="Andorra ">Andorra </option>
                                                    <option value="Angola ">Angola </option>
                                                    <option value="Anguila ">Anguila </option>

                                                    <option value="Antigua y Barbuda ">Antigua y Barbuda </option>
                                                    <option value="Antillas Neerlandesas ">Antillas Neerlandesas </option>
                                                    <option value="Arabia Saudí ">Arabia Saudí </option>

                                                    <option value="Argelia ">Argelia </option>
                                                    <option value="Argentina ">Argentina </option>
                                                    <option value="Armenia ">Armenia </option>
                                                    <option value="Aruba ">Aruba </option>
                                                    <option value="Ashmore andCartier Islands ">Ashmore andCartier Islands </option>
                                                    <option value="Atlantic Ocean ">Atlantic Ocean </option>
                                                    <option value="Australia ">Australia </option>
                                                    <option value="Austria ">Austria </option>
                                                    <option value="Azerbaiyán ">Azerbaiyán </option>
                                                    <option value="Bahamas ">Bahamas </option>
                                                    <option value="Bahráin ">Bahráin </option>
                                                    <option value="Bangladesh ">Bangladesh </option>
                                                    <option value="Barbados ">Barbados </option>
                                                    <option value="Bélgica ">Bélgica </option>
                                                    <option value="Belice ">Belice </option>
                                                    <option value="Benín ">Benín </option>
                                                    <option value="Bermudas ">Bermudas </option>
                                                    <option value="Bielorrusia ">Bielorrusia </option>
                                                    <option value="Birmania Myanmar ">Birmania Myanmar </option>
                                                    <option value="Bolivia ">Bolivia </option>
                                                    <option value="Bosnia y Hercegovina ">Bosnia y Hercegovina </option>
                                                    <option value="Botsuana ">Botsuana </option>
                                                    <option value="Brasil ">Brasil </option>
                                                    <option value="Brunéi ">Brunéi </option>
                                                    <option value="Bulgaria ">Bulgaria </option>
                                                    <option value="Burkina Faso ">Burkina Faso </option>
                                                    <option value="Burundi ">Burundi </option>
                                                    <option value="Bután ">Bután </option>
                                                    <option value="Cabo Verde ">Cabo Verde </option>
                                                    <option value="Camboya ">Camboya </option>
                                                    <option value="Camerún ">Camerún </option>
                                                    <option value="Canadá ">Canadá </option>
                                                    <option value="Chad ">Chad </option>
                                                    <option value="Chile ">Chile </option>
                                                    <option value="China ">China </option>
                                                    <option value="Chipre ">Chipre </option>

                                                    <option value="Colombia ">Colombia </option>
                                                    <option value="Comoras ">Comoras </option>
                                                    <option value="Congo ">Congo </option>
                                                    <option value="Coral Sea Islands ">Coral Sea Islands </option>
                                                    <option value="Corea del Norte ">Corea del Norte </option>
                                                    <option value="Corea del Sur ">Corea del Sur </option>
                                                    <option value="Costa de Marfil ">Costa de Marfil </option>
                                                    <option value="Costa Rica ">Costa Rica </option>
                                                    <option value="Croacia ">Croacia </option>
                                                    <option value="Cuba ">Cuba </option>

                                                    <option value="Dinamarca ">Dinamarca </option>
                                                    <option value="Dominica ">Dominica </option>
                                                    <option value="Ecuador ">Ecuador </option>
                                                    <option value="Egipto ">Egipto </option>
                                                    <option value="El Salvador ">El Salvador </option>
                                                    <option value="El Vaticano ">El Vaticano </option>
                                                    <option value="Emiratos Árabes Unidos ">Emiratos Árabes Unidos </option>
                                                    <option value="Eritrea ">Eritrea </option>
                                                    <option value="Eslovaquia ">Eslovaquia </option>
                                                    <option value="Eslovenia ">Eslovenia </option>
                                                    <option value="España ">España </option>
                                                    <option value="Estados Unidos ">Estados Unidos </option>
                                                    <option value="Estonia ">Estonia </option>
                                                    <option value="Etiopía ">Etiopía </option>
                                                    <option value="Filipinas ">Filipinas </option>
                                                    <option value="Finlandia ">Finlandia </option>
                                                    <option value="Fiyi ">Fiyi </option>
                                                    <option value="Francia ">Francia </option>
                                                    <option value="Gabón ">Gabón </option>
                                                    <option value="Gambia ">Gambia </option>
                                                    <option value="Gaza Strip ">Gaza Strip </option>
                                                    <option value="Georgia ">Georgia </option>
                                                    <option value="Ghana ">Ghana </option>
                                                    <option value="Gibraltar ">Gibraltar </option>
                                                    <option value="Granada ">Granada </option>
                                                    <option value="Grecia ">Grecia </option>
                                                    <option value="Groenlandia ">Groenlandia </option>
                                                    <option value="Guam ">Guam </option>
                                                    <option value="Guatemala ">Guatemala </option>
                                                    <option value="Guernsey ">Guernsey </option>
                                                    <option value="Guinea ">Guinea </option>
                                                    <option value="Guinea Ecuatorial ">Guinea Ecuatorial </option>
                                                    <option value="Guinea-Bissau ">Guinea-Bissau </option>
                                                    <option value="Guyana ">Guyana </option>
                                                    <option value="Haití ">Haití </option>
                                                    <option value="Honduras ">Honduras </option>
                                                    <option value="Hong Kong ">Hong Kong </option>
                                                    <option value="Hungría ">Hungría </option>
                                                    <option value="India ">India </option>
                                                    <option value="Indian Ocean ">Indian Ocean </option>
                                                    <option value="Indonesia ">Indonesia </option>
                                                    <option value="Irán ">Irán </option>
                                                    <option value="Iraq ">Iraq </option>
                                                    <option value="Irlanda ">Irlanda </option>
                                                    <option value="Isla Bouvet ">Isla Bouvet </option>
                                                    <option value="Isla Christmas ">Isla Christmas </option>
                                                    <option value="Isla Norfolk ">Isla Norfolk </option>
                                                    <option value="Islandia ">Islandia </option>
                                                    <option value="Islas Caimán ">Islas Caimán </option>
                                                    <option value="Islas Cocos ">Islas Cocos </option>
                                                    <option value="Islas Cook ">Islas Cook </option>
                                                    <option value="Islas Feroe ">Islas Feroe </option>
                                                    <option value="Islas Georgia del Sur y Sandwich del Sur ">Islas Georgia del Sur y Sandwich del Sur </option>
                                                    <option value="Islas Heard y McDonald ">Islas Heard y McDonald </option>
                                                    <option value="Islas Malvinas ">Islas Malvinas </option>
                                                    <option value="Islas Marianas del Norte ">Islas Marianas del Norte </option>
                                                    <option value="IslasMarshall ">IslasMarshall </option>
                                                    <option value="Islas Pitcairn ">Islas Pitcairn </option>
                                                    <option value="Islas Salomón ">Islas Salomón </option>
                                                    <option value="Islas Turcas y Caicos ">Islas Turcas y Caicos </option>
                                                    <option value="Islas Vírgenes Americanas ">Islas Vírgenes Americanas </option>
                                                    <option value="Islas Vírgenes Británicas ">Islas Vírgenes Británicas </option>
                                                    <option value="Israel ">Israel </option>
                                                    <option value="Italia ">Italia </option>
                                                    <option value="Jamaica ">Jamaica </option>
                                                    <option value="Jan Mayen ">Jan Mayen </option>
                                                    <option value="Japón ">Japón </option>
                                                    <option value="Jersey ">Jersey </option>
                                                    <option value="Jordania ">Jordania </option>
                                                    <option value="Kazajistán ">Kazajistán </option>
                                                    <option value="Kenia ">Kenia </option>
                                                    <option value="Kirguizistán ">Kirguizistán </option>
                                                    <option value="Kiribati ">Kiribati </option>
                                                    <option value="Kuwait ">Kuwait </option>
                                                    <option value="Laos ">Laos </option>
                                                    <option value="Lesoto ">Lesoto </option>
                                                    <option value="Letonia ">Letonia </option>
                                                    <option value="Líbano ">Líbano </option>
                                                    <option value="Liberia ">Liberia </option>
                                                    <option value="Libia ">Libia </option>
                                                    <option value="Liechtenstein ">Liechtenstein </option>
                                                    <option value="Lituania ">Lituania </option>
                                                    <option value="Luxemburgo ">Luxemburgo </option>
                                                    <option value="Macao ">Macao </option>
                                                    <option value="Macedonia ">Macedonia </option>
                                                    <option value="Madagascar ">Madagascar </option>
                                                    <option value="Malasia ">Malasia </option>
                                                    <option value="Malaui ">Malaui </option>
                                                    <option value="Maldivas ">Maldivas </option>
                                                    <option value="Malí ">Malí </option>
                                                    <option value="Malta ">Malta </option>
                                                    <option value="Man, Isle of ">Man, Isle of </option>
                                                    <option value="Marruecos ">Marruecos </option>
                                                    <option value="Mauricio ">Mauricio </option>
                                                    <option value="Mauritania ">Mauritania </option>
                                                    <option value="Mayotte ">Mayotte </option>
                                                    <option value="México ">México </option>
                                                    <option value="Micronesia ">Micronesia </option>
                                                    <option value="Moldavia ">Moldavia </option>
                                                    <option value="Mónaco ">Mónaco </option>
                                                    <option value="Mongolia ">Mongolia </option>
                                                    <option value="Montserrat ">Montserrat </option>
                                                    <option value="Mozambique ">Mozambique </option>
                                                    <option value="Namibia ">Namibia </option>
                                                    <option value="Nauru ">Nauru </option>
                                                    <option value="Navassa Island ">Navassa Island </option>
                                                    <option value="Nepal ">Nepal </option>
                                                    <option value="Nicaragua ">Nicaragua </option>
                                                    <option value="Níger ">Níger </option>
                                                    <option value="Nigeria ">Nigeria </option>
                                                    <option value="Niue ">Niue </option>
                                                    <option value="Noruega ">Noruega </option>
                                                    <option value="Nueva Caledonia ">Nueva Caledonia </option>
                                                    <option value="Nueva Zelanda ">Nueva Zelanda </option>
                                                    <option value="Omán ">Omán </option>
                                                    <option value="Pacific Ocean ">Pacific Ocean </option>
                                                    <option value="Países Bajos ">Países Bajos </option>
                                                    <option value="Pakistán ">Pakistán </option>
                                                    <option value="Palaos ">Palaos </option>
                                                    <option value="Panamá ">Panamá </option>
                                                    <option value="Papúa-Nueva Guinea ">Papúa-Nueva Guinea </option>
                                                    <option value="Paracel Islands ">Paracel Islands </option>
                                                    <option value="Paraguay ">Paraguay </option>
                                                    <option value="Perú ">Perú </option>
                                                    <option value="Polinesia Francesa ">Polinesia Francesa </option>
                                                    <option value="Polonia ">Polonia </option>
                                                    <option value="Portugal ">Portugal </option>
                                                    <option value="Puerto Rico ">Puerto Rico </option>
                                                    <option value="Qatar ">Qatar </option>
                                                    <option value="Reino Unido ">Reino Unido </option>
                                                    <option value="República Centroafricana ">República Centroafricana </option>
                                                    <option value="República Checa ">República Checa </option>
                                                    <option value="República Democrática del Congo ">República Democrática del Congo </option>
                                                    <option value="República Dominicana ">República Dominicana </option>
                                                    <option value="Ruanda ">Ruanda </option>
                                                    <option value="Rumania ">Rumania </option>
                                                    <option value="Rusia ">Rusia </option>
                                                    <option value="Sáhara Occidental ">Sáhara Occidental </option>
                                                    <option value="Samoa ">Samoa </option>
                                                    <option value="Samoa Americana ">Samoa Americana </option>
                                                    <option value="San Cristóbal y Nieves ">San Cristóbal y Nieves </option>
                                                    <option value="San Marino ">San Marino </option>
                                                    <option value="San Pedro y Miquelón ">San Pedro y Miquelón </option>
                                                    <option value="San Vicente y las Granadinas ">San Vicente y las Granadinas </option>
                                                    <option value="Santa Helena ">Santa Helena </option>
                                                    <option value="Santa Lucía ">Santa Lucía </option>
                                                    <option value="Santo Tomé y Príncipe ">Santo Tomé y Príncipe </option>
                                                    <option value="Senegal ">Senegal </option>
                                                    <option value="Seychelles ">Seychelles </option>
                                                    <option value="Sierra Leona ">Sierra Leona </option>
                                                    <option value="Singapur ">Singapur </option>
                                                    <option value="Siria ">Siria </option>
                                                    <option value="Somalia ">Somalia </option>
                                                    <option value="Southern Ocean ">Southern Ocean </option>
                                                    <option value="Spratly Islands ">Spratly Islands </option>
                                                    <option value="Sri Lanka ">Sri Lanka </option>
                                                    <option value="Suazilandia ">Suazilandia </option>
                                                    <option value="Sudáfrica ">Sudáfrica </option>
                                                    <option value="Sudán ">Sudán </option>
                                                    <option value="Suecia ">Suecia </option>
                                                    <option value="Suiza ">Suiza </option>
                                                    <option value="Surinam ">Surinam </option>
                                                    <option value="Svalbard y Jan Mayen ">Svalbard y Jan Mayen </option>
                                                    <option value="Tailandia ">Tailandia </option>
                                                    <option value="Taiwán ">Taiwán </option>
                                                    <option value="Tanzania ">Tanzania </option>
                                                    <option value="Tayikistán ">Tayikistán </option>
                                                    <option value="TerritorioBritánicodel Océano Indico ">TerritorioBritánicodel Océano Indico </option>
                                                    <option value="Territorios Australes Franceses ">Territorios Australes Franceses </option>
                                                    <option value="Timor Oriental ">Timor Oriental </option>
                                                    <option value="Togo ">Togo </option>
                                                    <option value="Tokelau ">Tokelau </option>
                                                    <option value="Tonga ">Tonga </option>
                                                    <option value="Trinidad y Tobago ">Trinidad y Tobago </option>
                                                    <option value="Túnez ">Túnez </option>
                                                    <option value="Turkmenistán ">Turkmenistán </option>
                                                    <option value="Turquía ">Turquía </option>
                                                    <option value="Tuvalu ">Tuvalu </option>
                                                    <option value="Ucrania ">Ucrania </option>
                                                    <option value="Uganda ">Uganda </option>
                                                    <option value="Unión Europea ">Unión Europea </option>
                                                    <option value="Uruguay ">Uruguay </option>
                                                    <option value="Uzbekistán ">Uzbekistán </option>
                                                    <option value="Vanuatu ">Vanuatu </option>
                                                    <option value="Venezuela ">Venezuela </option>
                                                    <option value="Vietnam ">Vietnam </option>
                                                    <option value="Wake Island ">Wake Island </option>
                                                    <option value="Wallis y Futuna ">Wallis y Futuna </option>
                                                    <option value="West Bank ">West Bank </option>
                                                    <option value="World ">World </option>
                                                    <option value="Yemen ">Yemen </option>
                                                    <option value="Yibuti ">Yibuti </option>
                                                    <option value="Zambia ">Zambia </option>
                                                    <option value="Zimbabue ">Zimbabue </option>
                                                    <option <%=(modificar != null) ? ((modificar.getPais() != null) ? "selected" : "") : ""%>
                                                        value="<%=(modificar != null) ? modificar.getPais() : "España"%>">
                                                        <%=(modificar != null) ? modificar.getPais() : ""%>
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="edad" class="col-sm-3 control-label">Ciudad</label>
                                            <div class="col-sm-6">
                                                <input type="text" value="<%=(modificar == null) ? "" : modificar.getCiudad()%>" class="form-control" name="ciudad" id="edad"  required>
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
                                    <h3 class="box-title">Listado de paises de origen</h3>
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
                                    <form action="ControladorOrigenes" method="post">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Aeropuerto</th>
                                                    <th>País</th>
                                                    <th>Ciudad</th>
                                                    <th>Acciones</th>
                                                    <th>Mensaje</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (Origenes registro : origen.listadoorigenes()) {%>
                                                <tr>
                                                    <td><%=registro.getNombreaeropuerto()%></td>
                                                    <td><%=registro.getPais()%></td>
                                                    <td><%=registro.getCiudad()%></td>
                                                    <td><button value="<%=registro.getIdorigen()%>" name="editar" class="btn btn-success"><span class="fa fa-edit"></span></button>
                                                            <%if (ne.buscarorigen(registro.getIdorigen()) != null) {%>
                                                        <button value="<%=registro.getIdorigen()%>" name="borrar" class="btn btn-danger"><span class="fa fa-remove"></span></button> 
                                                            <%} else {%>
                                                        <button value="<%=registro.getIdorigen()%>" name="borrar" class="btn btn-danger"><span class="fa fa-trash"></span></button> 
                                                            <%}%>
                                                    </td>
                                                    <td>
                                                        <%if (ne.buscarorigen(registro.getIdorigen()) != null) {%>
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
        <!--para el combo o select-->
        <script src="componentes/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
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
                    text: "El país de origen ya ha sido registrado",
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

