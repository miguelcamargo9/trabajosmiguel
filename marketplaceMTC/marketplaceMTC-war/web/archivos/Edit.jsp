<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Editing Archivos</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Editing Archivos</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{archivos.archivos.id}" title="Id" />
        <h:outputText value="Tipo:"/>
        <h:inputText id="tipo" value="#{archivos.archivos.tipo}" title="Tipo" required="true" requiredMessage="The tipo field is required." />
        <h:outputText value="Ruta:"/>
        <h:inputText id="ruta" value="#{archivos.archivos.ruta}" title="Ruta" required="true" requiredMessage="The ruta field is required." />
        <h:outputText value="ArchivosadjuntosList:"/>
        <h:selectManyListbox id="archivosadjuntosList" value="#{archivos.archivos.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].archivosadjuntosList}" title="ArchivosadjuntosList" size="6" converter="#{archivosadjuntos.converter}" >
          <f:selectItems value="#{archivosadjuntos.archivosadjuntosItemsAvailableSelectMany}"/>
        </h:selectManyListbox>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{archivos.edit}" value="Save">
        <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivos.archivos][archivos.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{archivos.detailSetup}" value="Show" immediate="true">
        <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][archivos.archivos][archivos.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <h:commandLink action="#{archivos.listSetup}" value="Show All Archivos Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
