/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.entities;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Miguel
 */
@Entity
@Table(name = "paquetesdeservicios")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "Paquetesdeservicios.findAll", query = "SELECT p FROM Paquetesdeservicios p"),
  @NamedQuery(name = "Paquetesdeservicios.findById", query = "SELECT p FROM Paquetesdeservicios p WHERE p.id = :id"),
  @NamedQuery(name = "Paquetesdeservicios.findByEstado", query = "SELECT p FROM Paquetesdeservicios p WHERE p.estado = :estado")})
public class Paquetesdeservicios implements Serializable {
  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "id")
  private Integer id;
  @Basic(optional = false)
  @NotNull
  @Column(name = "estado")
  private boolean estado;
  @JoinColumn(name = "idServicio", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private Servicios idServicio;
  @JoinColumn(name = "idPaquete", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private Paquetes idPaquete;

  public Paquetesdeservicios() {
  }

  public Paquetesdeservicios(Integer id) {
    this.id = id;
  }

  public Paquetesdeservicios(Integer id, boolean estado) {
    this.id = id;
    this.estado = estado;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public boolean getEstado() {
    return estado;
  }

  public void setEstado(boolean estado) {
    this.estado = estado;
  }

  public Servicios getIdServicio() {
    return idServicio;
  }

  public void setIdServicio(Servicios idServicio) {
    this.idServicio = idServicio;
  }

  public Paquetes getIdPaquete() {
    return idPaquete;
  }

  public void setIdPaquete(Paquetes idPaquete) {
    this.idPaquete = idPaquete;
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
    if (!(object instanceof Paquetesdeservicios)) {
      return false;
    }
    Paquetesdeservicios other = (Paquetesdeservicios) object;
    if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "com.marketplaceMTC.entities.Paquetesdeservicios[ id=" + id + " ]";
  }
  
}
