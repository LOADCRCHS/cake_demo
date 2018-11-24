// JavaScript Document
/*------------------------选择地点下拉效果2014-4--18------------------------*/

$(document).ready(function(){
  $(".TN_address").click(function(){
    $(".TN_chooseADD").slideToggle("slow");
  });
  $(".TN_chooseADD a").click(function(){
    $(".TN_chooseADD").slideUp("slow");
  });
});
/*------------------------下拉菜单悬浮下拉效果---------------------*/
$(document).ready(function(){
$(".TN_menu ul li").hover(
			function(){
				
				$(this).children(".TN_drop-down").show();
				
			},
			function(){
				$(this).children(".TN_drop-down").hide();
			}
		)
});
/*-----------------首页banner_foalt滚动效果---------------------------*/
//980

//$(document).ready(function(){
//	var sTo = 0;
//	var sMar = null;
//	var outDiv = $(".TN_banner");
//	var insideDiv = $("#imgList1");
//	var toNum = 0;
//	var sudu = 49;
//	var bro=$.browser;
//	if(bro.msie)
//		sudu = 49;
//	function scrollTo(){
//		if(outDiv.scrollLeft() == sTo){
//			if(outDiv.scrollLeft() == 4900){
//				outDiv.scrollLeft(0);
//				toNum = 0;
//			}
//			clearInterval(sMar);
//		}else if(outDiv.scrollLeft() < sTo)
//			outDiv.scrollLeft(outDiv.scrollLeft()+sudu);
//		else
//			outDiv.scrollLeft(outDiv.scrollLeft()-sudu);
//	}
//
//	$(".TN_BUT").hover(
//		function(){
//			clearInterval(sTimer);
//			var overIndex = $(this).parent().children().index($(this));
//			toNum = overIndex-1;
//			$(this).parent().children(":eq(0)").animate({"marginLeft":85*toNum},200);
//			clearInterval(sMar);
//			sTo = toNum*980;
//			sMar = setInterval(scrollTo,10);
//		},
//		function(){
//			clearInterval(sTimer);
//			sTimer = setInterval(scrollTimer,3000);
//		}
//	);
///*------------------------------------->
//	$(".TN_leftJ").click(
//		function(){
//			clearInterval(sTimer);
//			var overIndex = $(this).parent().children().index($(this));
//			toNum = overIndex-1;
//			$(this).parent().children(":eq(0)").animate({"marginLeft":85*toNum},200);
//			clearInterval(sMar);
//			sTo = toNum*980;
//			sMar = setInterval(scrollTo,10);
//		},
//		function(){
//			clearInterval(sTimer);
//			sTimer = setInterval(scrollTimer,3000);
//		}
//	);
//
//	$(".TN_rightJ").click(
//		function(){
//			clearInterval(sTimer);
//			var overIndex = $(this).parent().children(":eq(2)").index($(this));
//			toNum = overIndex-1;
//			$(this).parent().children(":eq(2)").children().animate({"marginLeft":85*toNum},200);
//			clearInterval(sMar);
//			sTo = toNum*980;
//			sMar = setInterval(scrollTo,10);
//		},
//		function(){
//			clearInterval(sTimer);
//			sTimer = setInterval(scrollTimer,3000);
//		}
//	);
//---------------------------------------------------------------------------*/
//
//	$(".TN_banner").hover(
//		function(){
//			clearInterval(sTimer);
//		},
//		function(){
//			clearInterval(sTimer);
//			sTimer = setInterval(scrollTimer,3000);
//		}
//	)
//
//	function scrollTimer(){
//		toNum ++;
//		if(toNum == 5){
//			$("#TN_float").css({"marginLeft":0});
//		}
//		$("#TN_float").animate({"marginLeft":85*(toNum%5)},200);
//		clearInterval(sMar);
//		sTo = toNum*980;
//		sMar = setInterval(scrollTo,10);
//	}
//	var sTimer = setInterval(scrollTimer,3000);
//
//});

//首页商品悬浮效果class="TN_goods"---2014-4-23------------------>

