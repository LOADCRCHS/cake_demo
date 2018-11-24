$(function () {
    //主图轮播
    new Swiper('#banner', {
        autoplay: true,
        speed: 800,
        loop: true,
        navigation: {
            nextEl: '.next_btn',
            prevEl: '.prev_btn'
        }
    });

    var loadImgInSwiperArr = [];
    //评论轮播
    if ($('#comments .swiper-wrapper li').length > 1) {
        new Swiper('#comments', {
            speed: 800,
            loop: false,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            },
            on: {
                slideChange: function () {
                    loadImgInSwiper(this.activeIndex);
                }
            }
        });
    }
    $('.swiper-slide-active .slideLazy').lazyload({
        effect: 'fadeIn'
    });

    function loadImgInSwiper(activeIndex) {
        if (activeIndex === 0) {
            return;
        }
        if ($.inArray(activeIndex, loadImgInSwiperArr) === -1) {
            setTimeout(function () {
                $('.slideLazy').lazyload({
                    effect: 'fadeIn', // 载入使用何种效果
                    threshold: 12, // 提前开始加载
                    container: $('#comments .swiper-slide-active')
                });
            }, 0);
        }
        loadImgInSwiperArr.push(activeIndex);
    }


    //2018.08.08 情人节弹窗
    (function () {
        var plat = 'pc',
            flag = 'activity_180808',
            key = flag + '_' + plat,
            clearKey = 'clear_' + key;
        if (utils.getQuery(clearKey)) {
            sessionStorage.removeItem(key);
        }
        var val = sessionStorage.getItem(key);
        if (!val) {
            sessionStorage.setItem(key, 'isSet');
            var dom = $('.' + flag);
            dom.removeClass('hide').find('.close_btn').click(function () {
                dom.remove();
            });
            var height = $(window).height() * .96,
                _h = height > 610 ? 610 : height,
                _w = _h * 600 / 610;
            dom.find('.div_img').css({
                width: _w + 'px',
                height: _h + 'px'
            }).removeClass('hide');
        }
    })();

    //2018.11.06 领券
    (function () {
        var plat = 'pc',
            flag = 'activity_181106',
            key = flag + '_' + plat,
            clearKey = 'clear_' + key;
        if (utils.getQuery(clearKey)) {
            localStorage.removeItem(key);
        }
        var val = localStorage.getItem(key);
        if (!val) {
            localStorage.setItem(key, 'isSet');
            var dom = $('.' + flag);
            dom.removeClass('hide').click(function () {
                dom.remove();
            }).find('.div_img').click(function (e) {
                e.stopPropagation();
            }).find('.close_btn').click(function () {
                dom.remove();
            });
            setTimeout(function () {
                dom.remove();
            }, 10000);
        }
    })();

    //2018.09.15 广东台风提示
    (function () {
        var cityAlias = cookie.get('CITY_ALIAS');
        if (cityAlias === 'SH') {
            $("#marquee").removeClass('hide').marquee({duration: 8000, delayBeforeStart: 0, pauseOnHover: true});
        }
    })();
});