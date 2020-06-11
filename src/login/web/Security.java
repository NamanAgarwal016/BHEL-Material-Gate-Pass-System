package login.web;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Java class for avoiding URL bypass and Cache-control directives.

public class Security {

	public void enable(HttpSession session, HttpServletResponse response) {
		
		String validUser = (String) session.getAttribute("username");

		if (validUser == null) {
			try {
				response.sendRedirect("gatepass_login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", 0); // Proxies.
	}
}
