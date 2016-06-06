package com.it.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.BookDAO;
import com.it.entity.Book;

public class BookHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookHome() {
		super();
		// TODO Auto-generated constructor stub
	}

	BookDAO dao = new BookDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		if (request.getParameter("wd") != null) {
			String wd = new String(request.getParameter("wd").getBytes("ISO-8859-1"), "utf-8");
			
			List<Book> list = dao.findBook(wd);
			request.setAttribute("list", dao.findBook(wd));
		} 
		else {
			List<Book> list = dao.allBook();
			request.setAttribute("list", dao.allBook());
		}
		request.getRequestDispatcher("/WEB-INF/views/booklist.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
