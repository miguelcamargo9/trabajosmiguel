/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.session;

import com.marketplaceMTC.entities.Perfiles;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Miguel
 */
@Stateless
public class PerfilesFacade extends AbstractFacade<Perfiles> {
  @PersistenceContext(unitName = "marketplaceMTC-ejbPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public PerfilesFacade() {
    super(Perfiles.class);
  }
  
}
