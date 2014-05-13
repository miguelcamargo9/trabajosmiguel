/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.calculadoraJSF.managedBeans;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author miguelcamargo9
 */
@ManagedBean
@RequestScoped
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
  
  
}