$(document).ready(function(){
		$("#TN_DG1").mouseenter(function(){
				var targetObj = this;
			    t=setTimeout(function(){$(targetObj).children("#TN_DP1").animate({left:'0px'},500)},500);//第一个时间是触动效果"#TN_DP1"滑出时间，第二个时间是悬浮停留时间				
			}
		).mouseleave(function(){
				var targetObj = this;
		        $(targetObj).children("#TN_DP1").stop().animate({left:'-650px'},500);//时间是"#TN_DP1"消失时间，速度是width：650px/500毫秒，可控。
			    clearTimeout(t);
			}
		);
});

$(document).ready(function(){
		$("#TN_DG2").mouseenter(function(){
				var targetObj = this;
			    t=setTimeout(function(){$(targetObj).children("#TN_DP2").animate({top:'0px'},500)},500);
				
			}
		).mouseleave(function(){
				var targetObj = this;
		        $(targetObj).children("#TN_DP2").stop().animate({top:'-410px'},500);
			    clearTimeout(t);
			}
		);
});

$(document).ready(function(){
		$("#TN_DG3").mouseenter(function(){
				var targetObj = this;
			    t=setTimeout(function(){$(targetObj).children("#TN_DP3").animate({right:'0px'},500)},500);
				
			}
		).mouseleave(function(){
				var targetObj = this;
		        $(targetObj).children("#TN_DP3").stop().animate({right:'-650px'},500);
			    clearTimeout(t);
			}
		);
});

$(document).ready(function(){
		$("#TN_DG4").mouseenter(function(){
				var targetObj = this;
			    t=setTimeout(function(){$(targetObj).children("#TN_DP4").animate({left:'0px'},500)},500);
				
			}
		).mouseleave(function(){
				var targetObj = this;
		        $(targetObj).children("#TN_DP4").stop().animate({left:'-650px'},500);
			    clearTimeout(t);
			}
		);
});

$(document).ready(function(){
		$("#TN_DG5").mouseenter(function(){
				var targetObj = this;
			    t=setTimeout(function(){$(targetObj).children("#TN_DP5").animate({bottom:'0px'},500)},500);
				
			}
		).mouseleave(function(){
				var targetObj = this;
		        $(targetObj).children("#TN_DP5").stop().animate({bottom:'-410px'},500);
			    clearTimeout(t);
			}
		);
});

$(document).ready(function(){
		$("#TN_DG6").mouseenter(function(){
				var targetObj = this;
			    t=setTimeout(function(){$(targetObj).children("#TN_DP6").animate({right:'0px'},500)},500);
				
			}
		).mouseleave(function(){
				var targetObj = this;
		        $(targetObj).children("#TN_DP6").stop().animate({right:'-650px'},500);
			    clearTimeout(t);
			}
		);
});

/****首页底部商品悬浮效果******/
$(document).ready(function(){

    function createAniHtml() {
        $('.ani_product').each(function () {
            var me = $(this),
                items,
                itemsStr = me.attr('data-items'),
                aniStr = me.attr('data-str'),
                firstPrice = 0,
                disabled = '',
                html = '<div class="ani_bottom" style="display: none"><h4>' + aniStr + '</h4><p class="p_num_wrap">';
            if (!itemsStr) {
                return;
            }
            items = itemsStr.split(':');
            $.each(itemsStr.split(':'), function (index, item) {
                var arr = item.split('|'),
                    active = '';
                if (index == parseInt(me.attr('data-item-index'), 10)) {
                    active = ' active';
                    firstPrice = arr[1];
                    if (arr[3] == 0) {
                    	disabled = ' disabled';
					}
                }
                html += '<a class="p_num' + active + '" href="javascript:void(0)" data-stock="' + arr[3] + '" data-id="' + arr[0] + '" data-price="' + arr[1] + '">' + arr[2] + '</a>';
            });
            html += '<i class="clear_both"></i></p>' +
				'<h5>' +
				'<strong>¥&nbsp;<span class="ani_price">' + firstPrice + '</span></strong>' +
				'<a href="javascript:void(0)" class="add_cart' + disabled + '">加入购物车</a>' +
				'</h5>' +
				'</div>';
            me.append(html);
            var aniDom = me.find('.ani_bottom');
            aniDom.css({bottom: -aniDom.height()}).find('.p_num').click(function () {
                var that = $(this);
                if (that.hasClass('active')) {
                    return;
                }
                var ani_price =  aniDom.find('.ani_price'),
					ani_cart = aniDom.find('.add_cart');
                that.addClass('active').siblings().removeClass('active');
                ani_price.text(that.attr('data-price'));
                me.attr('data-item-index', that.index());
                if (parseInt(that.attr('data-stock'), 10) == 1) {
                    ani_cart.removeClass('disabled');
				} else {
                    ani_cart.addClass('disabled');
				}
            });
            me.find('.add_cart').click(function () {
            	if ($(this).hasClass('disabled')) {
            		return;
				}
                var id = aniDom.find('.p_num.active').attr('data-id');
                if (!id) {
                    comm_alert("请选择商品！");
                    return false;
                } else {
                    general_cart.addNew(id, 1);
                }
            });
            me.mouseenter(function () {
                aniDom.stop();
                aniDom.show().css({bottom: -aniDom.height() - 10});
                setTimeout(function () {
                    aniDom.animate({bottom: 0}, 500);
                }, 300);
            }).mouseleave(function () {
                aniDom.animate({bottom: -aniDom.height()}, 500, function () {
                    aniDom.hide();
                });
            });
        });
    }

    createAniHtml();
});
 $(document).ready(function(){
		$("li.TN_index_drop-top dd p.TN_one a").click(
			function(){
				$("li.TN_index_drop-top dd p.TN_one a").removeClass("TN_cut");
				$(this).addClass("TN_cut");
				
			});
			
			$("li.TN_index_drop-top dd p.TN_tow a").click(
			function(){
				$("li.TN_index_drop-top dd p.TN_tow a").removeClass("TN_cut");
				$(this).addClass("TN_cut");
				
			});
			
	 });	


