package com.it.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.BookDAO;
import com.it.entity.Book;

/**
 * Servlet implementation class BookAdd
 */
public class BookAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookDAO dao = new BookDAO();
	Book b = new Book(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.getRequestDispatcher("/WEB-INF/views/bookadd.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		b.setCode(request.getParameter("code"));
		b.setTitle(request.getParameter("title"));
		b.setAuthor(request.getParameter("author"));
		b.setPublishing(request.getParameter("publising"));
		b.setTotal(new Integer(request.getParameter("total")));
		b.setCount(new Integer(request.getParameter("count")));
		if(dao.add(b)){
			response.sendRedirect("/bookhome");
		}else{
		response.sendError(400, "ÃÌº” ß∞‹");
	}

	}

}
