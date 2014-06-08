<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>New Perfiles</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>New Perfiles</h1>
    <h:form>
      <h:inputHidden id="validateCreateField" validator="#{perfiles.validateCreate}" value="value"/>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:inputText id="id" value="#{perfiles.perfiles.id}" title="Id" required="true" requiredMessage="The id field is required." />
        <h:outputText value="Descripcion:"/>
        <h:inputText id="descripcion" value="#{perfiles.perfiles.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
        <h:outputText value="Estado:"/>
        <h:inputText id="estado" value="#{perfiles.perfiles.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
        <h:outputText value="PermisosList:"/>
        <h:selectManyListbox id="permisosList" value="#{perfiles.perfiles.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].permisosList}" title="PermisosList" size="6" converter="#{permisos.converter}" >
          <f:selectItems value="#{permisos.permisosItemsAvailableSelectMany}"/>
        </h:selectManyListbox>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{perfiles.create}" value="Create"/>
      <br />
      <br />
      <h:commandLink action="#{perfiles.listSetup}" value="Show All Perfiles Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
