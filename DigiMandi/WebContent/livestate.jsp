<%@include file="db.jsp" %>

<%String qr="select state from user where email =all(select email from livetrading where commodity=?);";
String cmd = request.getParameter("cmd");
PreparedStatement ps = con.prepareStatement(qr);
ps.setString(1, cmd);
ResultSet rs = ps.executeQuery();
%>
<option >Select district</option>
<% 
if(rs.next()){
	
	do{
		
		%>
		<option><%=rs.getString("state")%></option>
		<%
	}while(rs.next());
}
%>