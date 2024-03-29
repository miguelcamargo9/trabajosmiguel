/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.session;

import com.marketplaceMTC.entities.Ofertas;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Miguel
 */
@Stateless
public class OfertasFacade extends AbstractFacade<Ofertas> {
  @PersistenceContext(unitName = "marketplaceMTC-ejbPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public OfertasFacade() {
    super(Ofertas.class);
  }
  
}
