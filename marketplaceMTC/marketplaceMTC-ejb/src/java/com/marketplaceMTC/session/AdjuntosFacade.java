/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.session;

import com.marketplaceMTC.entities.Adjuntos;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Miguel
 */
@Stateless
public class AdjuntosFacade extends AbstractFacade<Adjuntos> {
  @PersistenceContext(unitName = "marketplaceMTC-ejbPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public AdjuntosFacade() {
    super(Adjuntos.class);
  }
  
}
