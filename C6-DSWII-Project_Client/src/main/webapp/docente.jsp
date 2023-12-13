<!--Importamos de jstl el core para lenguaje de expresion  $ { } y le asignamos un prefijo u objeto  
c dond usarmeos las etiquetas del core por medio del prefijo c-->

<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--FIN DE IMPORTACION  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!--Importamos bootstrap-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <!-- Fin de Bootstrap -->
   <!-- Estilo de la tabla -->
   <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap4.min.css">
   <!-- Fin del estilo de tabla -->
<title>Docente</title>
<!-- Creamos style para css -->
<style type="text/css">
/*Aqui con este modal-header damos estilo al contenedor del titulo REGISTRAR DOCENTE */
.modal-header{
color:#fff;
background:#428bca;
display:flex;
justify-content:center;
}
/*Esto de aqui abajo son para el color de errores de validacion*/
.help-block{
color:red;
}
.form-group.has-error .form-control-label{
color:red;
}
.form-group.has-error .form-control{
border:1px solid red;
box-shadow: 0 0 0 0.2rem rgba(250,16,0,0.18);
}
</style>
<!-- FIN DEL CSS -->
</head>
<body>
<!-- Contenido centrado y con margens con container -->
<div class="container">
<!------ Para el alert de bootstrap -->
<!-- Validamos con JSTL de la libreria core donde si existe atributo se muestre 
y si no existe no se muestre, el atributo que almacena los mensajes que queremos que se muestre 
del servlet docente vienen asi request. setAttribute("MENSAJE","Error al actualizar..." )
por medio de la variable o atributo  MENSAJE  quien contiene el texto-->
<!-- El servlet envia respuestas por medio de un atributo a la vista, y el alert este sera visible
siempre y cuando exista el atributo MENSAJE que viene del ServletDocente -->

<!-- Validaremos con if del JSTL que es c : if, donde dentro del test se hará una evaluación -->
<!-- Recuperamos con requestScope el atributo MENSAJE del servlet y decimos que si es diferente de null 
osea trae algo entonces mostrar en el alert de bootstrap,caso contrario si MENSAJE es null no se muestra-->
<c:if test="${requestScope.MENSAJE !=null }"> 
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
	<!-- Para imprimir el valor de MENSAJE que viene de ServletDocente lo llamamos asi -->
	  <strong>${requestScope.MENSAJE}</strong>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	
