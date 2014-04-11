/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.proDis.proDisTaller9JSF.backBean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author miguelcamargo9
 */
@ManagedBean
@RequestScoped
public class JSFManagedBean {

  /**
   * Creates a new instance of JSFManagedBean
   */
  private String nombre;
  private String apellido;
  private String fecha;
  private Double valorC;
  private int cuotas;
  public JSFManagedBean() {
  }
}
