<%String district=(String)session.getAttribute("district"); 
String state=(String)session.getAttribute("state");
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
    <style>
      .vl {
        border-left: 6px solid green;
        height: 500px;
      }
      </style>
  <title>Live Trading</title>
</head>

<body>
  <h1>Live Trading</h1>
  <div class="row">
  <div class="col">
   <h3> Add Your Product to Live Trading</h3>
   <div style="width: 80%; margin: auto;">
   <form action="Addliveproduct">

    <div class="input-group form-group">
      <div class="input-group-prepend">
        <span class="input-group-text"><i class="fas fa-seedling"></i></span>
      </div>
      <select type="text" name="pname" class="form-control" placeholder="Product Name" id="commodity" required>
        <option selected disabled value="">Select Product</option>
      </select>
    </div>
	<div><h5>Government price of selected product at your market <%=district %> is</h5>
	<h6 id="suggestedprice"> not defined</h6>
	</div>
    <div class="input-group form-group">
      <div class="input-group-prepend">
        <span class="input-group-text"><i class="fas fa-balance-scale"></i></span>
      </div>
      <input type="number" class="form-control" name="pquantity" placeholder="Product Quantity in Quintal" min="1" max="500"required>
    </div>
    <div class="input-group form-group">
      <div class="input-group-prepend">
        <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
      </div>
      <input type="number" class="form-control" name="pprice" placeholder="Price per Quintal" min="1" required>
    </div>
	<label for="date">End date</label>
  	<input type="date" id="date" name="date">
  	<label for="time">End time</label>
  	<input type="time" id="time" name="time">
    <div class="form-group">
      <input type="submit" value="Add" class="btn float-right login_btn">
    </div>
  </form>
  </div>
  </div>
  <div class="col vl">
    <h3>Your Live Products</h3>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Commodity</th>
          <th>Weight</th>
          <th>Last Bid</th>
          <th>Last Bidder</th>
          <th>End date</th>
          <th>End time</th>
        </tr>
      </thead>
      <tbody id="liveproducts">
        
      </tbody>
    </table>
  </div>
</div>
  <div>
  	<a class="btn login_btn" style="width:15%" href="showbid.jsp">Show Bid Order</a>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
    crossorigin="anonymous"></script>
   <script>
$(document).ready(function(){
	$("#commodity").load("commodity.html");
	$("#commodity").change(function(){
  	  
  	 
  	  var cm=$("#commodity").val();
        
        $.post("suggestedprice.jsp",{
          cmd : cm,
          
        },
        function(data,status){
          
           $('#suggestedprice').html(data);
           
        });
  	  
    });
	
	$("#liveproducts").load("liveproducts.jsp");
	
});
</script> 
</body>

</html>