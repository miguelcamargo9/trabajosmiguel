/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var req;
var isIE;

function init(){
  campoCompletar = document.getElementById("buscarPersona");
}

function BuscarPersona(){
  var url = "buscarServlet?action=completar&id="+escape(campoCompletar.value);
  req = initRequest();
  req.open("GET", url, true);
  req.onreadystatechange = callback;
  req.send(null);
  
}

function initRequest(){
  if(window.XMLHttpRequest){
    if(navigator.userAgent.indexOF('MSIE') != -1){
      isIE = true;
    }
    return new XMLHttpRequest();
  }else if(window.ActiveXObject){
    idIE = true;
    return new ActiveXObject("Microsoft.XMLHTTP")
  }
}