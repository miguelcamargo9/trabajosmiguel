<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Editing Usuarios</title>
      <link rel="stylesheet" type="text/css" href="/marketplaceMTC-war/faces/jsfcrud.css" />
    </head>
    <body>
    <h:panelGroup id="messagePanel" layout="block">
      <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
    </h:panelGroup>
    <h1>Editing Usuarios</h1>
    <h:form>
      <h:panelGrid columns="2">
        <h:outputText value="Id:"/>
        <h:outputText value="#{usuarios.usuarios.id}" title="Id" />
        <h:outputText value="PrimerNombre:"/>
        <h:inputText id="primerNombre" value="#{usuarios.usuarios.primerNombre}" title="PrimerNombre" />
        <h:outputText value="SegundoNombre:"/>
        <h:inputText id="segundoNombre" value="#{usuarios.usuarios.segundoNombre}" title="SegundoNombre" />
        <h:outputText value="PrimerApellido:"/>
        <h:inputText id="primerApellido" value="#{usuarios.usuarios.primerApellido}" title="PrimerApellido" />
        <h:outputText value="SegundoApellido:"/>
        <h:inputText id="segundoApellido" value="#{usuarios.usuarios.segundoApellido}" title="SegundoApellido" />
        <h:outputText value="NombreComercial:"/>
        <h:inputText id="nombreComercial" value="#{usuarios.usuarios.nombreComercial}" title="NombreComercial" />
        <h:outputText value="Nickname:"/>
        <h:inputText id="nickname" value="#{usuarios.usuarios.nickname}" title="Nickname" required="true" requiredMessage="The nickname field is required." />
        <h:outputText value="Contrasena:"/>
        <h:inputText id="contrasena" value="#{usuarios.usuarios.contrasena}" title="Contrasena" required="true" requiredMessage="The contrasena field is required." />
        <h:outputText value="Correo:"/>
        <h:inputText id="correo" value="#{usuarios.usuarios.correo}" title="Correo" />
        <h:outputText value="IdPerfil:"/>
        <h:inputText id="idPerfil" value="#{usuarios.usuarios.idPerfil}" title="IdPerfil" />
        <h:outputText value="Estado:"/>
        <h:inputText id="estado" value="#{usuarios.usuarios.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
        <h:outputText value="PaquetesList:"/>
        <h:selectManyListbox id="paquetesList" value="#{usuarios.usuarios.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].paquetesList}" title="PaquetesList" size="6" converter="#{paquetes.converter}" >
          <f:selectItems value="#{paquetes.paquetesItemsAvailableSelectMany}"/>
        </h:selectManyListbox>
        <h:outputText value="PreguntasList:"/>
        <h:selectManyListbox id="preguntasList" value="#{usuarios.usuarios.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].preguntasList}" title="PreguntasList" size="6" converter="#{preguntas.converter}" >
          <f:selectItems value="#{preguntas.preguntasItemsAvailableSelectMany}"/>
        </h:selectManyListbox>
        <h:outputText value="PreguntasList1:"/>
        <h:selectManyListbox id="preguntasList1" value="#{usuarios.usuarios.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].preguntasList1}" title="PreguntasList1" size="6" converter="#{preguntas.converter}" >
          <f:selectItems value="#{preguntas.preguntasItemsAvailableSelectMany}"/>
        </h:selectManyListbox>
        <h:outputText value="TransaccionesList:"/>
        <h:selectManyListbox id="transaccionesList" value="#{usuarios.usuarios.jsfcrud_transform[jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method.arrayToList].transaccionesList}" title="TransaccionesList" size="6" converter="#{transacciones.converter}" >
          <f:selectItems value="#{transacciones.transaccionesItemsAvailableSelectMany}"/>
        </h:selectManyListbox>

      </h:panelGrid>
      <br />
      <h:commandLink action="#{usuarios.edit}" value="Save">
        <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <br />
      <h:commandLink action="#{usuarios.detailSetup}" value="Show" immediate="true">
        <f:param name="jsfcrud.currentUsuarios" value="#{jsfcrud_class['com.marketplaceMTC.vista.managedbeans.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuarios.usuarios][usuarios.converter].jsfcrud_invoke}"/>
      </h:commandLink>
      <br />
      <h:commandLink action="#{usuarios.listSetup}" value="Show All Usuarios Items" immediate="true"/>
      <br />
      <br />
      <h:commandLink value="Index" action="welcome" immediate="true" />

    </h:form>
    </body>
  </html>
</f:view>
