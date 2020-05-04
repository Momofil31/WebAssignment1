<%-- 
    Document   : login
    Created on : 3-mag-2020, 18.59.27
    Author     : filippomomesso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
        <style>
            body {
                display: flex;
                min-height: 100vh;
                flex-direction: column;
            }

            main {
                flex: 1 0 auto;
            }

            body {
                background: #fff;
            }

            .input-field input[type=date]:focus:not([readonly]) + label,
            .input-field input[type=text]:focus:not([readonly]) + label,
            .input-field input[type=email]:focus:not([readonly]) + label,
            .input-field input[type=password]:focus:not([readonly]) + label {
                color: #e91e63;
            }

            .input-field input[type=date]:focus:not([readonly]),
            .input-field input[type=text]:focus:not([readonly]),
            .input-field input[type=email]:focus:not([readonly]),
            .input-field input[type=password]:focus:not([readonly]) {
                border-bottom: 2px solid #e91e63;
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <div class="section"></div>
        <main>
            <center>
                <div class="section"></div>

                <h5 class="indigo-text">Please, login into your account</h5>
                <div class="section"></div>

                <div class="container">
                    <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
                        <p class="red-text">${message}</p>
                        <form class="col s12" method="post" action="<%=request.getContextPath()%>/login">
                            <div class='row'>
                                <div class='col s12'>
                                </div>
                            </div>

                            <div class='row'>
                                <div class='input-field col s12'>
                                    <input class='' required type='text' name='username' id='username' />
                                    <label for='username'>Enter your username</label>
                                </div>
                            </div>

                            <div class='row'>
                                <div class='input-field col s12'>
                                    <input class='' required type='password' name='password' id='password' />
                                    <label for='password'>Enter your password</label>
                                </div>
                                <label style='float: right;'>
                                    <a class='pink-text' href='#!'><b>Forgot Password?</b></a>
                                </label>
                            </div>

                            <br />
                            <center>
                                <div class='row'>
                                    <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Login</button>
                                </div>
                            </center>
                        </form>
                    </div>
                </div>
            </center>

            <div class="section"></div>
            <div class="section"></div>
        </main>

        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>

</html>

