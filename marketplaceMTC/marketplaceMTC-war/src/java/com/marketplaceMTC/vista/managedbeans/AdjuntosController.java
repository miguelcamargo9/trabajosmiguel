/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Adjuntos;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.AdjuntosFacade;
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
public class AdjuntosController {

  public AdjuntosController() {
    pagingInfo = new PagingInfo();
    converter = new AdjuntosConverter();
  }
  private Adjuntos adjuntos = null;
  private List<Adjuntos> adjuntosItems = null;
  private AdjuntosFacade jpaController = null;
  private AdjuntosConverter converter = null;
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

  public AdjuntosFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (AdjuntosFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "adjuntosJpa");
    }
    return jpaController;
  }

  public SelectItem[] getAdjuntosItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getAdjuntosItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Adjuntos getAdjuntos() {
    if (adjuntos == null) {
      adjuntos = (Adjuntos) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAdjuntos", converter, null);
    }
    if (adjuntos == null) {
      adjuntos = new Adjuntos();
    }
    return adjuntos;
  }

  public String listSetup() {
    reset(true);
    return "adjuntos_list";
  }

  public String createSetup() {
    reset(false);
    adjuntos = new Adjuntos();
    return "adjuntos_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(adjuntos);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Adjuntos was successfully created.");
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
    return scalarSetup("adjuntos_detail");
  }

  public String editSetup() {
    return scalarSetup("adjuntos_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    adjuntos = (Adjuntos) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAdjuntos", converter, null);
    if (adjuntos == null) {
      String requestAdjuntosString = JsfUtil.getRequestParameter("jsfcrud.currentAdjuntos");
      JsfUtil.addErrorMessage("The adjuntos with id " + requestAdjuntosString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String adjuntosString = converter.getAsString(FacesContext.getCurrentInstance(), null, adjuntos);
    String currentAdjuntosString = JsfUtil.getRequestParameter("jsfcrud.currentAdjuntos");
    if (adjuntosString == null || adjuntosString.length() == 0 || !adjuntosString.equals(currentAdjuntosString)) {
      String outcome = editSetup();
      if ("adjuntos_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit adjuntos. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(adjuntos);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Adjuntos was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentAdjuntos");
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
        JsfUtil.addSuccessMessage("Adjuntos was successfully deleted.");
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

  public List<Adjuntos> getAdjuntosItems() {
    if (adjuntosItems == null) {
      getPagingInfo();
      adjuntosItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return adjuntosItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "adjuntos_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "adjuntos_list";
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
    adjuntos = null;
    adjuntosItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Adjuntos newAdjuntos = new Adjuntos();
    String newAdjuntosString = converter.getAsString(FacesContext.getCurrentInstance(), null, newAdjuntos);
    String adjuntosString = converter.getAsString(FacesContext.getCurrentInstance(), null, adjuntos);
    if (!newAdjuntosString.equals(adjuntosString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
