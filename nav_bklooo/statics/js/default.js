// 点击获取网址
function click_go_web()
{
	$.ajax({
		type: "POST",
		url: "geturl/",
		data: "classification=classification_1&name=百度&tr_id=tr1&td_id=td1",
		success: function(msg){
		  x = 'http://' + msg;
		  window.open(x); 
		}
	 });
}