<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Perfiles Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Perfiles Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{perfiles.perfiles.id}" title="Id" />
        <h:outputText value="Descripcion:"/>
        <h:outputText value="#{perfiles.perfiles.descripcion}" title="Descripcion" />
        <h:outputText value="Estado:"/>
        <h:outputText value="#{perfiles.perfiles.estado}" title="Estado" />

        <h:outputText value="PermisosList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty perfiles.perfiles.permisosList}" value="(No Items)"/>
          <h:dataTable value="#{perfiles.perfiles.permisosList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty perfiles.perfiles.permisosList}">
            <h:column>
              <f:facet name="header">
                <h:outputText value="Id"/>
              </f:facet>
              <h:outputText value="#{item.id}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="Opciones"/>
              </f:facet>
              <h:outputText value="#{item.opciones}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="IdPerfil"/>
              </f:facet>
              <h:outputText value="#{item.idPerfil}"/>
            </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText escape="false" value="&nbsp;"/>
              </f:facet>
              <h:commandLink value="Show" action="#{permisos.detailSetup}">
                <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfiles.perfiles][perfiles.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][permisos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="perfiles" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PerfilesController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{permisos.editSetup}">
                <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfiles.perfiles][perfiles.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][permisos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="perfiles" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PerfilesController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{permisos.destroy}">
                <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfiles.perfiles][perfiles.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][permisos.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="perfiles" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PerfilesController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{perfiles.remove}" value="Destroy">
        <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfiles.perfiles][perfiles.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{perfiles.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfiles.perfiles][perfiles.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{perfiles.createSetup}" value="New Perfiles" />
      <br />
      <h:commandLink action="#{perfiles.listSetup}" value="Show All Perfiles Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
