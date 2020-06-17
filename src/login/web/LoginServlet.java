package login.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import login.bean.LoginBean;
import login.database.LoginDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;
	

	public void init() {
		loginDao = new LoginDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String realPassword = request.getParameter("password");
		String password = MD5.getMd5(username.concat(realPassword)) ; 
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);
		int staffid;
		int userID;

		try {
			if (loginDao.validate(loginBean)) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				
				String Name = loginBean.getName();
				session.setAttribute("Name", Name);
				
				int ID = loginBean.getstaffid();
				session.setAttribute("ID", ID);
				
				staffid = loginBean.getUserID();
				userID = loginBean.getstaffid();
				session.setAttribute("ID",userID);
				session.setAttribute("staffid", staffid);
				if(staffid == 102)
					response.sendRedirect("gatepass_statusAdmin.jsp");
				if (staffid == 101 || staffid == 104 || staffid == 100 )
				    response.sendRedirect("gatepass_status.jsp");
				if (staffid == 103)
					response.sendRedirect("gatepassSecurity.jsp");
			} else {
				response.sendRedirect("gatepass_login.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}