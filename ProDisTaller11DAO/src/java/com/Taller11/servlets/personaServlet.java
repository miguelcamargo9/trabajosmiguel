/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Taller11.servlets;

import com.Taller11.DAO.personaDAO;
import com.Taller11.vo.persona;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Miguel
 */
@WebServlet(name = "personaServlet", urlPatterns = {"/personaServlet"})
public class personaServlet extends HttpServlet {
  
  private persona miPersona = new persona(null, null, Integer.MIN_VALUE);
  private personaDAO miDao = new personaDAO();
  private boolean bandera = true;

  /**
   * Processes requests for both HTTP
   * <code>GET</code> and
   * <code>POST</code> methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try {

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet personaServlet</title>");      
      out.println("</head>");
      out.println("<body>");
      if(bandera == true){
        out.println("<h1>Guardado con Exito</h1>");
      }else{
        out.println("<h1>Error al Guardar</h1>");
      }
      
      out.println("</body>");
      out.println("</html>");
    } finally {      
      out.close();
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP
   * <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP
   * <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    Integer documento = Integer.parseInt(request.getParameter("documento"));
    miPersona.setNombre(nombre);
    miPersona.setApellido(apellido);
    miPersona.setDocumento(documento);
    try {
      miDao.insertarPersona(miPersona);
      bandera = true;
    } catch (Exception ex) {
      bandera = false;
      Logger.getLogger(personaServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>
}
