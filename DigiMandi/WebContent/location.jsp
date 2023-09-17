<%@page import="java.sql.*"%>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
String qr="select distinct district from user;";
PreparedStatement ps=con.prepareStatement(qr);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	do
	{	
		String district=rs.getString("district");
		%>
		<option><%=district %></option>
		<%
	}while(rs.next());
}
else
{
	out.println("no city found");
}
con.close();
%>