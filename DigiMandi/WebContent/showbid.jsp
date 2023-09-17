<%@include file="db.jsp" %>
<% 
String semail=(String)session.getAttribute("email");
String qr= "select * from bidorder where email=?;";
PreparedStatement st= con.prepareStatement(qr);
st.setString(1, semail);
ResultSet rs = st.executeQuery();
%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="login.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
    </script>
    
  <title>Past Orders</title>
</head>

<body>
  <div>
  <h1 style="text-align: center;">Past Bid Orders</h1>
  </div>
  
  <div class="col">
    <h3>Past Bid Orders</h3>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Commodity</th>
          <th>Quantity</th>
          <th>BasePrice</th>
          <th>Last Bid</th>
          <th>Last Bidder</th>
          <th>End Date</th>
          <th>End time</th>
          <th>Seller</th>
        </tr>
      </thead>
      <tbody id="pastorders">
      <% 
      if(rs.next()){
    	  do{
    		 %>
    		<tr>
    			<td><%=rs.getString("commodity") %></td>
    			<td><%=rs.getString("quantity") %></td>
    			<td><%=rs.getString("baseprice") %></td>
    			<td><%=rs.getString("lastbid") %></td>
    			<td><%=rs.getString("lastbidder") %></td>
    			<td><%=rs.getString("date") %></td>
    			<td><%=rs.getString("etime") %></td>
       			<td><%=rs.getString("email") %></td>
      		</tr>
    		 <%
    	  }while(rs.next());
      }
      %>
      
      
      
      </tbody>
    </table>
  
</div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
    crossorigin="anonymous"></script>
 
    
</body>

</html>