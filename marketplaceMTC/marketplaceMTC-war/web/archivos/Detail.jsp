<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Archivos Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Archivos Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{archivos.archivos.id}" title="Id" />
        <h:outputText value="Tipo:"/>
        <h:outputText value="#{archivos.archivos.tipo}" title="Tipo" />
        <h:outputText value="Ruta:"/>
        <h:outputText value="#{archivos.archivos.ruta}" title="Ruta" />

        <h:outputText value="ArchivosadjuntosList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty archivos.archivos.archivosadjuntosList}" value="(No Items)"/>
          <h:dataTable value="#{archivos.archivos.archivosadjuntosList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty archivos.archivos.archivosadjuntosList}">
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
                <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivos.archivos][archivos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="archivos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{archivosadjuntos.editSetup}">
                <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivos.archivos][archivos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="archivos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{archivosadjuntos.destroy}">
                <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivos.archivos][archivos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="archivos" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{archivos.remove}" value="Destroy">
        <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivos.archivos][archivos.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{archivos.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivos.archivos][archivos.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{archivos.createSetup}" value="New Archivos" />
      <br />
      <h:commandLink action="#{archivos.listSetup}" value="Show All Archivos Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
