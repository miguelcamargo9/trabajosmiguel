<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Menus Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Menus Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{menus.menus.id}" title="Id" />
        <h:outputText value="IdPadre:"/>
        <h:outputText value="#{menus.menus.idPadre}" title="IdPadre" />
        <h:outputText value="Descripcion:"/>
        <h:outputText value="#{menus.menus.descripcion}" title="Descripcion" />
        <h:outputText value="Enlace:"/>
        <h:outputText value="#{menus.menus.enlace}" title="Enlace" />
        <h:outputText value="Estado:"/>
        <h:outputText value="#{menus.menus.estado}" title="Estado" />


      </h:panelGrid>
      <br />
      <h:commandLink action="#{menus.remove}" value="Destroy">
        <f:param name="jsfcrud.currentMenus" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][menus.menus][menus.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{menus.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentMenus" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][menus.menus][menus.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{menus.createSetup}" value="New Menus" />
      <br />
      <h:commandLink action="#{menus.listSetup}" value="Show All Menus Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
