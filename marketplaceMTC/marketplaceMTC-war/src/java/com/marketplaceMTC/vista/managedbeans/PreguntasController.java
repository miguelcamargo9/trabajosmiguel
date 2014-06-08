/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Preguntas;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.PreguntasFacade;
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
public class PreguntasController {

  public PreguntasController() {
    pagingInfo = new PagingInfo();
    converter = new PreguntasConverter();
  }
  private Preguntas preguntas = null;
  private List<Preguntas> preguntasItems = null;
  private PreguntasFacade jpaController = null;
  private PreguntasConverter converter = null;
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

  public PreguntasFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (PreguntasFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "preguntasJpa");
    }
    return jpaController;
  }

  public SelectItem[] getPreguntasItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getPreguntasItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Preguntas getPreguntas() {
    if (preguntas == null) {
      preguntas = (Preguntas) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPreguntas", converter, null);
    }
    if (preguntas == null) {
      preguntas = new Preguntas();
    }
    return preguntas;
  }

  public String listSetup() {
    reset(true);
    return "preguntas_list";
  }

  public String createSetup() {
    reset(false);
    preguntas = new Preguntas();
    return "preguntas_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(preguntas);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Preguntas was successfully created.");
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
    return scalarSetup("preguntas_detail");
  }

  public String editSetup() {
    return scalarSetup("preguntas_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    preguntas = (Preguntas) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPreguntas", converter, null);
    if (preguntas == null) {
      String requestPreguntasString = JsfUtil.getRequestParameter("jsfcrud.currentPreguntas");
      JsfUtil.addErrorMessage("The preguntas with id " + requestPreguntasString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String preguntasString = converter.getAsString(FacesContext.getCurrentInstance(), null, preguntas);
    String currentPreguntasString = JsfUtil.getRequestParameter("jsfcrud.currentPreguntas");
    if (preguntasString == null || preguntasString.length() == 0 || !preguntasString.equals(currentPreguntasString)) {
      String outcome = editSetup();
      if ("preguntas_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit preguntas. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(preguntas);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Preguntas was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPreguntas");
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
        JsfUtil.addSuccessMessage("Preguntas was successfully deleted.");
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

  public List<Preguntas> getPreguntasItems() {
    if (preguntasItems == null) {
      getPagingInfo();
      preguntasItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return preguntasItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "preguntas_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "preguntas_list";
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
    preguntas = null;
    preguntasItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Preguntas newPreguntas = new Preguntas();
    String newPreguntasString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPreguntas);
    String preguntasString = converter.getAsString(FacesContext.getCurrentInstance(), null, preguntas);
    if (!newPreguntasString.equals(preguntasString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
