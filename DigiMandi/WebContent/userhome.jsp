
<%@include file="db.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%

String email=(String)session.getAttribute("email");  
String qr4= "select * from user where email=?";
PreparedStatement ps4= con.prepareStatement(qr4);
ps4.setString(1, email);
ResultSet rs4= ps4.executeQuery();

	rs4.next();
	String fname=rs4.getString("fname");
	String lname=rs4.getString("lname");
	String state=rs4.getString("state");
	String district=rs4.getString("district");
	String usertype=rs4.getString("usertype");
	String phone=rs4.getString("phone");
	String password = rs4.getString("password");

	session.setAttribute("district",district);
	session.setAttribute("state",state);
%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
    crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
  </script>
  <link rel="stylesheet" type="text/css" href="userhome.css">
  <style type="text/css">
  #Yorder,#transaction,#profile{
  width: 70%;
  height: 70%;
  position: relative;
  top: 20%;
  left:10%;
  }
  #pcard{
  background: black;
  opacity:70%;
  }
  .login_btn{
color: black;
background-color: #FFC312;
width: 100%;
}

.login_btn:hover{
color: black;
background-color: white;
}
}</style>
  <title>Login</title>
</head>

<body>
  <nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">DigiMandi</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon" >#</span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" a data-bs-toggle="tab" aria-current="page" role="tab" href="#log">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Livetradinguser.jsp">Live Trading</a>
          </li>
          
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
  <div style="" id="log-out">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item">
        <a class="nav-link" id="email-tab" aria-controls="login" aria-selected="true"></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="usertype-tab" aria-controls="login" aria-selected="true"></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="logOut-tab" href="logout" role="tab" aria-controls="register"
          aria-selected="false">LogOut</a>
      </li>
    </ul>
  </div>
  <div  id="addproduct">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item">
        <a class="nav-link" id="product-tab" href="addproduct.html" aria-controls="Aproduct" aria-selected="true">Add Product</a>
      </li>
    </ul>
  </div>
  <div class="d-flex " id="content">
    <div class="float-left mt-5">
      <ul class="nav sidenav nav-tabs d-block" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link" id="login-tab" data-bs-toggle="tab" href="#con" role="tab" aria-controls="login"
            aria-selected="true">Your Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="register-tab" data-bs-toggle="tab" href="#Yorder" role="tab" aria-controls="register"
            aria-selected="false">Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="register-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="register"
            aria-selected="false">Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="register-tab" data-bs-toggle="tab" href="#transaction" role="tab" aria-controls="register"
            aria-selected="false">Transaction History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="register-tab" data-bs-toggle="tab" href="#reg" role="tab" aria-controls="register"
            aria-selected="false">Help</a>
        </li>
      </ul>
    </div>
    <div class="tab-content container">
    <div class="container mt-5 overflow-auto tab-pane" role="tabpanel" id="con">
      <div class="card-columns" id="dcard">
        
      </div>
    </div>
    <div class="container mt-5 overflow-auto tab-pane" role="tabpanel" id="Yorder" >
        <div class="card-columns" id="ycard">
          
      </div>
    </div>
    <div class="container mt-5 overflow-auto tab-pane" role="tabpanel" id="transaction" >
        <div class="card-columns" id="tcard">
          
      </div>
    </div>
    <div class="container mt-5 overflow-auto tab-pane" role="tabpanel" id="profile" >
        <div class="d-flex justify-content-center h-100">
        <div class="card" id=pcard>
          <div class="card-header">
            <h3>Profile</h3>
          </div>
          <div class="card-body">
            <form action="Profilechange.jsp" id="rs">
              <div class="d-flex">
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                  </div>
                  <input type="text" class="form-control mr-2" name="fname" placeholder="first name" value=<%=fname %>>

                </div>
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                  </div>
                  <input type="text" class="form-control" name="lname" placeholder="last name" value=<%=lname %>>

                </div>
              </div>
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-phone"></i></span>
                </div>
                <input type="text" class="form-control" name="phone" pattern="^\d{10}$" value=<%=phone %>>

              </div>
              <div class="input-group form-group">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-at"></i></span>
                </div>
                <input type="text" class="form-control" name="email" pattern="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$" placeholder="Enter your email id" value=<%=email %>>

              </div>
              <div class="d-flex">
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                  </div>
                  <select class="form-select mr-2" name="state" id="state">
                    <option selected value=""><%=state %></option>
                  </select>
                </div>
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-city"></i></span>
                  </div>
                  <select class="form-select mr-2" name="district" id="district">
                    <option selected value=""><%=district %></option>
                  </select>
                </div>
              </div>
              <div class="d-flex">
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                  </div>
                  <input type="password" class="form-control mr-2" id="pwd" name="pwd" placeholder="Enter Password" value=<%=password %>>

                </div>
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                  </div>
                  <input type="password" class="form-control" id="rpwd" name="rpwd" placeholder="re-Enter Password" value=<%=password %>>
                </div>
              </div>
              <div class="form-group">
                <input type="button" value="Save Changes" id="rsubmit" class="btn float-right login_btn">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  	</div>
  <script type="text/javascript">
  	document.getElementById("email-tab").innerHTML = "<%= email%>";
  	document.getElementById("usertype-tab").innerHTML = "<%=usertype%>";

  	</script>
  <%
  String qr = "select * from product where email= ?;";
  String qr2 = "select * from contract where sellerEmail=?;";
  String qr3 = "select * from transaction where sellerEmail= ?;";
  PreparedStatement ps = con.prepareStatement(qr);
  PreparedStatement ps2 = con.prepareStatement(qr2);
  PreparedStatement ps3 = con.prepareStatement(qr3);
  ps.setString(1, email);
  ps2.setString(1,email);
  ps3.setString(1,email);
  ResultSet rs = ps.executeQuery();
  ResultSet rs2 = ps2.executeQuery();
  ResultSet rs3 = ps3.executeQuery();
  %>
  <script type="text/javascript">
  var c="";
  </script>
  <%
  if(rs.next()){
		do{
			%>
			<script type="text/javascript">
  			
  			c= c +
  			`<div class="card">
       		<img src="https://www.world-grain.com/ext/resources/Article-Images/2020/12/GMR_Rice_AdobeStock_64819529_E_Nov.jpg?1609338918" class="card-img-top card_img" alt="...">
       		 <div class="card-body">
        	 <h5 class="card-title">Product Name-<%=rs.getString("pname")%></h5>
        	 <h5>Price-<%=rs.getString("pprice")%></h5>
        	 <h5>Quantity<%=rs.getString("pquantity")%></h5>
        	 <button ><a style="text-decoration:none;" href="Editproduct.jsp?pname=<%=rs.getString("pname")%>&price=<%=rs.getString("pprice")%>&pqu=<%=rs.getString("pquantity")%>">Edit Product</a></button>
        	 <button ><a style="text-decoration:none;" href="Delproduct?pname=<%=rs.getString("pname")%>">Delete Product</a></button>
  	
        	 </div>
      		</div>`;
      		document.getElementById("dcard").innerHTML= c;
  </script>
			<%
		}while(rs.next());
		}
  %>
  
  
  <script type="text/javascript">
  var d="";
  </script>
  <%
  if(rs2.next()){
		do{
			%>
			<script type="text/javascript">
  			
  			d= d +
  			`<div class="card">
       		<img src="https://www.world-grain.com/ext/resources/Article-Images/2020/12/GMR_Rice_AdobeStock_64819529_E_Nov.jpg?1609338918" class="card-img-top card_img" alt="...">
       		 <div class="card-body">
        	 <h5 class="card-title"><%=rs2.getString("productName")%></h5>
          	 <h6><%=rs2.getString("buyerEmail")%></h6>
          	<h6><%=rs2.getString("quantity")%></h6>
          	<h6><%=rs2.getString("price")%></h6>
        	</div>
        	<button ><a style="text-decoration:none;" href="checkOrder.jsp?pname=<%=rs2.getString("productName")%>&pprice=<%=rs2.getString("price")%>&pqu=<%=rs2.getString("quantity")%>&bemail=<%=rs2.getString("buyerEmail")%>&cno=<%=rs2.getString("cno")%>">Check Order</a></button>
      		
        	</div>`;
      		document.getElementById("ycard").innerHTML= d;
  </script>
			<%
		}while(rs2.next());
		}
  %>
  
  
  
  
  <script type="text/javascript">
  var e="";
  </script>
  <%
  if(rs3.next()){
		do{
			%>
			<script type="text/javascript">
  			
  			e= e +
  			`<div class="card">
       		<img src="https://www.world-grain.com/ext/resources/Article-Images/2020/12/GMR_Rice_AdobeStock_64819529_E_Nov.jpg?1609338918" class="card-img-top card_img" alt="...">
       		 <div class="card-body">
        	 <h5 class="card-title"><%=rs3.getString("productName")%></h5>
          	 <h6><%=rs3.getString("buyerEmail")%></h6>
          	<h6><%=rs3.getString("quantity")%></h6>
          	<h6><%=rs3.getString("price")%></h6>
        	</div>
        	
      		
        	</div>`;
      		document.getElementById("tcard").innerHTML= e;
  </script>
			<%
		}while(rs3.next());
		}
  %>
  
  <script>
  $(document).ready(function(){
    $("#rsubmit").click(function(){
      pwd=$("#pwd").val();
      rpwd=$("#rpwd").val();
      if(pwd===rpwd){
        
        $("#rs").submit();
      }
      else{
        window.alert("Password mismatch");
      }
    });
  });
</script>
  <script>
	
  		$("#state").load("states.html");			
	
	$('#state').change(function(){
		var st=$("#state").val();
		
		
		$.post("district.jsp",{
			sta : st,
			
		},
		function(data,status){
			
			 $('#district').html(data);
			 
		});
	});
  </script>
</body>

</html>

