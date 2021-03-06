// JavaScript Document
/*-----------------首页banner_foalt滚动效果--需要页面加载完成JS按顺序运行，初始打开页面，banner第一张滚动时间延长3s左右。-----------------------*/
//980
var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
var len = $("#focus ul li").length; //获取焦点图个数
var index = 0;
var picTimer;

//以下代码添加底部按钮
var btn = "<div class='btnBg'><div class='btn'>";
for(var i=0; i < len; i++) {
	btn += "<span></span>";
}
btn += "</div></div>";
$("#focus").append(btn);
//$("#focus .btnBg").css("opacity",0.8);

//为小按钮添加鼠标滑入事件，以显示相应的内容
$("#focus .btnBg .btn span").addClass('mouseout').mouseover(function() {
	index = $("#focus .btnBg .btn span").index(this);
	showPics(index);
}).eq(0).trigger("mouseover");

//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
$("#focus ul").css("width",sWidth * (len));
//计算底部按钮外围div宽度，按钮自动居中，85是每个span的宽度，如果修改，同步修改样式宽度
$("#focus .btnBg .btn").css("width",85* (len));

//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
$("#focus").hover(function() {
	clearInterval(picTimer);
},function() {
	picTimer = setInterval(function() {
		showPics(index);
		index++;
		if(index == len) {index = 0;}
	},3000); //此3000代表自动播放的间隔，单位：毫秒
}).trigger("mouseleave");

//显示图片函数，根据接收的index值显示相应的内容
function showPics(index) { //普通切换
	var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
	$("#focus ul").stop(true,false).animate({"left":nowLeft},300); //通过animate()调整ul元素滚动到计算出的position
	$("#focus .btnBg .btn span").stop(true,false).removeClass('mouseover').addClass('mouseout').eq(index).stop(true,false).removeClass('mouseout').addClass('mouseover'); //为当前的按钮切换到选中的效果
}
