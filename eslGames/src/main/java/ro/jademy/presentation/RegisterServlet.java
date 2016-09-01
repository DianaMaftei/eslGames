package ro.jademy.presentation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ro.jademy.domain.entity.RegisterMessages;
import ro.jademy.domain.entity.TypeOfUser;
import ro.jademy.domain.service.RegisterService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fullName = request.getParameter("fullName");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		TypeOfUser userType = TypeOfUser.valueOf(request.getParameter("type").toUpperCase());
		
		RegisterService register = new RegisterService();
		RegisterMessages regMess = register.registerUser(fullName, username, password, email, userType);
		
		if (RegisterMessages.SUCCESS.equals(regMess)) {
			response.sendRedirect("gamesHome.jsp");			
		} else {
			request.setAttribute("toggleRegister", "true");
			request.setAttribute("errorMessage", regMess.toString() +":"+ regMess.getMessage());
			System.out.println(regMess);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
