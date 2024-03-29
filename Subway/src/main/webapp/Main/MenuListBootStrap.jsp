<%@page import="java.util.Vector"%>
<%@page import="DTO.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
List<OrderDTO> cartLists = (Vector<OrderDTO>)session.getAttribute("cartLists");
int count = 0;
if (cartLists != null) count = cartLists.size();%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SubWay!</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="../Main/main.jsp">Subway! Make your own snadwitchs!</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="../Main/main.jsp">Home</a></li>
                        <% if(session.getAttribute("admin_id")!= null || session.getAttribute("user_id")!=null){ %>
                        <li class="nav-item"><a class="nav-link" href="../Login/Logout.jsp">Logout</a></li>
                        <% } else { %>
                        <li class="nav-item"><a class="nav-link" href="../Login/LoginForm.jsp">Login</a></li>
                        <% } %>
                        <li class="nav-item"><a class="nav-link" href="../Order/Order.jsp">Order</a></li>
                        <% if(session.getAttribute("admin_id")!= null){ %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="# role="button" data-bs-toggle="dropdown" aria-expanded="false">Manage Condiments</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="../Condiment/conList.jsp">Condiments</a></li>
                            </ul>
                        </li>
                        <%} %>
                    </ul>
                    <form class="d-flex">
                        <a class="btn btn-outline-dark" role="button" href="../Cart/Cart.jsp">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%= count  %></span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../js/scripts.js"></script>
</body>
</html>