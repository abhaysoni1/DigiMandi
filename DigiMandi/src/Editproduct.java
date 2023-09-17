

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Editproduct
 */
@WebServlet("/Editproduct")
public class Editproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		int pprice = Integer.parseInt(request.getParameter("pprice"));
		int pquantity = Integer.parseInt(request.getParameter("pquantity"));
		String pname = request.getParameter("pname");
		
		try {
			HttpSession session=request.getSession();  
	        String email=(String)session.getAttribute("email");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
			String qr = "update product set pquantity=?,pprice=? where pname=? and email=?;";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setInt(1, pquantity);
			ps.setInt(2, pprice);
			ps.setString(3, pname);
			ps.setString(4, email);
			ps.executeUpdate();
			con.close();
			response.sendRedirect("userhome.jsp");
		} catch (Exception e) {
			out.println(e);
		}
	}

}
