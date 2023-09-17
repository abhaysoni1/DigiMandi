<%@include file="db.jsp" %>

<%String qr="select * from livetrading;";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(qr);
if(rs.next()){
	do{
		%>
		<option><%=rs.getString("commodity")%></option>
		<%
	}while(rs.next());
}
%>