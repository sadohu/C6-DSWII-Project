package ServicioNube;
import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import Entidad.Docente;
import Service.DocenteServiceImpl;


//Agregamos ruta de Crud
@Path("/Crud")
public class ServicioDocente {
	
	//Instanciamos la respectiva clase de implement para crear el servicio.
		DocenteServiceImpl serv = new DocenteServiceImpl();
		//*************************Creamos el metodo Listado
		//Ponemos etiqueta de tipo get y ruta Listado
		@GET
		@Path("/Listado")
		@Produces(MediaType.APPLICATION_JSON)
		public Response ListadoDocente(){
			//Invocamos al metodo listado
			List<Docente> listar = serv.listado();
			//retornamos el listado
			return Response.ok(listar).build();
		}// fin de ListadoDocente
		
		//*************************Creamos el metodo POST CREATE
		//Consume por que consumira JSON, de parametro objeto d de tipo Docente
		@POST
		@Path("/CrearDocente")
		@Produces(MediaType.APPLICATION_JSON)
		@Consumes(MediaType.APPLICATION_JSON)
		public Response CrearDocente(Docente d){
			//Invocamos al metodo registrar docente
			serv.RegistrarDocente(d);
			//retornamos la creacion
			return Response.status(Status.CREATED).build();
			//return Response.ok(Status.CREATED).build(); sale mensaje CREATED EN POSTMAN
		}//fin de CrearDocente
		
		//*************************Creamos el metodo buscar por codigo...
		//Servira para el actualizar , ya que busca por codigo
		@GET
		@Path("/BuscarDocente/{cod}")
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		public Response BuscarPorId(@PathParam("cod") int cod ){
			//realizamos la respectiva instacnia
			Docente dos = new Docente();
			//Asignamos el codigo a buscar que es del parametro cod
			dos.setCodigo(cod);
			//declaramos una variable de tipo entero para almacenar el valor
			int iddocente = 0;
			//almacenamos listado en validar, llama al listado sale el primer mensaje con conexion a BD
			List<Docente> validar = serv.listado();
			//aplicamos un bucle , donde listar recorre en validar que es List
			for(Docente listar: validar){
				//aplicamos una condicion para validar si existe
				if(listar.getCodigo() == dos.getCodigo()){
					iddocente = listar.getCodigo();
				}//fin de if
				
			}//fin de for
			//aplicamos condicion si es 0 el iddocente
			if(iddocente == 0){
				//esto es el mensaje si iddocente es 0
				return Response.status(Status.BAD_REQUEST).entity("Docente no encontrado en BD").build();
			}//fin de if
			else{
				//invocamos al metodo buscar por codigo, y le dos que almacena el codigo docente seteado
				//segundo sale el mensaje con conexion a BD
				Docente busautor = serv.BuscarDocente(dos);
				//retornamos el codigo a buscar
				return Response.ok(busautor).build();
				
			}//fin de else
		}//fin de BuscarPorId
		
		//*************************Creamos el metodo actualizar autor...
		@PUT
		@Path("/ActualizarDocente")
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		public Response ActualizarDocente(Docente clact ){
			//declaramos una variable de tipo int que almacena el iddos
			int iddos = 0;
			//variable list donde almacena lo que trae de listado, primer conexion con BD
			List<Docente> lis =  serv.listado();
			//aplicamos un bucle val almacena lo de lis
			for(Docente val : lis){
				//aplicamos una condicion, a partir de val obtenemos del listado el
				//idautor e comparamos con clactu el getCodigo que viene de parametro
				if(val.getCodigo() == clact.getCodigo()){
				//si son iguales le asignamos valor a iddos variable declarada arriba
					iddos=val.getCodigo();
				}//fn de if
			}//fin de for
			//aplicamos condicion si es 0 el iddos
					if(iddos == 0){
			//esto es el mensaje si idAutor es 0
	return Response.status(Status.BAD_REQUEST).entity("No se puede actualizar dicho codigo").build();
			}//fin de if
					else{
						//invocamos al metodo segundo conexion con BD
						serv.ActualizarDocente(clact);
						//retornamos
						return Response.status(Status.CREATED).build();
					}//fin de else
		}//fin de ActualizarDocente
		
		//*************************Creamos el metodo eliminar autor...
		@DELETE
		@Path("/EliminarDocente/{cod}")
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		public Response EliminarDocente(@PathParam("cod") int cod ){
			//realizamos la respectiva instacnia
			Docente claut = new Docente();
			//Asignamos el codigo a buscar que es del parametro cod
			claut.setCodigo(cod);
			//declaramos una variable de tipo entero para almacenar el valor
			int id = 0;
			//almacenamos listado en liselim, primer mensaje de Dato con conexion a BD 
					List<Docente> liselim = serv.listado();
					//aplicamos un bucle , donde listar recorre en validar que es List
					for(Docente liseli: liselim){
						//aplicamos una condicion para validar si existe
						if(liseli.getCodigo() == claut.getCodigo()){
							id = liseli.getCodigo();
						}//fin de if
						
					}//fin de for
					//aplicamos condicion si es 0 el id
					if(id == 0){
						//esto es el mensaje si idAutor es 0
	return Response.status(Status.BAD_REQUEST).entity("No se puede eliminar dicho codigo,NO EXISTE").build();
					}//fin de if
					else{
					//invocamos al metodo buscar por codigo, y le clbus que almacena el codigo idautor seteado
						//segundo mensaje de Dato con conexion a BD 
						serv.EliminarDocente(claut);	
						//retornamos 
						return Response.ok(Status.CREATED).build();	
					}//fin de else
		}//fin de EliminarDocente
	
	

} //fin de ServicioDocente
