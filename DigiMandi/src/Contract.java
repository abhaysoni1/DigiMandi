


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Contract
 */
@WebServlet("/Contract")
public class Contract extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String pname= request.getParameter("pname");
		int quantity= Integer.parseInt(request.getParameter("quantity"));
		String bemail= request.getParameter("bemail");
		String semail= request.getParameter("semail");
		int price= Integer.parseInt(request.getParameter("price"));
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
			String qr = "insert into contract values(?,?,?,?,?,?);";
			String qr2	= "select max(cno) from contract";
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(qr2);
			int cno;
			if(rs.next()){
				cno=rs.getInt("max(cno)")+1;
				System.out.println(cno);
			}
			else{
				cno=1;
				System.out.println(cno);
			}
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, bemail);
			ps.setString(2, semail);
			ps.setInt(3, quantity);
			ps.setInt(4, price);
			ps.setString(5, pname);
			ps.setInt(6, cno);
			int i=ps.executeUpdate();
			con.close();
			if(i>0){
				RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
				rd.include(request, response);
				out.println("<script>alert('contract submitted')</script>");
			}
			else{
				RequestDispatcher rd = request.getRequestDispatcher("customer.jsp");
				rd.include(request, response);
				out.println("<script>alert('contract failed')</script>");
			}
		} catch (Exception e) {
			out.println(e);
		}
		
	}

}
