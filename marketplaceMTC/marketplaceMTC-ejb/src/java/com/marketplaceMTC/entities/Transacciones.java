/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Miguel
 */
@Entity
@Table(name = "transacciones")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "Transacciones.findAll", query = "SELECT t FROM Transacciones t"),
  @NamedQuery(name = "Transacciones.findById", query = "SELECT t FROM Transacciones t WHERE t.id = :id"),
  @NamedQuery(name = "Transacciones.findByFechaTransaccion", query = "SELECT t FROM Transacciones t WHERE t.fechaTransaccion = :fechaTransaccion")})
public class Transacciones implements Serializable {
  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "id")
  private Integer id;
  @Basic(optional = false)
  @NotNull
  @Column(name = "fechaTransaccion")
  @Temporal(TemporalType.DATE)
  private Date fechaTransaccion;
  @JoinColumn(name = "idUsuario", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private Usuarios idUsuario;
  @JoinColumn(name = "idServicio", referencedColumnName = "id")
  @ManyToOne
  private Servicios idServicio;
  @JoinColumn(name = "idPaquete", referencedColumnName = "id")
  @ManyToOne
  private Paquetes idPaquete;
  @JoinColumn(name = "idOferta", referencedColumnName = "id")
  @ManyToOne
  private Ofertas idOferta;

  public Transacciones() {
  }

  public Transacciones(Integer id) {
    this.id = id;
  }

  public Transacciones(Integer id, Date fechaTransaccion) {
    this.id = id;
    this.fechaTransaccion = fechaTransaccion;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Date getFechaTransaccion() {
    return fechaTransaccion;
  }

  public void setFechaTransaccion(Date fechaTransaccion) {
    this.fechaTransaccion = fechaTransaccion;
  }

  public Usuarios getIdUsuario() {
    return idUsuario;
  }

  public void setIdUsuario(Usuarios idUsuario) {
    this.idUsuario = idUsuario;
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

  public Ofertas getIdOferta() {
    return idOferta;
  }

  public void setIdOferta(Ofertas idOferta) {
    this.idOferta = idOferta;
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
    if (!(object instanceof Transacciones)) {
      return false;
    }
    Transacciones other = (Transacciones) object;
    if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "com.marketplaceMTC.entities.Transacciones[ id=" + id + " ]";
  }
  
}
