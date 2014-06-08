<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Paquetes Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Paquetes Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{paquetes.paquetes.id}" title="Id" />
        <h:outputText value="Descripcion:"/>
        <h:outputText value="#{paquetes.paquetes.descripcion}" title="Descripcion" />
        <h:outputText value="Valor:"/>
        <h:outputText value="#{paquetes.paquetes.valor}" title="Valor" />
        <h:outputText value="Estado:"/>
        <h:outputText value="#{paquetes.paquetes.estado}" title="Estado" />
        <h:outputText value="IdProveedor:"/>
        <h:panelGroup>
          <h:outputText value="#{paquetes.paquetes.idProveedor}"/>
          <h:panelGroup rendered="#{paquetes.paquetes.idProveedor != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{usuarios.detailSetup}">
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes.idProveedor][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetes"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{usuarios.editSetup}">
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes.idProveedor][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetes"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{usuarios.destroy}">
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes.idProveedor][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="paquetes"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>

        <h:outputText value="OfertasList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty paquetes.paquetes.ofertasList}" value="(No Items)"/>
          <h:dataTable value="#{paquetes.paquetes.ofertasList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty paquetes.paquetes.ofertasList}">
            <h:column>
              <f:facet name="header">
                <h:outputText value="Id"/>
              </f:facet>
              <h:outputText value="#{item.id}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="Descripcion"/>
              </f:facet>
              <h:outputText value="#{item.descripcion}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="FechaInicial"/>
              </f:facet>
              <h:outputText value="#{item.fechaInicial}">
                <f:convertDateTime pattern="MM/dd/yyyy" />
              </h:outputText>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="FechaFinal"/>
              </f:facet>
              <h:outputText value="#{item.fechaFinal}">
                <f:convertDateTime pattern="MM/dd/yyyy" />
              </h:outputText>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="Valor"/>
              </f:facet>
              <h:outputText value="#{item.valor}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdPaquete"/>
              </f:facet>
              <h:outputText value="#{item.idPaquete}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText escape="false" value="&nbsp;"/>
              </f:facet>
              <h:commandLink value="Show" action="#{ofertas.detailSetup}">
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ofertas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{ofertas.editSetup}">
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ofertas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{ofertas.destroy}">
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ofertas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>
        <h:outputText value="PaquetesdeserviciosList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty paquetes.paquetes.paquetesdeserviciosList}" value="(No Items)"/>
          <h:dataTable value="#{paquetes.paquetes.paquetesdeserviciosList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty paquetes.paquetes.paquetesdeserviciosList}">
            <h:column>
              <f:facet name="header">
                <h:outputText value="Id"/>
              </f:facet>
              <h:outputText value="#{item.id}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="Estado"/>
              </f:facet>
              <h:outputText value="#{item.estado}"/>
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
                <h:outputText escape="false" value="&nbsp;"/>
              </f:facet>
              <h:commandLink value="Show" action="#{paquetesdeservicios.detailSetup}">
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{paquetesdeservicios.editSetup}">
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{paquetesdeservicios.destroy}">
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>
        <h:outputText value="TransaccionesList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty paquetes.paquetes.transaccionesList}" value="(No Items)"/>
          <h:dataTable value="#{paquetes.paquetes.transaccionesList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty paquetes.paquetes.transaccionesList}">
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
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{transacciones.editSetup}">
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{transacciones.destroy}">
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="paquetes" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PaquetesController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{paquetes.remove}" value="Destroy">
        <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{paquetes.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paquetes.paquetes][paquetes.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{paquetes.createSetup}" value="New Paquetes" />
      <br />
      <h:commandLink action="#{paquetes.listSetup}" value="Show All Paquetes Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
