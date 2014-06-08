<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Archivosadjuntos Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Archivosadjuntos Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Archivosadjuntos Items Found)<br />" rendered="#{archivosadjuntos.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{archivosadjuntos.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{archivosadjuntos.pagingInfo.firstItem + 1}..#{archivosadjuntos.pagingInfo.lastItem} of #{archivosadjuntos.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{archivosadjuntos.prev}" value="Previous #{archivosadjuntos.pagingInfo.batchSize}" rendered="#{archivosadjuntos.pagingInfo.firstItem >= archivosadjuntos.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{archivosadjuntos.next}" value="Next #{archivosadjuntos.pagingInfo.batchSize}" rendered="#{archivosadjuntos.pagingInfo.lastItem + archivosadjuntos.pagingInfo.batchSize <= archivosadjuntos.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{archivosadjuntos.next}" value="Remaining #{archivosadjuntos.pagingInfo.itemCount - archivosadjuntos.pagingInfo.lastItem}"
                       rendered="#{archivosadjuntos.pagingInfo.lastItem < archivosadjuntos.pagingInfo.itemCount && archivosadjuntos.pagingInfo.lastItem + archivosadjuntos.pagingInfo.batchSize > archivosadjuntos.pagingInfo.itemCount}"/>
        <h:dataTable value="#{archivosadjuntos.archivosadjuntosItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
          <h:column>
            <f:facet name="header">
              <h:outputText value="Id"/>
            </f:facet>
            <h:outputText value="#{item.id}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="IdArchivo"/>
            </f:facet>
            <h:outputText value="#{item.idArchivo}"/>
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
            <h:commandLink value="Show" action="#{archivosadjuntos.detailSetup}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{archivosadjuntos.editSetup}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{archivosadjuntos.remove}">
              <f:param name="jsfcrud.currentArchivosadjuntos" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][archivosadjuntos.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{archivosadjuntos.createSetup}" value="New Archivosadjuntos"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
