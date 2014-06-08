<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Servicios Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Servicios Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{servicios.servicios.id}" title="Id" />
        <h:outputText value="Descripcion:"/>
        <h:outputText value="#{servicios.servicios.descripcion}" title="Descripcion" />
        <h:outputText value="Valor:"/>
        <h:outputText value="#{servicios.servicios.valor}" title="Valor" />
        <h:outputText value="Estado:"/>
        <h:outputText value="#{servicios.servicios.estado}" title="Estado" />
        <h:outputText value="IdCategoria:"/>
        <h:panelGroup>
          <h:outputText value="#{servicios.servicios.idCategoria}"/>
          <h:panelGroup rendered="#{servicios.servicios.idCategoria != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{categorias.detailSetup}">
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios.idCategoria][categorias.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="servicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{categorias.editSetup}">
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios.idCategoria][categorias.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="servicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{categorias.destroy}">
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios.idCategoria][categorias.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="servicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>
        <h:outputText value="IdAdjunto:"/>
        <h:panelGroup>
          <h:outputText value="#{servicios.servicios.idAdjunto}"/>
          <h:panelGroup rendered="#{servicios.servicios.idAdjunto != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{adjuntos.detailSetup}">
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios.idAdjunto][adjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="servicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{adjuntos.editSetup}">
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios.idAdjunto][adjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="servicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{adjuntos.destroy}">
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios.idAdjunto][adjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="servicios"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>

        <h:outputText value="PaquetesdeserviciosList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty servicios.servicios.paquetesdeserviciosList}" value="(No Items)"/>
          <h:dataTable value="#{servicios.servicios.paquetesdeserviciosList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty servicios.servicios.paquetesdeserviciosList}">
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
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="servicios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{paquetesdeservicios.editSetup}">
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="servicios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{paquetesdeservicios.destroy}">
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="servicios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>
        <h:outputText value="TransaccionesList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty servicios.servicios.transaccionesList}" value="(No Items)"/>
          <h:dataTable value="#{servicios.servicios.transaccionesList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty servicios.servicios.transaccionesList}">
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
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="servicios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{transacciones.editSetup}">
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="servicios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{transacciones.destroy}">
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="servicios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ServiciosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{servicios.remove}" value="Destroy">
        <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{servicios.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][servicios.servicios][servicios.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{servicios.createSetup}" value="New Servicios" />
      <br />
      <h:commandLink action="#{servicios.listSetup}" value="Show All Servicios Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