/*---------------蛋糕馆banner动态效果-----------------------------*/
var idx = 0;
function chg(){	
	idx ++;
	if(idx==$("#showImgs").children().length){
		idx = 0;
	}
	idxChange(idx);
}
var changeMethod = setInterval(chg,3000);
function idxChange(idx_cur){
	$imgObj = $("#showImgs").children(":eq("+idx_cur+")");
	$imgObj.show().siblings().hide();
}
$(document).ready(function(e) {
	$("#showImgs").hover(
		function(){
			clearInterval(changeMethod);
		},
		function(){
			clearInterval(changeMethod);
			changeMethod = setInterval(chg,3000);
		}
	)
});


/*蛋糕管口味时刻切换效果*/

   $(document).ready(
	function(){
	/*
       $("#TN_SMALE").click(
			function(){
				$(".TN_NONEbg").animate({width:'190px'},500);
				
				$("#TN_none").animate({left:'190px'},500);
				$(this).hide();
				$("#TN_TIME").show();
			});
			
		 $("#TN_TIME").click(	
			function(){
				$(".TN_NONEbg").animate({width:'0px'},501);
				$("#TN_none").animate({left:'-190px'},500);
				$(this).hide();
				$("#TN_SMALE").show();
			});
		 $("ul#TN_none li").click(
			function(){
				$(this).toggleClass("TN_cut");
				$(this).children(".TN_drop-down").show();
			});
	    
		
		*/
		$("ul.TN_CAKE_ul li").hover(
			function(){
				$(this).fadeTo(100,0.7);
				
			},function(){
				$(this).fadeTo(100,1);
				
			})

		$("ul.TN_CAKE_ul li").mouseenter(function(){
				var targetObj = this;
			    t=setTimeout(function(){$(targetObj).children(".TN_CAKEdrop-right").show()},300);
				
			}
		).mouseleave(function(){
				var targetObj = this;
		        $(targetObj).children(".TN_CAKEdrop-right").stop().hide();
			    clearTimeout(t);
			}
		);
});	

	
	
/*蛋糕馆商品鼠标悬浮效果*/
	 
