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
		//doGet(request, response);
	}

}
