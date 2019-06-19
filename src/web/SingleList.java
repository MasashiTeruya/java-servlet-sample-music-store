package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Discography;
import data.SingleDatabase;

/**
 * Servlet implementation class AlbumList
 */
@WebServlet("/SingleList")
public class SingleList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SingleList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// AlbumDatabase.ALBUMS
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().append("[");
		List<Discography> items = SingleDatabase.SINGLES;
		for (int i = 0; i < items.size(); i++) {
			if (i > 0) {
				response.getWriter().append(",");
			}
			Discography d = items.get(i);

			response.getWriter()
					.append("{\"id\":" + d.getId() + ",\"name\":\"" + d.getName() + "\",\"date\":\"" + d.getDate() + "\"}");
		}
		response.getWriter().append("]");
	}

}
