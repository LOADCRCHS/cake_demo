var carouselSwiper = null,
    isDigital = parseInt($('#goodsImg').attr('data-digital')) === 1;
$(function () {
    //主图轮播
    carouselSwiper = new Swiper('#goodsImg', {
        autoplay: {
            delay: 3000,
            stopOnLastSlide: false,
            disableOnInteraction: false
        },
        speed: 500,
        loop: !isDigital,
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        observer: true,
        observeParents: true,
        paginationClickable: true,
        autoplayDisableOnInteraction: false
    });

    //加入购物车
    $('#cartAdd,#cartAdd1').click(function () {
        _addCart(false);
    });
    //立即购买
    $('#buyNow,#buyNow1').click(function () {
        _addCart(true);
    });

    function _addCart(isQuickBuy) {
        var params = [{
            sku_id: $('#uid').val(),
            amount: 1,
            checked: 1
        }], fn = {};
        //如果是数字蛋糕
        if ($('#numCakeTab').length) {
            params = [];
            var currentItem = $('#numCakeTab .tab_item.active'),
                label = currentItem.attr('data-label'),
                isConstellation = currentItem.attr('data-isConstellation'),
                id = currentItem.attr('data-id');
            if (label.length > 1 && !isConstellation) {
                var labelArr = label.split('');
                $('#numCakeTab .tab_item').each(function () {
                    var me = $(this),
                        label = me.attr('data-label'),
                        id = me.attr('data-id');
                    if ($.inArray(label, labelArr) !== -1) {
                        params.push({
                            sku_id: id,
                            amount: 1,
                            checked: 1
                        });
                    }
                });
            } else {
                params.push({
                    sku_id: id,
                    amount: 1,
                    checked: 1
                });
            }
        }
        if (!isQuickBuy) {
            fn.success = function () {
                $.alert('加入购物车成功', {autoClose: true});
            }
        }
        $('.group_item').each(function () {
            var me = $(this);
            if (me.hasClass('active')) {
                params.push({
                    sku_id: me.attr('data-uid'),
                    amount: 1,
                    checked: 1
                });
            }
        });
        app_js.buyItem(params, null, false, fn);
    }

    //点击音乐icon跳转音乐说明
    $('#audioTips').click(function () {
        var dom = $('.audio_desc');
        if (dom.length) {
            $('html, body').animate({scrollTop: dom.offset().top - $('.global_header').height()}, 500);
        }
    });
    //商品评论
    (function () {
        //获取商品评论
        $.ajax({
            method: 'get',
            url: '/goods/get-comment.html',
            data: {
                twoPostID: $('#twoPostId').val(),
                type: 1,
                pageCount: 100
            }
        }).done(function (data) {
            if (data.list && data.total > 0) {
                var hotComment = '',
                    allComment = '',
                    li = '',
                    html = '',
                    len = data.list.length;
                for (var i = 0; i < len; i++) {
                    li = data.list[i];
                    //上传图片
                    var imgList = '';
                    if (li.imgList) {
                        imgList = '<div class="info upload_wrap commented clear_fix">';
                        $.each(li.imgList, function (i, v) {
                            imgList += '<div class="upload_item">' +
                                '<div class="div_img">' +
                                '<img src="' + GlobalConfig.staticUrl + 'images/grey.gif" data-original="' + v.thumbnail_img + '" data-src="' + v.original_img + '">' +
                                '</div>' +
                                '<div class="show_wrap"><a href="javascript:void(0)" class="upload_show"></a></div>' +
                                '</div>';
                        });
                        imgList += '</div>';
                    }
                    var reply = '';
                    if (li.reply) {
                        reply = '<div class="info reply_info">' +
                            '<p class="clear_fix comment_title">' +
                            '<span class="comment_username">[ 小诺回复 ]</span>' +
                            '<span class="comment_username"></span>' +
                            '<span class="comment_date" style="color: #949494;">' + li.replyTime.substring(0, 10) + '</span>' +
                            '</p>' +
                            '<p>' + li.reply + '</p>' +
                            '</div>';
                    }
                    html = '<li class="clear_fix' + (i > 9 ? ' hide' : '') + '">' +
                        '<div class="img_wrap f_left"></div>' +
                        '<div class="info">' +
                        '<p class="clear_fix comment_title">' +
                        '<span class="comment_username">' + li.creator + '</span>' +
                        '<span class="comment_spec">规格：' + li.displaySpec + '</span>' +
                        '<span class="comment_date">' + li.createTime + '</span>' +
                        '</p>' +
                        '<p>' + li.content + '</p>' +
                        '</div>' +
                        imgList +
                        reply +
                        '</li>';
                    if (i < 2) {
                        hotComment += html;
                    }
                    allComment += html;
                }
                $('#hotComment').html('<div class="hot_comment">' +
                    '<h4><i></i>用户评论</h4>' +
                    '<ul class="comment_list">' + hotComment + '</ul>' +
                    '<p class="text_center"><a href="javascript:void(0)" class="more" id="moreComment">更多评论+</a></p>' +
                    '</div>');
                $('#allComment .comment_wrap').append(
                    '<div class="all_comment">' +
                    '<ul class="comment_list">' + allComment + '</ul>' +
                    '</div>');
                $('.upload_item').imageShow();

                $('.goods_fixed .comment_count').text('(' + len + ')');
                // 如果有评论
                if (len && len > 0) {
                    // 展示右侧的资源位
                    $('#allComment .top,.resource_wrap').removeClass('hide');
                    // 显示底部更多icon
                    if (len > 10) {
                        $('#allComment .btn_wrap').removeClass('hide');
                    }
                }
            }
        });
        $(document).on('click', '#moreComment', function () {
            $('html, body').animate({scrollTop: $('#allComment').offset().top - $('.global_header').height()}, 800);
        });
        $(document).on('click', '#toggleMoreComment', function () {
            var all_comment = $(this).parents('#allComment').find('.all_comment');
            if (all_comment.hasClass('active')) {
                all_comment.removeClass('active').find('li:gt(4)').addClass('hide');
                $(this).removeClass('active')
            } else {
                all_comment.addClass('active').find('li:gt(4)').removeClass('hide');
                $(this).addClass('active')
            }
        });
    })();

    //数字蛋糕
    $('.tab_item').click(function () {
        var me = $(this);
        me.addClass('active').siblings().removeClass('active');
        setNumCake();
    });
    setNumCake();

    function setNumCake() {
        $('.tab_item').each(function () {
            var me = $(this);
            if (me.hasClass('active')) {
                var price = me.attr('data-price'),
                    image = me.attr('data-image'),
                    currentId = me.attr('data-id'),
                    mainIndex = parseInt(me.attr('data-mainIndex')),  // 主商品索引
                    appendPicSize = parseInt(me.attr('data-appendPicSize')),  // 主商品与第一个列表商品之间插了几张图
                    name = me.attr('data-name'),
                    spec = me.attr('data-spec'),
                    tableware = me.attr('data-tableware'),
                    goodsLength = parseInt(me.attr('data-goodsLength')),
                    goodsWidth = parseInt(me.attr('data-goodsWidth')),
                    goodsHeight = parseInt(me.attr('data-goodsHeight')),
                    goodsWeight = parseInt(me.attr('data-goodsWeight'));
                $('.group_buy .goods_main_img img').prop('src', image);
                $('.group_buy .goods_name').text(name);
                $('#goodsTitle').text(name);
                $('#goodsPrice').text(price);
                // 顶部悬浮商品属性设置
                $('.goods_fixed .goods_name').text(name);
                $('.goods_fixed .price i').text(price);
                $('.goods_fixed .people i').text(spec);
                // 点击tab切换轮播图和规格描述
                var _index = me.index();
                if (currentId == 106883) {
                    // carouselSwiper.slideTo(1);
                    $('#bread_type01').removeClass('hide').siblings('.bread_spec').addClass('hide');
                } else if (currentId == 106880) {
                    // carouselSwiper.slideTo(2);
                    $('#bread_type02').removeClass('hide').siblings('.bread_spec').addClass('hide');
                } else if (currentId == 106876) {
                    // carouselSwiper.slideTo(3);
                    $('#bread_type03').removeClass('hide').siblings('.bread_spec').addClass('hide');
                } else {
                    var str = '';
                    if(goodsLength && goodsWidth && goodsHeight){
                        str = '<i></i>约' + goodsLength + 'x' + goodsWidth + 'x' + goodsHeight + 'cm';
                    } else if (goodsLength && goodsWidth) {
                        str = '<i></i>约' + goodsLength + 'x' + goodsWidth + 'cm';
                    } else if (goodsLength && goodsHeight) {
                        str = '<i></i>约' + goodsLength + 'x' + goodsHeight + 'cm';
                    }
                    $('.size').html(str);
                    $('.tableware').html('<i></i>含' + tableware + '套餐具');
                    $('.weight').html('<i></i>约' + goodsWeight + 'g');
                    if (_index === mainIndex) {
                        carouselSwiper.slideTo(0);
                    } else if (_index < mainIndex) {
                        carouselSwiper.slideTo(_index + appendPicSize + 1);
                    } else {
                        carouselSwiper.slideTo(_index + appendPicSize);
                    }
                }
            }
        });
    }

    // 监听页面滚动,展示顶部商品悬浮栏
    $(document).on('scroll', function () {
        if ($(this).scrollTop() >= 760) {
            $('.goods_fixed').removeClass('hide');
        } else {
            $('.goods_fixed').addClass('hide');
        }
    });
    $('.goods_fixed .goods_comment').click(function () {
        $('html, body').animate({scrollTop: $('#allComment').offset().top - 230}, 500);
    });
    $('.goods_fixed .goods_hot').click(function () {
        $('html, body').animate({scrollTop: $('.recommend').offset().top - 230}, 500);
    });

    //加价购
    checkGroupStatus();
    $('.add_group').click(function () {
        $(this).parents('.group_item').toggleClass('active');
        checkGroupStatus();
    });
    if ($('.group_list_wrap').hasClass('need_swiper')) {
        new Swiper('#groupList', {
            slidesPerView: 'auto',
            slidesPerColumn: 1,
            spaceBetween: 0,
            slidesPerGroup: 4,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            }
        });
    }
});

function checkGroupStatus() {
    var groupCount = $('.group_item.active').length;
    $('#groupBuyCount').text(groupCount);
    var itemPrice = parseFloat($('#goodsPrice').text()),
        totalPrice = itemPrice;
    $('.group_item.active').each(function () {
        totalPrice += parseFloat($(this).attr('data-price'));
    });
    $('#totalGroupPrice').text(parseFloat(utils.currency(totalPrice)));
}