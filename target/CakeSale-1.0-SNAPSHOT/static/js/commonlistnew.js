//点击弹出购买框
var buyPop = {
    wrap: null,
    //隐藏弹框
    hide: function () {
        this.wrap && this.wrap.remove();
        cover.hide();
    },
    //显示弹框
    show: function (dom) {
        var items,
            itemsStr = dom.attr('data-items'),
            hideSpec = dom.attr('data-hidespec'),
            isNumCake = dom.hasClass('num_cake'),
            taste = dom.attr('data-goodstastetxt'),
            sweet = dom.attr('data-goodssweet'),
            currentId = dom.attr('data-id'),
            headerText = isNumCake ? '&nbsp;&nbsp;&nbsp;&nbsp;请选择数字' : '',
            headerTitle = isNumCake ? '加入购物车' : '建议食用人数',
            html = '<article class="buy_pop hide" id="buyPop">' +
                '<header>' +
                '<h3>' + headerTitle + headerText + '</h3>' +
                '<a href="javascript:void(0);" class="close_btn">关闭</a>' +
                '</header>' +
                '<div class="main"><section class="top clear_fix ' + (isNumCake ? 'num_cake' : '') + '">';
        itemsStr = itemsStr || '';
        if (!currentId && !itemsStr && !hideSpec) {
            return;
        }
        items = itemsStr.split('@@');
        //假如只有一个规格，直接加购物车
        if (items.length === 1 || hideSpec || !itemsStr) {
            this.buyItem(currentId, 1);
            return;
        }
        $.each(items, function (index, item) {
            var arr = item.split('|'),
                active = '';
            if (currentId === arr[5]) {
                active = ' active';
            }
            // "数字蛋糕（数字0）|Number Cake|http://alpha.lecake.com/postsystem/docroot/images/goods/201803/14211/list_14211_o.jpg|/shop/goods-104149.html|1|104149|14212|1|1|0|1551456000000|100002|建议食用人数|2-4人食|58|198|15|0|19|17|5||0|0|0
            html += '<a href="javascript:void(0)" class="pop_item ' + active + '" ' +
                'data-id="' + arr[5] + '" ' +
                'data-title="' + arr[0] + '" ' +
                'data-title_en="' + arr[1] + '" ' +
                'data-salePrice="' + arr[14] + '" ' +
                'data-passCardPrice="' + arr[22] + '" ' +
                'data-preferentialPrice="' + arr[24] + '" ' +
                'data-taste="' + taste + '" ' +
                'data-sweet="' + sweet + '" ' +
                'data-length="' + arr[16] + '" ' +
                'data-width="' + arr[17] + '" ' +
                'data-height="' + arr[18] + '" ' +
                'data-tableware="' + arr[20] + '" ' +
                'data-weight="' + arr[19] + '">' + (isNumCake ? index : arr[13]) + '</a>';
        });
        html += '</section><div class="detail"></div>';
        html += '</div>' +
            '<footer class="buy_wrap">' +
            '<a href="javascript:void(0)" class="add_cart" id="addCart">加入购物车</a>' +
            '</footer>' +
            '</article>';
        $(html).appendTo($('body'));
        this.wrap = $('#buyPop');
        this.createDetail();
        this.wrap.removeClass('hide');
        cover.show();
        this.bindHandler();
    },
    //检查商品餐具是否要特殊处理
    checkTableware: function (itemId) {
        globalSpecialDinnerware = globalSpecialDinnerware || {};
        var str = '';
        for (var key in globalSpecialDinnerware) {
            if (globalSpecialDinnerware.hasOwnProperty(key)) {
                if (parseInt(key) === itemId) {
                    str = globalSpecialDinnerware[key];
                }
            }
        }
        return str;
    },
    //根据选中的item创建内容
    createDetail: function () {
        var item = this.wrap.find('.pop_item.active'),
            detail = this.wrap.find('.detail'),
            title = item.attr('data-title'),
            title_en = item.attr('data-title_en'),
            salePrice = parseFloat(item.attr('data-salePrice')),
            passCardPrice = parseFloat(item.attr('data-passCardPrice')),
            preferentialPrice = parseFloat(item.attr('data-preferentialPrice')),
            sweet = parseFloat(item.attr('data-sweet')),
            taste = item.attr('data-taste'),
            length = parseFloat(item.attr('data-length')),
            width = parseFloat(item.attr('data-width')),
            height = parseFloat(item.attr('data-height')),
            tableware = parseFloat(item.attr('data-tableware')),
            weight = parseFloat(item.attr('data-weight')),
            itemId = parseInt(item.attr('data-id')),
            str = '<section class="middle clear_fix">' +
                '<div class="f_left title">' +
                '<h2 class="no_wrap">' + title + '</h2>' +
                '<h3>' + title_en + '</h3>' +
                '</div>' +
                '<div class="f_right price_wrap text_right">' +
                '<p class="new_price"><small>¥ </small>' + salePrice + '</p>' +
                (passCardPrice ? '<p class="pass_card_price"><small>¥ </small>' + passCardPrice + '</p>' : '') +
                (preferentialPrice && !passCardPrice ? '<p class="markup_price"><small>¥ </small>' + preferentialPrice + '</p>' : '') +
                '</div>' +
                '</section>';
        var specPrefixText = itemId === 106041 ? '各' : '';
        if (sweet || taste || (width && height) || tableware || weight) {
            var tablewareHtml = tableware ? '<p class="tableware has_icon no_wrap"><i></i>含' + tableware + '套餐具</p>' : '',
                specialDinnerware = this.checkTableware(itemId);
            if (specialDinnerware) {
                tablewareHtml = '<p class="tableware has_icon no_wrap"><i></i>' + specialDinnerware + '</p>';
            }
            var sizeStr = '';
            if(length && width && height){
                sizeStr = length + 'x' + width + 'x' + height;
            } else if (length && width) {
                sizeStr = length + 'x' + width;
            } else if (length && height) {
                sizeStr = length + 'x' + height;
            }
            str += '<section class="bottom clear_fix">' +
                (sweet ? '<p class="taste no_wrap">口味：' + taste + '</p>' : '') +
                (sizeStr ? '<p class="size has_icon no_wrap">' + specPrefixText + '约<i></i>' + sizeStr + 'cm</p>' : '') + tablewareHtml +
                (sweet ? '<p class="sweet">甜度：<i class="level_' + sweet + '"></i></p>' : '') +
                (weight ? '<p class="weight has_icon">' + specPrefixText + '约<i></i>' + weight + 'g</p>' : '') +
                '</section>';
        }
        detail.html(str);
    },
    //绑定弹框内部dom事件
    bindHandler: function () {
        var self = this,
            wrap = self.wrap;
        //关闭弹框
        wrap.find('.close_btn').click(function () {
            self.hide();
        });
        //切换选中商品
        $('.pop_item').click(function () {
            $(this).addClass('active').siblings().removeClass('active');
            self.createDetail();
        });
        //加入购物车
        $('#addCart').click(function () {
            var itemId = wrap.find('.pop_item.active').attr('data-id'),
                amount = 1;
            self.buyItem(itemId, amount);
        });
    },
    //加入购物车
    buyItem: function (itemId, amount) {
        if (!itemId) {
            return;
        }
        amount = amount || 1;
        var self = this;
        loading.show();
        app_js.buyItem(itemId, amount, false, {
            success: function () {
                var buyItemCallback = window.buyItemCallback || '';
                if (utils.isType(buyItemCallback, 'function')) {
                    buyItemCallback();
                } else {
                    $.alert('加入购物车成功', {
                        confirmText: '去结算',
                        confirmFn: function () {
                            $.removeDialog();
                            window.location = '/cart/index.html';
                        },
                        autoClose: true
                    });
                }
            },
            always: function () {
                loading.hide();
                self.hide();
            }
        }, true);
    }
};
/**
 * 商品列表操作
 * 当鼠标enter时显示购买按钮，点击弹出选择商品框
 * 首页/商品列表页/详情页
 */
var itemHandler = function () {
    //点击购买弹出购买框
    $(document).on('click', '.buy_btn', function () {
        var me = $(this);
        if (me.hasClass('normal') || me.hasClass('disabled')) {
            return;
        }
        buyPop.show(me.parents('.p_item_new'));
    });
};
$(function () {
    //订单列表页处理
    itemHandler();
    //商品列表图片懒加载
    $('.lazy').lazyload({
        threshold: 200,
        effect: 'fadeIn'
    });
});