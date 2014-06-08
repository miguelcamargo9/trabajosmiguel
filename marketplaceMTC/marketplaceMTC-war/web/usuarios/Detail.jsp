<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Usuarios Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Usuarios Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{usuarios.usuarios.id}" title="Id" />
        <h:outputText value="PrimerNombre:"/>
        <h:outputText value="#{usuarios.usuarios.primerNombre}" title="PrimerNombre" />
        <h:outputText value="SegundoNombre:"/>
        <h:outputText value="#{usuarios.usuarios.segundoNombre}" title="SegundoNombre" />
        <h:outputText value="PrimerApellido:"/>
        <h:outputText value="#{usuarios.usuarios.primerApellido}" title="PrimerApellido" />
        <h:outputText value="SegundoApellido:"/>
        <h:outputText value="#{usuarios.usuarios.segundoApellido}" title="SegundoApellido" />
        <h:outputText value="NombreComercial:"/>
        <h:outputText value="#{usuarios.usuarios.nombreComercial}" title="NombreComercial" />
        <h:outputText value="Nickname:"/>
        <h:outputText value="#{usuarios.usuarios.nickname}" title="Nickname" />
        <h:outputText value="Contrasena:"/>
        <h:outputText value="#{usuarios.usuarios.contrasena}" title="Contrasena" />
        <h:outputText value="Correo:"/>
        <h:outputText value="#{usuarios.usuarios.correo}" title="Correo" />
        <h:outputText value="IdPerfil:"/>
        <h:outputText value="#{usuarios.usuarios.idPerfil}" title="IdPerfil" />
        <h:outputText value="Estado:"/>
        <h:outputText value="#{usuarios.usuarios.estado}" title="Estado" />

        <h:outputText value="PaquetesList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty usuarios.usuarios.paquetesList}" value="(No Items)"/>
          <h:dataTable value="#{usuarios.usuarios.paquetesList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty usuarios.usuarios.paquetesList}">
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
                <h:outputText value="Valor"/>
              </f:facet>
              <h:outputText value="#{item.valor}"/>
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
                <h:outputText escape="false" value="&nbsp;"/>
              </f:facet>
              <h:commandLink value="Show" action="#{paquetes.detailSetup}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{paquetes.editSetup}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{paquetes.destroy}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paquetes.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>
        <h:outputText value="PreguntasList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty usuarios.usuarios.preguntasList}" value="(No Items)"/>
          <h:dataTable value="#{usuarios.usuarios.preguntasList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty usuarios.usuarios.preguntasList}">
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
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{preguntas.editSetup}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{preguntas.destroy}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>
        <h:outputText value="PreguntasList1:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty usuarios.usuarios.preguntasList1}" value="(No Items)"/>
          <h:dataTable value="#{usuarios.usuarios.preguntasList1}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty usuarios.usuarios.preguntasList1}">
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
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{preguntas.editSetup}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{preguntas.destroy}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentPreguntas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][preguntas.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>
        <h:outputText value="TransaccionesList:" />
        <h:panelGroup>
          <h:outputText rendered="#{empty usuarios.usuarios.transaccionesList}" value="(No Items)"/>
          <h:dataTable value="#{usuarios.usuarios.transaccionesList}" var="item" 
                       border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                       rendered="#{not empty usuarios.usuarios.transaccionesList}">
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
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Edit" action="#{transacciones.editSetup}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
              <h:outputText value=" "/>
              <h:commandLink value="Destroy" action="#{transacciones.destroy}">
                <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][transacciones.converter].jsfcrud_invoke}"/>
                <f:param name="jsfcrud.relatedController" value="usuarios" />
                <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.UsuariosController" />
              </h:commandLink>
            </h:column>
          </h:dataTable>
        </h:panelGroup>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{usuarios.remove}" value="Destroy">
        <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{usuarios.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{usuarios.createSetup}" value="New Usuarios" />
      <br />
      <h:commandLink action="#{usuarios.listSetup}" value="Show All Usuarios Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
