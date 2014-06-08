/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Usuarios;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.UsuariosFacade;
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
public class UsuariosController {

  public UsuariosController() {
    pagingInfo = new PagingInfo();
    converter = new UsuariosConverter();
  }
  private Usuarios usuarios = null;
  private List<Usuarios> usuariosItems = null;
  private UsuariosFacade jpaController = null;
  private UsuariosConverter converter = null;
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

  public UsuariosFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (UsuariosFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "usuariosJpa");
    }
    return jpaController;
  }

  public SelectItem[] getUsuariosItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getUsuariosItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Usuarios getUsuarios() {
    if (usuarios == null) {
      usuarios = (Usuarios) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentUsuarios", converter, null);
    }
    if (usuarios == null) {
      usuarios = new Usuarios();
    }
    return usuarios;
  }

  public String listSetup() {
    reset(true);
    return "usuarios_list";
  }

  public String createSetup() {
    reset(false);
    usuarios = new Usuarios();
    return "usuarios_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(usuarios);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Usuarios was successfully created.");
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
    return scalarSetup("usuarios_detail");
  }

  public String editSetup() {
    return scalarSetup("usuarios_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    usuarios = (Usuarios) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentUsuarios", converter, null);
    if (usuarios == null) {
      String requestUsuariosString = JsfUtil.getRequestParameter("jsfcrud.currentUsuarios");
      JsfUtil.addErrorMessage("The usuarios with id " + requestUsuariosString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String usuariosString = converter.getAsString(FacesContext.getCurrentInstance(), null, usuarios);
    String currentUsuariosString = JsfUtil.getRequestParameter("jsfcrud.currentUsuarios");
    if (usuariosString == null || usuariosString.length() == 0 || !usuariosString.equals(currentUsuariosString)) {
      String outcome = editSetup();
      if ("usuarios_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit usuarios. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(usuarios);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Usuarios was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentUsuarios");
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
        JsfUtil.addSuccessMessage("Usuarios was successfully deleted.");
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

  public List<Usuarios> getUsuariosItems() {
    if (usuariosItems == null) {
      getPagingInfo();
      usuariosItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return usuariosItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "usuarios_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "usuarios_list";
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
    usuarios = null;
    usuariosItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Usuarios newUsuarios = new Usuarios();
    String newUsuariosString = converter.getAsString(FacesContext.getCurrentInstance(), null, newUsuarios);
    String usuariosString = converter.getAsString(FacesContext.getCurrentInstance(), null, usuarios);
    if (!newUsuariosString.equals(usuariosString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
