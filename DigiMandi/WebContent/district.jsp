
<%String sta= request.getParameter("sta"); %>

<script>
    async function loc(){
    const response = await fetch('https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd00000135de12f0f023428964029c24f0193e14&format=json&offset=0&limit=10000');
    const users = await response.json();
    return users;
}
var c = loc();
var dis= new Array();
i=0;
c.then((data) => {
	
  	data.records.forEach(myFunction);
		function myFunction(item,index) {
				
		if("<%=sta%>"==item.state){
        	
        	dis[i]=item.district;
        	
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
			var uniques = dis.unique();
			uniques.forEach(element =>{
				document.getElementById("district").innerHTML+="<option>"+element+"</option>";
				
				});

			dis=[];
});


  </script>
