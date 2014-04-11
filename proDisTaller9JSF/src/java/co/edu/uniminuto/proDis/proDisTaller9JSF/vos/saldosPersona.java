/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniminuto.proDis.proDisTaller9JSF.vos;

/**
 *
 * @author Administrador
 */
public class saldosPersona {
  
  private int Cuotas;
  private Double Saldo;
  private Double Valorcuota;
  private Double Intereses;

  public saldosPersona(int Cuotas, Double Saldo, Double Valorcuota, Double Intereses) {
    this.Cuotas = Cuotas;
    this.Saldo = Saldo;
    this.Valorcuota = Valorcuota;
    this.Intereses = Intereses;
  }

  public int getCuotas() {
    return Cuotas;
  }

  public void setCuotas(int Cuotas) {
    this.Cuotas = Cuotas;
  }

  public Double getSaldo() {
    return Saldo;
  }

  public void setSaldo(Double Saldo) {
    this.Saldo = Saldo;
  }

  public Double getValorcuota() {
    return Valorcuota;
  }

  public void setValorcuota(Double Valorcuota) {
    this.Valorcuota = Valorcuota;
  }

  public Double getIntereses() {
    return Intereses;
  }

  public void setIntereses(Double Intereses) {
    this.Intereses = Intereses;
  }
  
}
