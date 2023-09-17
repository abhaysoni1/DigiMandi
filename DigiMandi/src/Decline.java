

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Decline
 */
@WebServlet("/Decline")
public class Decline extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");					
		int cno= Integer.parseInt(request.getParameter("cno"));  
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
			String qr= "delete from contract where cno=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setInt(1, cno);
			ps.executeUpdate();
			response.sendRedirect("userhome.jsp");
			con.close();
		} catch (Exception e) {
			
			out.println(e);
		}
		
	}

}
