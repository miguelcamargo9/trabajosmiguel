/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.session;

import com.marketplaceMTC.entities.Paquetesdeservicios;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Miguel
 */
@Stateless
public class PaquetesdeserviciosFacade extends AbstractFacade<Paquetesdeservicios> {
  @PersistenceContext(unitName = "marketplaceMTC-ejbPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public PaquetesdeserviciosFacade() {
    super(Paquetesdeservicios.class);
  }
  
}
