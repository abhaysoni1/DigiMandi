

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
 * Servlet implementation class Addliveproduct
 */
@WebServlet("/Addliveproduct")
public class Addliveproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		int  baseprice= Integer.parseInt(request.getParameter("pprice"));
		int  pquantity= Integer.parseInt(request.getParameter("pquantity"));
		String commodity = request.getParameter("pname");
		
		
		try {
			HttpSession session=request.getSession();  
	        String email=(String)session.getAttribute("email");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
			String qr = "insert into livetrading values(?,?,?,?,?,?,?,?);";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, commodity);
			ps.setInt(2, pquantity);
			ps.setInt(3, 0);
			ps.setString(4,"");
			ps.setString(5,date);
			ps.setString(6,email);
			ps.setString(7,time);
			ps.setInt(8, baseprice);
			ps.executeUpdate();
			con.close();
			response.sendRedirect("Livetradinguser.jsp");
		} catch (Exception e) {
			out.println(e);
		}
		
	}

}
