<%@include file="db.jsp"%>

<%

String email=(String)session.getAttribute("email");  
String qr = "select * from livetrading where email=?;";
PreparedStatement ps = con.prepareStatement(qr);
ps.setString(1,email);
ResultSet rs = ps.executeQuery();

if(rs.next()){
	
	do{
		
		%>
		<tr>
          <td><%=rs.getString("commodity") %></td>
          <td><%=rs.getInt("quantity") %></td>
          <td><%=rs.getInt("lastbid") %></td>
          <td><%=rs.getString("lastbidder") %></td>
          <td><%=rs.getString("date") %></td>
          <td><%=rs.getString("etime") %></td>
          <td><a href="Bidconfirm?commodity=<%=rs.getString("commodity") %>&quantity=<%=rs.getInt("quantity") %>&lastbid=<%=rs.getInt("lastbid") %>&lastbidder=<%=rs.getString("lastbidder") %>&date=<%=rs.getString("date") %>&etime=<%=rs.getString("etime") %>&baseprice=<%=rs.getString("baseprice")%>" class="btn login_btn" style="width:100%">Bid confrim</a></td>
        </tr>
		<%
	}while(rs.next());
}
%>
