

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
import javax.servlet.http.HttpSession;


@WebServlet("/Addproduct")
public class Addproduct extends HttpServlet {
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
			String qr = "insert into product values(?,?,?,?);";
			String qr2 ="select * from product where email=?;";
			PreparedStatement ps = con.prepareStatement(qr);
			
			PreparedStatement ps2 = con.prepareStatement(qr2);
			
			ps2.setString(1, email);
			ResultSet rs= ps2.executeQuery();
			
			ps.setString(1, email);
			ps.setString(2, pname);
			ps.setInt(3,pprice);
			ps.setInt(4,pquantity);
			int j=0;
			if(rs.next()){
				do{
					if(rs.getString("pname").equals(pname)){
						RequestDispatcher rd = request.getRequestDispatcher("addproduct.html");
						rd.include(request, response);
						out.println("<script>alert('failed');</script>");
						j=1;
						break;
					}
				}while(rs.next());
			}
			if(j==0){
			ps.executeUpdate();
			}
			con.close();
			response.sendRedirect("userhome.jsp");
		} catch (Exception e) {
			out.println(e);
		}

}
	}
