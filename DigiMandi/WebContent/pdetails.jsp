<%@include file="db.jsp" %>
<%

String pname=request.getParameter("pname");
String district=request.getParameter("dis");
String price=request.getParameter("pprice");
String quantity=request.getParameter("pqu");
String email=request.getParameter("email");
String Bemail=(String)session.getAttribute("email");


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
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Dropdown
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
	<form>
  <div class="form-row">
    <div class="col">
      PRODUCT NAME<input type="text" class="form-control" value=<%=pname%>>
    </div>
  </div>
  <div class="form-row">
    <div class="col">
      QUANTIY<input type="number" class="form-control" id="quantity" min="1" max="<%=quantity%>>"value=<%=quantity%>>
    </div>
   
  </div>
  <input type="submit" value="submit" hidden>
</form>
    <button id="cbtn">Contract</button>
    <div id="contract"></div>
    <script>
	$(document).ready(function(){
		$("#cbtn").click(function(){
			var quant = document.getElementById("quantity").value;
			var pr =  quant * parseInt(<%=price%>);
			
			console.log(quant +" "+pr);
			document.getElementById("contract").innerHTML= `<h3>Contract Between Seller and Buyer</h3>
			<p>price is `+pr+` of product <%=pname%> having quantity`+ quant+`</p>
			<form action="Contract">
			<input type="hidden" name="pname" value="<%=pname%>">
			<input type="hidden" name="price" value=`+pr+`>
			<input type="hidden" name="bemail" value=<%=Bemail%>>
			<input type="hidden" name="semail" value=<%=email%>>
			<input type="hidden" name="quantity" value=`+quant+`>
			
			<input type="submit" value="Confirm contract">
			</form>`
			;
		});
	});
			
	
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  </body>
</html>
