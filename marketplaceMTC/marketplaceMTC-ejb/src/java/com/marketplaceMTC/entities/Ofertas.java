/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Miguel
 */
@Entity
@Table(name = "ofertas")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "Ofertas.findAll", query = "SELECT o FROM Ofertas o"),
  @NamedQuery(name = "Ofertas.findById", query = "SELECT o FROM Ofertas o WHERE o.id = :id"),
  @NamedQuery(name = "Ofertas.findByDescripcion", query = "SELECT o FROM Ofertas o WHERE o.descripcion = :descripcion"),
  @NamedQuery(name = "Ofertas.findByFechaInicial", query = "SELECT o FROM Ofertas o WHERE o.fechaInicial = :fechaInicial"),
  @NamedQuery(name = "Ofertas.findByFechaFinal", query = "SELECT o FROM Ofertas o WHERE o.fechaFinal = :fechaFinal"),
  @NamedQuery(name = "Ofertas.findByValor", query = "SELECT o FROM Ofertas o WHERE o.valor = :valor")})
public class Ofertas implements Serializable {
  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "id")
  private Integer id;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1, max = 50)
  @Column(name = "descripcion")
  private String descripcion;
  @Basic(optional = false)
  @NotNull
  @Column(name = "fechaInicial")
  @Temporal(TemporalType.DATE)
  private Date fechaInicial;
  @Basic(optional = false)
  @NotNull
  @Column(name = "fechaFinal")
  @Temporal(TemporalType.DATE)
  private Date fechaFinal;
  @Basic(optional = false)
  @NotNull
  @Column(name = "valor")
  private int valor;
  @JoinColumn(name = "idPaquete", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private Paquetes idPaquete;
  @OneToMany(mappedBy = "idOferta")
  private List<Transacciones> transaccionesList;

  public Ofertas() {
  }

  public Ofertas(Integer id) {
    this.id = id;
  }

  public Ofertas(Integer id, String descripcion, Date fechaInicial, Date fechaFinal, int valor) {
    this.id = id;
    this.descripcion = descripcion;
    this.fechaInicial = fechaInicial;
    this.fechaFinal = fechaFinal;
    this.valor = valor;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getDescripcion() {
    return descripcion;
  }

  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  public Date getFechaInicial() {
    return fechaInicial;
  }

  public void setFechaInicial(Date fechaInicial) {
    this.fechaInicial = fechaInicial;
  }

  public Date getFechaFinal() {
    return fechaFinal;
  }

  public void setFechaFinal(Date fechaFinal) {
    this.fechaFinal = fechaFinal;
  }

  public int getValor() {
    return valor;
  }

  public void setValor(int valor) {
    this.valor = valor;
  }

  public Paquetes getIdPaquete() {
    return idPaquete;
  }

  public void setIdPaquete(Paquetes idPaquete) {
    this.idPaquete = idPaquete;
  }

  @XmlTransient
  public List<Transacciones> getTransaccionesList() {
    return transaccionesList;
  }

  public void setTransaccionesList(List<Transacciones> transaccionesList) {
    this.transaccionesList = transaccionesList;
  }

  @Override
  public int hashCode() {
    int hash = 0;
    hash += (id != null ? id.hashCode() : 0);
    return hash;
  }

  @Override
  public boolean equals(Object object) {
    // TODO: Warning - this method won't work in the case the id fields are not set
    if (!(object instanceof Ofertas)) {
      return false;
    }
    Ofertas other = (Ofertas) object;
    if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "com.marketplaceMTC.entities.Ofertas[ id=" + id + " ]";
  }
  
}
