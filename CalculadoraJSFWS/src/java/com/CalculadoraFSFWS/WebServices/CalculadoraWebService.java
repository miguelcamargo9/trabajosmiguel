/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.CalculadoraFSFWS.WebServices;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.ejb.Stateless;

/**
 *
 * @author Miguel
 */
@WebService(serviceName = "CalculadoraWebService")
@Stateless()
public class CalculadoraWebService {

  /**
   * Web service operation
   */
  @WebMethod(operationName = "sumar")
  public Double sumar(@WebParam(name = "numeroU") double numeroU, @WebParam(name = "numeroD") double numeroD) {
    //TODO write your implementation code here:
    Double Resultado = (numeroU) + (numeroD);
    return Resultado;
  }

  /**
   * Web service operation
   */
  @WebMethod(operationName = "resta")
  public Double resta(@WebParam(name = "numeroU") double numeroU, @WebParam(name = "numeroD") double numeroD) {
    //TODO write your implementation code here:
    Double Resultado = (numeroU) - (numeroD);
    return Resultado;
  }

  /**
   * Web service operation
   */
  @WebMethod(operationName = "multiplicar")
  public Double multiplicar(@WebParam(name = "numeroU") double numeroU, @WebParam(name = "numeroD") double numeroD) {
    //TODO write your implementation code here:
    Double Resultado = (numeroU) * (numeroD);
    return Resultado;
  }

  /**
   * Web service operation
   */
  @WebMethod(operationName = "dividir")
  public Double dividir(@WebParam(name = "numeroU") double numeroU, @WebParam(name = "numeroD") double numeroD) {
    //TODO write your implementation code here:
    Double Resultado = (numeroU) / (numeroD);
    return Resultado;
  }

  /**
   * Web service operation
   */
  @WebMethod(operationName = "sin")
  public Double sin(@WebParam(name = "numeroU") double numeroU) {
    //TODO write your implementation code here:
    Double Resultado = Math.sin(numeroU);
    return Resultado;
  }

  /**
   * Web service operation
   */
  @WebMethod(operationName = "cos")
  public Double cos(@WebParam(name = "numeroU") double numeroU) {
    //TODO write your implementation code here:
    Double Resultado = Math.cos(numeroU);
    return Resultado;
  }

  /**
   * Web service operation
   */
  @WebMethod(operationName = "tan")
  public Double tan(@WebParam(name = "numeroU") double numeroU) {
    //TODO write your implementation code here:
    Double Resultado = Math.tan(numeroU);
    return Resultado;
  }
}
