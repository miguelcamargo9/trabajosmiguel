/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finalSimulacion.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Miguel
 */
@WebServlet(name = "distrubucionServlet", urlPatterns = {"/distrubucionServlet"})
public class distrubucionServlet extends HttpServlet {

  ArrayList<Integer> vRandomDias = new ArrayList<>();
  ArrayList<Double> vRandom1 = new ArrayList<>();
  ArrayList<Double> vRandom2 = new ArrayList<>();
  ArrayList<Double> fx = new ArrayList<>();
  ArrayList<Double> x = new ArrayList<>();
  ArrayList<String> data = new ArrayList<>();
  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */

  Integer diasSim;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try {
      HttpSession session = request.getSession();
      String labels = "";
      for (int i = 0; i < diasSim; i++) {
        labels += "\"Dia" + (i + 1) + "\",";
        data.add("65, 59, 90, 81, 56, 55, 40");
      }
      session.setAttribute("labels", labels.substring(0, labels.length() - 1));
      session.setAttribute("data", data);
      response.sendRedirect("salida.jsp");
    } finally {
      out.close();
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
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
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    diasSim = Integer.parseInt(request.getParameter("diasSimular"));
    this.generarDias(diasSim);
    this.calcularX();
    this.calcularFX();
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

  public void generarDias(Integer numeroDias) {
    for (int i = 0; i < numeroDias; i++) {
      Double numeroAleatorio = Math.random();
      Double numeroAleatorio2 = Math.random();
      vRandom1.add(numeroAleatorio);
      vRandom2.add(numeroAleatorio2);
      if (0.0000 <= numeroAleatorio && numeroAleatorio < 0.0067) {
        this.vRandomDias.add(0);
      } else if (0.0067 <= numeroAleatorio && numeroAleatorio < 0.0404) {
        this.vRandomDias.add(1);
      } else if (0.0404 <= numeroAleatorio && numeroAleatorio < 0.1246) {
        this.vRandomDias.add(2);
      } else if (0.1246 <= numeroAleatorio && numeroAleatorio < 0.2650) {
        this.vRandomDias.add(3);
      } else if (0.2650 <= numeroAleatorio && numeroAleatorio < 0.4405) {
        this.vRandomDias.add(4);
      } else if (0.4405 <= numeroAleatorio && numeroAleatorio < 0.6160) {
        this.vRandomDias.add(5);
      } else if (0.6160 <= numeroAleatorio && numeroAleatorio < 0.7622) {
        this.vRandomDias.add(6);
      } else if (0.7622 <= numeroAleatorio && numeroAleatorio < 0.8666) {
        this.vRandomDias.add(7);
      } else if (0.8666 <= numeroAleatorio && numeroAleatorio < 0.9319) {
        this.vRandomDias.add(8);
      } else if (0.9319 <= numeroAleatorio && numeroAleatorio < 0.9682) {
        this.vRandomDias.add(9);
      } else if (0.9682 <= numeroAleatorio && numeroAleatorio < 0.9863) {
        this.vRandomDias.add(10);
      } else if (0.9863 <= numeroAleatorio && numeroAleatorio < 0.9945) {
        this.vRandomDias.add(11);
      } else if (0.9945 <= numeroAleatorio && numeroAleatorio < 0.9979) {
        this.vRandomDias.add(12);
      } else if (0.9979 <= numeroAleatorio && numeroAleatorio < 0.9992) {
        this.vRandomDias.add(13);
      } else if (0.9992 <= numeroAleatorio && numeroAleatorio < 0.9997) {
        this.vRandomDias.add(14);
      } else if (0.9997 <= numeroAleatorio && numeroAleatorio < 0.9999) {
        this.vRandomDias.add(15);
      }
    }
  }

  public void calcularX() {
    for (int i = 0; i < vRandom1.size(); i++) {
      Double valor = 6 + (12 + 6) * vRandom1.get(i);
      x.add(valor);
    }
  }
  
  public void calcularFX() {
    for (int i = 0; i < x.size(); i++) {
      Double valor = 0.0;
      if (x.get(i) >= 6 && x.get(i) <= 9) {
        valor = (x.get(i) * (0.11)) - 0.66;
      } else {
        valor = (-x.get(i) * (0.11)) - 0.66;
      }
      fx.add(valor);
    }
  }
  
  public Double calcularLlegada(Double Random){
    return -(Math.log(Random))/ 64;
  }
  
  public Double calcularEmpaquetado(Double Random){
    return 30+((50-30)*Random);
  }
  
  public Double calcularEnsamblado(Double Random){
    Double sumatoria = 0.0;
    for(int i = 0;i< 12; i++){
      sumatoria = sumatoria + ((sumatoria*i)-6);
    }
    return 15 + 10 * (sumatoria);
  }
}
