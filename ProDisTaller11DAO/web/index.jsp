<%-- 
    Document   : index
    Created on : 09-may-2014, 23:39:03
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Save DAO</title>
  </head>
  <body>
    <form action="personaServlet" method="post">
      <table>
        <tr>
          <td>
            Nombre
          </td>
          <td>
            <input type="text" name="nombre" required>
          </td>
        </tr>
        <tr>
          <td>
            Apellido
          </td>
          <td>
            <input type="text" name="apellido" required>
          </td>
        </tr>
        <tr>
          <td>
            Documento
          </td>
          <td>
            <input type="text" name="documento" required>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="Guardar">
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
