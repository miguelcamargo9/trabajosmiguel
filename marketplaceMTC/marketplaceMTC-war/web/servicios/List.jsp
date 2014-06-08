<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Servicios Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Servicios Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Servicios Items Found)<br />" rendered="#{servicios.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{servicios.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{servicios.pagingInfo.firstItem + 1}..#{servicios.pagingInfo.lastItem} of #{servicios.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{servicios.prev}" value="Previous #{servicios.pagingInfo.batchSize}" rendered="#{servicios.pagingInfo.firstItem >= servicios.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{servicios.next}" value="Next #{servicios.pagingInfo.batchSize}" rendered="#{servicios.pagingInfo.lastItem + servicios.pagingInfo.batchSize <= servicios.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{servicios.next}" value="Remaining #{servicios.pagingInfo.itemCount - servicios.pagingInfo.lastItem}"
                       rendered="#{servicios.pagingInfo.lastItem < servicios.pagingInfo.itemCount && servicios.pagingInfo.lastItem + servicios.pagingInfo.batchSize > servicios.pagingInfo.itemCount}"/>
        <h:dataTable value="#{servicios.serviciosItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{servicios.editSetup}">
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{servicios.remove}">
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][servicios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{servicios.createSetup}" value="New Servicios"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
