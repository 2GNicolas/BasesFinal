<%-- 
    Document   : GestionarProducto
    Created on : 28/10/2018, 07:57:49 PM
    Author     : Richard Alejandro
--%>

<%@page import="java.util.List"%>
<%@page import="VO.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Gestionar Productos</title>
    <meta name="description" content="WebUni Education Template">
    <meta name="keywords" content="webuni, education, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="shortcut icon">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,400i,500,500i,600,600i,700,700i,800,800i"

      rel="stylesheet">
    <!-- Stylesheets -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>	<![endif]-->
  </head>
  <body>
    <!-- Page Preloder -->
    <div id="preloder">
      <div class="loader"></div>
    </div>
    <!-- Header section -->
    <header class="header-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-3">
            <div class="nav-switch"> <i class="fa fa-bars"></i> </div>
          </div>
          <nav class="main-menu">
            <ul>
              <center>
                <li><a href="ControlVentas.html">Control de Ventas</a></li>
                <li><a href="ProductosVendidos.html">Productos Vendidos</a></li>
                <li><a href="GestionarClientes.jsp">Gestionar Clientes</a></li>
                <li><a href="GestionarEmpleados.jsp">Gestionar Empleados</a></li>
                <li><a href="GestionarProveedores.jsp">Gestionar Proveedores</a></li>
              </center>
            </ul>
          </nav>
        </div>
      </div>
    </header>
    <!-- Header section end -->
    <!-- Page info -->
    <div class="page-info-section set-bg" data-setbg="img/page-bg/3.jpg">
      <div class="container">
        <div class="site-breadcrumb"> <a href="Admin.jsp">Inicio</a> <span>Gestionar
            Productos</span> </div>
      </div>
    </div>
    <!-- Page info end -->
    <!-- search section -->
    <section class="search-section ss-other-page">
      <div class="container">
        <div class="search-warp">
          <div class="section-title text-white">
            <h2><span>Gestionar Productos</span></h2>
          </div>
          <div class="row">
            <div class="col-lg-10 offset-lg-1">
              <!-- search form -->
              <form  action="ControladorProductos" method="POST"> <input placeholder="ID" name ="ID" type="text">
                <input class="last-m" placeholder="Nombre" name ="Nombre" type="text"> <input

                  class="last-m" placeholder="Cantidad" name ="Cantidad" type="text"> <input class="last-m"

                  placeholder="PrecioCompra0" name ="PrecioCompra" type="text"> <input class="last-m" placeholder="PrecioVenta" name ="PrecioVenta"

                  type="text"> <input class="last-m" placeholder="..................."

                  type="text"> <button class="site-btn btn-dark" name = "agregar">Agregar</button>
                <button class="site-btn btn-dark" name = "eliminar">Eliminar</button> <button class="site-btn btn-dark" name ="Cargar">Ver inventario</button>
                <button class="site-btn btn-dark" name = "buscar">Buscar</button> <br> <br> <br> <br>
                <table style="width:100%" name="lista">
                  <tbody>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Cantidad</th>
                      <th>Precio Compra</th>
                      <th>Precio Venta</th>
                    </tr>
                    <%
                    if(request.getAttribute("lista")!=null){
                        List productos = (List<Producto>)request.getAttribute("lista");
                        for (int i = 0; i < productos.size(); i++) {
                            Producto producto = (Producto)productos.get(i);

                    %>
                    <tr>
                        <td><%=producto.getId_P()%></td>
                        <td><%=producto.getNombre()%></td>
                        <td><%=producto.getCantidad()%></td>
                        <td><%=producto.getP_Compra()%></td>
                        <td><%=producto.getP_Venta()%></td>
                       
                       
                    </tr>
                      <%
                        }
                    }
                  
                %> 
                
                  </tbody>
                </table>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- search section end -->
    <!-- Page  -->
    <!-- Page end -->
    <!-- banner section -->
    <section class="banner-section spad">
      <div class="container">
        <div class="section-title mb-0 pb-2">
          <h2>Join Our Community Now!</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
            malesuada lorem maximus mauris scelerisque, at rutrum nulla dictum.
            Ut ac ligula sapien. Suspendisse cursus faucibus finibus.</p>
        </div>
        <div class="text-center pt-5"> <a href="#" class="site-btn">Register
            Now</a> </div>
      </div>
    </section>
    <!-- banner section end -->
    <!-- footer section -->
    <footer class="footer-section spad pb-0">
      <div class="footer-top">
        <div class="footer-warp">
          <div class="row">
            <div class="widget-item">
              <h4>Contact Info</h4>
              <ul class="contact-list">
                <li>1481 Creekside Lane <br>
                  Avila Beach, CA 931</li>
                <li>+53 345 7953 32453</li>
                <li>yourmail@gmail.com</li>
              </ul>
            </div>
            <div class="widget-item">
              <h4>Engeneering</h4>
              <ul>
                <li><a href="">Applied Studies</a></li>
                <li><a href="">Computer Engeneering</a></li>
                <li><a href="">Software Engeneering</a></li>
                <li><a href="">Informational Engeneering</a></li>
                <li><a href="">System Engeneering</a></li>
              </ul>
            </div>
            <div class="widget-item">
              <h4>Graphic Design</h4>
              <ul>
                <li><a href="">Applied Studies</a></li>
                <li><a href="">Computer Engeneering</a></li>
                <li><a href="">Software Engeneering</a></li>
                <li><a href="">Informational Engeneering</a></li>
                <li><a href="">System Engeneering</a></li>
              </ul>
            </div>
            <div class="widget-item">
              <h4>Development</h4>
              <ul>
                <li><a href="">Applied Studies</a></li>
                <li><a href="">Computer Engeneering</a></li>
                <li><a href="">Software Engeneering</a></li>
                <li><a href="">Informational Engeneering</a></li>
                <li><a href="">System Engeneering</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <div class="footer-warp">
          <ul class="footer-menu">
            <li><a href="#">Terms &amp; Conditions</a></li>
            <li><a href="#">Register</a></li>
            <li><a href="#">Privacy</a></li>
          </ul>
        </div>
      </div>
    </footer>
    <!-- footer section end -->
    <!--====== Javascripts & Jquery ======-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/circle-progress.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    
  </body>
</html>

