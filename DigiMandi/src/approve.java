

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/approve")
public class approve extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String pname= request.getParameter("pname");
		int quantity= Integer.parseInt(request.getParameter("pqu"));
		String bemail= request.getParameter("bemail");
		int price= Integer.parseInt(request.getParameter("pprice"));
		int cno= Integer.parseInt(request.getParameter("cno"));
		HttpSession session=request.getSession();  
		String email=(String)session.getAttribute("email");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
			String qr= "select * from product where email=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			int uquantity=0;
			
			if(rs.next()){
				do{
					
					if(pname.equals(rs.getString("pname"))){
					uquantity = rs.getInt("pquantity") - quantity;
						if(uquantity>0){
							String qr2= "update product set pquantity= ? where pname= ?;";
							PreparedStatement ps2=con.prepareStatement(qr2);
							ps2.setInt(1, uquantity);
							ps2.setString(2, pname);
							int i=ps2.executeUpdate();
								if(i>0){
									out.println("Contract approved");
									String qr3 = "insert into transaction values(?,?,?,?,?,?);";
									PreparedStatement ps3 = con.prepareStatement(qr3);
									ps3.setString(1, bemail);
									ps3.setString(2, email);
									ps3.setInt(3, quantity);
									ps3.setInt(4, price);
									ps3.setString(5, pname);
									ps3.setInt(6, cno);
									ps3.executeUpdate();
									String qr4= "delete from contract where cno=?";
									PreparedStatement ps4=con.prepareStatement(qr4);
									ps4.setInt(1, cno);
									ps4.executeUpdate();
								}
								else{
									out.println("contract not approved");
								}
						}
						else{
							out.println("Quantity is less");
						}
					
				}
				}while(rs.next());
			}
			con.close();
		} catch (Exception e) {
			
			out.println(e);
		}
	}

}
