<% 
String state=(String)session.getAttribute("state"); 
String district=(String)session.getAttribute("district"); 
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
			document.getElementById("suggestedprice").innerHTML+="||"+item.commodity+"||"+item.variety+"||"+item.arrival_date+"||"+item.market+"||"+item.min_price+"||"+item.max_price+"||<br>";
			
		}
	});
});

</script>
