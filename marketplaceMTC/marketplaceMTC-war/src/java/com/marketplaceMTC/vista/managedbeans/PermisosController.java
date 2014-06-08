/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Permisos;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.PermisosFacade;
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
public class PermisosController {

  public PermisosController() {
    pagingInfo = new PagingInfo();
    converter = new PermisosConverter();
  }
  private Permisos permisos = null;
  private List<Permisos> permisosItems = null;
  private PermisosFacade jpaController = null;
  private PermisosConverter converter = null;
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

  public PermisosFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (PermisosFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "permisosJpa");
    }
    return jpaController;
  }

  public SelectItem[] getPermisosItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getPermisosItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Permisos getPermisos() {
    if (permisos == null) {
      permisos = (Permisos) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPermisos", converter, null);
    }
    if (permisos == null) {
      permisos = new Permisos();
    }
    return permisos;
  }

  public String listSetup() {
    reset(true);
    return "permisos_list";
  }

  public String createSetup() {
    reset(false);
    permisos = new Permisos();
    return "permisos_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(permisos);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Permisos was successfully created.");
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
    return scalarSetup("permisos_detail");
  }

  public String editSetup() {
    return scalarSetup("permisos_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    permisos = (Permisos) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPermisos", converter, null);
    if (permisos == null) {
      String requestPermisosString = JsfUtil.getRequestParameter("jsfcrud.currentPermisos");
      JsfUtil.addErrorMessage("The permisos with id " + requestPermisosString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String permisosString = converter.getAsString(FacesContext.getCurrentInstance(), null, permisos);
    String currentPermisosString = JsfUtil.getRequestParameter("jsfcrud.currentPermisos");
    if (permisosString == null || permisosString.length() == 0 || !permisosString.equals(currentPermisosString)) {
      String outcome = editSetup();
      if ("permisos_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit permisos. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(permisos);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Permisos was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPermisos");
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
        JsfUtil.addSuccessMessage("Permisos was successfully deleted.");
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

  public List<Permisos> getPermisosItems() {
    if (permisosItems == null) {
      getPagingInfo();
      permisosItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return permisosItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "permisos_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "permisos_list";
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
    permisos = null;
    permisosItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Permisos newPermisos = new Permisos();
    String newPermisosString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPermisos);
    String permisosString = converter.getAsString(FacesContext.getCurrentInstance(), null, permisos);
    if (!newPermisosString.equals(permisosString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
