package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.AlbumDatabase;
import data.Discography;

/**
 * Servlet implementation class AlbumList
 */
@WebServlet("/AlbumList")
public class AlbumList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlbumList() {
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
		List<Discography> items = AlbumDatabase.ALBUMS;
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
