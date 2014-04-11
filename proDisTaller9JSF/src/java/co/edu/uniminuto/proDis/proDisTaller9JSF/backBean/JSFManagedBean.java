/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.proDis.proDisTaller9JSF.backBean;

import co.edu.uniminuto.proDis.proDisTaller9JSF.vos.FormularioPersonaVo;
import co.edu.uniminuto.proDis.proDisTaller9JSF.vos.saldosPersona;
import java.util.ArrayList;
import java.util.List;
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
  private FormularioPersonaVo miPersonaVO;
  private String msj;

  public JSFManagedBean() {
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

  public String getFecha() {
    return fecha;
  }

  public void setFecha(String fecha) {
    this.fecha = fecha;
  }

  public Double getValorC() {
    return valorC;
  }

  public void setValorC(Double valorC) {
    this.valorC = valorC;
  }

  public int getCuotas() {
    return cuotas;
  }

  public void setCuotas(int cuotas) {
    this.cuotas = cuotas;
  }

  public FormularioPersonaVo getMiPersonaVO() {
    return miPersonaVO;
  }

  public void setMiPersonaVO(FormularioPersonaVo miPersonaVO) {
    this.miPersonaVO = miPersonaVO;
  }

  public String getMsj() {
    return msj;
  }

  public void setMsj(String msj) {
    this.msj = msj;
  }
  
  public void calcular(){
    boolean bandera = true;
    String msje = "";
    Double ValorCuo = 0.0;
    FormularioPersonaVo miForm = new FormularioPersonaVo(this.getNombre(), this.getApellido(), this.getFecha(), this.getValorC(), this.getCuotas(), ValorCuo);
    this.setMiPersonaVO(miForm);
    if ((Integer.parseInt(miForm.calcularEdad(this.getMiPersonaVO().getFecha())) <= 18) || 
            (Integer.parseInt(this.getMiPersonaVO().calcularEdad(miForm.getFecha())) >= 35)) {
      msje = "CREDITO NO APROBADO";
      bandera = false;
    }
    if (bandera) {
      Double ValorCuotaNormal = this.getMiPersonaVO().getValorC() / this.getMiPersonaVO().getCuotas();
      Double ValorCP = this.getMiPersonaVO().getValorC();
      Double valorCuo = this.getMiPersonaVO().getValotCuo(ValorCP);
      List<saldosPersona> saldoLista = new ArrayList<saldosPersona>();
      for (int i = 0; i < this.getMiPersonaVO().getCuotas(); i++) {
        saldosPersona miSaldo = new saldosPersona(i + 1,  ValorCP, valorCuo, valorCuo - ValorCuotaNormal);
        saldoLista.add(miSaldo);
        ValorCP = ValorCP - ValorCuotaNormal;
      }
      this.getMiPersonaVO().setSaldoLista(saldoLista);
      msje = "Señor: "+getMiPersonaVO().getNombre() + " " + getMiPersonaVO().getApellido() + ", su edad " + getMiPersonaVO().calcularEdad(getMiPersonaVO().getFecha());
    }
    
    this.setMsj(msje);
  }
  
   
}
