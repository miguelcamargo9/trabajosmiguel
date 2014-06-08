<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Ofertas Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Ofertas Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Ofertas Items Found)<br />" rendered="#{ofertas.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{ofertas.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{ofertas.pagingInfo.firstItem + 1}..#{ofertas.pagingInfo.lastItem} of #{ofertas.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{ofertas.prev}" value="Previous #{ofertas.pagingInfo.batchSize}" rendered="#{ofertas.pagingInfo.firstItem >= ofertas.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{ofertas.next}" value="Next #{ofertas.pagingInfo.batchSize}" rendered="#{ofertas.pagingInfo.lastItem + ofertas.pagingInfo.batchSize <= ofertas.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{ofertas.next}" value="Remaining #{ofertas.pagingInfo.itemCount - ofertas.pagingInfo.lastItem}"
                       rendered="#{ofertas.pagingInfo.lastItem < ofertas.pagingInfo.itemCount && ofertas.pagingInfo.lastItem + ofertas.pagingInfo.batchSize > ofertas.pagingInfo.itemCount}"/>
        <h:dataTable value="#{ofertas.ofertasItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
              <h:outputText value="FechaInicial"/>
            </f:facet>
            <h:outputText value="#{item.fechaInicial}">
              <f:convertDateTime pattern="MM/dd/yyyy" />
            </h:outputText>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="FechaFinal"/>
            </f:facet>
            <h:outputText value="#{item.fechaFinal}">
              <f:convertDateTime pattern="MM/dd/yyyy" />
            </h:outputText>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Valor"/>
            </f:facet>
            <h:outputText value="#{item.valor}"/>
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
            <h:commandLink value="Show" action="#{ofertas.detailSetup}">
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ofertas.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{ofertas.editSetup}">
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ofertas.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{ofertas.remove}">
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][ofertas.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{ofertas.createSetup}" value="New Ofertas"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
