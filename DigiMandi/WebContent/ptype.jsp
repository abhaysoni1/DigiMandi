<%@page import="java.sql.*"%>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/digimandi","root","abhay");
String qr="select distinct pname from product;";
PreparedStatement ps=con.prepareStatement(qr);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	do
	{	
		String pname=rs.getString("pname");
		%>
		<option><%=pname %></option>
		<%
	}while(rs.next());
}
else
{
	out.println("no city found");
}
con.close();
%>