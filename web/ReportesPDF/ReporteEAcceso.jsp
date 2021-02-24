
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Airline | JARS</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Airline | JARS</title>

        <!-- para hacer responsive el diseño -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 4.1.3-->
        <link rel="stylesheet" href="../componentes/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome para los iconos y los estilos de letras-->
        <link rel="stylesheet" href="../componentes/font-awesome/css/font-awesome.min.css">
        <!-- para los iconos del panel del index para el control de cantidades -->
        <link rel="stylesheet" href="../componentes/Ionicons/css/ionicons.min.css">
        <!-- para el diseño de la plantilla. -->
        <link rel="stylesheet" href="../estilos/css/AdminLTE.min.css">
        <!-- para el diseño de la plantilla. -->
        <link rel="stylesheet" href="../estilos/css/skins/_all-skins.min.css">
        <!--paginacion de las tablas y del filtrado-->
        <link rel="stylesheet" href="../componentes/datatables.net-bs/css/dataTables.bootstrap.min.css">
        <!-- Date picker -->
        <link href="../componentes/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
        <!--Para el combo o select-->
        <link href="../componentes/select2/dist/css/select2.min.css" rel="stylesheet"/>
        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


    </head>
    <body>
        
        <form action="ReportesE.jsp" method=""post>
            <div class="form-group row">
                <label for="estadoreserva" class="control-label col-md-2 col-sm-3 col-xs-12">Seleccione:</label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <select id="estadoreserva" class="form-control" name="estadoreserva">
                        <option  value="Ejecutada">Ejecutadas</option>
                        <option value="No ejecutada">Sin ejecutar</option>
                    </select>
                </div>      
            </div>
            <div class="form-group aling">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <button type="submit" class="btn btn-danger" name="cancelar"><a href="../menus/index.jsp"  style="color:white;">Cancelar</a></button>
                    <button type="submit" class="btn btn-success" class="submit btn btn-primary readMore roundBtn"  value="Enviar">Enviar</button>
                </div>
            </div>
        </form>





    </body>
</html>

