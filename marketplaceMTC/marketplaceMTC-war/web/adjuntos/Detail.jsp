<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Adjuntos Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Adjuntos Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{adjuntos.adjuntos.id}" title="Id" />
        <h:outputText value="Descripcion:"/>
        <h:outputText value="#{adjuntos.adjuntos.descripcion}" title="Descripcion" />

        <h:outputText value="ServiciosList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty adjuntos.adjuntos.serviciosList}" value="(No Items)"/>
          <h:dataTable value="#{adjuntos.adjuntos.serviciosList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty adjuntos.adjuntos.serviciosList}">
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
                <h:outputText value="Valor"/>
              </f:facet>
              <h:outputText value="#{item.valor}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="Estado"/>
              </f:facet>
              <h:outputText value="#{item.estado}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdCategoria"/>
              </f:facet>
              <h:outputText value="#{item.idCategoria}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdAdjunto"/>
              </f:facet>
              <h:outputText value="#{item.idAdjunto}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText escape="false" value="&nbsp;"/>
              </f:facet>
              <h:commandLink value="Show" action="#{servicios.detailSetup}">
                <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][adjuntos.adjuntos][adjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="adjuntos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.AdjuntosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{servicios.editSetup}">
                <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][adjuntos.adjuntos][adjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="adjuntos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.AdjuntosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{servicios.destroy}">
                <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][adjuntos.adjuntos][adjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="adjuntos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.AdjuntosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>
        <h:outputText value="ArchivosadjuntosList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty adjuntos.adjuntos.archivosadjuntosList}" value="(No Items)"/>
          <h:dataTable value="#{adjuntos.adjuntos.archivosadjuntosList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty adjuntos.adjuntos.archivosadjuntosList}">
            <h:column>
              <f:facet name="header">
                <h:outputText value="Id"/>
              </f:facet>
              <h:outputText value="#{item.id}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdArchivo"/>
              </f:facet>
              <h:outputText value="#{item.idArchivo}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdAdjunto"/>
              </f:facet>
              <h:outputText value="#{item.idAdjunto}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText escape="false" value="&nbsp;"/>
              </f:facet>
              <h:commandLink value="Show" action="#{archivosadjuntos.detailSetup}">
                <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][adjuntos.adjuntos][adjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="adjuntos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.AdjuntosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{archivosadjuntos.editSetup}">
                <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][adjuntos.adjuntos][adjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="adjuntos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.AdjuntosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{archivosadjuntos.destroy}">
                <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][adjuntos.adjuntos][adjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="adjuntos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.AdjuntosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{adjuntos.remove}" value="Destroy">
        <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][adjuntos.adjuntos][adjuntos.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{adjuntos.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][adjuntos.adjuntos][adjuntos.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{adjuntos.createSetup}" value="New Adjuntos" />
      <br />
      <h:commandLink action="#{adjuntos.listSetup}" value="Show All Adjuntos Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
