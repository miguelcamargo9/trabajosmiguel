<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Permisos Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Permisos Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{permisos.permisos.id}" title="Id" />
        <h:outputText value="Opciones:"/>
        <h:outputText value="#{permisos.permisos.opciones}" title="Opciones" />
        <h:outputText value="IdPerfil:"/>
        <h:panelGroup>
          <h:outputText value="#{permisos.permisos.idPerfil}"/>
          <h:panelGroup rendered="#{permisos.permisos.idPerfil != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{perfiles.detailSetup}">
              <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos][permisos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos.idPerfil][perfiles.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="permisos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PermisosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{perfiles.editSetup}">
              <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos][permisos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos.idPerfil][perfiles.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="permisos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PermisosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{perfiles.destroy}">
              <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos][permisos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos.idPerfil][perfiles.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="permisos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PermisosController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>


      </h:panelGrid>
      <br />
      <h:commandLink action="#{permisos.remove}" value="Destroy">
        <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos][permisos.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{permisos.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos][permisos.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{permisos.createSetup}" value="New Permisos" />
      <br />
      <h:commandLink action="#{permisos.listSetup}" value="Show All Permisos Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
