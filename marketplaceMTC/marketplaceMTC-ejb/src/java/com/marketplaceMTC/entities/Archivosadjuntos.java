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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Miguel
 */
@Entity
@Table(name = "archivosadjuntos")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "Archivosadjuntos.findAll", query = "SELECT a FROM Archivosadjuntos a"),
  @NamedQuery(name = "Archivosadjuntos.findById", query = "SELECT a FROM Archivosadjuntos a WHERE a.id = :id")})
public class Archivosadjuntos implements Serializable {
  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "id")
  private Integer id;
  @JoinColumn(name = "idArchivo", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private Archivos idArchivo;
  @JoinColumn(name = "idAdjunto", referencedColumnName = "id")
  @ManyToOne(optional = false)
  private Adjuntos idAdjunto;

  public Archivosadjuntos() {
  }

  public Archivosadjuntos(Integer id) {
    this.id = id;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Archivos getIdArchivo() {
    return idArchivo;
  }

  public void setIdArchivo(Archivos idArchivo) {
    this.idArchivo = idArchivo;
  }

  public Adjuntos getIdAdjunto() {
    return idAdjunto;
  }

  public void setIdAdjunto(Adjuntos idAdjunto) {
    this.idAdjunto = idAdjunto;
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
    if (!(object instanceof Archivosadjuntos)) {
      return false;
    }
    Archivosadjuntos other = (Archivosadjuntos) object;
    if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "com.marketplaceMTC.entities.Archivosadjuntos[ id=" + id + " ]";
  }
  
}
