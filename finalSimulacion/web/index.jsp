<%-- 
    Document   : index
    Created on : 03-jun-2014, 23:07:16
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Proyecto Final</title>
  </head>
  <body>
    <form name="diasForm" method="POST" action="distrubucionServlet">
      <table border="1">
        <tbody>
          <tr>
            <td>Dias a Simular</td>
            <td><input type="number" name="diasSimular" value="0" min="0"/></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><input type="submit" value="Enviar" /></td>
          </tr>
        </tbody>
      </table>
    </form>
  </body>
</html>
