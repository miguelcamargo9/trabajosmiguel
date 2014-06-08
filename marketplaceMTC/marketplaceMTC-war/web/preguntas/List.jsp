<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Preguntas Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Preguntas Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Preguntas Items Found)<br />" rendered="#{preguntas.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{preguntas.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{preguntas.pagingInfo.firstItem + 1}..#{preguntas.pagingInfo.lastItem} of #{preguntas.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{preguntas.prev}" value="Previous #{preguntas.pagingInfo.batchSize}" rendered="#{preguntas.pagingInfo.firstItem >= preguntas.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{preguntas.next}" value="Next #{preguntas.pagingInfo.batchSize}" rendered="#{preguntas.pagingInfo.lastItem + preguntas.pagingInfo.batchSize <= preguntas.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{preguntas.next}" value="Remaining #{preguntas.pagingInfo.itemCount - preguntas.pagingInfo.lastItem}"
                       rendered="#{preguntas.pagingInfo.lastItem < preguntas.pagingInfo.itemCount && preguntas.pagingInfo.lastItem + preguntas.pagingInfo.batchSize > preguntas.pagingInfo.itemCount}"/>
        <h:dataTable value="#{preguntas.preguntasItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
          <h:column>
            <f:facet name="header">
              <h:outputText value="Id"/>
            </f:facet>
            <h:outputText value="#{item.id}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Pregunta"/>
            </f:facet>
            <h:outputText value="#{item.pregunta}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Respuesta"/>
            </f:facet>
            <h:outputText value="#{item.respuesta}"/>
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
              <h:outputText value="IdUsuario"/>
            </f:facet>
            <h:outputText value="#{item.idUsuario}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText escape="false" value="&nbsp;"/>
            </f:facet>
            <h:commandLink value="Show" action="#{preguntas.detailSetup}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{preguntas.editSetup}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{preguntas.remove}">
              <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{preguntas.createSetup}" value="New Preguntas"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
