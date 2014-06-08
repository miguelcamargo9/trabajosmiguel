/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Servicios;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.ServiciosFacade;
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
public class ServiciosController {

  public ServiciosController() {
    pagingInfo = new PagingInfo();
    converter = new ServiciosConverter();
  }
  private Servicios servicios = null;
  private List<Servicios> serviciosItems = null;
  private ServiciosFacade jpaController = null;
  private ServiciosConverter converter = null;
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

  public ServiciosFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (ServiciosFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "serviciosJpa");
    }
    return jpaController;
  }

  public SelectItem[] getServiciosItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getServiciosItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Servicios getServicios() {
    if (servicios == null) {
      servicios = (Servicios) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentServicios", converter, null);
    }
    if (servicios == null) {
      servicios = new Servicios();
    }
    return servicios;
  }

  public String listSetup() {
    reset(true);
    return "servicios_list";
  }

  public String createSetup() {
    reset(false);
    servicios = new Servicios();
    return "servicios_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(servicios);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Servicios was successfully created.");
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
    return scalarSetup("servicios_detail");
  }

  public String editSetup() {
    return scalarSetup("servicios_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    servicios = (Servicios) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentServicios", converter, null);
    if (servicios == null) {
      String requestServiciosString = JsfUtil.getRequestParameter("jsfcrud.currentServicios");
      JsfUtil.addErrorMessage("The servicios with id " + requestServiciosString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String serviciosString = converter.getAsString(FacesContext.getCurrentInstance(), null, servicios);
    String currentServiciosString = JsfUtil.getRequestParameter("jsfcrud.currentServicios");
    if (serviciosString == null || serviciosString.length() == 0 || !serviciosString.equals(currentServiciosString)) {
      String outcome = editSetup();
      if ("servicios_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit servicios. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(servicios);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Servicios was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentServicios");
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
        JsfUtil.addSuccessMessage("Servicios was successfully deleted.");
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

  public List<Servicios> getServiciosItems() {
    if (serviciosItems == null) {
      getPagingInfo();
      serviciosItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return serviciosItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "servicios_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "servicios_list";
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
    servicios = null;
    serviciosItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Servicios newServicios = new Servicios();
    String newServiciosString = converter.getAsString(FacesContext.getCurrentInstance(), null, newServicios);
    String serviciosString = converter.getAsString(FacesContext.getCurrentInstance(), null, servicios);
    if (!newServiciosString.equals(serviciosString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
