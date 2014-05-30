/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.CalculadoraFSFWS.ManagedBeans;

import com.CalculadoraFSFWS.WebServicesClient.CalculadoraWebService_Service;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author miguelcamargo9
 */
@ManagedBean
@SessionScoped
public class calculadoraMB {

  @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/CalculadoraWebService/CalculadoraWebService.wsdl")
  private CalculadoraWebService_Service service;
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

  private Double sumar(double numeroU, double numeroD) {
    com.CalculadoraFSFWS.WebServicesClient.CalculadoraWebService port = service.getCalculadoraWebServicePort();
    return port.sumar(numeroU, numeroD);
  }
  
  private Double cos(double numeroU) {
    com.CalculadoraFSFWS.WebServicesClient.CalculadoraWebService port = service.getCalculadoraWebServicePort();
    return port.cos(numeroU);
  }
  
  private Double resta(double numeroU, double numeroD) {
    com.CalculadoraFSFWS.WebServicesClient.CalculadoraWebService port = service.getCalculadoraWebServicePort();
    return port.resta(numeroU, numeroD);
  }
  
  private Double multiplicar(double numeroU, double numeroD) {
    com.CalculadoraFSFWS.WebServicesClient.CalculadoraWebService port = service.getCalculadoraWebServicePort();
    return port.multiplicar(numeroU, numeroD);
  }

  private Double dividir(double numeroU, double numeroD) {
    com.CalculadoraFSFWS.WebServicesClient.CalculadoraWebService port = service.getCalculadoraWebServicePort();
    return port.dividir(numeroU, numeroD);
  }

  private Double sin(double numeroU) {
    com.CalculadoraFSFWS.WebServicesClient.CalculadoraWebService port = service.getCalculadoraWebServicePort();
    return port.sin(numeroU);
  }

  private Double tan(double numeroU) {
    com.CalculadoraFSFWS.WebServicesClient.CalculadoraWebService port = service.getCalculadoraWebServicePort();
    return port.tan(numeroU);
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
        this.resultado = sumar(this.resultado, this.numero);
        break;
      case 2:
        this.resultado = resta(this.resultado,this.numero);
        break;
      case 3:
        this.resultado = multiplicar(this.resultado,this.numero);
        break;
      case 4:
        this.resultado = dividir(this.resultado,this.numero);
        break;
      case 5:
        this.resultado = sin(this.numero);
        break;
      case 6:
        this.resultado = cos(this.numero);
        break;
      case 7:
        this.resultado = tan(this.numero);
        break;
    }
  }

  


}
