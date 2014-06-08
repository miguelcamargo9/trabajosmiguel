/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Perfiles;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.PerfilesFacade;
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
public class PerfilesController {

  public PerfilesController() {
    pagingInfo = new PagingInfo();
    converter = new PerfilesConverter();
  }
  private Perfiles perfiles = null;
  private List<Perfiles> perfilesItems = null;
  private PerfilesFacade jpaController = null;
  private PerfilesConverter converter = null;
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

  public PerfilesFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (PerfilesFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "perfilesJpa");
    }
    return jpaController;
  }

  public SelectItem[] getPerfilesItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getPerfilesItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Perfiles getPerfiles() {
    if (perfiles == null) {
      perfiles = (Perfiles) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPerfiles", converter, null);
    }
    if (perfiles == null) {
      perfiles = new Perfiles();
    }
    return perfiles;
  }

  public String listSetup() {
    reset(true);
    return "perfiles_list";
  }

  public String createSetup() {
    reset(false);
    perfiles = new Perfiles();
    return "perfiles_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(perfiles);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Perfiles was successfully created.");
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
    return scalarSetup("perfiles_detail");
  }

  public String editSetup() {
    return scalarSetup("perfiles_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    perfiles = (Perfiles) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPerfiles", converter, null);
    if (perfiles == null) {
      String requestPerfilesString = JsfUtil.getRequestParameter("jsfcrud.currentPerfiles");
      JsfUtil.addErrorMessage("The perfiles with id " + requestPerfilesString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String perfilesString = converter.getAsString(FacesContext.getCurrentInstance(), null, perfiles);
    String currentPerfilesString = JsfUtil.getRequestParameter("jsfcrud.currentPerfiles");
    if (perfilesString == null || perfilesString.length() == 0 || !perfilesString.equals(currentPerfilesString)) {
      String outcome = editSetup();
      if ("perfiles_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit perfiles. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(perfiles);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Perfiles was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPerfiles");
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
        JsfUtil.addSuccessMessage("Perfiles was successfully deleted.");
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

  public List<Perfiles> getPerfilesItems() {
    if (perfilesItems == null) {
      getPagingInfo();
      perfilesItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return perfilesItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "perfiles_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "perfiles_list";
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
    perfiles = null;
    perfilesItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Perfiles newPerfiles = new Perfiles();
    String newPerfilesString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPerfiles);
    String perfilesString = converter.getAsString(FacesContext.getCurrentInstance(), null, perfiles);
    if (!newPerfilesString.equals(perfilesString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
