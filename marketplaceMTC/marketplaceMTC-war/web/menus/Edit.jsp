<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Editing Menus</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Editing Menus</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{menus.menus.id}" title="Id" />
        <h:outputText value="IdPadre:"/>
        <h:inputText id="idPadre" value="#{menus.menus.idPadre}" title="IdPadre" />
        <h:outputText value="Descripcion:"/>
        <h:inputText id="descripcion" value="#{menus.menus.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
        <h:outputText value="Enlace:"/>
        <h:inputText id="enlace" value="#{menus.menus.enlace}" title="Enlace" required="true" requiredMessage="The enlace field is required." />
        <h:outputText value="Estado:"/>
        <h:inputText id="estado" value="#{menus.menus.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />

      </h:panelGrid>
      <br />
      <h:commandLink action="#{menus.edit}" value="Save">
        <f:param name="jsfcrud.currentMenus" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][menus.menus][menus.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{menus.detailSetup}" value="Show" immediate="true">
        <f:param name="jsfcrud.currentMenus" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][menus.menus][menus.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <h:commandLink action="#{menus.listSetup}" value="Show All Menus Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
