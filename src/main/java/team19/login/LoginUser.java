package team19.login;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team19.dao.Dao;

@WebServlet(name = "LoginUser",
			urlPatterns = {"/loginuser"}
			)

public class LoginUser extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("html/login.html");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		Dao dao = new Dao();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// Reading reference values from database
		String salt = dao.getUserSalt(username);
		String hashpassword = dao.getUserPasswordHash(username);
		
		dao.close();
		
		if (SecurityUtils.isPasswordCorrect(hashpassword, password, salt)) {
			response.getWriter().println("Login successful");
			
		} else {
			response.getWriter().println("Login failed");
		}
	}
}