</c:if>
<!-----FIN DEL ALERT DE BOOTSTRAP  -->
  <h2 class="text-center" >Listado de Docentes</h2>
  <!-- Insertamos boton -->
  <!-- Agregamos a boton data-toggle que es model y agregamos data-target que hara la conexion con el nombre o id del model de abajo-->
  <!-- Agregamos idNuevo para asignarle al input de codigo-> 0 para que agregue y no de error 
  el cual sirve para la validacion del servlet bean.getCodigo()==0 e use agregar , en caso codigo
  tenga info se ira a actualizar o updatear , le asignaremos un evento de click para que se ponga el input con 0 
  internamente ya que esa caja estará oculta-->
  <button type="button" class="btn btn-primary" id="idNuevo"  data-toggle="modal" data-target="#modalDocente">Nuevo Docente</button>
  <!-- ESPACIADO  class mt-4 es margen superior de 4 para toda la tabla -->
  <div class="mt-4">
  <!-- INICIO DE LA TABLA y asignamos id tableDocentes -->
  <table id="tableDocentes" class="table table-striped table-bordered" style="width:100%">
  		<!-- thead seria para el nombre de las columnas o encabezado -->
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombres</th>
                <th>Paterno</th>
                <th>Materno</th>
                <th>Sexo</th>
                <th>Hijos</th>
                <th>Sueldo</th>
                <!-- Creamos 2 th para los botones -->
                <th></th>
                <th></th>
            </tr>
        </thead>
        <!-- Dentro del cuerpo creamos tr que es una fila y td es celda dentro de la fila -->
        <tbody>
        <!-- Bucle para realizar recorrido sobre el atributo "docentes" de forma antigua
        for (Alumno a: lista){
        System.out.println(a.getCodigo());
        }
         -->
         <!-- con c que es prefijo de Core llamamos al metodo forEach, el foreach tiene un atributo items
         por el cual dentro de " " ,llamamos al atributo que viene del servlet que este caso es docentes que almacena
         la lista -->
         <!-- El lenguaje de expresion inicia con $ { } y dentro de las llaves ponemos requestScope por que en servlet
         el atributo docentes que almacena la variable lista fue llamado de un request y creamos una variable row de tipo var 
         para llamar a los campos de la lista que trae el requestScope.docentes,tambien row es un objeto de la lista que
         trae requestScope.docentes -->
         
         <c:forEach var="row" items="${listado}" >
            <tr>
            <!-- llamamos con $ { } y con el objeto row llamamos a los campos de la lista que trae el requestScope.docentes 
            y llamamos en orden en base a las columnas pero las variables despues del row. la sacamos del paquete entidad Docente
             los atributos declarados en la clase Docente del paquete entidad de ahi sacamos estos nombres de abajo-->
              	<td>${row.codigo}</td>
                <td>${row.nombres}</td>
                <td>${row.paterno}</td>
                <td>${row.materno}</td>
                <td>${row.sexo}</td>
                <td>${row.hijos}</td>
                <td>${row.sueldo}</td> 
               
                
                
                
                
                <!-- Creamos 2 td para los botones y para el boton Editar agregamos data-toggle y data-target
                para que aparezca el modal del agregar -->
                <!-- Asignamos btn-editar es una clase que nos ayudará para relacionar e usarlo en script de abajo -->
                <td><button type="button" class="btn btn-info btn-editar" data-toggle="modal" data-target="#modalDocente">Editar</button></td>
                <!-- Asignamos btn-eliminar es una clase que nos ayudará para relacionar e usarlo en script de abajo -->
                <td><button type="button" class="btn btn-danger btn-eliminar" data-toggle="modal" data-target="#modalEliminar" >Eliminar</button></td>
            </tr>
            </c:forEach>
         </tbody>
         <!--FIN de tbody  --> 
    </table>
  <!-- FIN DE LA TABLA -->
  </div>
  <!-- FIN DEL DIV MT-4 para margen superior de 4 -->
  <!-- INICIO Modal para que al darle nuevo docente aparezca campos a rellenar -->
  <!-- el id es el identificador del div , le ponemos nombre modalDocente -->
