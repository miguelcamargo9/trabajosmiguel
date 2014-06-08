<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Paquetes Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Paquetes Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Paquetes Items Found)<br />" rendered="#{paquetes.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{paquetes.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{paquetes.pagingInfo.firstItem + 1}..#{paquetes.pagingInfo.lastItem} of #{paquetes.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{paquetes.prev}" value="Previous #{paquetes.pagingInfo.batchSize}" rendered="#{paquetes.pagingInfo.firstItem >= paquetes.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{paquetes.next}" value="Next #{paquetes.pagingInfo.batchSize}" rendered="#{paquetes.pagingInfo.lastItem + paquetes.pagingInfo.batchSize <= paquetes.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{paquetes.next}" value="Remaining #{paquetes.pagingInfo.itemCount - paquetes.pagingInfo.lastItem}"
                       rendered="#{paquetes.pagingInfo.lastItem < paquetes.pagingInfo.itemCount && paquetes.pagingInfo.lastItem + paquetes.pagingInfo.batchSize > paquetes.pagingInfo.itemCount}"/>
        <h:dataTable value="#{paquetes.paquetesItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
              <h:outputText value="IdProveedor"/>
            </f:facet>
            <h:outputText value="#{item.idProveedor}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText escape="false" value="&nbsp;"/>
            </f:facet>
            <h:commandLink value="Show" action="#{paquetes.detailSetup}">
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetes.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{paquetes.editSetup}">
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetes.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{paquetes.remove}">
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetes.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{paquetes.createSetup}" value="New Paquetes"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
