package com.it.le;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.it.dao.AdminDAO;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}
	AdminDAO dao = new AdminDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String pwd = request.getParameter("userpwd");
		String rememberme = request.getParameter("rememberme");
		if(dao.find(name, pwd)){
			if("yes".equals(rememberme)){
				Cookie ck1 = new Cookie("username", name);
				Cookie ck2 = new Cookie("userpwd", pwd);
				ck1.setPath("/");
				ck1.setMaxAge(60*60*24*7);
				response.addCookie(ck1);
				ck2.setPath("/");
				ck2.setMaxAge(60*60*24*7);
				response.addCookie(ck2);
			}
			HttpSession session = request.getSession(true);
			session.setAttribute("username", name);
			response.sendRedirect("/home");
		}else{
			response.sendRedirect("/index.jsp?err=1001");
		}
		
	}

}
