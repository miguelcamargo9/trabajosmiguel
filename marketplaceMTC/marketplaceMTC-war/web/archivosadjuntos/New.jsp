<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>New Archivosadjuntos</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>New Archivosadjuntos</h1>
    <h:form>
      <h:inputHidden id="validateCreateField" validator="#{archivosadjuntos.validateCreate}" value="value"/>
      <h:panelGrid columns="2">
        <h:outputText value="IdArchivo:"/>
        <h:selectOneMenu id="idArchivo" value="#{archivosadjuntos.archivosadjuntos.idArchivo}" title="IdArchivo" required="true" requiredMessage="The idArchivo field is required." >
          <f:selectItems value="#{archivos.archivosItemsAvailableSelectOne}"/>
        </h:selectOneMenu>
        <h:outputText value="IdAdjunto:"/>
        <h:selectOneMenu id="idAdjunto" value="#{archivosadjuntos.archivosadjuntos.idAdjunto}" title="IdAdjunto" required="true" requiredMessage="The idAdjunto field is required." >
          <f:selectItems value="#{adjuntos.adjuntosItemsAvailableSelectOne}"/>
        </h:selectOneMenu>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{archivosadjuntos.create}" value="Create"/>
      <br />
      <br />
      <h:commandLink action="#{archivosadjuntos.listSetup}" value="Show All Archivosadjuntos Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
