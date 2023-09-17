<%@include file="db.jsp"%>

<%
String pname=request.getParameter("pname");
String location=request.getParameter("location");

String qr="select pname,user.email, pprice,pquantity,user.district from product left join user on product.email=user.email where pname = ? and district = ? ;";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, pname);
ps.setString(2, location);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	do{
	int pprice=rs.getInt("pprice");
	int pquantity=rs.getInt("pquantity");
	String district=rs.getString("district");
	String email=rs.getString("email");
	%>
<div class="card mb-3">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="..." alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        Product name<h5 class="card-title" class='pna'><%=pname %></h5>
        Price<h6 class='pri'><%=pprice %></h6>
        Quantity Available<h6 class='pqu'><%=pquantity %></h6>
        Location<h6 class='dis'><%=district %></h6>
        <button ><a style="text-decoration:none;" href="pdetails.jsp?pname=<%=pname %>&pprice=<%=pprice %>&pqu=<%=pquantity %>&dis=<%=district %>&email=<%=email %>">check in</a></button>
      </div>
    </div>
  </div>
</div>
	<%
	}while(rs.next());
	}
con.close();
%>

