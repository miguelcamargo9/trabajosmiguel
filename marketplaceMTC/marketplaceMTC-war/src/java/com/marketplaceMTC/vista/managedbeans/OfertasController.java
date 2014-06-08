/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Ofertas;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.OfertasFacade;
import java.util.List;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author Miguel
 */
public class OfertasController {

  public OfertasController() {
    pagingInfo = new PagingInfo();
    converter = new OfertasConverter();
  }
  private Ofertas ofertas = null;
  private List<Ofertas> ofertasItems = null;
  private OfertasFacade jpaController = null;
  private OfertasConverter converter = null;
  private PagingInfo pagingInfo = null;
  @Resource
  private UserTransaction utx = null;
  @PersistenceUnit(unitName = "marketplaceMTC-warPU")
  private EntityManagerFactory emf = null;

  public PagingInfo getPagingInfo() {
    if (pagingInfo.getItemCount() == -1) {
      pagingInfo.setItemCount(getJpaController().count());
    }
    return pagingInfo;
  }

  public OfertasFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (OfertasFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "ofertasJpa");
    }
    return jpaController;
  }

  public SelectItem[] getOfertasItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getOfertasItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Ofertas getOfertas() {
    if (ofertas == null) {
      ofertas = (Ofertas) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentOfertas", converter, null);
    }
    if (ofertas == null) {
      ofertas = new Ofertas();
    }
    return ofertas;
  }

  public String listSetup() {
    reset(true);
    return "ofertas_list";
  }

  public String createSetup() {
    reset(false);
    ofertas = new Ofertas();
    return "ofertas_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(ofertas);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Ofertas was successfully created.");
      } else {
        JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
      }
    } catch (Exception e) {
      try {
        utx.rollback();
      } catch (Exception ex) {
      }
      JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
      return null;
    }
    return listSetup();
  }

  public String detailSetup() {
    return scalarSetup("ofertas_detail");
  }

  public String editSetup() {
    return scalarSetup("ofertas_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    ofertas = (Ofertas) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentOfertas", converter, null);
    if (ofertas == null) {
      String requestOfertasString = JsfUtil.getRequestParameter("jsfcrud.currentOfertas");
      JsfUtil.addErrorMessage("The ofertas with id " + requestOfertasString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String ofertasString = converter.getAsString(FacesContext.getCurrentInstance(), null, ofertas);
    String currentOfertasString = JsfUtil.getRequestParameter("jsfcrud.currentOfertas");
    if (ofertasString == null || ofertasString.length() == 0 || !ofertasString.equals(currentOfertasString)) {
      String outcome = editSetup();
      if ("ofertas_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit ofertas. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(ofertas);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Ofertas was successfully updated.");
      } else {
        JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
      }
    } catch (Exception e) {
      try {
        utx.rollback();
      } catch (Exception ex) {
      }
      JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
      return null;
    }
    return detailSetup();
  }

  public String remove() {
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentOfertas");
    Integer id = new Integer(idAsString);
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().remove(getJpaController().find(id));
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Ofertas was successfully deleted.");
      } else {
        JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
      }
    } catch (Exception e) {
      try {
        utx.rollback();
      } catch (Exception ex) {
      }
      JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
      return null;
    }
    return relatedOrListOutcome();
  }

  private String relatedOrListOutcome() {
    String relatedControllerOutcome = relatedControllerOutcome();
    if (relatedControllerOutcome != null) {
      return relatedControllerOutcome;
    }
    return listSetup();
  }

  public List<Ofertas> getOfertasItems() {
    if (ofertasItems == null) {
      getPagingInfo();
      ofertasItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return ofertasItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "ofertas_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "ofertas_list";
  }

  private String relatedControllerOutcome() {
    String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
    String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
    if (relatedControllerString != null && relatedControllerTypeString != null) {
      FacesContext context = FacesContext.getCurrentInstance();
      Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
      try {
        Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
        Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
        return (String) detailSetupMethod.invoke(relatedController);
      } catch (ClassNotFoundException e) {
        throw new FacesException(e);
      } catch (NoSuchMethodException e) {
        throw new FacesException(e);
      } catch (IllegalAccessException e) {
        throw new FacesException(e);
      } catch (InvocationTargetException e) {
        throw new FacesException(e);
      }
    }
    return null;
  }

  private void reset(boolean resetFirstItem) {
    ofertas = null;
    ofertasItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Ofertas newOfertas = new Ofertas();
    String newOfertasString = converter.getAsString(FacesContext.getCurrentInstance(), null, newOfertas);
    String ofertasString = converter.getAsString(FacesContext.getCurrentInstance(), null, ofertas);
    if (!newOfertasString.equals(ofertasString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
