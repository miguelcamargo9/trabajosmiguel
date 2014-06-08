<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Editing Permisos</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Editing Permisos</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{permisos.permisos.id}" title="Id" />
        <h:outputText value="Opciones:"/>
        <h:inputText id="opciones" value="#{permisos.permisos.opciones}" title="Opciones" required="true" requiredMessage="The opciones field is required." />
        <h:outputText value="IdPerfil:"/>
        <h:selectOneMenu id="idPerfil" value="#{permisos.permisos.idPerfil}" title="IdPerfil" required="true" requiredMessage="The idPerfil field is required." >
          <f:selectItems value="#{perfiles.perfilesItemsAvailableSelectOne}"/>
        </h:selectOneMenu>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{permisos.edit}" value="Save">
        <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos][permisos.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{permisos.detailSetup}" value="Show" immediate="true">
        <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][permisos.permisos][permisos.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <h:commandLink action="#{permisos.listSetup}" value="Show All Permisos Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
