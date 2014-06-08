/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.session;

import com.marketplaceMTC.entities.Servicios;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Miguel
 */
@Stateless
public class ServiciosFacade extends AbstractFacade<Servicios> {
  @PersistenceContext(unitName = "marketplaceMTC-warPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public ServiciosFacade() {
    super(Servicios.class);
  }
  
}
