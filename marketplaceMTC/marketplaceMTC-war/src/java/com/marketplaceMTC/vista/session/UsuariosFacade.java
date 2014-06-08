/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.session;

import com.marketplaceMTC.entities.Usuarios;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Miguel
 */
@Stateless
public class UsuariosFacade extends AbstractFacade<Usuarios> {
  @PersistenceContext(unitName = "marketplaceMTC-warPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public UsuariosFacade() {
    super(Usuarios.class);
  }
  
}
