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
import javax.faces.bean.SessionScoped;
import javax.faces.event.AjaxBehaviorEvent;

/**
 *
 * @author miguelcamargo9
 */
@ManagedBean
@SessionScoped
public class personaMB {

  private Integer id;
  private String nombre;
  private String apellido;
  private Integer documento;
  private persona miPersonaVO;
  private List<persona> misPersonas = new ArrayList<persona>();
  private List<persona> misPersonasB = new ArrayList<persona>();
  private personaDAO miPersonaDao = new personaDAO();

  /**
   * Creates a new instance of personaMB
   */
  public personaMB() {
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

  public String eliminar(int Cedula) {
    this.setDocumento(Cedula);
    return "eliminar";
  }

  public String irEditar(Integer id, String nombre, String apellido, Integer documento) {
    this.setId(id);
    this.setNombre(nombre);
    this.setApellido(apellido);
    this.setDocumento(documento);
    return "editar";
  }

  public String irConsultar(int id, String nombre, String apellido, Integer documento) {
    this.setId(id);
    this.setNombre(nombre);
    this.setApellido(apellido);
    this.setDocumento(documento);
    return "consultar";
  }

  public String irEliminar(Integer id, String nombre, String apellido, Integer documento) {
    this.setId(id);
    this.setNombre(nombre);
    this.setApellido(apellido);
    this.setDocumento(documento);
    return "eliminar";
  }

  public void limpiar() {
    this.nombre = "";
    this.apellido = "";
    this.id = null;
    this.documento = null;
  }

  public String nuevo() {
    miPersonaVO = new persona(nombre, apellido, documento);
    try {
      miPersonaDao.insertarPersona(miPersonaVO);
      misPersonas = miPersonaDao.traerPersonas();
      return "volver";
    } catch (Exception ex) {
      Logger.getLogger(personaMB.class.getName()).log(Level.SEVERE, null, ex);
      return "nuevo";
    }
  }

  public String editar() {
    miPersonaVO = new persona(nombre, apellido, documento);
    miPersonaVO.setId(id);
    try {
      miPersonaDao.actualizarPersona(miPersonaVO);
      misPersonas = miPersonaDao.traerPersonas();
      return "volver";
    } catch (Exception ex) {
      Logger.getLogger(personaMB.class.getName()).log(Level.SEVERE, null, ex);
      return "editar";
    }
  }

  public String eliminar() {
    miPersonaVO = new persona(nombre, apellido, documento);
    miPersonaVO.setId(id);
    try {
      miPersonaDao.eliminarPersona(miPersonaVO.getId());
      misPersonas = miPersonaDao.traerPersonas();
      return "volver";
    } catch (Exception ex) {
      Logger.getLogger(personaMB.class.getName()).log(Level.SEVERE, null, ex);
      return "eliminar";
    }
  }

  public String volver() {
    return "volver";
  }

  public List<persona> getPersonaPorNombre() {
    if (misPersonasB == null) {
      try {
        //... actualizar el contenido
        misPersonasB = miPersonaDao.buscarPersona(nombre); //... actualizar el contenido
      } catch (Exception ex) {
        Logger.getLogger(personaMB.class.getName()).log(Level.SEVERE, null, ex);
      }
    }
    return misPersonasB; //devuelve la lista con los elementos encontrados
  }

  public void nombreChangeListener(AjaxBehaviorEvent event) {
    try {
      //cada vez que haya un cambio en el texto, vuelve a generar la lista
      misPersonasB = miPersonaDao.buscarPersona(nombre);
    } catch (Exception ex) {
      Logger.getLogger(personaMB.class.getName()).log(Level.SEVERE, null, ex);
    }
  }
}
