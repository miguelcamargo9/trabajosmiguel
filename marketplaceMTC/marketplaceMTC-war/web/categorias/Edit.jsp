<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Editing Categorias</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Editing Categorias</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{categorias.categorias.id}" title="Id" />
        <h:outputText value="Descripcion:"/>
        <h:inputText id="descripcion" value="#{categorias.categorias.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
        <h:outputText value="ServiciosList:"/>
        <h:selectManyListbox id="serviciosList" value="#{categorias.categorias.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].serviciosList}" title="ServiciosList" size="6" converter="#{servicios.converter}" >
          <f:selectItems value="#{servicios.serviciosItemsAvailableSelectMany}"/>
        </h:selectManyListbox>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{categorias.edit}" value="Save">
        <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categorias.categorias][categorias.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{categorias.detailSetup}" value="Show" immediate="true">
        <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categorias.categorias][categorias.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <h:commandLink action="#{categorias.listSetup}" value="Show All Categorias Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
