<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Archivos Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Archivos Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Archivos Items Found)<br />" rendered="#{archivos.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{archivos.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{archivos.pagingInfo.firstItem + 1}..#{archivos.pagingInfo.lastItem} of #{archivos.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{archivos.prev}" value="Previous #{archivos.pagingInfo.batchSize}" rendered="#{archivos.pagingInfo.firstItem >= archivos.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{archivos.next}" value="Next #{archivos.pagingInfo.batchSize}" rendered="#{archivos.pagingInfo.lastItem + archivos.pagingInfo.batchSize <= archivos.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{archivos.next}" value="Remaining #{archivos.pagingInfo.itemCount - archivos.pagingInfo.lastItem}"
                       rendered="#{archivos.pagingInfo.lastItem < archivos.pagingInfo.itemCount && archivos.pagingInfo.lastItem + archivos.pagingInfo.batchSize > archivos.pagingInfo.itemCount}"/>
        <h:dataTable value="#{archivos.archivosItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
          <h:column>
            <f:facet name="header">
              <h:outputText value="Id"/>
            </f:facet>
            <h:outputText value="#{item.id}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Tipo"/>
            </f:facet>
            <h:outputText value="#{item.tipo}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Ruta"/>
            </f:facet>
            <h:outputText value="#{item.ruta}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText escape="false" value="&nbsp;"/>
            </f:facet>
            <h:commandLink value="Show" action="#{archivos.detailSetup}">
              <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{archivos.editSetup}">
              <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{archivos.remove}">
              <f:param name="jsfcrud.currentArchivos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{archivos.createSetup}" value="New Archivos"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
