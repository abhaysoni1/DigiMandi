<% 
String state = request.getParameter("sta");
String district = request.getParameter("dis");
%>
<script>
    async function loc(){
    const response = await fetch('https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd00000135de12f0f023428964029c24f0193e14&format=json&offset=0&limit=10000');
    const users = await response.json();
    return users;
}
var c = loc();
var com= new Array();
var i=0;
c.then((data) => {
	console.log(data);
  	data.records.forEach(myFunction);
		function myFunction(item,index) {
				
		if("<%=state%>"==item.state && "<%=district%>"==item.district){
        	
        	com[i]=item.commodity;
        	
        	i=i+1;
  		}
	}
		Array.prototype.contains = function(v) {
			  for (var i = 0; i < this.length; i++) {
			    if (this[i] === v) return true;
			  }
			  return false;
			};

			Array.prototype.unique = function() {
			  var arr = [];
			  for (var i = 0; i < this.length; i++) {
			    if (!arr.contains(this[i])) {
			      arr.push(this[i]);
			    }
			  }
			  return arr;
			}
			var uniques = com.unique();
			uniques.forEach(element =>{
				document.getElementById("commodity").innerHTML+="<option>"+element+"</option>";
				
				});

			com=[];
});


  </script>