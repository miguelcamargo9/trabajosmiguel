<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Menus Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Menus Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Menus Items Found)<br />" rendered="#{menus.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{menus.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{menus.pagingInfo.firstItem + 1}..#{menus.pagingInfo.lastItem} of #{menus.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{menus.prev}" value="Previous #{menus.pagingInfo.batchSize}" rendered="#{menus.pagingInfo.firstItem >= menus.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{menus.next}" value="Next #{menus.pagingInfo.batchSize}" rendered="#{menus.pagingInfo.lastItem + menus.pagingInfo.batchSize <= menus.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{menus.next}" value="Remaining #{menus.pagingInfo.itemCount - menus.pagingInfo.lastItem}"
                       rendered="#{menus.pagingInfo.lastItem < menus.pagingInfo.itemCount && menus.pagingInfo.lastItem + menus.pagingInfo.batchSize > menus.pagingInfo.itemCount}"/>
        <h:dataTable value="#{menus.menusItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
          <h:column>
            <f:facet name="header">
              <h:outputText value="Id"/>
            </f:facet>
            <h:outputText value="#{item.id}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="IdPadre"/>
            </f:facet>
            <h:outputText value="#{item.idPadre}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Descripcion"/>
            </f:facet>
            <h:outputText value="#{item.descripcion}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Enlace"/>
            </f:facet>
            <h:outputText value="#{item.enlace}"/>
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
            <h:commandLink value="Show" action="#{menus.detailSetup}">
              <f:param name="jsfcrud.currentMenus" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][menus.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{menus.editSetup}">
              <f:param name="jsfcrud.currentMenus" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][menus.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{menus.remove}">
              <f:param name="jsfcrud.currentMenus" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][menus.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{menus.createSetup}" value="New Menus"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
