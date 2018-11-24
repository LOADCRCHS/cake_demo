$(function () {
    // tab切换券类型
    var couponType = parseInt(utils.getQuery('flg'));
    if (!couponType) {
        couponType = 1;
    }
    $('.public_tab li').eq(couponType - 1).addClass('active').siblings().removeClass('active');
    $('.public_tab li').click(function () {
        if (!$(this).hasClass('active')) {
            $(this).addClass('active').siblings().removeClass('active');
            // 切换券类型,初始化当前页,加载列表数据
            vueObj.isGetList = false;
            vueObj.queryParams.useFlag = $(this).index() + 1;
            vueObj.queryParams.currentPage = 1;
            vueObj.getCouponList(1);
        }
    });

    $(document).on('click', '.coupon_rule', function () {
        var coupon_desc_popup = $(this).parents('.coupon_wrap').find('.coupon_desc_popup');
        if (coupon_desc_popup.hasClass('hide')) {
            coupon_desc_popup.removeClass('hide');
            coupon_desc_popup.parent('.coupon_wrap').siblings('.coupon_wrap').children('.coupon_desc_popup').addClass('hide');
            $('.checkRules .coupon_desc_popup').addClass('hide');
        } else {
            coupon_desc_popup.addClass('hide');
        }
        return false;
    });
    $(document).on('click', '.couponRules', function () {
        var coupon_desc_popup = $(this).siblings('.coupon_desc_popup');
        if (coupon_desc_popup.hasClass('hide')) {
            coupon_desc_popup.removeClass('hide');
            $('.coupon_wrap .coupon_desc_popup').addClass('hide');
        } else {
            coupon_desc_popup.addClass('hide');
        }
        return false;
    });
    $(document).click(function (e) {
        e = window.event.srcElement || window.event.target;
        if (e.className != 'couponRules' && e.className != 'coupon_rule' && e.className != 'coupon_desc_popup' && e.className != 'coupon_desc_detail' && e.className != 'title') {
            $('.coupon_desc_popup').addClass('hide');
        }
    });
});

var vueObj = new Vue({
    el: '#coupon',
    data: {
        couponList: [],
        total: 0,    // 券总数
        pageCount: 0,  // 总页数
        showData: 12,   // 每页显示条数
        queryParams: {
            useFlag: 1,  // 券类型 1：可使用 2：已使用 3：已过期
            currentPage: 1,  // 当前页数
            pageSize: 12   // 每页条数
        },
        couponCode: '',
        isGetList: false,
        weeklyCoupons: null,
        activeWeeklyCoupons: null,
        isShowPop: false  // 是否展示二维码弹窗
    },
    mounted: function () {
        this.getCouponList(1);
        if (weeklyCoupons[0]) {
            this.weeklyCoupons = this.createList(weeklyCoupons[0]);
        }
        if (weeklyCoupons[1]) {
            this.activeWeeklyCoupons = this.createList(weeklyCoupons[1]);
        }
    },
    methods: {
        quickBuy: function () {
            this.isShowPop = true;
        },
        //处理对象为数组
        createList: function (obj) {
            var list = [],
                sizeArray = obj;
            for (var i in sizeArray) {
                if (sizeArray.hasOwnProperty(i)) {
                    var o = {
                        couponId: i,
                        goodsId: sizeArray[i]
                    };
                    list.push(o);
                }
            }
            return list;
        },
        pageInt: function () {
            var self = this;
            // 分页
            $('.paging_wrap').pagination({
                totalData: self.total,
                showData: self.showData,
                coping: true,
                prevContent: '上一页',
                nextContent: '下一页',
                pageCount: self.pageCount,
                callback: function (api) {
                    self.queryParams.currentPage = api.getCurrent();
                    self.getCouponList();
                    $('html,body').animate({scrollTop: 0}, 500);
                }
            });
        },
        getCouponList: function (flag) {
            var self = this;
            this.couponList = [];
            loading.show();
            $.ajax({
                url: '/customer/get-coupon.html',
                data: {
                    params: self.queryParams
                }
            }).done(function (res) {
                if (res.error === 0) {
                    var data = res.data.list || [];
                    if (data.length) {
                        data.forEach(function (item) {
                            item.startDate = utils.formatDate(item.startDate, 'yyyy-MM-dd');
                            item.endDate = utils.formatDate(item.endDate, 'yyyy-MM-dd');
                            if (item.description) {
                                item.descTitle = item.description.replace('<br/>', "");
                            }
                            if (item.couponId === 20017) {
                                var now = parseInt(new Date().getTime()),
                                    start = parseInt(new Date('2018/6/14').getTime());
                                if (now < start) {
                                    item.isDisabled = true;
                                } else {
                                    item.isDisabled = false;
                                }
                            }
                        });
                    }
                    self.couponList = data;
                    self.total = res.data.total || 0;
                    self.pageCount = self.total / self.showData;
                    if (flag) {  // 是否需要初始化当前页
                        self.pageInt();
                    }
                }
            }).always(function () {
                loading.hide();
                self.isGetList = true;
            });
        },
        // 使用优惠券
        useCoupon: function (e) {
            const self = this;
            var couponId = parseInt(e.target.dataset.couponid), couponName = e.target.dataset.couponname;
            self.weeklyCoupons.forEach(function (item) {
                if (parseInt(item.couponId) === couponId) {
                    self.isShowPop = true;
                }
            });
            self.activeWeeklyCoupons.forEach(function (item) {
                if (parseInt(item.couponId) === couponId) {
                    self.isShowPop = true;
                }
            });
            if (!self.isShowPop) {
                // var myCity = cookie.get('CITY_ID').split('_')[0];
                // location.href = "/" + myCity + "/category-0-1.html";
                location.href = '/goods/search.html?keyword=' + couponId + '&couponName=' + couponName;
            }
        },
        // 绑定优惠券
        bindCoupon: function (code) {
            var self = this;
            if (!code) {
                $.toast('优惠券码不能为空');
                return;
            }
            var isExits = self.couponList.some(function (item) {
                return item.code === code;
            });
            if (isExits) {
                $.toast('请勿重复添加优惠券');
                return;
            }
            loading.show();
            $.ajax({
                url: '/customer/bind-coupon.html',
                data: {
                    code: code
                }
            }).done(function (res) {
                if (res.error === 0) {
                    $.toast('优惠券已绑定成功');
                    setTimeout(function () {
                        window.location.reload();
                    }, 500);
                } else {
                    $.toast(res.msg);
                }
            }).always(function () {
                loading.hide();
            });
        }
    }
});