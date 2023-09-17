<%@include file="db.jsp" %>
<%
String email=(String)session.getAttribute("email");  
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String district=request.getParameter("district");
String state=request.getParameter("state");
String changedemail=request.getParameter("email");
String pwd=request.getParameter("pwd");
String phone=request.getParameter("phone");

String qr= "update user set fname=?,lname=?,phone=?,email=?,state=?,district=?,password=? where email=?;";
PreparedStatement ps = con.prepareStatement(qr);
ps.setString(1, fname);
ps.setString(2, lname);
ps.setString(3, phone);
ps.setString(4, changedemail);
ps.setString(5, state);
ps.setString(6, district);
ps.setString(7, pwd);
ps.setString(8, email);
int i=ps.executeUpdate();

if(i>0){
%>
Updated successfully
<%
}
else{
	%>
	not Updated
	<% 
}
%>
