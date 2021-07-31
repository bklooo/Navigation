// 点击跳转网址
function click_go_web(obj)
{
	var classification = $(obj).parent().parent().parent().parent().parent().parent().prev().children().children().attr('id');
	var name = obj.innerHTML;
	var tr_id = $(obj).parent().parent().attr('id');
	var td_id = $(obj).parent().attr('id');
	$.ajax({
		type: "POST",
		url: "Navigation/geturl/",
		headers:{ "X-CSRFtoken":$.cookie("csrftoken")},
		data: "classification=" + classification + "&name=" + name + "&tr_id=" + tr_id + "&td_id=" + td_id,
		success: function(msg){
		  x = 'http://' + msg;
		  window.open(x); 
		}
	 });
}

// 加载站名
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
						for (var k=0;k<9;k++) {
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

// 获取随机网址
function getsite()
{
	$.ajax({
		type: "GET",
		url: "Navigation/ransite/",
		success: function(msg){
			var r = msg.replace(/\'/g, "\"").replace(/\)\(/g, "\,").replace("\(", "\[").replace("\)", "\]");
			var ranlist = eval("("+r+")");
			var nameid = 0;
			var linkid = 1;
			for (var a=0;a<12;a++) {
				for (b=0;b<3;b++) {
					var s = document.getElementById("tag").getElementsByTagName("table")[0].getElementsByTagName("tbody")[0].getElementsByTagName("tr")[a].getElementsByTagName("td")[b].getElementsByTagName("a")[0];
					s.innerHTML = ranlist[nameid];
					s.href = ranlist[linkid];
					nameid+=2;
					linkid+=2;
				}
			}
		}
	})
}

// 改变背景色
function changColor_1()
{
	var x = document.body
	x.style.backgroundColor = "#C0C0C0";
}
function changColor_2()
{
	var x = document.body
	x.style.backgroundColor = "#87CEEB";
}
function changColor_3()
{
	var x = document.body
	x.style.backgroundColor = "#FFFFF0";
}
function changColor_4()
{
	var x = document.body
	x.style.backgroundColor = "#FFF0F5";
}
function changColor_5()
{
	var x = document.body
	x.style.backgroundColor = "#FFFFFF";
}