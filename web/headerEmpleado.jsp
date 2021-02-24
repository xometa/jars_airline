<%-- 
    Document   : headerEmpleado
    Created on : 12-07-2018, 05:04:14 AM
    Author     : Hernandez
--%>
<header class="main-header">
    <!-- Logo -->
    <a href="index.jsp" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>J</b>ARS</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>JARS</b> AIRLINE</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only"></span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Cuenta del usuario que ha ingresado -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="estilos/img/1.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs"><%out.println(session.getAttribute("user"));%></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="estilos/img/1.jpg" class="img-circle" alt="User Image">

                            <p>
                                <%out.println(session.getAttribute("user"));%>
                                <small>Empleado</small>
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <form action="ControladorSesionSalir" method="post">
                                <div class="form-group">
                                    <button name="salir" type="submit" class="btn btn-default col-sm-12"><span class="fa fa-power-off"></span> Salir</button>
                                </div>
                            </form>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
       <%-- <div class="user-panel">
            <div class="pull-left image">
                <img src="estilos/img/1.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><%out.println(session.getAttribute("user"));%></p>
                <a href="#"><i class="fa fa-circle text-success"></i> En Línea</a>
            </div>
        </div>--%>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
           <!-- <li class="header">Menú General</li>-->
