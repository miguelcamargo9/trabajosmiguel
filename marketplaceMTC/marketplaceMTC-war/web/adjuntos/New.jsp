<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>New Adjuntos</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>New Adjuntos</h1>
    <h:form>
      <h:inputHidden id="validateCreateField" validator="#{adjuntos.validateCreate}" value="value"/>
      <h:panelGrid columns="2">
        <h:outputText value="Descripcion:"/>
        <h:inputText id="descripcion" value="#{adjuntos.adjuntos.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
        <h:outputText value="ServiciosList:"/>
        <h:selectManyListbox id="serviciosList" value="#{adjuntos.adjuntos.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].serviciosList}" title="ServiciosList" size="6" converter="#{servicios.converter}" >
          <f:selectItems value="#{servicios.serviciosItemsAvailableSelectMany}"/>
        </h:selectManyListbox>
        <h:outputText value="ArchivosadjuntosList:"/>
        <h:selectManyListbox id="archivosadjuntosList" value="#{adjuntos.adjuntos.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].archivosadjuntosList}" title="ArchivosadjuntosList" size="6" converter="#{archivosadjuntos.converter}" >
          <f:selectItems value="#{archivosadjuntos.archivosadjuntosItemsAvailableSelectMany}"/>
        </h:selectManyListbox>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{adjuntos.create}" value="Create"/>
      <br />
      <br />
      <h:commandLink action="#{adjuntos.listSetup}" value="Show All Adjuntos Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>