/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.proDis.proDisTaller9JSF.vos;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author miguelcamargo9
 */
public class FormularioPersonaVo {

  private String Nombre;
  private String Apellido;
  private String Fecha;
  private Double ValorC;
  private int Cuotas;
  private Double ValorCuo;
  private List<saldosPersona> saldoLista = new ArrayList<saldosPersona>();

  public FormularioPersonaVo(String Nombre, String Apellido, String Fecha, Double ValorC, int Cuotas, Double ValorCuo) {
    this.Nombre = Nombre;
    this.Apellido = Apellido;
    this.Fecha = Fecha;
    this.ValorC = ValorC;
    this.Cuotas = Cuotas;
    this.ValorCuo = ValorCuo;
  }

  public String getNombre() {
    return Nombre;
  }

  public void setNombre(String Nombre) {
    this.Nombre = Nombre;
  }

  public String getApellido() {
    return Apellido;
  }

  public void setApellido(String Apellido) {
    this.Apellido = Apellido;
  }

  public String getFecha() {
    return Fecha;
  }

  public void setFecha(String Fecha) {
    this.Fecha = Fecha;
  }

  public Double getValorC() {
    return ValorC;
  }

  public void setValorC(Double ValorC) {
    this.ValorC = ValorC;
  }

  public int getCuotas() {
    return Cuotas;
  }

  public void setCuotas(int Cuotas) {
    this.Cuotas = Cuotas;
  }

  public Double getValotCuo(Double ValorC) {
    this.calcularValorCuota(Integer.parseInt(this.calcularEdad(Fecha)), ValorC);
    return ValorCuo;
  }

  public void setValotCuo(Double ValotT) {
    this.ValorCuo = ValotT;
  }

  public String calcularEdad(String Fecha) {
    int ano = Integer.valueOf(Fecha.substring(0, 4));
    int mes = Integer.valueOf(Fecha.substring(5, 7));
    int dia = Integer.valueOf(Fecha.substring(8, 10));

    Calendar fechaSistema = Calendar.getInstance();

    fechaSistema.add(Calendar.YEAR, -ano);
    fechaSistema.add(Calendar.MONTH, -mes);
    fechaSistema.add(Calendar.DAY_OF_MONTH, -dia);

    return String.valueOf(fechaSistema.get(Calendar.YEAR));
  }

  public void calcularValorCuota(int Edad, Double ValorC) {

    Double ValorT;
    Double ValorCo = ValorC / this.getCuotas();
    Double Inte = this.calcularInteres(Edad);
    ValorT = (ValorCo + (Inte * ValorC));
    this.setValotCuo(ValorT);
  }

  public Double calcularInteres(int Edad) {
    Double Int = 0.0;
    if (Edad <= 18 || Edad > 60) {
    } else {
      if (Edad <= 35) {
        Int = 0.04;
      } else {
        if (Edad <= 60) {
          Int = 0.06;
        }
      }
    }
    return Int;
  }

  public List<saldosPersona> getSaldoLista() {
    return saldoLista;
  }

  public void setSaldoLista(List<saldosPersona> saldoLista) {
    this.saldoLista = saldoLista;
  }
}
