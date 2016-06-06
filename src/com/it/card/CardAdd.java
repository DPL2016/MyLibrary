package com.it.card;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.CardDAO;
import com.it.entity.Card;

/**
 * Servlet implementation class CardAdd
 */
public class CardAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CardAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/cardadd.jsp").forward(request, response);
	}

	CardDAO dao = new CardDAO();
	Card cd = new Card();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		cd.setCode(request.getParameter("code"));
		cd.setName(request.getParameter("name"));
		cd.setTel(request.getParameter("tel"));
		if(dao.add(cd)){
			response.sendRedirect("/cardhome");
		}else{
			response.sendError(405, "ÃÌº” ß∞‹");
		}
	}

}
