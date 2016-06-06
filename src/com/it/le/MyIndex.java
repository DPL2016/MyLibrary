package com.it.le;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.AdminDAO;

/**
 * Servlet implementation class MyIndex
 */
public class MyIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cks = request.getCookies();
		String name = null;
		String pwd = null;
		if(cks!=null){
			for (Cookie c : cks) {
				if("username".equals(c.getName())){
					name = c.getValue();
				}else if("userpwd".equals(c.getName())){
					pwd = c.getValue();
				}
			}
		}
		if(name!=null&pwd!=null){
			AdminDAO dao = new AdminDAO();
			if(dao.find(name, pwd)){
				request.getSession().setAttribute("username", name);
				response.sendRedirect("/home");
				return;
			}else{
				Cookie ck1 = new Cookie("username", "");
				ck1.setPath("/");
				ck1.setMaxAge(0);
				ck1.setHttpOnly(true);
				response.addCookie(ck1);
				Cookie ck2 = new Cookie("userpwd", "");
				ck2.setPath("/");
				ck2.setMaxAge(0);
				ck2.setHttpOnly(true);
				response.addCookie(ck2);
			}
		}
		
		request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
