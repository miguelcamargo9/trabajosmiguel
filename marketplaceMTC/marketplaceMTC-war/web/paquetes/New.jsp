<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>New Paquetes</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>New Paquetes</h1>
    <h:form>
      <h:inputHidden id="validateCreateField" validator="#{paquetes.validateCreate}" value="value"/>
      <h:panelGrid columns="2">
        <h:outputText value="Descripcion:"/>
        <h:inputText id="descripcion" value="#{paquetes.paquetes.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
        <h:outputText value="Valor:"/>
        <h:inputText id="valor" value="#{paquetes.paquetes.valor}" title="Valor" required="true" requiredMessage="The valor field is required." />
        <h:outputText value="Estado:"/>
        <h:inputText id="estado" value="#{paquetes.paquetes.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
        <h:outputText value="IdProveedor:"/>
        <h:selectOneMenu id="idProveedor" value="#{paquetes.paquetes.idProveedor}" title="IdProveedor" required="true" requiredMessage="The idProveedor field is required." >
          <f:selectItems value="#{usuarios.usuariosItemsAvailableSelectOne}"/>
        </h:selectOneMenu>
        <h:outputText value="OfertasList:"/>
        <h:selectManyListbox id="ofertasList" value="#{paquetes.paquetes.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].ofertasList}" title="OfertasList" size="6" converter="#{ofertas.converter}" >
          <f:selectItems value="#{ofertas.ofertasItemsAvailableSelectMany}"/>
        </h:selectManyListbox>
        <h:outputText value="PaquetesdeserviciosList:"/>
        <h:selectManyListbox id="paquetesdeserviciosList" value="#{paquetes.paquetes.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].paquetesdeserviciosList}" title="PaquetesdeserviciosList" size="6" converter="#{paquetesdeservicios.converter}" >
          <f:selectItems value="#{paquetesdeservicios.paquetesdeserviciosItemsAvailableSelectMany}"/>
        </h:selectManyListbox>
        <h:outputText value="TransaccionesList:"/>
        <h:selectManyListbox id="transaccionesList" value="#{paquetes.paquetes.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].transaccionesList}" title="TransaccionesList" size="6" converter="#{transacciones.converter}" >
          <f:selectItems value="#{transacciones.transaccionesItemsAvailableSelectMany}"/>
        </h:selectManyListbox>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{paquetes.create}" value="Create"/>
      <br />
      <br />
      <h:commandLink action="#{paquetes.listSetup}" value="Show All Paquetes Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
