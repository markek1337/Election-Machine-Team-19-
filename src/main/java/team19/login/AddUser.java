package team19.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import team19.dao.Dao;


@WebServlet (name = "AddUser",
			urlPatterns = {"/adduser"}
			)

public class AddUser extends HttpServlet {
      
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		response.sendRedirect("index.html");
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Dao dao = new Dao();
		PrintWriter pw = response.getWriter();
		
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		
		// Create salt and hashed password
		String salt = SecurityUtils.getSalt();
		String hashpass = SecurityUtils.getPasswordHashed(password, salt);
		
		// pw.println(username);
		// pw.println(password);
		// pw.println(hashpass);
		
		dao.addUser(username, hashpass, salt);
		dao.close();
		
		response.sendRedirect("index.html");
		
	}
}
