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

import Entidad.Usuario;
import Interface.UsuarioService;
import Service.UsuarioServicesImpl;

@Path("/Usuario")
public class UsuarioController {

	UsuarioService service = new UsuarioServicesImpl();
	
	@GET
	@Path("/ListadoUsuarios")
	@Produces(MediaType.APPLICATION_JSON)
	public Response ListadoUsuarios(){
		List<Usuario> usuarios = service.listar();
		return Response.ok(usuarios).build();
	}
	
	@GET
	@Path("/BuscarPorId/{cod}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response BuscarPorId(@PathParam("cod") int codigo){
		Usuario usuario = service.buscar(codigo);
		if(usuario == null)
			return Response.status(Status.BAD_REQUEST).entity("Usuario no encontrado en BD").build();
		
		return Response.ok(usuario).build(); 
	}
	
	@POST
	@Path("/CrearUsuario")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response CrearUsuario(Usuario usuario){
		service.registrar(usuario);
		return Response.status(Status.CREATED).build();
	}
	
	@PUT
	@Path("/ActualizarUsuario")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response ActualizarUsuario(Usuario usuario){
		Usuario usuarioExists = service.buscar(usuario.getCodigo());
		if(usuarioExists == null)
			return Response.status(Status.BAD_REQUEST).entity("Usuario no encontrado en BD").build();
		
		
		service.actualizar(usuario);
		return Response.status(Status.CREATED).build();
	}
	
	@DELETE
	@Path("/EliminarUsuario/{cod}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response EliminarUsuario(@PathParam("cod") int codigo){
		Usuario usuarioExists = service.buscar(codigo);
		if(usuarioExists == null)
			return Response.status(Status.BAD_REQUEST).entity("Usuario no encontrado en BD").build();
		
		service.eliminar(codigo);
		return Response.status(Status.CREATED).build();	 
	}
	
	@POST
	@Path("/LoginUsuario")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response BuscarPorId(Usuario usuario){
		Usuario usuarioExists = service.login(usuario);
		if(usuarioExists == null)
			return Response.status(Status.BAD_REQUEST).entity("Credenciales incorrectas").build();
		
		return Response.ok(usuario).build(); 
	}
	
}
