package Security.detail;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Security
 */
@WebServlet("/SecurityG")
public class SecurityG extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String GatePassNumber = request.getParameter("Gnumber"); // Gate Pass Number
		request.setAttribute("GateNumber", GatePassNumber);
		RequestDispatcher view = request.getRequestDispatcher("Security.jsp");
		view.forward(request, response);
	}

}
