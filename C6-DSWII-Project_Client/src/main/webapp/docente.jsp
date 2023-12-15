
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.*"%>
    <%@page import="Modelo.Docente"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!--Importamos bootstrap-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    
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

 


	</br>
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
                <th align="center">Código</th>
                <th align="center">Nombres</th>
                <th align="center">A.Paterno</th>
                <th align="center">A.Materno</th>
                <th align="center">Sexo</th>
                <th align="center">Hijos</th>
                <th align="center">Sueldo</th>
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
		            <%
		List<Docente> listado =(List<Docente>)request.getAttribute("listado");
		//Aplicamos una condicion , si es diferente de null osea si hay data de listado
		if(listado != null){
			//aplicamos un bucle for... lis almacena lo de listado
			for(Docente lis: listado){
				%>
				<tr>
				<td align="center"><%=lis.getCodigo() %></td>
				<td align="center"><%=lis.getNombres() %></td>
				<td align="center"><%=lis.getPaterno() %></td>
				<td align="center"><%=lis.getMaterno() %></td>
				<td align="center"><%=lis.getSexo() %></td>
				<td align="center"><%=lis.getHijos() %></td>
				<td align="center"><%=lis.getSueldo() %></td>
				<!-- <td align="center">Actualizar</td>
				
				<td align="center">Eliminar</td> -->
			
				<%-- <td align="center"><a href="ControladorDocente?accion=Buscar&codigo=<%=lis.getCodigo() %>"><img src="imagenes/Update.png" width="30px" height="30px"></a></td>
				<td align="center"><a id="eliminar" href="ControladorDocente?accion=Eliminar&codigo=<%=lis.getCodigo() %>"><img src="imagenes/Delete.png" width="30px" height="30px"></a><input type="hidden" id="codigo" value="<%=lis.getCodigo() %>"></td> --%>
				
				    <!-- <td align="center"><button type="button" class="btn btn-info btn-editar" data-toggle="modal" data-target="#modalDocente">Editar</button></td> -->
				    <td align="center">
					  <button type="button" class="btn btn-info btn-editar" data-toggle="modal" data-target="#modalDocente">
					<a href="ControladorDocente?accion=Buscar&codigo=<%=lis.getCodigo() %>" style="color: white;">Editar</a> 
					    <!-- <a  style="color: white;">Editar</a> -->
					  </button>
					</td>
				    
				    <td align="center">
				    <!-- <button type="button" class="btn btn-danger btn-eliminar" data-toggle="modal" data-target="#modalEliminar" > -->
				    
				    <a id="eliminar" href="ControladorDocente?accion=Eliminar&codigo=<%=lis.getCodigo() %>" style="color: white;">
				    <button type="button" class="btn btn-danger btn-eliminar" >Eliminar</button></a>
				    <input type="hidden" id="cod" value="<%=lis.getCodigo() %>">
				    
				    
				    </td>
				</tr>
				<%
			}//fin de for
			
			
		}//fin de if
		%>
            
            
            
         </tbody>
         <!--FIN de tbody  --> 
    </table>
    
     	<!-- MENSAJE -->
		 	<% 
		 	String successMessage = (String)request.getAttribute("successMessage");
		 	String men = "";
		 	
			  if (successMessage != null ) {
				 men = successMessage;
			  }
			%>
			  <div align="center"  id="successMessage"  style="display: none;" >
			   <%=men%>
			  </div>
		  <!-- MENSAJE -->
		  
		
		  
		  
		  
		  
		
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
		<form id="idRegistrar" action="ControladorDocente" method="post">
		<!--Para codigo y no visualizar llamamos solo al input y, le pondremos hidden-->
		<input type="hidden" class="form-control" id="idCodigo" name="codigo">
		<!-- FIN DE PARA CODIGO -->
		  <div class="form-group">
		    <label for="exampleInputNombre1">Nombre</label>
		    <!-- input type text por que sera una caja y asignamos name para reconocerlos en Servlet y para la validación  -->
		    <input type="text" class="form-control" id="idNombre" name="nombre" placeholder="Ingresar nombre" >
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="toastr.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

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
//-----------------------INICIO Para buscar 
//----------Con el que tiene la clase btn-editar, osea el boton que hace la actualizacion
	$(document).on("click",".btn-editar",function(e){
		e.preventDefault();//evitar que se recargue doble
		//Cogemos de las filas el de la columna 0 que es el codigo 
		var codigo = $(this).parents("tr").find("td")[0].innerHTML;
		//Llamamos al metodo buscarcliente a partir de codigo,pero como esta variable var de tipo
		//codigo almacena el codigo de la fila, buscamos por ese campo y el metodo buscarCliente
		//esta abajo que luego q busca por codigo asigna los datos a los inputs por medio del id
	    buscarDocente(codigo);
	
	})

		//Metodo buscarDocente a partir de codigo
		//se le quito la ruta desde la tabla pero se obtiene con 
		//esta linea el code
		//var codigo = $(this).parents("tr").find("td")[0].innerHTML;
	function buscarDocente(codigo) {
		var url="ControladorDocente?accion=Buscar&codigo="+codigo;
		//usamos ajax
	    $.ajax({
	    	//nos dirigimos en la parte de get del controlador docente
	        type: "GET",
	        url: url,
	        async:true,
	        success: function(response){
	        	console.log(response);
	        	//creamos variable cliente que es igual al JSON que viene del controladordocente
	        	var docente = response;
	        	//asignamos lo obtenido del JSON a los inputs por medio de su id
	        	//donde variable docente es solo referencial pero luego del punto si se pone
	        	//campos propios declarados en el modelo Docente
	            $("#idCodigo").val(docente.codigo);
	            $("#idNombre").val(docente.nombres);
	            $("#idPaterno").val(docente.paterno);
	            $("#idMaterno").val(docente.materno);
	            $("#idHijos").val(docente.hijos);
	            $("#idSueldo").val(docente.sueldo);
	            $("#idSexo").val(docente.sexo);
	        },
	        //en caso no traia JSON  en el response dara error
	        error: function(response){
	            alert("Error al buscar el Docente");
	        }
	    });
	}





