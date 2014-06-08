<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Editing Transacciones</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Editing Transacciones</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{transacciones.transacciones.id}" title="Id" />
        <h:outputText value="FechaTransaccion (MM/dd/yyyy):"/>
        <h:inputText id="fechaTransaccion" value="#{transacciones.transacciones.fechaTransaccion}" title="FechaTransaccion" required="true" requiredMessage="The fechaTransaccion field is required." >
          <f:convertDateTime pattern="MM/dd/yyyy" />
        </h:inputText>
        <h:outputText value="IdUsuario:"/>
        <h:selectOneMenu id="idUsuario" value="#{transacciones.transacciones.idUsuario}" title="IdUsuario" required="true" requiredMessage="The idUsuario field is required." >
          <f:selectItems value="#{usuarios.usuariosItemsAvailableSelectOne}"/>
        </h:selectOneMenu>
        <h:outputText value="IdServicio:"/>
        <h:selectOneMenu id="idServicio" value="#{transacciones.transacciones.idServicio}" title="IdServicio" >
          <f:selectItems value="#{servicios.serviciosItemsAvailableSelectOne}"/>
        </h:selectOneMenu>
        <h:outputText value="IdPaquete:"/>
        <h:selectOneMenu id="idPaquete" value="#{transacciones.transacciones.idPaquete}" title="IdPaquete" >
          <f:selectItems value="#{paquetes.paquetesItemsAvailableSelectOne}"/>
        </h:selectOneMenu>
        <h:outputText value="IdOferta:"/>
        <h:selectOneMenu id="idOferta" value="#{transacciones.transacciones.idOferta}" title="IdOferta" >
          <f:selectItems value="#{ofertas.ofertasItemsAvailableSelectOne}"/>
        </h:selectOneMenu>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{transacciones.edit}" value="Save">
        <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{transacciones.detailSetup}" value="Show" immediate="true">
        <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <h:commandLink action="#{transacciones.listSetup}" value="Show All Transacciones Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
