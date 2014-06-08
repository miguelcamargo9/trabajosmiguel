<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Archivosadjuntos Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Archivosadjuntos Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{archivosadjuntos.archivosadjuntos.id}" title="Id" />
        <h:outputText value="IdArchivo:"/>
        <h:panelGroup>
          <h:outputText value="#{archivosadjuntos.archivosadjuntos.idArchivo}"/>
          <h:panelGroup rendered="#{archivosadjuntos.archivosadjuntos.idArchivo != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{archivos.detailSetup}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos][archivosadjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos.idArchivo][archivos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="archivosadjuntos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosadjuntosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{archivos.editSetup}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos][archivosadjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos.idArchivo][archivos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="archivosadjuntos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosadjuntosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{archivos.destroy}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos][archivosadjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos.idArchivo][archivos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="archivosadjuntos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosadjuntosController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>
        <h:outputText value="IdAdjunto:"/>
        <h:panelGroup>
          <h:outputText value="#{archivosadjuntos.archivosadjuntos.idAdjunto}"/>
          <h:panelGroup rendered="#{archivosadjuntos.archivosadjuntos.idAdjunto != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{adjuntos.detailSetup}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos][archivosadjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos.idAdjunto][adjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="archivosadjuntos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosadjuntosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{adjuntos.editSetup}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos][archivosadjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos.idAdjunto][adjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="archivosadjuntos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosadjuntosController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{adjuntos.destroy}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos][archivosadjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos.idAdjunto][adjuntos.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="archivosadjuntos"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.ArchivosadjuntosController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>


      </h:panelGrid>
      <br />
      <h:commandLink action="#{archivosadjuntos.remove}" value="Destroy">
        <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos][archivosadjuntos.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{archivosadjuntos.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivosadjuntos.archivosadjuntos][archivosadjuntos.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{archivosadjuntos.createSetup}" value="New Archivosadjuntos" />
      <br />
      <h:commandLink action="#{archivosadjuntos.listSetup}" value="Show All Archivosadjuntos Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
