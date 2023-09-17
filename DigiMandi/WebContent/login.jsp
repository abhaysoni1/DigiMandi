<%@include file="db.jsp" %>

<%
String email=request.getParameter("email");
String pwd = request.getParameter("pwd");

String qr = "select * from user";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(qr);
String usertype="";
int i=0;
if(rs.next()){
	do{
		if(email.equals(rs.getString("email")) && pwd.equals(rs.getString("password"))){
			if(rs.getString("usertype").equals("Seller")){
			i=999;
			usertype="Seller";
			break;
			}
			else{
				i=888;
				usertype="Buyer";
			}
		} 
	}while(rs.next());
}
if(i==999){
	session.setAttribute("email",email);
	session.setAttribute("usertype",usertype);
	%>
	
	<jsp:forward page="userhome.jsp" /> 
	
	<%
	
}
else if(i==888){
	session.setAttribute("email",email);
	session.setAttribute("usertype",usertype);
%>
	
	<jsp:forward page="customer.jsp" /> 
	
	<%
}
else{
	out.println("<script>window.alert('login failed')</script>");
}
%>