<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Ofertas Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Ofertas Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{ofertas.ofertas.id}" title="Id" />
        <h:outputText value="Descripcion:"/>
        <h:outputText value="#{ofertas.ofertas.descripcion}" title="Descripcion" />
        <h:outputText value="FechaInicial:"/>
        <h:outputText value="#{ofertas.ofertas.fechaInicial}" title="FechaInicial" >
          <f:convertDateTime pattern="MM/dd/yyyy" />
        </h:outputText>
        <h:outputText value="FechaFinal:"/>
        <h:outputText value="#{ofertas.ofertas.fechaFinal}" title="FechaFinal" >
          <f:convertDateTime pattern="MM/dd/yyyy" />
        </h:outputText>
        <h:outputText value="Valor:"/>
        <h:outputText value="#{ofertas.ofertas.valor}" title="Valor" />
        <h:outputText value="IdPaquete:"/>
        <h:panelGroup>
          <h:outputText value="#{ofertas.ofertas.idPaquete}"/>
          <h:panelGroup rendered="#{ofertas.ofertas.idPaquete != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{paquetes.detailSetup}">
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas][ofertas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="ofertas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.OfertasController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{paquetes.editSetup}">
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas][ofertas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="ofertas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.OfertasController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{paquetes.destroy}">
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas][ofertas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="ofertas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.OfertasController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>

        <h:outputText value="TransaccionesList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty ofertas.ofertas.transaccionesList}" value="(No Items)"/>
          <h:dataTable value="#{ofertas.ofertas.transaccionesList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty ofertas.ofertas.transaccionesList}">
            <h:column>
              <f:facet name="header">
                <h:outputText value="Id"/>
              </f:facet>
              <h:outputText value="#{item.id}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="FechaTransaccion"/>
              </f:facet>
              <h:outputText value="#{item.fechaTransaccion}">
                <f:convertDateTime pattern="MM/dd/yyyy" />
              </h:outputText>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdUsuario"/>
              </f:facet>
              <h:outputText value="#{item.idUsuario}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdServicio"/>
              </f:facet>
              <h:outputText value="#{item.idServicio}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdPaquete"/>
              </f:facet>
              <h:outputText value="#{item.idPaquete}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdOferta"/>
              </f:facet>
              <h:outputText value="#{item.idOferta}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText escape="false" value="&nbsp;"/>
              </f:facet>
              <h:commandLink value="Show" action="#{transacciones.detailSetup}">
                <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas][ofertas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="ofertas" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.OfertasController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{transacciones.editSetup}">
                <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas][ofertas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="ofertas" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.OfertasController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{transacciones.destroy}">
                <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas][ofertas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="ofertas" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.OfertasController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{ofertas.remove}" value="Destroy">
        <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas][ofertas.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{ofertas.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][ofertas.ofertas][ofertas.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{ofertas.createSetup}" value="New Ofertas" />
      <br />
      <h:commandLink action="#{ofertas.listSetup}" value="Show All Ofertas Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
