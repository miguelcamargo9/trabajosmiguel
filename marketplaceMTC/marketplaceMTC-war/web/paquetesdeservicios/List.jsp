<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Paquetesdeservicios Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Paquetesdeservicios Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Paquetesdeservicios Items Found)<br />" rendered="#{paquetesdeservicios.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{paquetesdeservicios.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{paquetesdeservicios.pagingInfo.firstItem + 1}..#{paquetesdeservicios.pagingInfo.lastItem} of #{paquetesdeservicios.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{paquetesdeservicios.prev}" value="Previous #{paquetesdeservicios.pagingInfo.batchSize}" rendered="#{paquetesdeservicios.pagingInfo.firstItem >= paquetesdeservicios.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{paquetesdeservicios.next}" value="Next #{paquetesdeservicios.pagingInfo.batchSize}" rendered="#{paquetesdeservicios.pagingInfo.lastItem + paquetesdeservicios.pagingInfo.batchSize <= paquetesdeservicios.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{paquetesdeservicios.next}" value="Remaining #{paquetesdeservicios.pagingInfo.itemCount - paquetesdeservicios.pagingInfo.lastItem}"
                       rendered="#{paquetesdeservicios.pagingInfo.lastItem < paquetesdeservicios.pagingInfo.itemCount && paquetesdeservicios.pagingInfo.lastItem + paquetesdeservicios.pagingInfo.batchSize > paquetesdeservicios.pagingInfo.itemCount}"/>
        <h:dataTable value="#{paquetesdeservicios.paquetesdeserviciosItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
          <h:column>
            <f:facet name="header">
              <h:outputText value="Id"/>
            </f:facet>
            <h:outputText value="#{item.id}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Estado"/>
            </f:facet>
            <h:outputText value="#{item.estado}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="IdServicio"/>
            </f:facet>
            <h:outputText value="#{item.idServicio}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="IdPaquete"/>
            </f:facet>
            <h:outputText value="#{item.idPaquete}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText escape="false" value="&nbsp;"/>
            </f:facet>
            <h:commandLink value="Show" action="#{paquetesdeservicios.detailSetup}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{paquetesdeservicios.editSetup}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{paquetesdeservicios.remove}">
              <f:param name="jsfcrud.currentPaquetesdeservicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetesdeservicios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{paquetesdeservicios.createSetup}" value="New Paquetesdeservicios"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
