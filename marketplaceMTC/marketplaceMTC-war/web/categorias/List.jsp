<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Categorias Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Categorias Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Categorias Items Found)<br />" rendered="#{categorias.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{categorias.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{categorias.pagingInfo.firstItem + 1}..#{categorias.pagingInfo.lastItem} of #{categorias.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{categorias.prev}" value="Previous #{categorias.pagingInfo.batchSize}" rendered="#{categorias.pagingInfo.firstItem >= categorias.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{categorias.next}" value="Next #{categorias.pagingInfo.batchSize}" rendered="#{categorias.pagingInfo.lastItem + categorias.pagingInfo.batchSize <= categorias.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{categorias.next}" value="Remaining #{categorias.pagingInfo.itemCount - categorias.pagingInfo.lastItem}"
                       rendered="#{categorias.pagingInfo.lastItem < categorias.pagingInfo.itemCount && categorias.pagingInfo.lastItem + categorias.pagingInfo.batchSize > categorias.pagingInfo.itemCount}"/>
        <h:dataTable value="#{categorias.categoriasItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
              <h:outputText escape="false" value="&nbsp;"/>
            </f:facet>
            <h:commandLink value="Show" action="#{categorias.detailSetup}">
              <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][categorias.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{categorias.editSetup}">
              <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][categorias.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{categorias.remove}">
              <f:param name="jsfcrud.currentCategorias" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][categorias.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{categorias.createSetup}" value="New Categorias"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