//---------------------------FIN DE BUSCAR

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
<script>
	 /* Agrega este script para ocultar el mensaje despu de 5 segundos */
 setTimeout(function() { 
       // document.getElementById('successMessage').style.display = 'none';
	 document.getElementById('successMessage').style.display = 'none';
    }, 100);

  // Obt el valor de idSolicitud desde el elemento span
   // var mensaje = document.getElementById('successMessage').innerText.trim();
   var mensaje = document.getElementById('successMessage').innerText.trim();
    // Muestra el toast con el mensaje 
    if(mensaje  == null || mensaje == "" ){
    	console.log("Blah");
    }else if(mensaje == "GUARDADO"){
    	 toastr.success(mensaje);
    	 console.log("Si hay guardado");
    } else{
    	toastr.info(mensaje);
    	console.log("Si hay actualizado");
    }
   
	</script>
<script>
//Para eliminar
//Eliminar AJAX en base al de id eliminar y el de id cod del boton eliminar
	$(document).ready(function(){
		//$("tr #eliminar").click(function(y){
		$("#tableDocentes").on("click", "tr #eliminar", function(y) { //Al cambiar
			//de paginacion solo eliminaba a los 10 primeros, con esto delegamos
			//que sera del cambio de paginacion de tableDocentes para eliminar
			y.preventDefault();
			var cod=$(this).parent().find("#cod").val();
		    Swal.fire({
			  title: 'Eliminar Docente',
			  text: "¿Usted Desea Eliminar el Docente?",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'SI, ELIMINAR DOCENTE',
			  cancelButtonText:'Cancelar'
			}).then((result) => {
			  if (result.isConfirmed) {
				  eliminardoce(cod);
				  setTimeout(function(){
				  parent.location="ControladorDocente"
				  },1000)
			  }
			})
		})
		//esto lo llamamos en la linea de arriba en el if del result.isconfirmed
		function eliminardoce(cod){
			var codigo=Number(cod);
			var url="ControladorDocente?accion=Eliminar&codigo="+codigo;
			$.ajax({
				url:url,
				async:true,
				success:function(r){
					console.log(r)	
				}
			})
		}
	})

</script>

<!-- FIN DE BLOQUES SCRIPT -->
</body>
</html>