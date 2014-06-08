<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Perfiles Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Perfiles Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Perfiles Items Found)<br />" rendered="#{perfiles.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{perfiles.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{perfiles.pagingInfo.firstItem + 1}..#{perfiles.pagingInfo.lastItem} of #{perfiles.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{perfiles.prev}" value="Previous #{perfiles.pagingInfo.batchSize}" rendered="#{perfiles.pagingInfo.firstItem >= perfiles.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{perfiles.next}" value="Next #{perfiles.pagingInfo.batchSize}" rendered="#{perfiles.pagingInfo.lastItem + perfiles.pagingInfo.batchSize <= perfiles.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{perfiles.next}" value="Remaining #{perfiles.pagingInfo.itemCount - perfiles.pagingInfo.lastItem}"
                       rendered="#{perfiles.pagingInfo.lastItem < perfiles.pagingInfo.itemCount && perfiles.pagingInfo.lastItem + perfiles.pagingInfo.batchSize > perfiles.pagingInfo.itemCount}"/>
        <h:dataTable value="#{perfiles.perfilesItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
              <h:outputText value="Estado"/>
            </f:facet>
            <h:outputText value="#{item.estado}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText escape="false" value="&nbsp;"/>
            </f:facet>
            <h:commandLink value="Show" action="#{perfiles.detailSetup}">
              <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][perfiles.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{perfiles.editSetup}">
              <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][perfiles.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{perfiles.remove}">
              <f:param name="jsfcrud.currentPerfiles" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][perfiles.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{perfiles.createSetup}" value="New Perfiles"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
