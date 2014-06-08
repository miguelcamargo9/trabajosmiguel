<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Paquetesdeservicios Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Paquetesdeservicios Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{paquetesdeservicios.paquetesdeservicios.id}" title="Id" />
        <h:outputText value="Estado:"/>
        <h:outputText value="#{paquetesdeservicios.paquetesdeservicios.estado}" title="Estado" />
        <h:outputText value="IdServicio:"/>
        <h:panelGroup>
          <h:outputText value="#{paquetesdeservicios.paquetesdeservicios.idServicio}"/>
          <h:panelGroup rendered="#{paquetesdeservicios.paquetesdeservicios.idServicio != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{servicios.detailSetup}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios][paquetesdeservicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios.idServicio][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetesdeservicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesdeserviciosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{servicios.editSetup}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios][paquetesdeservicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios.idServicio][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetesdeservicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesdeserviciosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{servicios.destroy}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios][paquetesdeservicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios.idServicio][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetesdeservicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesdeserviciosController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>
        <h:outputText value="IdPaquete:"/>
        <h:panelGroup>
          <h:outputText value="#{paquetesdeservicios.paquetesdeservicios.idPaquete}"/>
          <h:panelGroup rendered="#{paquetesdeservicios.paquetesdeservicios.idPaquete != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{paquetes.detailSetup}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios][paquetesdeservicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetesdeservicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesdeserviciosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{paquetes.editSetup}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios][paquetesdeservicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetesdeservicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesdeserviciosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{paquetes.destroy}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios][paquetesdeservicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetesdeservicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesdeserviciosController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>


      </h:panelGrid>
      <br />
      <h:commandLink action="#{paquetesdeservicios.remove}" value="Destroy">
        <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios][paquetesdeservicios.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{paquetesdeservicios.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetesdeservicios.paquetesdeservicios][paquetesdeservicios.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{paquetesdeservicios.createSetup}" value="New Paquetesdeservicios" />
      <br />
      <h:commandLink action="#{paquetesdeservicios.listSetup}" value="Show All Paquetesdeservicios Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
