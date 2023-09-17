<%
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");

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

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
    <link rel="stylesheet" type="text/css" href="customer.css">
    <title>Hello, world!</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg pt-3">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">DigiMandi</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon">#</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="livetradingcustomer.jsp">Live Trading</a>
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
    <div id="pselect" style="text-align:center;">
    
      <div class="row">
        <select class="form-select mr-2 col" id="pt">
          <option selected disabled value="">Product Type</option>
         
        </select>
        <select class="form-select mr-2 col" id="lc" >
          <option selected disabled value="">location</option>
          
          
        </select>
      </div>
      <div>
    <h1>Your data here </h1>
    <button id="lbtn"> load type</button>
    <hr>
    <div class="container mt-5 overflow-auto" style="height:500px;width:700px;overflow:scroll;">
	    <div id ="contents" >
	    
	    
	    </div>
    </div>
    </div>
    </div>
    <script type="text/javascript">
  	document.getElementById("email-tab").innerHTML = "<%= email%>";
  	document.getElementById("usertype-tab").innerHTML = "<%=usertype%>";
  	</script>
    <script>
	$(document).ready(function(){
		
		
			$('#pt').load('ptype.jsp');
			$('#lc').load('location.jsp');
		
		$('#lbtn').click(function(){
			var pt=document.getElementById('pt').value;
			var lc=document.getElementById('lc').value;
			
			
			$.post("content.jsp",{
				pname : pt,
				location : lc
			},
			function(data,status){
				
				 $('#contents').html(data);
				 
			});
		});
		
	});
			
	
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  </body>
</html>
