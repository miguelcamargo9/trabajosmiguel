<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Permisos Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Permisos Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Permisos Items Found)<br />" rendered="#{permisos.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{permisos.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{permisos.pagingInfo.firstItem + 1}..#{permisos.pagingInfo.lastItem} of #{permisos.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{permisos.prev}" value="Previous #{permisos.pagingInfo.batchSize}" rendered="#{permisos.pagingInfo.firstItem >= permisos.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{permisos.next}" value="Next #{permisos.pagingInfo.batchSize}" rendered="#{permisos.pagingInfo.lastItem + permisos.pagingInfo.batchSize <= permisos.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{permisos.next}" value="Remaining #{permisos.pagingInfo.itemCount - permisos.pagingInfo.lastItem}"
                       rendered="#{permisos.pagingInfo.lastItem < permisos.pagingInfo.itemCount && permisos.pagingInfo.lastItem + permisos.pagingInfo.batchSize > permisos.pagingInfo.itemCount}"/>
        <h:dataTable value="#{permisos.permisosItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
          <h:column>
            <f:facet name="header">
              <h:outputText value="Id"/>
            </f:facet>
            <h:outputText value="#{item.id}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Opciones"/>
            </f:facet>
            <h:outputText value="#{item.opciones}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="IdPerfil"/>
            </f:facet>
            <h:outputText value="#{item.idPerfil}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText escape="false" value="&nbsp;"/>
            </f:facet>
            <h:commandLink value="Show" action="#{permisos.detailSetup}">
              <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][permisos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{permisos.editSetup}">
              <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][permisos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{permisos.remove}">
              <f:param name="jsfcrud.currentPermisos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][permisos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{permisos.createSetup}" value="New Permisos"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
