/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.marketplaceMTC.vista.managedbeans;

import com.marketplaceMTC.entities.Ofertas;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

/**
 *
 * @author Miguel
 */
public class OfertasConverter implements Converter {

  public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
    if (string == null || string.length() == 0) {
      return null;
    }
    Integer id = new Integer(string);
    OfertasController controller = (OfertasController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "ofertas");
    return controller.getJpaController().find(id);
  }

  public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
    if (object == null) {
      return null;
    }
    if (object instanceof Ofertas) {
      Ofertas o = (Ofertas) object;
      return o.getId() == null ? "" : o.getId().toString();
    } else {
      throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: com.marketplaceMTC.entities.Ofertas");
    }
  }
  
}
