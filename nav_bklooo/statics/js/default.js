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

// 加载网址资源
window.onload = function load_site_name()
{
	$.ajax({
		type: "GET",
		url: "sitename/",
		success: function(msg){
			if (msg != "error") {
				let namelist = msg.replace(/\[/g, "").replace(/\]/g, "").split(",");
				var id = 0;
				for (var i=1;i<13;i++) {
					var classall = "class_all_" + i.toString();
					for (var j=0;j<6;j++) {
						// var tr = "tr" + j.toString();
						for (k=0;k<9;k++) {
							// var td = "td" + k.toString();
							var x = document.getElementById(classall).getElementsByTagName("tr")[j].getElementsByTagName("td")[k].getElementsByTagName("a")[0];
							// window.alert(x);
							x.innerHTML = namelist[id];
							id++;
						}
					}
				}
			}
		}
	})
}