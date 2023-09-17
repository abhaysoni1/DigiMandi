

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Bidconfirm
 */
@WebServlet("/Bidconfirm")
public class Bidconfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String date = request.getParameter("date");
		String time = request.getParameter("etime");
		int  baseprice= Integer.parseInt(request.getParameter("baseprice"));
		int  quantity= Integer.parseInt(request.getParameter("quantity"));
		String commodity = request.getParameter("commodity");
		int  lastbid= Integer.parseInt(request.getParameter("lastbid"));
		String lastbidder = request.getParameter("lastbidder");
		
		try {
			HttpSession session=request.getSession();  
	        String email=(String)session.getAttribute("email");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
			String qr = "insert into bidorder values(?,?,?,?,?,?,?,?);";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1, commodity);
			ps.setInt(2, quantity);
			ps.setInt(3, lastbid);
			ps.setString(4,lastbidder);
			ps.setString(5,date);
			ps.setString(6,email);
			ps.setString(7,time);
			ps.setInt(8, baseprice);
			int i=ps.executeUpdate();
			if(i>0){
			String qr2="delete from livetrading where lastbidder=? and email=? and quantity=? and baseprice=? and commodity=?; ";
			PreparedStatement ps2 = con.prepareStatement(qr2);
			ps2.setString(1, lastbidder);
			ps2.setString(2, email);
			ps2.setInt(3, quantity);
			ps2.setInt(4, baseprice);
			ps2.setString(5, commodity);
			int j=ps2.executeUpdate();
			if(j>0){
				RequestDispatcher rd= request.getRequestDispatcher("Livetradinguser.jsp");
				rd.include(request, response);
				out.println("<script>window.alert('Bid confirmed')</script>");
			}else{
				RequestDispatcher rd= request.getRequestDispatcher("Livetradinguser.jsp");
				rd.include(request, response);
				out.println("<script>window.alert('Bid not confirmed')</script>");
			}
			}else{
				RequestDispatcher rd= request.getRequestDispatcher("Livetradinguser.jsp");
				rd.include(request, response);
				out.println("<script>window.alert('Bid not confirmed')</script>");
			}
			con.close();
		} catch (Exception e) {
			out.println(e);
		}
		
	}

}
