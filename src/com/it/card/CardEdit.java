package com.it.card;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it.dao.CardDAO;
import com.it.entity.Card;

/**
 * Servlet implementation class CardEdit
 */
public class CardEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CardEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	CardDAO dao = new CardDAO();
	Card card = new Card();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("id");
		int id = new Integer(str);
		request.setAttribute("card", dao.findOne(id));
		request.getRequestDispatcher("/WEB-INF/views/cardupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("id");
		int id = new Integer(str);
		card.setId(id);
		card.setCode(request.getParameter("code"));
		card.setName(request.getParameter("name"));
		card.setTel(request.getParameter("tel"));
		if(dao.modify(card)){
			response.sendRedirect("/cardhome");
		}else{
			response.sendError(405, "ÐÞ¸ÄÊ§°Ü");
		}
	}

}
