<%-- 
    Document   : salida
    Created on : 04-jun-2014, 11:36:14
    Author     : open12
--%>

<%@page import="com.finalSimulacion.VO.elementoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String labels = null;
  String total = null;
  ArrayList data = (ArrayList) session.getAttribute("data");
  ArrayList<elementoVO> datos = (ArrayList<elementoVO>) session.getAttribute("arreglo");
  labels = (String) session.getAttribute("labels");
  labels = (String) session.getAttribute("total");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/Chartjs/Chart.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
//Get context with jQuery - using jQuery's .get() method.
        var ctx = $("#myChart").get(0).getContext("2d");
//This will get the first returned node in the jQuery collection.
        var myNewChart = new Chart(ctx);
        var data = {
          labels: [<%=labels%>],
          datasets: [
            {
              fillColor: "rgba(151,187,205,0.5)",
              strokeColor: "rgba(151,187,205,1)",
              data: [<%=data.get(0)%>]
            },
            {
              fillColor: "rgba(120,123,45,0.5)",
              strokeColor: "rgba(151,187,205,1)",
              data: [<%=data.get(1)%>]
            },
            {
              fillColor: "rgba(50,123,45,0.5)",
              strokeColor: "rgba(151,187,205,1)",
              data: [<%=data.get(2)%>]
            },
            {
              fillColor: "rgba(50,123,45,0.5)",
              strokeColor: "rgba(151,187,205,1)",
              data: [<%=data.get(3)%>]
            },
            {
              fillColor: "rgba(50,123,45,0.5)",
              strokeColor: "rgba(151,187,205,1)",
              data: [<%=data.get(4)%>]
            }
          ]
        };
        var options = {
          scaleOverlay: false
        };
        new Chart(ctx).Bar(data, options);
      });
    </script>
    <title>Simulacion</title>
  </head>
  <body>
    <fieldset>
      <legend>Grafico</legend>
      <canvas id="myChart" width="1200" height="500"></canvas>
    </fieldset>
    <h1>total = <%=total%></h1>
    <fieldset>
      <legend>Tabla</legend>
      <table border="1">
        <thead>
          <tr>
            <th>tapas</th>
            <th>tapas cola</th>
            <th>paquetes</th>
            <th>paquetes cola</th>
            <th>producto final</th>
            <th>producto final cola</th>
          </tr>
        </thead>
        <tbody>
          <% 
          for (elementoVO elemento: datos) {
          %>
          <tr>
            <td><%=elemento.getTapas()%></td>
            <td><%=elemento.getTapasCola()%></td>
            <td><%=elemento.getPaquetes()%></td>
            <td><%=elemento.getPaquetesCola()%></td>
            <td><%=elemento.getProductoFinal()%></td>
            <td><%=elemento.getProductoFinalCola()%></td>
          </tr>
          <%
          }
          %>
        </tbody>
      </table>

    </fieldset>
  </body>
</html>
