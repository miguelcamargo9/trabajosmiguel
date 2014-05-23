/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Taller13.vos;

/**
 *
 * @author miguelcamargo9
 */
public class persona {

  private String nombre;
  private String apellido;
  private Integer documento;

  public persona(String nombre, String apellido, Integer documento) {
    this.nombre = nombre;
    this.apellido = apellido;
    this.documento = documento;
  }

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public String getApellido() {
    return apellido;
  }

  public void setApellido(String apellido) {
    this.apellido = apellido;
  }

  public Integer getDocumento() {
    return documento;
  }

  public void setDocumento(Integer documento) {
    this.documento = documento;
  }
}