$(document).ready(function(){
    
	$(".TN_CAKE_goodsUL").mouseenter(function(){
			var targetObj = this;
			 t=setTimeout(function(){$(targetObj).children(".TN_CAKE_drop-top").animate({height:'100px'},500)},500); //.fadeTo(500,1)},500);
			 $('li.TN_CAKE_drop-top dd p.TN_one a[value="'+$(this).attr('post_id')+'"]').trigger('click');
		}
	).mouseleave(function(){
		var targetObj = this;
		$(targetObj).children(".TN_CAKE_drop-top").stop().animate({height:'0px'},500);  //.fadeTo(500,0);
			clearTimeout(t);
		}
	);
});


 $(document).ready(function(){
		$("li.TN_CAKE_drop-top dd p.TN_one a").click(
			function(){
				$("li.TN_CAKE_drop-top dd p.TN_one a").removeClass("TN_cut");
				$(this).addClass("TN_cut");
				
			});
			$("li.TN_CAKE_drop-top dd p.TN_tow a").click(
			function(){
				$("li.TN_CAKE_drop-top dd p.TN_tow a").removeClass("TN_cut");
				$(this).addClass("TN_cut");
				
			});
			
	 });

//商品详情页切换 商品图片
$(function(){
    $('img[id^=goods_switch_img_]').mouseover(function(){
        $('img[id^=goods_switch_img_]').removeClass('over');
        $(this).addClass('over');
        var src = $(this).attr('longdesc');
        $('#big_display_img').attr('src',src);
    });
});

/*详情页TAB效果
$(document).ready(function(){
    $("ul.TN_goodsRight li.TN_one dd#DAN-1").mouseenter(
        function(){
            $(":text").val('1');
            $("ul.TN_goodsRight li.TN_one dd").removeClass("TN_cut");
            $(this).addClass("TN_cut");
            $("#SAN-1").show();
            $("#SAN-2").hide();
            $("#SAN-3").hide();
            $("#SAN-4").hide();
            $("#SPEC-1").show();
            $("#SPEC-2").hide();
            $("#SPEC-3").hide();
            $("#SPEC-4").hide();

        });
    $("ul.TN_goodsRight li.TN_one dd#DAN-2").mouseenter(
        function(){
            $(":text").val('1');
            $("ul.TN_goodsRight li.TN_one dd").removeClass("TN_cut");
            $(this).addClass("TN_cut");
            $("#SAN-2").show();
            $("#SAN-1").hide();
            $("#SAN-3").hide();
            $("#SAN-4").hide();
            $("#SPEC-2").show();
            $("#SPEC-1").hide();
            $("#SPEC-3").hide();
            $("#SPEC-4").hide();

        });
    $("ul.TN_goodsRight li.TN_one dd#DAN-3").mouseenter(
        function(){
            $(":text").val('1');
            $("ul.TN_goodsRight li.TN_one dd").removeClass("TN_cut");
            $(this).addClass("TN_cut");
            $("#SAN-3").show();
            $("#SAN-1").hide();
            $("#SAN-2").hide();
            $("#SAN-4").hide();
            $("#SPEC-3").show();
            $("#SPEC-2").hide();
            $("#SPEC-1").hide();
            $("#SPEC-4").hide();

        });
    $("ul.TN_goodsRight li.TN_one dd#DAN-4").mouseenter(
        function(){
            $(":text").val('1');
            $("ul.TN_goodsRight li.TN_one dd").removeClass("TN_cut");
            $(this).addClass("TN_cut");
            $("#SAN-4").show();
            $("#SAN-1").hide();
            $("#SAN-3").hide();
            $("#SAN-2").hide();
            $("#SPEC-4").show();
            $("#SPEC-2").hide();
            $("#SPEC-3").hide();
            $("#SPEC-1").hide();

        });

});
	 
/*****详情页组合JS*********2014-5-20*****/ 
//控制滚动条 
 $(document).ready(function(){

   var len = $("#TN_focus ul li").length;
  $("#TN_focus ul").css("width",330* (len)-10);//JS控制UL宽度
  
  if(len>3)//判断LI个数大于3个出现滚动条，高度增加
  {   
	$(".TN_teem").css({"overflow-x":"scroll","overflow-y":"hidden","height":"261"}); 
  }
  });
   
  
  //点选商品，选中和取消效果
 $(document).ready(function(){
  $("p.TN_gou span.one").click(function(){
	 $(this).removeClass("TN_show").addClass("TN_hide");
	  $(this).siblings(".tow").removeClass("TN_hide").addClass("TN_show"); 
  });
  
  $("p.TN_gou span.tow").click(function(){
	 $(this).removeClass("TN_show").addClass("TN_hide");
	  $(this).siblings(".one").removeClass("TN_hide").addClass("TN_show"); 
  });
});
 

/**********************************样式2014/4/21节点
**********************************************
************************************************************/
