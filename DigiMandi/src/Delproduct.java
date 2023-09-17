

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Delproduct
 */
@WebServlet("/Delproduct")
public class Delproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String pname = request.getParameter("pname");
		
		try {
			HttpSession session=request.getSession();  
	        String email=(String)session.getAttribute("email");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
			String qr = "delete from product where pname=? and email=?;";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, pname);
			ps.setString(2, email);
			ps.executeUpdate();
			con.close();
			response.sendRedirect("userhome.jsp");
		} catch (Exception e) {
			out.println(e);
		}
	}

}
