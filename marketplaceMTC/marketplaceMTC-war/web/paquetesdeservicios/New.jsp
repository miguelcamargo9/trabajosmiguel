<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>New Paquetesdeservicios</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>New Paquetesdeservicios</h1>
    <h:form>
      <h:inputHidden id="validateCreateField" validator="#{paquetesdeservicios.validateCreate}" value="value"/>
      <h:panelGrid columns="2">
        <h:outputText value="Estado:"/>
        <h:inputText id="estado" value="#{paquetesdeservicios.paquetesdeservicios.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
        <h:outputText value="IdServicio:"/>
        <h:selectOneMenu id="idServicio" value="#{paquetesdeservicios.paquetesdeservicios.idServicio}" title="IdServicio" required="true" requiredMessage="The idServicio field is required." >
          <f:selectItems value="#{servicios.serviciosItemsAvailableSelectOne}"/>
        </h:selectOneMenu>
        <h:outputText value="IdPaquete:"/>
        <h:selectOneMenu id="idPaquete" value="#{paquetesdeservicios.paquetesdeservicios.idPaquete}" title="IdPaquete" required="true" requiredMessage="The idPaquete field is required." >
          <f:selectItems value="#{paquetes.paquetesItemsAvailableSelectOne}"/>
        </h:selectOneMenu>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{paquetesdeservicios.create}" value="Create"/>
      <br />
      <br />
      <h:commandLink action="#{paquetesdeservicios.listSetup}" value="Show All Paquetesdeservicios Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
