/**
 * Created by luzd on 17/4/20.
 */
$(function () {
    (function () {
        //遮罩层
        var cover = {
            show: function (options) {
                var opt = $.extend({}, {css: {}}, options);
                $('<div class="global_cover" id="globalCover"></div>').appendTo($('body')).css(opt.css).click(function () {
                    opt.clickHandler && opt.clickHandler();
                });
            },
            hide: function () {
                $('#globalCover').remove();
            }
        };
        //弹出框
        var dialog = {
            wrap: null,
            hide: function () {
                this.wrap.remove();
                cover.hide();
            },
            show: function (options) {
                var self = this;
                var defaults = {
                    title: '提示信息',
                    content: ''
                };
                var opts = $.extend({}, defaults, options);
                var footer = '',
                    html = '<article class="dialog_pop" id="dialogPop">' +
                        '<header>' +
                        '<h3>' + opts.title + '</h3>' +
                        '<a href="javascript:void(0);" class="close_btn">关闭</a>' +
                        '</header>' +
                        '<div class="main">' +
                        '<p>' + opts.content + '</p>' +
                        '</div>';
                if (opts.confirmFn || opts.cancelFn) {
                    footer = '<footer>';
                    if (opts.confirmFn) {
                        footer += '<a class="btn confirm_btn ' + (opts.cancelFn ? 'has_right' : '') + '" href="javascript:void(0)">确定</a>';
                    }
                    if (opts.cancelFn) {
                        footer += '<a class="btn cancel_btn" href="javascript:void(0)">取消</a>';
                    }
                    footer += '</footer>';
                }
                html += footer + '</article>';
                $(html).appendTo($('body'));
                this.wrap = $('#dialogPop');
                this.wrap.find('.confirm_btn').click(function () {
                    opts.confirmFn();
                }).end().find('.cancel_btn').click(function () {
                    opts.cancelFn();
                }).end().find('.close_btn').click(function () {
                    self.hide();
                    opts.closeFn && opts.closeFn();
                });
                cover.show();
            }
        };
        //初始化城市选择器
        var citySelector = {
            wrap: null,
            cityArr: [
                {
                    id: 2,
                    title: '上海',
                    alias: 'SH'
                },
                {
                    id: 287,
                    title: '北京',
                    alias: 'BJ'
                },
                {
                    id: 420,
                    title: '广州',
                    alias: 'GZ'
                },
                {
                    id: 355,
                    title: '南京',
                    alias: 'NJ'
                },
                {
                    id: 449,
                    title: '成都',
                    alias: 'CD'
                },
                {
                    id: 499,
                    title: '重庆',
                    alias: 'CQ'
                },
                {
                    id: 386,
                    title: '深圳',
                    alias: 'SN'
                },
                {
                    id: 83,
                    title: '杭州',
                    alias: 'HZ'
                },
                {
                    id: 228,
                    title: '苏州',
                    alias: 'SZ'
                },
                {
                    id: 334,
                    title: '天津',
                    alias: 'TJ'
                },
                {
                    id: 356,
                    title: '宁波',
                    alias: 'NB'
                },
                {
                    id: 261,
                    title: '无锡',
                    alias: 'WX'
                },
                {
                    id: 446,
                    title: '绍兴',
                    alias: 'SX'
                },
                {
                    id: 447,
                    title: '嘉兴',
                    alias: 'JX'
                }
            ],
            hide: function () {
                this.wrap.remove();
                cover.hide();
            },
            show: function () {
                var self = this,
                    currentCity = get_COOKIE_INFO('CITY_ALIAS'),
                    html = '<article class="city_selector" id="citySelector">' +
                        '<header>' +
                        '<h3>当前选择城市：<strong><i></i>' + $('#currentCity').text() + '</strong>' +
                        '</h3><a href="javascript:void(0);" class="close_btn">关闭</a>' +
                        '</header>' +
                        '<div class="main clear_fix">' +
                        '<label class="f_left">全部城市：</label>' +
                        '<div class="city_list_wrap clear_fix">';
                $.each(self.cityArr, function (i, v) {
                    html += '<a href="javascript:void(0)" data-id="' + v.id + '" data-alias="' + v.alias + '" class="' + (v.alias == currentCity ? 'active' : '') + '">' + v.title + '</a>';
                });
                html += '</div>' +
                    '</div>' +
                    '</article>';
                $(html).appendTo($('body'));
                this.wrap = $('#citySelector');
                cover.show();
                this.bindHandler();
            },
            link: function (alias) {
                window.location.href = '/' + alias + '/index.html';
            },
            bindHandler: function () {
                var self = this,
                    wrap = self.wrap;
                //关闭弹框
                wrap.find('.close_btn').click(function () {
                    self.hide();
                });
                //切换城市
                wrap.find('.city_list_wrap a').click(function () {
                    var me = $(this),
                        alias = me.attr('data-alias'),
                        cityId = me.attr('data-id'),
                        cartNum = parseInt(get_COOKIE_INFO('CARTAMOUNT'), 10);
                    if (me.hasClass('active')) {
                        self.hide();
                        return false;
                    }
                    if (cartNum) {
                        self.hide();
                        dialog.show({
                            content: '切换城市您的购物车将清空！',
                            confirmFn: function () {
                                dialog.hide();
                                city.city_alias_id = alias + '_' + cityId;
                                city.city_alias = alias;
                                cart.city_change_empty();
                            },
                            cancelFn: function () {
                                dialog.hide();
                            }
                        });
                    } else {
                        self.link(alias);
                    }
                });
            },
            init: function () {
                var self = this;
                $(document).on('click', '#selectCity', function () {
                    self.show();
                });
                var currentCity = get_COOKIE_INFO('CITY_ALIAS');
                $.each(self.cityArr, function (i, v) {
                    if (v.alias == currentCity) {
                        $('#currentCity').text(v.title);
                    }
                });
            }
        };
        citySelector.init();
        //微信图片
        $('.wx_btn').on('mouseenter', function () {
            $(this).find('img').show();
        }).on('mouseleave', function () {
            $(this).find('img').hide();
        });
        $('#footerServiceBtn').click(function () {
            $('#serviceBtn').click();
        });
        //客服
        $(document).on('click', '#serviceBtn,#footerServiceBtn', function () {
            $('#online_service').click();
        });
        //判断用户
        var myCustomerId = customer.cust_id;
        //获取心享卡 信息
        var hasPassCard = get_COOKIE_INFO('has_pass_card'); //是否已购买心享卡
        if (myCustomerId == null) {
            var rem_user = get_COOKIE_INFO('REMEMBER_USERNAME');
            if (rem_user) {
                $("#customerName").html('欢迎您 ' + rem_user + ' <a href="/customer/login.html" onclick="_statLog.logClick(\'nav_login\', \'登录\')">登录</a>' +
                    '<a href="javascript:void(0)">/</a>' +
                    '<a href="/customer/register.html" onclick="_statLog.logClick(\'nav_register\', \'注册\')">注册</a>');
            } else {
                $("#customerName").html('<a href="/customer/login.html" onclick="_statLog.logClick(\'nav_login\', \'登录\')">登录</a>' +
                    '<a href="javascript:void(0)">/</a>' +
                    '<a href="/customer/register.html" onclick="_statLog.logClick(\'nav_register\', \'注册\')">注册</a>');
            }
        } else {
            var passCardText = '';
            if (hasPassCard === '1') {
                passCardText = '<i id="passCardFlag" class="active"></i>';
            } else {
                passCardText = '<i id="passCardFlag"></i>';
            }
            $("#customerName").html('<strong class="user_name no_wrap">' + passCardText + myCustomerId + ' </strong><a href="/shop/logout.php" onclick="_statLog.logClick(\'nav_exit\', \'退出\')" class="logout_btn">退出</a>');
        }
        //购物车数量

        var cart_amount = get_COOKIE_INFO("CARTCNT");
        var cart_amount_lightning = get_COOKIE_INFO("CARTAMOUNT_lightning");
        cart_amount = parseInt(Number(cart_amount));
        cart_amount_lightning = parseInt(Number(cart_amount_lightning));
        if (!cart_amount) {
            $("#globalCartNum").hide();
        } else {
            $("#globalCartNum").show().find('b').text(cart_amount + cart_amount_lightning);
        }
        //底部导航根据站点区分url
        var _url = '';
        $('.TN_footercen .TN_Ftow a').each(function () {
            if ($.trim($(this).text()) === '客服服务') {
                _url = $(this).attr('href');
            }
        });
        $('.global_footer .footer_nav a').each(function () {
            if ($.trim($(this).text()) === '客服服务') {
                $(this).attr('href', _url);
            }
        })
    })();
});