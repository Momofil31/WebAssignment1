<%-- 
    Document   : showcase
    Created on : 3-mag-2020, 20.14.55
    Author     : filippomomesso
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.unitn.studenti.filippomomesso.Product"%>
<%@page import="java.util.ArrayList"%>
<%!
    //Database variables
    String dbURL = "jdbc:derby://localhost:1527/DerbyDB";
    String user = "filippo";
    String password = "filippo";
    Connection conn = null;

    ArrayList<Product> productList = new ArrayList<Product>();

    public void jspInit() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, user, password);

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }

        try {
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM Products FETCH FIRST 15 ROWS ONLY";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Product product = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getString("price"), rs.getString("img_url"));
                productList.add(product);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void jspDestroy() {
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Showcase</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
        <script type="text/javascript" src="./js/scripts.js"></script>
    </head>
    <body>
        <nav class="indigo" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="" class="brand-logo">Showcase</a>
                <ul class="right hide-on-med-and-down">
                    <li><a class="btn pink" href="./logout">Logout</a></li>					
                </ul>

                <ul id="nav-mobile" class="sidenav">
                    <li><a class="btn pink" href="./logout">Logout</a></li>					
                </ul>

                <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            </div>
        </nav>
        <!-- Page Layout here -->
        <div class="row section">
            <div class="col s12 m8 l9 push-m4 push-l3"> 
                <!-- Main content -->
                <div  id="main">
                    <div class="card">
                        <div class="card-content">
                            <h6>Seleziona un articolo per visualizzarlo!</h6>
                        </div>
                    </div>
                    <!-- Product detailed template -->              
                </div>
                <h5>Recently seen:</h5>
                <div class="center-cols center-align equal-col" id="recent">
                    <!-- Recently seen template --> 
                </div>
            </div>

            <!-- Sidebar -->
            <div class="col s12 m4 l3 pull-m8 pull-l9">
                <div class="card" id="product-preview-sidebar">
                    <% for (Product product : productList) {%>
                    <!-- post preview template -->
                    <div class="product-preview" id="product-preview-<%= product.getId()%>" onclick="displayProduct(<%= product.getId()%>)">
                        <div class="card-content">
                            <span class="card-title"><%= product.getName()%></span>
                            <p class="grey-text"><i><%= product.getPrice()%></i></p>
                            <p><%= product.getDescription().substring(0, Math.min(100, product.getDescription().length()))%></p>
                        </div>                            
                        <div class="divider"></div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>

        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script>
                        $(document).ready(function () {
                            $(".sidenav").sidenav();
                        });
        </script>
        <script>displayRecentlySeen()</script>
    </body>
</html>
