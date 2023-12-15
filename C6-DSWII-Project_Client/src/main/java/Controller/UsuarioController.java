package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ClienteDocente.UsuarioService;
import Modelo.Usuario;

/**
 * Servlet implementation class UsuarioController
 */
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioService service = new UsuarioService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Usuario usuario = null;

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Usuario usuarioForm = new Usuario(0, username, password);
		usuario = service.login(usuarioForm);

		if (usuario == null) {
			request.setAttribute("message", "invalid");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}

		request.setAttribute("message", "correct");
		response.sendRedirect("ControladorDocente");
	}

}
