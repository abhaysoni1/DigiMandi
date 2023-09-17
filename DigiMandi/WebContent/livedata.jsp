<%@include file="db.jsp" %>

<%String qr="select * from livetrading where commodity=? and email = all(select email from user where state=? and district=?);";
String cmd = request.getParameter("cmd");
String state = request.getParameter("st");
String district = request.getParameter("ds");
String buyer = (String)session.getAttribute("email");
PreparedStatement ps = con.prepareStatement(qr);
ps.setString(1, cmd);
ps.setString(2, state);
ps.setString(3, district);
ResultSet rs = ps.executeQuery();
if(rs.next()){
	
	do{
		String com=rs.getString("commodity");
		com=com.replace(' ', '+');
		%>
		
		<tr>
          <td><%=rs.getString("commodity")%></td>
          <td><%=rs.getString("quantity")%></td>
          <td><%=rs.getString("lastbid")%></td>
          <td><%=rs.getString("lastbidder")%></td>
          <td><%=rs.getString("date")%></td>
          <td><%=rs.getString("etime")%></td>
          <td><%=rs.getString("email")%></td>
          <td>
          <form action="Confirmbid">
          <input type="number" name="currentbid" placeholder="enter your bid here" min="1" required>
          <input type="hidden" name="commodity" value=<%=com%> >
          <input type="hidden" name="lastbid" value=<%=rs.getString("lastbid")%>>
          <input type="hidden" name="seller" value=<%=rs.getString("email")%> >
          <input type="hidden" name="buyer" value=<%=buyer%> >
          <input type="hidden" name="baseprice" value=<%=rs.getString("baseprice")%> >
          <input type="submit" value="Confirm bid">
          </form>
          </td>
        </tr>
        
		<%
	}while(rs.next());
}	
%>