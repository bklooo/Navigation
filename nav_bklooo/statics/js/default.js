function click_go_web()
{
	// var website = document.getElementById("website").getElementsByTagName("a").text();  // 找到元素
	$.ajax({
		type: "POST",
		url: "geturl/",
		data: "classification=classification_1&w_id=w1&name=百度",
		success: function(msg){
		  x = 'http://' + msg;
		  window.open(x); 
		}
	 });
}