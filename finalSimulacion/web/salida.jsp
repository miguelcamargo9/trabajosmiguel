<%-- 
    Document   : salida
    Created on : 04-jun-2014, 11:36:14
    Author     : open12
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String labels = null;
  ArrayList data = (ArrayList) session.getAttribute("data");
  labels = (String) session.getAttribute("labels");
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
  </body>
</html>