<div class="modal fade" id="modalDocente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <!-- Agregamos para que este centrado el modal el modal-dialog centered -->
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      <!-- Nombre del docente  -->
        <h5 class="modal-title" id="exampleModalLabel">DOCENTE</h5>
       <!-- Fin del nombre del docente -->
       <!-- Esto hace refeencia a un x para cerrar el modal, LO ELIMINAMOS o COMENTAMOS -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
        <!-- Fin del x de cerrar modal -->
      </div>
      <!-- Dentro del div class modal-body ponemos el formulario -->
      <div class="modal-body">
      <!-- Creamos el formulario form y agregamos id o identificador con el nombre de idRegistrar 
      Para el validator del script del ultimo-->
      <!-- FORMULARIO -->
      <!-- Al form agregamos action donde ira al ServletDocente y al parametro Tipo y elige GRABAR
      y asignamos methodo post para que no se vea en el URL -->
		<form id="idRegistrar" action="ServletDocente?TIPO=GRABAR" method="post">
		<!--Para codigo y no visualizar llamamos solo al input y, le pondremos hidden-->
		<input type="hidden" class="form-control" id="idCodigo" name="codigo">
		<!-- FIN DE PARA CODIGO -->
		  <div class="form-group">
		    <label for="exampleInputNombre1">Nombre</label>
		    <!-- input type text por que sera una caja y asignamos name para reconocerlos en Servlet y para la validación  -->
		    <input type="text" class="form-control" id="idNombre" name="nombre" placeholder="Ingresar nombre">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPaterno1">Paterno</label>
		    <input type="text" class="form-control" id="idPaterno" name="paterno" placeholder="Ingresar apellido paterno">
		  </div>
		   <div class="form-group">
		    <label for="exampleInputMaterno1">Materno</label>
		    <input type="text" class="form-control" id="idMaterno"  name="materno" placeholder="Ingresar apellido materno">
		  </div>
		   <div class="form-group">
		    <label for="exampleInputHijos1">Hijos</label>
		    <input type="text" class="form-control" id="idHijos"  name="hijos" placeholder="Ingresar número de hijos">
		  </div>
		   <div class="form-group">
		    <label for="exampleInputSueldo1">Sueldo</label>
		    <input type="text" class="form-control" id="idSueldo" name="sueldo" placeholder="Ingresar Sueldo">
		  </div>
		  <!-- Para despegable -->
		  <div class="form-group">
		    <label for="exampleInputSueldo1">Sexo</label>
		    <!-- Para despegable con bootstrap con SELECT y asignamos id =idSexo -->
			  <select class="form-control" id="idSexo" name="sexo">
			  <!-- donde para Seleccione su value es vacio(espacio) es empty y agarra para la validación, y para los otros si tienen value-->
		      <option value=" ">[Seleccione Sexo...]</option>
		      <option value="Femenino">Femenino</option>
		      <option value="Masculino">Masculino</option>
		      </select>
		    <!-- Fin de despegable con bootstrap con SELECT -->
		  </div>
		  <!-- Creamos botones dentro de formulario -->
		   <div class="modal-footer">
		   <!-- para grabar le ponemos type submit para que active al formulario y active la validación de abajo -->
		   <!-- Cuando son varios como el boton editar y eliminar usar class , cuando es 1 o pocos usar id -->
		    <button type="submit" class="btn btn-primary">Grabar</button>
		    <!-- Asignamos idcerrar al boton cerrar para resetear las validaciones de bootstrap -->
	        <button type="button" class="btn btn-secondary" id="idCerrar"  data-dismiss="modal">Cerrar</button>
     	  </div>
		</form>
		<!-- FIN DEL FORMULARIO FORM -->
      </div>
      <!-- FIN del div class modal-body -->
     
    </div>
  </div>
</div>
  <!-- FIN DEL MODAL -->
  <!-- -----------MODAL PARA ELIMINAR-------- -->
  <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <!-- Agregamos para que este centrado el modal el modal-dialog centered -->
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
      <!-- Nombre del Modal sera SISTEMA -->
        <h5 class="modal-title" id="exampleModalLabel">SISTEMA</h5>
       <!-- Fin del nombre del docente -->
       <!-- Esto hace refeencia a un x para cerrar el modal -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <!-- Fin del x de cerrar modal -->
      </div>
      <!-- Dentro del div class modal-body ponemos el formulario para la eliminacion -->
      <div class="modal-body">
      <!-- Creamos el formulario form y agregamos id o identificador con el nombre de idEliminar
      Para el validator del script del ultimo-->
      <!-- FORMULARIO -->
      <!-- Al form agregamos action donde ira al ServletDocente y al parametro Tipo y elige ELIMINAR
      y asignamos methodo post para que no se vea en el URL -->
		<form id="idRegistrar" action="ServletDocente?TIPO=ELIMINAR" method="post">
		<!-- En un formulario pueden ir en el name iguales pero en el id debe ser diferentes para cada formulario -->
		<!--Para codigo creamos input para obtener el codigo de la lista y asignarle por idCodigoEliminar
		el valor usando java script y evento click asi se vera en el input el codigo de la lista-->
		<!-- el name codigo sera para obtener el valor en el servlet y ejecutar el metodo eliminar -->
		<!-- Ponemos de tipo hidden para ocultar en el modal -->
		<input type="hidden" class="form-control" id="idCodigoEliminar" name="codigo">
		¿Seguro de Eliminar?
		<!-- FIN DE PARA CODIGO -->
		  <!-- Creamos botones dentro de formulario -->
		   <div class="modal-footer">
		   <!-- para eliminar le ponemos si y submit , lo cual activa el action del formulario 
		   usando el metodo eliminar del servlet -->
		    <button type="submit" class="btn btn-success">Si</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
     	  </div>
		</form>
		<!-- FIN DEL FORMULARIO FORM -->
      </div>
      <!-- FIN del div class modal-body -->
     
    </div>
  </div>
