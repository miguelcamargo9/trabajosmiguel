<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Preguntas Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Preguntas Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{preguntas.preguntas.id}" title="Id" />
        <h:outputText value="Pregunta:"/>
        <h:outputText value="#{preguntas.preguntas.pregunta}" title="Pregunta" />
        <h:outputText value="Respuesta:"/>
        <h:outputText value="#{preguntas.preguntas.respuesta}" title="Respuesta" />
        <h:outputText value="Estado:"/>
        <h:outputText value="#{preguntas.preguntas.estado}" title="Estado" />
        <h:outputText value="IdProveedor:"/>
        <h:panelGroup>
          <h:outputText value="#{preguntas.preguntas.idProveedor}"/>
          <h:panelGroup rendered="#{preguntas.preguntas.idProveedor != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{usuarios.detailSetup}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas.idProveedor][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="preguntas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PreguntasController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{usuarios.editSetup}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas.idProveedor][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="preguntas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PreguntasController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{usuarios.destroy}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas.idProveedor][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="preguntas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PreguntasController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>
        <h:outputText value="IdUsuario:"/>
        <h:panelGroup>
          <h:outputText value="#{preguntas.preguntas.idUsuario}"/>
          <h:panelGroup rendered="#{preguntas.preguntas.idUsuario != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{usuarios.detailSetup}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas.idUsuario][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="preguntas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PreguntasController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{usuarios.editSetup}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas.idUsuario][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="preguntas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PreguntasController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{usuarios.destroy}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas.idUsuario][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="preguntas"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.PreguntasController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>


      </h:panelGrid>
      <br />
      <h:commandLink action="#{preguntas.remove}" value="Destroy">
        <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{preguntas.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][preguntas.preguntas][preguntas.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{preguntas.createSetup}" value="New Preguntas" />
      <br />
      <h:commandLink action="#{preguntas.listSetup}" value="Show All Preguntas Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
