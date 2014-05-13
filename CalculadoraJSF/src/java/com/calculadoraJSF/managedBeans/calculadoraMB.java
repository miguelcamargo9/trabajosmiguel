/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.calculadoraJSF.managedBeans;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author miguelcamargo9
 */
@ManagedBean
@SessionScoped
public class calculadoraMB {

  /**
   * Creates a new instance of calculadoraMB
   */
  private double numero;
  private double resultado;
  private String operacion;

  public calculadoraMB() {
  }

  public double getNumero() {
    return numero;
  }

  public void setNumero(double numero) {
    this.numero = numero;
  }

  public double getResultado() {
    return resultado;
  }

  public void setResultado(double resultado) {
    this.resultado = resultado;
  }

  public String getOperacion() {
    return operacion;
  }

  public void setOperacion(String operacion) {
    this.operacion = operacion;
  }

  public void calcular() {
    int Operac = 0;
    if (this.operacion.equals("SUMAR")) {
      Operac = 1;
    }
    if (this.operacion.equals("RESTAR")) {
      Operac = 2;
    }
    if (this.operacion.equals("MULTIPLICAR")) {
      Operac = 3;
    }
    if (this.operacion.equals("DIVIDIR")) {
      Operac = 4;
    }
    if (this.operacion.equals("SIN")) {
      Operac = 5;
    }
    if (this.operacion.equals("COS")) {
      Operac = 6;
    }
    if (this.operacion.equals("TAN")) {
      Operac = 7;
    }

    switch (Operac) {
      case 1:
        this.resultado = this.resultado + this.numero;
        break;
      case 2:
        this.resultado = this.resultado - this.numero;
        break;
      case 3:
        this.resultado = this.resultado * this.numero;
        break;
      case 4:
        this.resultado = this.resultado / this.numero;
        break;
      case 5:
        this.resultado = Math.sin(this.numero);
        break;
      case 6:
        this.resultado = Math.cos(this.numero);
        break;
      case 7:
        this.resultado = Math.tan(this.numero);
        break;
    }
  }
}