</div>
  <!-- -----------FIN DE MODAL PARA ELIMINAR-------- -->
</div>
<!-- Importamos más cosas que se necesitaran hasta mas campos para bootstrap esto sirve para paginacion y search y demás de la tabla junto a lo que esta en script -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap4.min.js"></script>
<!-- script para validar las cajas de texto --> 
<script src="https://cdn.bootcdn.net/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>

<!-- FIn del script validar -->
<!-- FIN DE MAS COSAS DE BOOTSTRAP -->
<!-- Bloque SCRIPTS -->
<script>
<!--Esto significa cuando la pagina(document) esta lista, lo de #example .dataTable se activará, donde tableDocentes el id de la tabla y aqui se creara para que tenga las caracteristicas de un DataTable-->
$(document).ready(function () {
    $('#tableDocentes').DataTable();
});
//PARA QUE AL DAR CLICK EDITAR, APAREZCA LOS DATOS DE LA FILA EN LAS CAJAS DE TEXTO
//Asignar evento click al boton con clase  btn-editar ponemos punto .btn-editar por que es una clase y necesitamos .
$(document).on("click",".btn-editar",function(){
	//variables
	var cod,nom,pat,mat,sexo,hijos,sue;
	//Obtener los valores de la fila actual segun el boton editar que se haya hecho click
	//$ this hace referencia al boton y parents para agarrar los td de la tr de la fila
	//donde tr es fila y td es celda y [0] lo que est dentro del [] significa el numero de columna a la que pertenece
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	nom=$(this).parents("tr").find("td")[1].innerHTML;
	pat=$(this).parents("tr").find("td")[2].innerHTML;
	mat=$(this).parents("tr").find("td")[3].innerHTML;
	sexo=$(this).parents("tr").find("td")[4].innerHTML;
	hijos=$(this).parents("tr").find("td")[5].innerHTML;
	sue=$(this).parents("tr").find("td")[6].innerHTML;
	//Mostrar los valores de las variables  en los controles que tengan identificar id
	//con val es para asignar valor
	$("#idCodigo").val(cod);
	$("#idNombre").val(nom);
	$("#idPaterno").val(pat);
	$("#idMaterno").val(mat);
	$("#idSexo").val(sexo);
	$("#idHijos").val(hijos);
	$("#idSueldo").val(sue);
	
})
//------------Para usar la clase btn-eliminar asignado al boton eliminar con evento click
$(document).on("click",".btn-eliminar",function(){
	//variables
	var cod;
	//Obtener los valores de la fila actual segun el boton eliminar que se haya hecho click
	//$ this hace referencia al boton y parents para agarrar los td de la tr de la fila
	//donde tr es fila y td es celda y [0] lo que est dentro del [] significa el numero de columna a la que pertenece
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	//Mostrar los valores de las variables  en los controles que tengan identificar id
	//con val es para asignar valor
	$("#idCodigoEliminar").val(cod);
	
})
//------------------FIN  de evento click de la clase  btn-eliminar
//----------------ASIGNAMOS EVENTO CLICK 
//PARA el boton cerrar para resetear las validaciones con id="idCerrar"-------------

$(document).on("click","#idCerrar",function(){
	//REINICIAR LA VALIDACIÓN al formulario con id "idRegistrar"
	//Donde #idRegistrar es el id del formulario de forma modal, el cual resetearemos las cajas de texto
	//validadas
	$('#idRegistrar').data("bootstrapValidator").resetForm(true);
	//Resetear limpiar cajas que existen en el formulario con idRegistrar 
	$('#idRegistrar').trigger("reset");
	//mostrar en la caja con ID idCodigo el valor de 0
	$('#idCodigo').val(0);

})

