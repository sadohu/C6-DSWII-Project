package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ClienteDocente.ClassConsumirDocente;
import Modelo.Docente;

/**
 * Servlet implementation class ControladorDocente
 */
public class ControladorDocente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorDocente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ClassConsumirDocente consuDoc = new ClassConsumirDocente();
		//almacenamos el listado en una variable de tipo list
		List<Docente> listadodoc = consuDoc.ListadoDocente();
		//enviamos a la vista ListadoAutores.jsp el listadocliente por atributo llamado listado
		request.setAttribute("listado", listadodoc);
		//redirecciona al listado de clientes llamado ListadoAutores
		request.getRequestDispatcher("/docente.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Obtenemos los parametros de los name de docente.jsp
		//PARA EL ID
		String codi = request.getParameter("codigo");
		int cod = 0;
		if(codi!=null){
			//cod se convierte en INT 
			cod=Integer.parseInt(codi);
		}
		//Para demás campos
		String nombre = request.getParameter("nombre");
		String paterno = request.getParameter("paterno");
		String materno = request.getParameter("materno");
		String sexo=request.getParameter("sexo");
		String hijos = request.getParameter("hijos");
		String sueldo = request.getParameter("sueldo");
		//Seteamos los atributos con Modelo Docente 
		Docente bean=new Docente();
		bean.setCodigo(cod);
		bean.setNombres(nombre);
		bean.setPaterno(paterno);
		bean.setMaterno(materno);
		bean.setSexo(sexo);
		bean.setHijos(Integer.parseInt(hijos));
		bean.setSueldo(Double.parseDouble(sueldo));
		//Consumir API
		ClassConsumirDocente consumir = new ClassConsumirDocente();
		//invocamos al metodo registrar
		consumir.CrearDocente(bean);
		//actualizar la vista
				List<Docente> listar = consumir.ListadoDocente();
				request.setAttribute("listado", listar);
				//request.setAttribute("successMessage", "Guardado");
				// Establecer el atributo en la sesión para que esté disponible solo para la siguiente solicitud
				request.setAttribute("successMessage", "GuardadobyMark");
				//redirecccionamos
				request.getRequestDispatcher("/docente.jsp").forward(request, response);
		
		
	} //fin de doPost

}
