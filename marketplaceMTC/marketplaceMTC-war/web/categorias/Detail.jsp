<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Categorias Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Categorias Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{categorias.categorias.id}" title="Id" />
        <h:outputText value="Descripcion:"/>
        <h:outputText value="#{categorias.categorias.descripcion}" title="Descripcion" />

        <h:outputText value="ServiciosList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty categorias.categorias.serviciosList}" value="(No Items)"/>
          <h:dataTable value="#{categorias.categorias.serviciosList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty categorias.categorias.serviciosList}">
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
                <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categorias.categorias][categorias.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="categorias" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.CategoriasController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{servicios.editSetup}">
                <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categorias.categorias][categorias.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="categorias" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.CategoriasController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{servicios.destroy}">
                <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categorias.categorias][categorias.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="categorias" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.CategoriasController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{categorias.remove}" value="Destroy">
        <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categorias.categorias][categorias.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{categorias.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categorias.categorias][categorias.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{categorias.createSetup}" value="New Categorias" />
      <br />
      <h:commandLink action="#{categorias.listSetup}" value="Show All Categorias Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
