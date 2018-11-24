$(function () {
    // tab切换券类型
    var couponType = parseInt(utils.getQuery('flg'));
    if (!couponType) {
        couponType = 1;
    }
    $('.public_tab li').eq(couponType - 1).addClass('active').siblings().removeClass('active');
    $('.public_tab li').click(function () {
        if(!$(this).hasClass('active')){
            $(this).addClass('active').siblings().removeClass('active');
            // 切换券类型,初始化当前页,加载列表数据
            vueObj.queryParams.useFlag = $(this).index() + 1;
            vueObj.queryParams.currentPage = 1;
            vueObj.getCouponList(1);
        }
    });
    $(document).on('click','.coupon_detail',function () {
        var coupon_desc_popup = $(this).parents('.coupon_wrap').find('.coupon_desc_popup');
        if (coupon_desc_popup.hasClass('hide')) {
            coupon_desc_popup.removeClass('hide');
            coupon_desc_popup.parent('.coupon_wrap').
            siblings('.coupon_wrap').children('.coupon_desc_popup').addClass('hide');
        } else {
            coupon_desc_popup.addClass('hide');
        }
        return false;
    });
    $(document).click(function (e) {
        e = window.event.srcElement || window.event.target;
        if (e.className != 'coupon_detail' && e.className != 'coupon_desc_popup' && e.className != 'coupon_desc_detail' && e.className != 'title') {
            $('.coupon_desc_popup').addClass('hide');
        }
    });
});

var vueObj = new Vue({
    el: '#storedCard',
    data: {
        couponList: [],
        total: 0,    // 券总数
        pageCount: 0,  // 总页数
        showData: 12,   // 每页显示条数
        queryParams: {
            useFlag: 1,  // 券类型 1：可使用 2：已使用
            currentPage: 1,  // 当前页数
            pageSize: 12  // 每页条数
        }
    },
    mounted: function () {
        this.getCouponList(1);
    },
    methods: {
        pageInt: function(){
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
                    self.queryParams.currentPage =  api.getCurrent();
                    self.getCouponList();
                    $('html,body').animate({ scrollTop: 0 }, 500);
                }
            });
        },
        getCouponList: function (flag) {
            var self = this;
            loading.show();
            $.ajax({
                url: '/customer/get-stored-card.html',
                data: {
                    params: self.queryParams
                }
            }).done(function (res) {
                if (res.error === 0) {
                    var data = res.data.list || [];
                    if(data.length){
                        data.forEach(function(item){
                            item.endtime = item.endtime.substring(0,item.endtime.indexOf(' '));
                        });
                    }
                    self.couponList = data;
                    self.total = res.data.total || 0;
                    self.pageCount = self.total/self.showData;
                    if(flag){  // 是否需要初始化当前页
                        self.pageInt();
                    }
                }
            }).always(function () {
                loading.hide();
            });
        },
        // 绑定优惠券
        bindCoupon: function(){
           window.location.href="/customer/czcard.html";
        }
    }
});