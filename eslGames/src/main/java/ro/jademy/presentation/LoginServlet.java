package ro.jademy.presentation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ro.jademy.domain.entity.LoginMessages;
import ro.jademy.domain.entity.User;
import ro.jademy.domain.service.LoginService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		LoginService login = new LoginService();

		LoginMessages loginMess = login.doLogin(username, password);

		if (LoginMessages.SUCCESS.equals(loginMess)) {
			User loggedIn = login.getUser(username);
			response.sendRedirect("gamesHome.jsp");			
		} else {
			request.setAttribute("errorMessage", loginMess.toString() +":"+ loginMess.getMessage());
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
