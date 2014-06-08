/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.session;

import com.marketplaceMTC.entities.Categorias;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Miguel
 */
@Stateless
public class CategoriasFacade extends AbstractFacade<Categorias> {
  @PersistenceContext(unitName = "marketplaceMTC-warPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public CategoriasFacade() {
    super(Categorias.class);
  }
  
}
