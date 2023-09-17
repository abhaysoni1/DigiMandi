<%@include file="db.jsp" %>

<%String qr="select district from user where email =all(select email from livetrading where commodity=?) and state=?;";
String cmd = request.getParameter("cmd");
String state = request.getParameter("st");
PreparedStatement ps = con.prepareStatement(qr);
ps.setString(1, cmd);
ps.setString(2, state);
ResultSet rs = ps.executeQuery();
%>
<option >Select district</option>
<% 
System.out.println(state);
if(rs.next()){
	
	do{
		
		
		System.out.println(rs.getString("district"));
		%>
		<option><%=rs.getString("district")%></option>
		<%
	}while(rs.next());
}
%>