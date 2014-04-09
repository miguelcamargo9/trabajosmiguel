/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.proDis.proDisTaller8JSF.backBean;

import co.edu.uniminuto.proDis.proDisTaller8JSF.vos.FormularioCalculadoraVo;
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
  private float var1;
  private float var2;
  private String operacion;
  private float resultado;
  private FormularioCalculadoraVo miCalc; 
  public JSFManagedBean() {
  }

  public float getVar1() {
    return var1;
  }

  public void setVar1(float var1) {
    this.var1 = var1;
  }

  public float getVar2() {
    return var2;
  }

  public void setVar2(float var2) {
    this.var2 = var2;
  }

  public String getOperacion() {
    return operacion;
  }

  public void setOperacion(String Operacion) {
    this.operacion = Operacion;
  }

  public float getResultado() {
    return resultado;
  }

  public void setResultado(float resultado) {
    this.resultado = resultado;
  }

  public FormularioCalculadoraVo getMiCalc() {
    return miCalc;
  }

  public void setMiCalc(FormularioCalculadoraVo miCalc) {
    this.miCalc = miCalc;
  }
  
  public void calcular(){
    FormularioCalculadoraVo miCal = new FormularioCalculadoraVo(this.var1,this.var2,this.operacion);
    this.setMiCalc(miCal);
    this.miCalc.setResultado();
    this.setResultado(this.miCalc.getResultado());
  }
}
