<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>New Ofertas</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>New Ofertas</h1>
    <h:form>
      <h:inputHidden id="validateCreateField" validator="#{ofertas.validateCreate}" value="value"/>
      <h:panelGrid columns="2">
        <h:outputText value="Descripcion:"/>
        <h:inputText id="descripcion" value="#{ofertas.ofertas.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
        <h:outputText value="FechaInicial (MM/dd/yyyy):"/>
        <h:inputText id="fechaInicial" value="#{ofertas.ofertas.fechaInicial}" title="FechaInicial" required="true" requiredMessage="The fechaInicial field is required." >
          <f:convertDateTime pattern="MM/dd/yyyy" />
        </h:inputText>
        <h:outputText value="FechaFinal (MM/dd/yyyy):"/>
        <h:inputText id="fechaFinal" value="#{ofertas.ofertas.fechaFinal}" title="FechaFinal" required="true" requiredMessage="The fechaFinal field is required." >
          <f:convertDateTime pattern="MM/dd/yyyy" />
        </h:inputText>
        <h:outputText value="Valor:"/>
        <h:inputText id="valor" value="#{ofertas.ofertas.valor}" title="Valor" required="true" requiredMessage="The valor field is required." />
        <h:outputText value="IdPaquete:"/>
        <h:selectOneMenu id="idPaquete" value="#{ofertas.ofertas.idPaquete}" title="IdPaquete" required="true" requiredMessage="The idPaquete field is required." >
          <f:selectItems value="#{paquetes.paquetesItemsAvailableSelectOne}"/>
        </h:selectOneMenu>
        <h:outputText value="TransaccionesList:"/>
        <h:selectManyListbox id="transaccionesList" value="#{ofertas.ofertas.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].transaccionesList}" title="TransaccionesList" size="6" converter="#{transacciones.converter}" >
          <f:selectItems value="#{transacciones.transaccionesItemsAvailableSelectMany}"/>
        </h:selectManyListbox>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{ofertas.create}" value="Create"/>
      <br />
      <br />
      <h:commandLink action="#{ofertas.listSetup}" value="Show All Ofertas Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
