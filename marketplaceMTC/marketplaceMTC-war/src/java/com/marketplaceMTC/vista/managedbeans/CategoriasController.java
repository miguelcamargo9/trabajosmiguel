/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Categorias;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.marketplaceMTC.vista.managedbeans.util.JsfUtil;
import com.marketplaceMTC.vista.managedbeans.util.PagingInfo;
import com.marketplaceMTC.session.CategoriasFacade;
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
public class CategoriasController {

  public CategoriasController() {
    pagingInfo = new PagingInfo();
    converter = new CategoriasConverter();
  }
  private Categorias categorias = null;
  private List<Categorias> categoriasItems = null;
  private CategoriasFacade jpaController = null;
  private CategoriasConverter converter = null;
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

  public CategoriasFacade getJpaController() {
    if (jpaController == null) {
      FacesContext facesContext = FacesContext.getCurrentInstance();
      jpaController = (CategoriasFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "categoriasJpa");
    }
    return jpaController;
  }

  public SelectItem[] getCategoriasItemsAvailableSelectMany() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), false);
  }

  public SelectItem[] getCategoriasItemsAvailableSelectOne() {
    return JsfUtil.getSelectItems(getJpaController().findAll(), true);
  }

  public Categorias getCategorias() {
    if (categorias == null) {
      categorias = (Categorias) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentCategorias", converter, null);
    }
    if (categorias == null) {
      categorias = new Categorias();
    }
    return categorias;
  }

  public String listSetup() {
    reset(true);
    return "categorias_list";
  }

  public String createSetup() {
    reset(false);
    categorias = new Categorias();
    return "categorias_create";
  }

  public String create() {
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().create(categorias);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Categorias was successfully created.");
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
    return scalarSetup("categorias_detail");
  }

  public String editSetup() {
    return scalarSetup("categorias_edit");
  }

  private String scalarSetup(String destination) {
    reset(false);
    categorias = (Categorias) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentCategorias", converter, null);
    if (categorias == null) {
      String requestCategoriasString = JsfUtil.getRequestParameter("jsfcrud.currentCategorias");
      JsfUtil.addErrorMessage("The categorias with id " + requestCategoriasString + " no longer exists.");
      return relatedOrListOutcome();
    }
    return destination;
  }

  public String edit() {
    String categoriasString = converter.getAsString(FacesContext.getCurrentInstance(), null, categorias);
    String currentCategoriasString = JsfUtil.getRequestParameter("jsfcrud.currentCategorias");
    if (categoriasString == null || categoriasString.length() == 0 || !categoriasString.equals(currentCategoriasString)) {
      String outcome = editSetup();
      if ("categorias_edit".equals(outcome)) {
        JsfUtil.addErrorMessage("Could not edit categorias. Try again.");
      }
      return outcome;
    }
    try {
      utx.begin();
    } catch (Exception ex) {
    }
    try {
      Exception transactionException = null;
      getJpaController().edit(categorias);
      try {
        utx.commit();
      } catch (javax.transaction.RollbackException ex) {
        transactionException = ex;
      } catch (Exception ex) {
      }
      if (transactionException == null) {
        JsfUtil.addSuccessMessage("Categorias was successfully updated.");
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
    String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentCategorias");
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
        JsfUtil.addSuccessMessage("Categorias was successfully deleted.");
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

  public List<Categorias> getCategoriasItems() {
    if (categoriasItems == null) {
      getPagingInfo();
      categoriasItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
    }
    return categoriasItems;
  }

  public String next() {
    reset(false);
    getPagingInfo().nextPage();
    return "categorias_list";
  }

  public String prev() {
    reset(false);
    getPagingInfo().previousPage();
    return "categorias_list";
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
    categorias = null;
    categoriasItems = null;
    pagingInfo.setItemCount(-1);
    if (resetFirstItem) {
      pagingInfo.setFirstItem(0);
    }
  }

  public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
    Categorias newCategorias = new Categorias();
    String newCategoriasString = converter.getAsString(FacesContext.getCurrentInstance(), null, newCategorias);
    String categoriasString = converter.getAsString(FacesContext.getCurrentInstance(), null, categorias);
    if (!newCategoriasString.equals(categoriasString)) {
      createSetup();
    }
  }

  public Converter getConverter() {
    return converter;
  }
  
}
