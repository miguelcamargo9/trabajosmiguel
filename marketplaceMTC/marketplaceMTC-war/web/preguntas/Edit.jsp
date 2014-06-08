<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Editing Preguntas</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Editing Preguntas</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{preguntas.preguntas.id}" title="Id" />
        <h:outputText value="Pregunta:"/>
        <h:inputTextarea rows="4" cols="30" id="pregunta" value="#{preguntas.preguntas.pregunta}" title="Pregunta" required="true" requiredMessage="The pregunta field is required." />
        <h:outputText value="Respuesta:"/>
        <h:inputTextarea rows="4" cols="30" id="respuesta" value="#{preguntas.preguntas.respuesta}" title="Respuesta" required="true" requiredMessage="The respuesta field is required." />
        <h:outputText value="Estado:"/>
        <h:inputText id="estado" value="#{preguntas.preguntas.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
        <h:outputText value="IdProveedor:"/>
        <h:selectOneMenu id="idProveedor" value="#{preguntas.preguntas.idProveedor}" title="IdProveedor" required="true" requiredMessage="The idProveedor field is required." >
          <f:selectItems value="#{usuarios.usuariosItemsAvailableSelectOne}"/>
        </h:selectOneMenu>
        <h:outputText value="IdUsuario:"/>
        <h:selectOneMenu id="idUsuario" value="#{preguntas.preguntas.idUsuario}" title="IdUsuario" required="true" requiredMessage="The idUsuario field is required." >
          <f:selectItems value="#{usuarios.usuariosItemsAvailableSelectOne}"/>
        </h:selectOneMenu>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{preguntas.edit}" value="Save">
        <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{preguntas.detailSetup}" value="Show" immediate="true">
        <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <h:commandLink action="#{preguntas.listSetup}" value="Show All Preguntas Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
