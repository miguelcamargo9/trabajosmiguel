<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Listing Usuarios Items</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Listing Usuarios Items</h1>
    <h:form styleClass="jsfcrud_list_form">
      <h:outputText escape="false" value="(No Usuarios Items Found)<br />" rendered="#{usuarios.pagingInfo.itemCount == 0}" />
      <h:panelGroup rendered="#{usuarios.pagingInfo.itemCount > 0}">
        <h:outputText value="Item #{usuarios.pagingInfo.firstItem + 1}..#{usuarios.pagingInfo.lastItem} of #{usuarios.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{usuarios.prev}" value="Previous #{usuarios.pagingInfo.batchSize}" rendered="#{usuarios.pagingInfo.firstItem >= usuarios.pagingInfo.batchSize}"/>&nbsp;
        <h:commandLink action="#{usuarios.next}" value="Next #{usuarios.pagingInfo.batchSize}" rendered="#{usuarios.pagingInfo.lastItem + usuarios.pagingInfo.batchSize <= usuarios.pagingInfo.itemCount}"/>&nbsp;
        <h:commandLink action="#{usuarios.next}" value="Remaining #{usuarios.pagingInfo.itemCount - usuarios.pagingInfo.lastItem}"
                       rendered="#{usuarios.pagingInfo.lastItem < usuarios.pagingInfo.itemCount && usuarios.pagingInfo.lastItem + usuarios.pagingInfo.batchSize > usuarios.pagingInfo.itemCount}"/>
        <h:dataTable value="#{usuarios.usuariosItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
          <h:column>
            <f:facet name="header">
              <h:outputText value="Id"/>
            </f:facet>
            <h:outputText value="#{item.id}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="PrimerNombre"/>
            </f:facet>
            <h:outputText value="#{item.primerNombre}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="SegundoNombre"/>
            </f:facet>
            <h:outputText value="#{item.segundoNombre}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="PrimerApellido"/>
            </f:facet>
            <h:outputText value="#{item.primerApellido}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="SegundoApellido"/>
            </f:facet>
            <h:outputText value="#{item.segundoApellido}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="NombreComercial"/>
            </f:facet>
            <h:outputText value="#{item.nombreComercial}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Nickname"/>
            </f:facet>
            <h:outputText value="#{item.nickname}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Contrasena"/>
            </f:facet>
            <h:outputText value="#{item.contrasena}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="Correo"/>
            </f:facet>
            <h:outputText value="#{item.correo}"/>
          </h:column>
          <h:column>
            <f:facet name="header">
              <h:outputText value="IdPerfil"/>
            </f:facet>
            <h:outputText value="#{item.idPerfil}"/>
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
            <h:commandLink value="Show" action="#{usuarios.detailSetup}">
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuarios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{usuarios.editSetup}">
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuarios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{usuarios.remove}">
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuarios.converter].jsfcrud_invoke}"/>
            </h:commandLink>
          </h:column>

        </h:dataTable>
      </h:panelGroup>
      <br />
      <h:commandLink action="#{usuarios.createSetup}" value="New Usuarios"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />


    </h:form>
    </body>
  </html>
</f:view>
