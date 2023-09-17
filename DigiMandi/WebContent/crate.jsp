<% String state = request.getParameter("sta");
String district = request.getParameter("dis");
String commodity = request.getParameter("cmd");
%>
<script>

async function market(){   
    const response = await fetch('https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd00000135de12f0f023428964029c24f0193e14&format=json&offset=0&limit=10000');
    const details = await response.json();
	return details;
}
var d = market();
d.then(data=>{
	data.records.forEach(item=>{
		if("<%=state%>"==item.state && "<%=district%>"==item.district && "<%=commodity%>"==item.commodity){
			document.getElementById("data").innerHTML+="<tr><th scope=>"+item.commodity+"</th><td>"+item.variety+"</td><td>"+item.arrival_date+"</td><td>"+item.market+"</td><td>"+item.min_price+"</td><td>"+item.max_price+"</td></tr>";
			
		}
	});
});

</script>
