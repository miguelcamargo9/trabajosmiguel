/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Taller13.managedBeans;

import com.Taller13.DAO.personaDAO;
import com.Taller13.vos.persona;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author miguelcamargo9
 */
@ManagedBean
@RequestScoped
public class personaMB {

  private Integer id;
  private String nombre;
  private String apellido;
  private Integer documento;
  private persona miPersonaVO;
  private List<persona> misPersonas = new ArrayList<persona>();
  private personaDAO miPersonaDao = new personaDAO();
  /**
   * Creates a new instance of personaMB
   */
  public personaMB(){
    try {
      this.misPersonas = miPersonaDao.traerPersonas();
    } catch (Exception ex) {
      Logger.getLogger(personaMB.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
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

  public Integer getDocumento() {
    return documento;
  }

  public void setDocumento(Integer documento) {
    this.documento = documento;
  }

  public persona getMiPersonaVO() {
    return miPersonaVO;
  }

  public void setMiPersonaVO(persona miPersonaVO) {
    this.miPersonaVO = miPersonaVO;
  }

  public List<persona> getMisPersonas() {
    return misPersonas;
  }

  public void setMisPersonas(List<persona> misPersonas) {
    this.misPersonas = misPersonas;
  }

  public String eliminar(int Cedula){
    this.setDocumento(Cedula);
    return "eliminar"; 
  }
  
  public String irEditar(Integer id, String nombre, String apellido, Integer documento){
    this.setId(id);
    this.setNombre(nombre);
    this.setApellido(apellido);
    this.setDocumento(documento);
    return "editar"; 
  }
  
  public String irConsultar(int id){
    this.setId(id);
    return "consultar"; 
  }
  
  public String irEliminar(int id){
    this.setId(id);
    return "eliminar"; 
  }
  
  public void editar(){
    miPersonaVO = new persona(nombre,apellido,documento);
    miPersonaVO.setId(id);
    try {
      miPersonaDao.actualizarPersona(miPersonaVO);
    } catch (Exception ex) {
      Logger.getLogger(personaMB.class.getName()).log(Level.SEVERE, null, ex);
    }
  }
}
