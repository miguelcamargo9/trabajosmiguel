/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Paquetes;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.PaquetesFacade;
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
public class PaquetesController {

  public PaquetesController() {
    pagingInfo = new PagingInfo();
    converter = new PaquetesConverter();
  }
  private Paquetes paquetes = null;
  private List<Paquetes> paquetesItems = null;
  private PaquetesFacade jpaController = null;
  private PaquetesConverter converter = null;
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

  public PaquetesFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (PaquetesFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "paquetesJpa");
    }
    return jpaController;
  }

  public SelectItem[] getPaquetesItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getPaquetesItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Paquetes getPaquetes() {
    if (paquetes == null) {
      paquetes = (Paquetes) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPaquetes", converter, null);
    }
    if (paquetes == null) {
      paquetes = new Paquetes();
    }
    return paquetes;
  }

  public String listSetup() {
    reset(true);
    return "paquetes_list";
  }

  public String createSetup() {
    reset(false);
    paquetes = new Paquetes();
    return "paquetes_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(paquetes);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Paquetes was successfully created.");
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
    return scalarSetup("paquetes_detail");
  }

  public String editSetup() {
    return scalarSetup("paquetes_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    paquetes = (Paquetes) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPaquetes", converter, null);
    if (paquetes == null) {
      String requestPaquetesString = JsfUtil.getRequestParameter("jsfcrud.currentPaquetes");
      JsfUtil.addErrorMessage("The paquetes with id " + requestPaquetesString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String paquetesString = converter.getAsString(FacesContext.getCurrentInstance(), null, paquetes);
    String currentPaquetesString = JsfUtil.getRequestParameter("jsfcrud.currentPaquetes");
    if (paquetesString == null || paquetesString.length() == 0 || !paquetesString.equals(currentPaquetesString)) {
      String outcome = editSetup();
      if ("paquetes_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit paquetes. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(paquetes);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Paquetes was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPaquetes");
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
        JsfUtil.addSuccessMessage("Paquetes was successfully deleted.");
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

  public List<Paquetes> getPaquetesItems() {
    if (paquetesItems == null) {
      getPagingInfo();
      paquetesItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return paquetesItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "paquetes_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "paquetes_list";
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
    paquetes = null;
    paquetesItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Paquetes newPaquetes = new Paquetes();
    String newPaquetesString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPaquetes);
    String paquetesString = converter.getAsString(FacesContext.getCurrentInstance(), null, paquetes);
    if (!newPaquetesString.equals(paquetesString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
