<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Transacciones Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Transacciones Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Transacciones Items Found)<br />" rendered="#{transacciones.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{transacciones.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{transacciones.pagingInfo.firstItem + 1}..#{transacciones.pagingInfo.lastItem} of #{transacciones.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{transacciones.prev}" value="Previous #{transacciones.pagingInfo.batchSize}" rendered="#{transacciones.pagingInfo.firstItem >= transacciones.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{transacciones.next}" value="Next #{transacciones.pagingInfo.batchSize}" rendered="#{transacciones.pagingInfo.lastItem + transacciones.pagingInfo.batchSize <= transacciones.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{transacciones.next}" value="Remaining #{transacciones.pagingInfo.itemCount - transacciones.pagingInfo.lastItem}"
                       rendered="#{transacciones.pagingInfo.lastItem < transacciones.pagingInfo.itemCount && transacciones.pagingInfo.lastItem + transacciones.pagingInfo.batchSize > transacciones.pagingInfo.itemCount}"/>
        <h:dataTable value="#{transacciones.transaccionesItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
          <h:column>
            <f:facet name="header">
              <h:outputText value="Id"/>
            </f:facet>
            <h:outputText value="#{item.id}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="FechaTransaccion"/>
            </f:facet>
            <h:outputText value="#{item.fechaTransaccion}">
              <f:convertDateTime pattern="MM/dd/yyyy" />
            </h:outputText>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="IdUsuario"/>
            </f:facet>
            <h:outputText value="#{item.idUsuario}"/>
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
              <h:outputText value="IdOferta"/>
            </f:facet>
            <h:outputText value="#{item.idOferta}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText escape="false" value="&nbsp;"/>
            </f:facet>
            <h:commandLink value="Show" action="#{transacciones.detailSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{transacciones.editSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{transacciones.remove}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{transacciones.createSetup}" value="New Transacciones"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
