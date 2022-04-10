package team19.login;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team19.dao.Dao;

@WebServlet(name = "LoginUser",
			urlPatterns = {"/loginuser"}
			)

public class LoginUser extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response.sendRedirect("html/login.html");
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		Dao dao = new Dao();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// String role = request.getParameter("roles");
		
		// Reading reference values from database
		String salt = dao.getUserSalt(username);
		String hashpassword = dao.getUserPasswordHash(username);
		
		dao.close();
		
		if (SecurityUtils.isPasswordCorrect(hashpassword, password, salt)) {
			response.getWriter().println("Login successful");
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("jsp/adminpage.jsp");
			
		} else {
			response.getWriter().println("Login failed, try again!");
		}
	}
}