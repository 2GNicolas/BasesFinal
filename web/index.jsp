<%-- 
    Document   : index
    Created on : 2/12/2018, 05:10:38 PM
    Author     : Nicolas
--%>

<%@page import="VO.ProdCarrito"%>
<%@page import="java.util.List"%>
<%@page import="VO.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Inicio</title>
    <meta name="description" content="WebUni Education Template">
    <meta name="keywords" content="webuni, education, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="img/favicon.ico" rel="shortcut icon">
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,400i,500,500i,600,600i,700,700i,800,800i"

      rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <!--[endif]---->
  </head>
  <body>
    <div id="preloder">
      <div class="loader"></div>
    </div>
    <header class="header-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-3">
            <div class="site-logo"> <img src="img/logop.png" alt="">
            </div>
            <div class="nav-switch"> <i class="fa fa-bars"></i> </div>
          </div>
          <div class="col-lg-9 col-md-9">
            <nav class="main-menu">
              <ul>
                
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </header>
    <section class="hero-section set-bg" data-setbg="img/bg.jpg">
      <div class="container">
        <div class="hero-text text-white">
          <h2>Variedades Sepia</h2>
        </div>
        <div class="row">
          <div class="col-lg-10 offset-lg-1">
            <form class="intro-newslatter" action="LoginC" method="POST"> <input placeholder="Usuario" type="text" name="usuario">
              <input class="last-s" placeholder="Contraseña" type="text" name="pass">  <input type="submit" name="submit"/>  </form>
          </div>
        </div>
      </div><br><br><br><br><br><br><br><br>
         <section class="search-section ss-other-page">
      <div class="container">
        <div class="search-warp">
          <div class="section-title text-white">
            <h2><span>Carrito</span></h2>
          </div>
          <div class="row">
            <div class="col-lg-10 offset-lg-1">
              <!-- search form -->
              <form  action="ControladorCarrito" method="POST"> <input placeholder="ID" name ="ID" type="text"><input placeholder="Cantidad" name ="Cantidad" type="text">
               <br><br> <button class="site-btn btn-dark" name = "agregar">Agregar</button>
                <button class="site-btn btn-dark" name = "eliminar">Eliminar</button> 
                <button class="site-btn btn-dark" name = "total">Limpiar</button>  
                <input placeholder="Total" id = "5" name ="total" type="text">
                <%
                if (request.getAttribute("totalizado") != null) {
                    String res = (String) request.getAttribute("totalizado");
            %>
            <script>
                document.getElementById("5").value = "<%=res%>";
            </script>
            <%
            } 
            %><br> <br> <br> <br>
                <table style="width:100%" name="lista">
                  <tbody>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Cantidad</th>
                      <th>Precio</th>
                     
                    </tr>
                    <%
                    if(request.getAttribute("carrito")!=null){
                        List productos = (List<ProdCarrito>)request.getAttribute("carrito");
                        for (int i = 0; i < productos.size(); i++) {
                            ProdCarrito producto = (ProdCarrito)productos.get(i);

                    %>
                    <tr>
                        <td><%=producto.getId()%></td>
                        <td><%=producto.getNombre()%></td>
                        <td><%=producto.getCantidad()%></td>
                        <td><%=producto.getPrecioT()%></td>
                    
                       
                       
                       
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
    </section>
    <section class="categories-section spad">
      <div class="container">
        <div class="section-title">
          <h2>Papeleria Variedades Sepia</h2>
          <p>El mejor servicio, la mejor calidad y al mejor precio.</p>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="categorie-item">
              <div class="ci-thumb set-bg" data-setbg="img/categories/precio10.jpg"></div>
              <div class="ci-text">
                <h5>IT Development</h5>
                <p>Lorem ipsum dolor sit amet, consectetur</p>
                <span>120 Courses</span> </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="categorie-item">
              <div class="ci-thumb set-bg" data-setbg="img/categories/seguridad10.jpg"></div>
              <div class="ci-text">
                <h5>Web Design</h5>
                <p>Lorem ipsum dolor sit amet, consectetur</p>
                <span>70 Courses</span> </div>
            </div>
          </div>
          <!-- categorie -->
          <div class="col-lg-4 col-md-6">
            <div class="categorie-item">
              <div class="ci-thumb set-bg" data-setbg="img/categories/calidad10.jpg"></div>
              <div class="ci-text">
                <h5>Illustration &amp; Drawing</h5>
                <p>Lorem ipsum dolor sit amet, consectetur</p>
                <span>55 Courses</span> </div>
            </div>
          </div>
          <!-- categorie -->
          <div class="col-lg-4 col-md-6">
            <div class="categorie-item">
              <div class="ci-thumb set-bg" data-setbg="img/categories/actualidad10.jpg"></div>
              <div class="ci-text">
                <h5>Social Media</h5>
                <p>Lorem ipsum dolor sit amet, consectetur</p>
                <span>40 Courses</span> </div>
            </div>
          </div>
          <!-- categorie -->
          <div class="col-lg-4 col-md-6">
            <div class="categorie-item">
              <div class="ci-thumb set-bg" data-setbg="img/categories/equipo10.jpg"></div>
              <div class="ci-text">
                <h5>Photoshop</h5>
                <p>Lorem ipsum dolor sit amet, consectetur</p>
                <span>220 Courses</span> </div>
            </div>
          </div>
          <!-- categorie -->
          <div class="col-lg-4 col-md-6">
            <div class="categorie-item">
              <div class="ci-thumb set-bg" data-setbg="img/categories/ambiente10.jpg"></div>
              <div class="ci-text">
                <h5>Cryptocurrencies</h5>
                <p>Lorem ipsum dolor sit amet, consectetur</p>
                <span>25 Courses</span> </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="signup-section spad">
      <div class="signup-bg set-bg" data-setbg="img/utiles.jpg"></div>
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
            <div class="signup-warp">
              <div class="section-title text-white text-left">
                <h2>Datos de la Papeleria</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  Donec malesuada lorem maximus mauris scelerisque, at rutrum
                  nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus
                  finibus.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- signup section end -->
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
