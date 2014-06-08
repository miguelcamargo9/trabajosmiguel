/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Miguel
 */
@Entity
@Table(name = "servicios")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "Servicios.findAll", query = "SELECT s FROM Servicios s"),
  @NamedQuery(name = "Servicios.findById", query = "SELECT s FROM Servicios s WHERE s.id = :id"),
  @NamedQuery(name = "Servicios.findByDescripcion", query = "SELECT s FROM Servicios s WHERE s.descripcion = :descripcion"),
  @NamedQuery(name = "Servicios.findByValor", query = "SELECT s FROM Servicios s WHERE s.valor = :valor"),
  @NamedQuery(name = "Servicios.findByEstado", query = "SELECT s FROM Servicios s WHERE s.estado = :estado")})
public class Servicios implements Serializable {
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
  @Column(name = "valor")
  private long valor;
  @Basic(optional = false)
  @NotNull
  @Column(name = "estado")
  private int estado;
  @JoinColumn(name = "idCategoria", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private Categorias idCategoria;
  @JoinColumn(name = "idAdjunto", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private Adjuntos idAdjunto;
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "idServicio")
  private List<Paquetesdeservicios> paquetesdeserviciosList;
  @OneToMany(mappedBy = "idServicio")
  private List<Transacciones> transaccionesList;

  public Servicios() {
  }

  public Servicios(Integer id) {
    this.id = id;
  }

  public Servicios(Integer id, String descripcion, long valor, int estado) {
    this.id = id;
    this.descripcion = descripcion;
    this.valor = valor;
    this.estado = estado;
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

  public long getValor() {
    return valor;
  }

  public void setValor(long valor) {
    this.valor = valor;
  }

  public int getEstado() {
    return estado;
  }

  public void setEstado(int estado) {
    this.estado = estado;
  }

  public Categorias getIdCategoria() {
    return idCategoria;
  }

  public void setIdCategoria(Categorias idCategoria) {
    this.idCategoria = idCategoria;
  }

  public Adjuntos getIdAdjunto() {
    return idAdjunto;
  }

  public void setIdAdjunto(Adjuntos idAdjunto) {
    this.idAdjunto = idAdjunto;
  }

  @XmlTransient
  public List<Paquetesdeservicios> getPaquetesdeserviciosList() {
    return paquetesdeserviciosList;
  }

  public void setPaquetesdeserviciosList(List<Paquetesdeservicios> paquetesdeserviciosList) {
    this.paquetesdeserviciosList = paquetesdeserviciosList;
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
    if (!(object instanceof Servicios)) {
      return false;
    }
    Servicios other = (Servicios) object;
    if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "com.marketplaceMTC.entities.Servicios[ id=" + id + " ]";
  }
  
}
