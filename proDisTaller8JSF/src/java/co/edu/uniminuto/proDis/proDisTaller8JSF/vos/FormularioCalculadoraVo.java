/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.proDis.proDisTaller8JSF.vos;

/**
 *
 * @author Administrador
 */
public class FormularioCalculadoraVo {

  private float var1;
  private float var2;
  private String Operacion;
  private float resultado;

  public FormularioCalculadoraVo(float var1, float var2, String Operacion) {
    this.var1 = var1;
    this.var2 = var2;
    this.Operacion = Operacion;
  }

  public String getOperacion() {
    return Operacion;
  }

  public void setOperacion(String Operacion) {
    this.Operacion = Operacion;
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

  public float getResultado() {
    return resultado;
  }

  public void setResultado() {
    int Operac = 0;
    if (this.Operacion.equals("SUMAR")) {
      Operac = 1;
    }
    if (this.Operacion.equals("RESTAR")) {
      Operac = 2;
    }
    if (this.Operacion.equals("MULTIPLICAR")) {
      Operac = 3;
    }
    if (this.Operacion.equals("DIVIDIR")) {
      Operac = 4;
    }

    float Resul = 0;
    switch (Operac) {
      case 1:
        this.resultado = this.getVar1() + this.getVar2();
        break;
      case 2:
        this.resultado = this.getVar1() - this.getVar2();
        break;
      case 3:
        this.resultado = this.getVar1() * this.getVar2();
        break;
      case 4:
        this.resultado = this.getVar1() / this.getVar2();
        break;
    }
  }
}
