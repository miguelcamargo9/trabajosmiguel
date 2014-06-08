/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Transacciones;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.TransaccionesFacade;
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
public class TransaccionesController {

  public TransaccionesController() {
    pagingInfo = new PagingInfo();
    converter = new TransaccionesConverter();
  }
  private Transacciones transacciones = null;
  private List<Transacciones> transaccionesItems = null;
  private TransaccionesFacade jpaController = null;
  private TransaccionesConverter converter = null;
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

  public TransaccionesFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (TransaccionesFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "transaccionesJpa");
    }
    return jpaController;
  }

  public SelectItem[] getTransaccionesItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getTransaccionesItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Transacciones getTransacciones() {
    if (transacciones == null) {
      transacciones = (Transacciones) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTransacciones", converter, null);
    }
    if (transacciones == null) {
      transacciones = new Transacciones();
    }
    return transacciones;
  }

  public String listSetup() {
    reset(true);
    return "transacciones_list";
  }

  public String createSetup() {
    reset(false);
    transacciones = new Transacciones();
    return "transacciones_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(transacciones);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Transacciones was successfully created.");
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
    return scalarSetup("transacciones_detail");
  }

  public String editSetup() {
    return scalarSetup("transacciones_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    transacciones = (Transacciones) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTransacciones", converter, null);
    if (transacciones == null) {
      String requestTransaccionesString = JsfUtil.getRequestParameter("jsfcrud.currentTransacciones");
      JsfUtil.addErrorMessage("The transacciones with id " + requestTransaccionesString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String transaccionesString = converter.getAsString(FacesContext.getCurrentInstance(), null, transacciones);
    String currentTransaccionesString = JsfUtil.getRequestParameter("jsfcrud.currentTransacciones");
    if (transaccionesString == null || transaccionesString.length() == 0 || !transaccionesString.equals(currentTransaccionesString)) {
      String outcome = editSetup();
      if ("transacciones_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit transacciones. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(transacciones);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Transacciones was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentTransacciones");
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
        JsfUtil.addSuccessMessage("Transacciones was successfully deleted.");
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

  public List<Transacciones> getTransaccionesItems() {
    if (transaccionesItems == null) {
      getPagingInfo();
      transaccionesItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return transaccionesItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "transacciones_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "transacciones_list";
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
    transacciones = null;
    transaccionesItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Transacciones newTransacciones = new Transacciones();
    String newTransaccionesString = converter.getAsString(FacesContext.getCurrentInstance(), null, newTransacciones);
    String transaccionesString = converter.getAsString(FacesContext.getCurrentInstance(), null, transacciones);
    if (!newTransaccionesString.equals(transaccionesString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
