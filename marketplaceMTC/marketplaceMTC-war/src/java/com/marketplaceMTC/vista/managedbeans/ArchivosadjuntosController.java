/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Archivosadjuntos;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.ArchivosadjuntosFacade;
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
public class ArchivosadjuntosController {

  public ArchivosadjuntosController() {
    pagingInfo = new PagingInfo();
    converter = new ArchivosadjuntosConverter();
  }
  private Archivosadjuntos archivosadjuntos = null;
  private List<Archivosadjuntos> archivosadjuntosItems = null;
  private ArchivosadjuntosFacade jpaController = null;
  private ArchivosadjuntosConverter converter = null;
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

  public ArchivosadjuntosFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (ArchivosadjuntosFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "archivosadjuntosJpa");
    }
    return jpaController;
  }

  public SelectItem[] getArchivosadjuntosItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getArchivosadjuntosItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Archivosadjuntos getArchivosadjuntos() {
    if (archivosadjuntos == null) {
      archivosadjuntos = (Archivosadjuntos) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentArchivosadjuntos", converter, null);
    }
    if (archivosadjuntos == null) {
      archivosadjuntos = new Archivosadjuntos();
    }
    return archivosadjuntos;
  }

  public String listSetup() {
    reset(true);
    return "archivosadjuntos_list";
  }

  public String createSetup() {
    reset(false);
    archivosadjuntos = new Archivosadjuntos();
    return "archivosadjuntos_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(archivosadjuntos);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Archivosadjuntos was successfully created.");
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
    return scalarSetup("archivosadjuntos_detail");
  }

  public String editSetup() {
    return scalarSetup("archivosadjuntos_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    archivosadjuntos = (Archivosadjuntos) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentArchivosadjuntos", converter, null);
    if (archivosadjuntos == null) {
      String requestArchivosadjuntosString = JsfUtil.getRequestParameter("jsfcrud.currentArchivosadjuntos");
      JsfUtil.addErrorMessage("The archivosadjuntos with id " + requestArchivosadjuntosString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String archivosadjuntosString = converter.getAsString(FacesContext.getCurrentInstance(), null, archivosadjuntos);
    String currentArchivosadjuntosString = JsfUtil.getRequestParameter("jsfcrud.currentArchivosadjuntos");
    if (archivosadjuntosString == null || archivosadjuntosString.length() == 0 || !archivosadjuntosString.equals(currentArchivosadjuntosString)) {
      String outcome = editSetup();
      if ("archivosadjuntos_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit archivosadjuntos. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(archivosadjuntos);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Archivosadjuntos was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentArchivosadjuntos");
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
        JsfUtil.addSuccessMessage("Archivosadjuntos was successfully deleted.");
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

  public List<Archivosadjuntos> getArchivosadjuntosItems() {
    if (archivosadjuntosItems == null) {
      getPagingInfo();
      archivosadjuntosItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return archivosadjuntosItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "archivosadjuntos_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "archivosadjuntos_list";
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
    archivosadjuntos = null;
    archivosadjuntosItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Archivosadjuntos newArchivosadjuntos = new Archivosadjuntos();
    String newArchivosadjuntosString = converter.getAsString(FacesContext.getCurrentInstance(), null, newArchivosadjuntos);
    String archivosadjuntosString = converter.getAsString(FacesContext.getCurrentInstance(), null, archivosadjuntos);
    if (!newArchivosadjuntosString.equals(archivosadjuntosString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
