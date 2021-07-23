// 点击获取网址
function click_go_web(obj)
{
	var classification = $(obj).parent().parent().parent().parent().parent().parent().prev().children().children().attr('id');
	var name = obj.innerHTML;
	var tr_id = $(obj).parent().parent().attr('id');
	var td_id = $(obj).parent().attr('id');
	$.ajax({
		type: "POST",
		url: "Navigation/geturl/",
		data: "classification=" + classification + "&name=" + name + "&tr_id=" + tr_id + "&td_id=" + td_id,
		success: function(msg){
		  x = 'http://' + msg;
		  window.open(x); 
		}
	 });
}

// 加载网址资源
function load_site_name()
{
	$.ajax({
		type: "GET",
		url: "Navigation/sitename/",
		success: function(msg){
			if (msg != "error") {
				var namelist = msg.split(",");
				var id = 0;
				for (var i=1;i<13;i++) {
					var classall = "class_all_" + i.toString();
					for (var j=0;j<6;j++) {
						for (k=0;k<9;k++) {
							var x = document.getElementById(classall).getElementsByTagName("tr")[j].getElementsByTagName("td")[k].getElementsByTagName("a")[0];
							x.innerHTML = namelist[id];
							id++;
						}
					}
				}
			}
		}
	})
}