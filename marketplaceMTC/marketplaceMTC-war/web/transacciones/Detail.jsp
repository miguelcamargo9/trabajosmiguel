<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Transacciones Detail</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Transacciones Detail</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{transacciones.transacciones.id}" title="Id" />
        <h:outputText value="FechaTransaccion:"/>
        <h:outputText value="#{transacciones.transacciones.fechaTransaccion}" title="FechaTransaccion" >
          <f:convertDateTime pattern="MM/dd/yyyy" />
        </h:outputText>
        <h:outputText value="IdUsuario:"/>
        <h:panelGroup>
          <h:outputText value="#{transacciones.transacciones.idUsuario}"/>
          <h:panelGroup rendered="#{transacciones.transacciones.idUsuario != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{usuarios.detailSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idUsuario][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{usuarios.editSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idUsuario][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{usuarios.destroy}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idUsuario][usuarios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>
        <h:outputText value="IdServicio:"/>
        <h:panelGroup>
          <h:outputText value="#{transacciones.transacciones.idServicio}"/>
          <h:panelGroup rendered="#{transacciones.transacciones.idServicio != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{servicios.detailSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idServicio][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{servicios.editSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idServicio][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{servicios.destroy}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentServicios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idServicio][servicios.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>
        <h:outputText value="IdPaquete:"/>
        <h:panelGroup>
          <h:outputText value="#{transacciones.transacciones.idPaquete}"/>
          <h:panelGroup rendered="#{transacciones.transacciones.idPaquete != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{paquetes.detailSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{paquetes.editSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{paquetes.destroy}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentPaquetes" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idPaquete][paquetes.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>
        <h:outputText value="IdOferta:"/>
        <h:panelGroup>
          <h:outputText value="#{transacciones.transacciones.idOferta}"/>
          <h:panelGroup rendered="#{transacciones.transacciones.idOferta != null}">
            <h:outputText value=" ("/>
            <h:commandLink value="Show" action="#{ofertas.detailSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idOferta][ofertas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Edit" action="#{ofertas.editSetup}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idOferta][ofertas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" "/>
            <h:commandLink value="Destroy" action="#{ofertas.destroy}">
              <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.currentOfertas" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones.idOferta][ofertas.converter].jsfcrud_invoke}"/>
              <f:param name="jsfcrud.relatedController" value="transacciones"/>
              <f:param name="jsfcrud.relatedControllerType" value="com.marketplaceMTC.vista.managedbeans.TransaccionesController"/>
            </h:commandLink>
            <h:outputText value=" )"/>
          </h:panelGroup>
        </h:panelGroup>


      </h:panelGrid>
      <br />
      <h:commandLink action="#{transacciones.remove}" value="Destroy">
        <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{transacciones.editSetup}" value="Edit">
        <f:param name="jsfcrud.currentTransacciones" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][transacciones.transacciones][transacciones.converter].jsfcrud_invoke}" />
      </h:commandLink>
      <br />
      <h:commandLink action="#{transacciones.createSetup}" value="New Transacciones" />
      <br />
      <h:commandLink action="#{transacciones.listSetup}" value="Show All Transacciones Items"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
