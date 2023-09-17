<%@include file="db.jsp" %>
<%

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String district=request.getParameter("district");
String state=request.getParameter("state");
String pwd=request.getParameter("pwd");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String utype=request.getParameter("utype");
String qr= "insert into user values(?,?,?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(qr);
ps.setString(1, fname);
ps.setString(2, lname);
ps.setString(3, phone);
ps.setString(4, email);
ps.setString(5, state);
ps.setString(6, district);
ps.setString(7, pwd);
ps.setString(8, utype);
int i=ps.executeUpdate();

if(i>0){
%>
Registered
<%
}
else{
	%>
	not registered
	<% 
}
%>