//------------------------FIN DEL BOTON CERRAR RESETEO DE VALIDACIONES

//------Asignamos evento CLICK al boton Nuevo Docente con idNuevo
$(document).on("click","#idNuevo",function(){
	//mostrar en la caja con ID idCodigo el valor de 0 para agregar y que en la validacion
	//if(bean.getCodigo()==0)  del servlet al ser 0 , agregará
	$('#idCodigo').val(0);

})
//FIN DE EVENTO CLICK DE NUEVO DOCENTE



</script>
<!-- Script para validar , donde el identificador es id=> idRegistrar el id del Formulario o form -->
<!--Luego dentro de fields ponemos los "name" de las cajas a validar -->
<script type="text/javascript">
$(document).ready(function(){
$('#idRegistrar').bootstrapValidator({
fields:{
		nombre:{
			validators:{
				//si la caja esta vacia es con notEmpty y con regexp ponemos expresion regular-
				notEmpty:{
					//este message se muestra si existe error 
					message:'Campo nombre es obligatorio'
				},
				//regexp es para RegExp
				regexp:{
					//Aqui ponemos expresion que acepte mayuscula y minuscula de la a a z, que acepte ñ Ñ
					//asi como tambien acepte vocales con acepte y que minimo sea 3 letras con / ^ inicia
					//con $ / finaliza
					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú]{3,}$/,
					//este message se muestra si existe error 
					message:'Campo nombre solo letras minimo 3'
					
				}
			}
		},
		paterno:{
			validators:{
				notEmpty:{
					message:'Campo paterno es obligatorio'
				},
				//regexp es para RegExp
				regexp:{
					//Aqui ponemos expresion que acepte mayuscula y minuscula de la a a z, que acepte ñ Ñ
					//asi como tambien acepte vocales con acepte y que minimo sea 3 letras con / ^ inicia
					//con $ / finaliza
					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú]{3,}$/,
					//este message se muestra si existe error 
					message:'Campo paterno solo letras minimo 3'
					
				}
			}
		},
		materno:{
			validators:{
				notEmpty:{
					message:'Campo materno es obligatorio'
				},
				//regexp es para RegExp
				regexp:{
					//Aqui ponemos expresion que acepte mayuscula y minuscula de la a a z, que acepte ñ Ñ
					//asi como tambien acepte vocales con acepte y que minimo sea 3 letras con / ^ inicia
					//con $ / finaliza
					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú]{3,}$/,
					//este message se muestra si existe error 
					message:'Campo materno solo letras minimo 3'
					
				}
			}
		},
		hijos:{
			validators:{
				notEmpty:{
					message:'Campo hijos es obligatorio'
				},
				//regexp es para RegExp
				regexp:{
					//Aqui ponemos expresion que acepte mayuscula y minuscula de la a a z, que acepte ñ Ñ
					//asi como tambien acepte vocales con acepte y que minimo sea 3 letras con / ^ inicia
					//con $ / finaliza
					regexp:/^[0-9]|[1][0]$/,
					//este message se muestra si existe error 
					message:'Campo hijos,solo números'
					
				}
			}
		},
		sueldo:{
			validators:{
				notEmpty:{
					message:'Campo sueldo es obligatorio'
				},
				//regexp es para RegExp
				regexp:{
					//Aqui ponemos expresion que acepte mayuscula y minuscula de la a a z, que acepte ñ Ñ
					//asi como tambien acepte vocales con acepte y que minimo sea 3 letras con / ^ inicia
					//con $ / finaliza
					regexp:/^(\d+)|(\d+\.\d{1,2})$/,
					//este message se muestra si existe error 
					message:'Campo sueldo, solo numeros'
					
				}
			}
		},
		sexo:{
			validators:{
				notEmpty:{
					message:'Seleccione Sexo'
				}
			}
		}
}
});

});
</script>

<!-- FIN DE BLOQUES SCRIPT -->
</body>
</html>