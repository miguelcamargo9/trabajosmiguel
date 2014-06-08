<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Adjuntos Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Adjuntos Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Adjuntos Items Found)<br />" rendered="#{adjuntos.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{adjuntos.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{adjuntos.pagingInfo.firstItem + 1}..#{adjuntos.pagingInfo.lastItem} of #{adjuntos.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{adjuntos.prev}" value="Previous #{adjuntos.pagingInfo.batchSize}" rendered="#{adjuntos.pagingInfo.firstItem >= adjuntos.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{adjuntos.next}" value="Next #{adjuntos.pagingInfo.batchSize}" rendered="#{adjuntos.pagingInfo.lastItem + adjuntos.pagingInfo.batchSize <= adjuntos.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{adjuntos.next}" value="Remaining #{adjuntos.pagingInfo.itemCount - adjuntos.pagingInfo.lastItem}"
                       rendered="#{adjuntos.pagingInfo.lastItem < adjuntos.pagingInfo.itemCount && adjuntos.pagingInfo.lastItem + adjuntos.pagingInfo.batchSize > adjuntos.pagingInfo.itemCount}"/>
        <h:dataTable value="#{adjuntos.adjuntosItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
            <h:commandLink value="Show" action="#{adjuntos.detailSetup}">
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][adjuntos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{adjuntos.editSetup}">
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][adjuntos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{adjuntos.remove}">
              <f:param name="jsfcrud.currentAdjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][adjuntos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{adjuntos.createSetup}" value="New Adjuntos"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
