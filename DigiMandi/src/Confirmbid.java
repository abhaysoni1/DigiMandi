

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
 * Servlet implementation class Confirmbid
 */
@WebServlet("/Confirmbid")
public class Confirmbid extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		int lastbid = Integer.parseInt(request.getParameter("lastbid"));
		int baseprice = Integer.parseInt(request.getParameter("baseprice"));
		String commodity = request.getParameter("commodity");
		String seller = request.getParameter("seller");
		String buyer = request.getParameter("buyer");
		int currentbid = Integer.parseInt(request.getParameter("currentbid"));
		commodity=commodity.replace('+', ' ');
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
				if(currentbid>=baseprice && currentbid > lastbid ){
					String qr ="update livetrading set lastbid=?,lastbidder=? where commodity=? and email=?;";
					PreparedStatement ps = con.prepareStatement(qr);
					ps.setInt(1, currentbid);
					ps.setString(2, buyer);
					ps.setString(3, commodity);
					ps.setString(4, seller);
					int i=ps.executeUpdate();
					
					if(i>0){
						RequestDispatcher rd = request.getRequestDispatcher("livetradingcustomer.jsp");
						rd.include(request, response);
						out.println("<script>window.alert('bid successfull')</script>");
					}else{
						RequestDispatcher rd = request.getRequestDispatcher("livetradingcustomer.jsp");
						rd.include(request, response);
						out.println("<script>window.alert('bid unsuccessfull')</script>");
					}
				}
				else{
					RequestDispatcher rd = request.getRequestDispatcher("livetradingcustomer.jsp");
					rd.include(request, response);
					out.println("<script>window.alert('your bid is less than last bid')</script>");
				}
			con.close();
		} catch (Exception e) {
			out.println(e);
		}
	}
		
	}


