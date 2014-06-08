/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Paquetesdeservicios;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.PaquetesdeserviciosFacade;
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
public class PaquetesdeserviciosController {

  public PaquetesdeserviciosController() {
    pagingInfo = new PagingInfo();
    converter = new PaquetesdeserviciosConverter();
  }
  private Paquetesdeservicios paquetesdeservicios = null;
  private List<Paquetesdeservicios> paquetesdeserviciosItems = null;
  private PaquetesdeserviciosFacade jpaController = null;
  private PaquetesdeserviciosConverter converter = null;
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

  public PaquetesdeserviciosFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (PaquetesdeserviciosFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "paquetesdeserviciosJpa");
    }
    return jpaController;
  }

  public SelectItem[] getPaquetesdeserviciosItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getPaquetesdeserviciosItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Paquetesdeservicios getPaquetesdeservicios() {
    if (paquetesdeservicios == null) {
      paquetesdeservicios = (Paquetesdeservicios) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPaquetesdeservicios", converter, null);
    }
    if (paquetesdeservicios == null) {
      paquetesdeservicios = new Paquetesdeservicios();
    }
    return paquetesdeservicios;
  }

  public String listSetup() {
    reset(true);
    return "paquetesdeservicios_list";
  }

  public String createSetup() {
    reset(false);
    paquetesdeservicios = new Paquetesdeservicios();
    return "paquetesdeservicios_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(paquetesdeservicios);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Paquetesdeservicios was successfully created.");
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
    return scalarSetup("paquetesdeservicios_detail");
  }

  public String editSetup() {
    return scalarSetup("paquetesdeservicios_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    paquetesdeservicios = (Paquetesdeservicios) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPaquetesdeservicios", converter, null);
    if (paquetesdeservicios == null) {
      String requestPaquetesdeserviciosString = JsfUtil.getRequestParameter("jsfcrud.currentPaquetesdeservicios");
      JsfUtil.addErrorMessage("The paquetesdeservicios with id " + requestPaquetesdeserviciosString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String paquetesdeserviciosString = converter.getAsString(FacesContext.getCurrentInstance(), null, paquetesdeservicios);
    String currentPaquetesdeserviciosString = JsfUtil.getRequestParameter("jsfcrud.currentPaquetesdeservicios");
    if (paquetesdeserviciosString == null || paquetesdeserviciosString.length() == 0 || !paquetesdeserviciosString.equals(currentPaquetesdeserviciosString)) {
      String outcome = editSetup();
      if ("paquetesdeservicios_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit paquetesdeservicios. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(paquetesdeservicios);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Paquetesdeservicios was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPaquetesdeservicios");
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
        JsfUtil.addSuccessMessage("Paquetesdeservicios was successfully deleted.");
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

  public List<Paquetesdeservicios> getPaquetesdeserviciosItems() {
    if (paquetesdeserviciosItems == null) {
      getPagingInfo();
      paquetesdeserviciosItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return paquetesdeserviciosItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "paquetesdeservicios_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "paquetesdeservicios_list";
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
    paquetesdeservicios = null;
    paquetesdeserviciosItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Paquetesdeservicios newPaquetesdeservicios = new Paquetesdeservicios();
    String newPaquetesdeserviciosString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPaquetesdeservicios);
    String paquetesdeserviciosString = converter.getAsString(FacesContext.getCurrentInstance(), null, paquetesdeservicios);
    if (!newPaquetesdeserviciosString.equals(paquetesdeserviciosString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
