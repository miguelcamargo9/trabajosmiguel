/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Archivos;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.ArchivosFacade;
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
public class ArchivosController {

  public ArchivosController() {
    pagingInfo = new PagingInfo();
    converter = new ArchivosConverter();
  }
  private Archivos archivos = null;
  private List<Archivos> archivosItems = null;
  private ArchivosFacade jpaController = null;
  private ArchivosConverter converter = null;
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

  public ArchivosFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (ArchivosFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "archivosJpa");
    }
    return jpaController;
  }

  public SelectItem[] getArchivosItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getArchivosItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Archivos getArchivos() {
    if (archivos == null) {
      archivos = (Archivos) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentArchivos", converter, null);
    }
    if (archivos == null) {
      archivos = new Archivos();
    }
    return archivos;
  }

  public String listSetup() {
    reset(true);
    return "archivos_list";
  }

  public String createSetup() {
    reset(false);
    archivos = new Archivos();
    return "archivos_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(archivos);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Archivos was successfully created.");
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
    return scalarSetup("archivos_detail");
  }

  public String editSetup() {
    return scalarSetup("archivos_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    archivos = (Archivos) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentArchivos", converter, null);
    if (archivos == null) {
      String requestArchivosString = JsfUtil.getRequestParameter("jsfcrud.currentArchivos");
      JsfUtil.addErrorMessage("The archivos with id " + requestArchivosString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String archivosString = converter.getAsString(FacesContext.getCurrentInstance(), null, archivos);
    String currentArchivosString = JsfUtil.getRequestParameter("jsfcrud.currentArchivos");
    if (archivosString == null || archivosString.length() == 0 || !archivosString.equals(currentArchivosString)) {
      String outcome = editSetup();
      if ("archivos_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit archivos. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(archivos);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Archivos was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentArchivos");
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
        JsfUtil.addSuccessMessage("Archivos was successfully deleted.");
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

  public List<Archivos> getArchivosItems() {
    if (archivosItems == null) {
      getPagingInfo();
      archivosItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return archivosItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "archivos_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "archivos_list";
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
    archivos = null;
    archivosItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Archivos newArchivos = new Archivos();
    String newArchivosString = converter.getAsString(FacesContext.getCurrentInstance(), null, newArchivos);
    String archivosString = converter.getAsString(FacesContext.getCurrentInstance(), null, archivos);
    if (!newArchivosString.equals(archivosString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
