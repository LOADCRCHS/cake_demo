cartData = cartData || {};

//费南雪（107418）在购物车仅可和普洱小金砖（107968）合买，不可和其他商品合买
var FNXGoodsIds = [107418], PEGoodsIds = [107968];
$(function () {
    cartObj = new Vue({
        el: '#mainCart',
        data: {
            itemCount: cartData.count,                      //购物车商品数量
            buyList: cartData.buy_list || [],               //正常商品列表
            accessories:  [],                 //配件
            birthdayList: cartData.birthDayCardList || [],               //默认生日牌
            showBirthdayCardList: [],                      //显示生日牌的商品列表
            specialDinnerware: globalSpecialDinnerware || {},            //某些商品特殊餐具数量

            totalPrice: cartData.totalPrice,                //总金额
            discountsPrice: cartData.discountsPrice,        //优惠金额

            fetching: false,                                //是否正在提交订单

            //weeklyAloneSku: weeklyAloneSku || [],              //仅可单独购买的熊抱吐司加价购商品列表
            weeklyGoods: {},                              //熊抱吐司加价购商品
            weeklyIndex: 0,                          //周周配当前选择项
            isShowSingleWeeklyGoods: false                  //是否显示单品吐司
        },
        created: function () {
            this.itemCount = cartData.count;
            if (window.weeklyGoods) {
                this.weeklyGoods = weeklyGoods;
            }
        },
        mounted: function () {
            new Swiper('.accessories .swiper-container', {
                slidesPerView: 'auto',
                slidesPerColumn: 1,
                spaceBetween: 0,
                slidesPerGroup: 5,
                navigation: {
                    nextEl: '.accessories .swiper-button-next',
                    prevEl: '.accessories .swiper-button-prev'
                }
            });
            //单品吐司
            this.isShowSingleWeeklyGoods = true;
        },
        methods: {
            //获取指定id的商品
            getItemInfo: function (sku_id) {
                var currentItem,
                    amount = 0,
                    attributes = {},
                    goodsName = '',
                    checked = 1,
                    use_bargain_id = 0;
                this.goodsList.forEach(function (item) {
                    if (item.sku_id === sku_id) {
                        currentItem = item;
                    }
                });
                if (currentItem) {
                    amount = currentItem.amount;
                    attributes = currentItem.attributes;
                    goodsName = currentItem.goods_name;
                    checked = currentItem.checked;
                    use_bargain_id = currentItem.use_bargain_id;
                }
                return {
                    amount: amount,
                    attributes: attributes,
                    goodsName: goodsName,
                    checked: checked,
                    use_bargain_id: use_bargain_id
                };
            },
            //切换选中商品
            toggleItem: function (sku_id) {
                var itemInfo = this.getItemInfo(sku_id),
                    checked = itemInfo.checked;
                this.createData(sku_id, {checked: checked === 1 ? 0 : 1});
            },
            //切换全部商品
            toggleAll: function () {
                var self = this;
                var checked = self.isCheckAll ? 0 : 1,
                    params = self.goodsList.map(function (item) {
                        return {
                            sku_id: item.sku_id,
                            amount: item.amount,
                            attributes: item.attributes,
                            checked: checked
                        }
                    });
                self.updateCart(params, {});
            },
            //编辑购物车
            updateCartNum: function (sku_id, flag, newVal, oldVal, event, fn) {
                var self = this,
                    fn = fn || {
                        fail: function () {
                            if (event) {
                                event.target.value = oldVal;
                            }
                        }
                    };
                sku_id = parseInt(sku_id);
                var itemInfo = this.getItemInfo(sku_id),
                    amount = itemInfo.amount;
                if (!utils.isType(newVal, 'undefined')) {
                    amount = newVal;
                }
                amount += flag;
                if (amount > 99) {
                    $.alert('数量不能大于99');
                    if (event) {
                        event.target.value = oldVal;
                    }
                    return false;
                }
                if (amount <= 0) {
                    var dialog = $.confirm('确定删除', function () {
                        dialog.hide();
                        self.createData(sku_id, {amount: amount});
                    }, {
                        cancelFn: function () {
                            dialog.hide();
                            if (event) {
                                event.target.value = oldVal;
                            }
                        }
                    });
                    return;
                }
                //如果是新添加商品，页面滚动到顶部
                if (!itemInfo.goodsName && !fn.success) {
                    fn.success = function () {
                        $('html, body').animate({scrollTop: 0}, 300);
                    };
                }
                self.createData(sku_id, {amount: amount, checked: itemInfo.checked}, fn);
            },
            //直接输入商品数量
            changeNum: function (sku_id, amount, event) {
                var val = event.target.value;
                if (!utils.isDigital(val)) {
                    $.alert('您输入的格式不正确');
                    event.target.value = amount;
                    return false;
                }
                this.updateCartNum(sku_id, 0, parseInt(val), amount, event);
            },
            //切换生日牌
            toggleBirthdayCard: function (sku_id, flag) {
                var showBirthdayCardList = this.showBirthdayCardList;
                if (flag && $.inArray(sku_id, showBirthdayCardList) === -1) {
                    showBirthdayCardList.push(sku_id);
                } else {
                    this.showBirthdayCardList = showBirthdayCardList.filter(function (item) {
                        return item !== sku_id;
                    });
                }
            },
            //设置生日牌
            setBirthdayWords: function (sku_id, words, e) {
                if (e) {
                    words = $.trim($(e.target).siblings('.customer_input').val());
                }
                if (utils.len(words) > 28) {
                    $.alert('生日牌最多14个汉字或28个字母');
                    return;
                }
                var self = this;
                var itemInfo = this.getItemInfo(sku_id),
                    attributes = itemInfo.attributes || {};
                attributes.goods_birthday = words;
                this.createData(sku_id, {attributes: attributes}, {
                    success: function () {
                        self.toggleBirthdayCard(sku_id, false);
                    }
                });
            },
            //切分
            cut: function (sku_id, num) {
                var itemInfo = this.getItemInfo(sku_id),
                    attributes = itemInfo.attributes || {};
                attributes.goods_cut = attributes.goods_cut > 0 ? '' : num;
                this.createData(sku_id, {attributes: attributes});
            },
            //选择是否升磅
            toggleUpgradePrice: function (sku_id, use_bargain_id) {
                var itemInfo = this.getItemInfo(sku_id);
                use_bargain_id = itemInfo.use_bargain_id > 0 ? '' : use_bargain_id;
                this.createData(sku_id, {use_bargain_id: use_bargain_id});
            },
            //删除商品
            deleteAll: function () {
                var self = this;
                var list = self.goodsList.filter(function (item) {
                    return item.checked;
                });
                if (list.length === 0) {
                    $.alert('请选择要删除的商品');
                    return;
                }
                var params = list.map(function (item) {
                    return {sku_id: item.sku_id, amount: 0};
                });
                $.confirm('确定删除？', function () {
                    $.removeDialog();
                    self.updateCart(params, {});
                });
            },
            //单个商品操作构造数据
            createData: function (sku_id, option, fn) {
                fn = fn || {};
                var self = this;
                var itemInfo = self.getItemInfo(sku_id);
                itemInfo = $.extend(itemInfo, option);
                var params = [{
                    sku_id: sku_id,
                    amount: itemInfo.amount,
                    attributes: itemInfo.attributes,
                    use_bargain_id: itemInfo.use_bargain_id,
                    checked: itemInfo.checked
                }];
                self.updateCart(params, fn);
            },
            //编辑购物车公用方法
            updateCart: function (params, fn) {
                var self = this;
                loading.show({showText: false});
                globalCart.update({
                    params: params,
                    success: function (res) {
                        self.setData(res);
                        fn.success && fn.success(res);
                    },
                    fail: function (msg) {
                        $.alert(msg);
                        fn.fail && fn.fail();
                    },
                    always: function () {
                        loading.hide();
                        fn.always && fn.always();
                    }
                }, false);
            },
            //去结算，构造形如[['sku_id' => 102541, 'amount' => 1]]的数组参数
            //前置条件 1，未在请求中 2，判断单独购买商品 3，判断是否全部配件
            submit: function () {
                if (this.fetching) {
                    return;
                }
                var self = this,
                    params = [],
                    newParams = [],
                    sku_id = 0,
                    hasAlone = false,
                    aloneGoodsName = '',
                    goodsList = self.goodsList,
                    cakeIds = [],
                    accessoriesIds = [],
                    totalNum = 0,                         //总数量
                    pointsGoodsNum = 0,                 //积分商品
                    FNXGoodsNum = 0,                    //费南雪商品数量
                    PEGoodsNum = 0,                     //普洱小金砖商品数量
                    weeklyAloneSkuNum = 0,              //仅可单独购买的吐司商品数量
                    weeklyAloneSingleSkuNum = 0,              //仅可单独购买的吐司商品数量(单品吐司可与特定商品一块购买)
                    weeklyAlonePackageSkuNum = 0,                 //仅可单独购买的吐司商品数量(套餐)
                    weeklyGoodsNum = 0,                 //吐司加价购商品数量
                    canBuyWithToastGoodsNum = 0,                    //可以和吐司馆商品一同购买的商品数量
                    canBuyWithToastGoods = null,                      //可以和吐司馆商品一同购买的商品
                    overMaxAmountGoods = null,               //数量超过自身最大可购买数量的商品
                    toastPackageIds = [106883, 106880, 106876],                         //仅可单独购买的吐司套餐id
                    selectedUpgradePriceGoodsNum = 0,                                       //已经选中了加价升级的商品数量
                    notSelectedUpgradePriceGoodsNum = 0,                                  //可以参加升磅但未选中升磅的商品数量
                    weeklyGoodsIds = self.weeklyGoodsList.map(function (item) {
                        return parseInt(item.uid);
                    });
                //for test
                if (GlobalConfig.site_env === 'alpha') {
                    toastPackageIds = [103700];
                }
                goodsList.forEach(function (item) {
                    if (item.checked) {
                        sku_id = item.sku_id;
                        if (item.need_points > 0) {
                            pointsGoodsNum++;
                        }
                        if (item.goods_type === 1) {
                            cakeIds.push(item.sku_id);
                        }
                        if (self.aloneIds.indexOf(sku_id) !== -1) {
                            hasAlone = true;
                            aloneGoodsName = self.getItemInfo(sku_id).goodsName;
                        }
                        //配件 goods_type
                        if (item.goods_type === 2 || item.goods_type === 3) {
                            accessoriesIds.push(sku_id);
                        }
                        if ($.inArray(sku_id, self.weeklyAloneSku) !== -1) {
                            weeklyAloneSkuNum += item.amount;
                            if ($.inArray(sku_id, toastPackageIds) === -1) {
                                weeklyAloneSingleSkuNum += item.amount;
                            } else {
                                weeklyAlonePackageSkuNum += item.amount;
                            }
                        }
                        if ($.inArray(sku_id, weeklyGoodsIds) !== -1) {
                            weeklyGoodsNum += item.amount;
                        }
                        if (item.preferentialNum > 0 && item.amount > item.preferentialNum && !overMaxAmountGoods) {
                            overMaxAmountGoods = item;
                        }
                        if ($.inArray(sku_id, milkGoods) !== -1) {
                            canBuyWithToastGoodsNum++;
                            if (!canBuyWithToastGoods) {
                                canBuyWithToastGoods = item;
                            }
                        }

                        if ($.inArray(sku_id, FNXGoodsIds) !== -1) {
                            FNXGoodsNum += item.amount;
                        }

                        if ($.inArray(sku_id, PEGoodsIds) !== -1) {
                            PEGoodsNum += item.amount;
                        }

                        if (item.upgradePriceInfo.id && !item.use_bargain_id) {
                            notSelectedUpgradePriceGoodsNum++;
                        }
                        if (item.use_bargain_id) {
                            selectedUpgradePriceGoodsNum++;
                        }

                        totalNum += item.amount;
                        params.push({
                            sku_id: sku_id,
                            amount: item.amount,
                            use_bargain_id: item.use_bargain_id,
                            attributes: item.attributes
                        });
                    }
                });
                if (params.length === 0) {
                    $.alert('请先购买商品');
                    return;
                }
                if (hasAlone && params.length !== 1) {
                    $.alert(aloneGoodsName + ' 只能单独下单购买');
                    return;
                }
                if (accessoriesIds.length === params.length) {
                    $.alert('不可以单独购买配件');
                    return;
                }

                if (overMaxAmountGoods) {
                    $.alert(overMaxAmountGoods.goods_name + '购买数量不能大于' + overMaxAmountGoods.preferentialNum);
                    return;
                }

                if (canBuyWithToastGoodsNum > 0 && canBuyWithToastGoodsNum + weeklyAloneSingleSkuNum !== totalNum) {
                    $.alert(canBuyWithToastGoods.goods_name + '只能和特定吐司商品同时购买');
                    return;
                }

                //检查熊抱吐司加价购商品
                //仅可单独下单的吐司
                if (weeklyAloneSkuNum > 0) {
                    if (weeklyAloneSkuNum > 1) {
                        $.alert('吐司商品购买数量不能大于1', {
                            confirmText: '我知道了'
                        });
                        return;
                    }
                    if (weeklyAlonePackageSkuNum > 0 && params.length > 1) {
                        $.alert('吐司商品仅可单独购买且数量不能大于1', {
                            confirmText: '我知道了'
                        });
                        return;
                    }
                    if (weeklyAloneSingleSkuNum > 0 && canBuyWithToastGoodsNum + weeklyAloneSingleSkuNum !== totalNum) {
                        $.alert('吐司商品只能和特定商品同时购买');
                        return;
                    }
                }

                //吐司可以单独购买，或者仅和蛋糕一块合买
                if (cakeIds.length === 0 && weeklyGoodsNum === 1) {
                    $.alert('熊抱吐司加价购商品不可单独购买，必须和蛋糕商品一起购买！', {
                        confirmText: '我知道了'
                    });
                    return;
                }
                if (weeklyGoodsNum > 1) {
                    $.alert('熊抱吐司加价购商品只能选择1种且数量不能大于1', {
                        confirmText: '我知道了'
                    });
                    return;
                }
                if (weeklyGoodsNum > 0 && pointsGoodsNum > 0) {
                    $.alert('熊抱吐司加价购商品和积分商品不能同时购买', {
                        confirmText: '我知道了'
                    });
                    return;
                }

                if (FNXGoodsNum > 0 && FNXGoodsNum + PEGoodsNum !== totalNum) {
                    $.alert('金砖形费南雪礼盒仅可和普洱小金砖礼盒同时购买', {
                        confirmText: '我知道了'
                    });
                    return;
                }

                //拆单商品暂不参与升磅活动
                if (weeklyGoodsNum > 0) {
                    if (selectedUpgradePriceGoodsNum) {
                        $.alert('您的订单中已选择加价升级优惠，不能与吐司优惠同享哦');
                        return;
                    }
                } else {
                    if (notSelectedUpgradePriceGoodsNum && !selectedUpgradePriceGoodsNum) {
                        $.confirm($('<h2 class="orange">您当前选择的蛋糕单品可享受加价升级服务哦^_^，</h2><h3>请选择是否升级？</h3>'), null, {
                            className: 'square_type',
                            hideHeader: true,
                            showClose: true,
                            confirmText: '是，我要升级',
                            cancelText: '否，直接购买',
                            confirmFn: function () {
                                $.removeDialog();
                                newParams = [];
                                params.forEach(function (item) {
                                    item = $.extend({}, item);
                                    goodsList.forEach(function (goods) {
                                        var upgradePriceInfo = goods.upgradePriceInfo;
                                        if (goods.sku_id === item.sku_id) {
                                            if (upgradePriceInfo.id && !item.use_bargain_id) {
                                                item.use_bargain_id = upgradePriceInfo.id;
                                            }
                                        }
                                    });
                                    newParams.push(item);
                                });
                                self.doSubmit(newParams, weeklyGoodsNum, weeklyAloneSkuNum);
                            },
                            cancelFn: function () {
                                $.removeDialog();
                                self.doSubmit(params, weeklyGoodsNum, weeklyAloneSkuNum);
                            },
                            closeFn: function () {
                                $.removeDialog();
                            }
                        });
                        return;
                    }
                }
                self.doSubmit(params, weeklyGoodsNum, weeklyAloneSkuNum);
            },
            //跳转结算页
            doSubmit: function (params, weeklyGoodsNum, weeklyAloneSkuNum) {
                var self = this,
                    activity = '';
                self.fetching = true;
                $.ajax({
                    /*method: 'get',
                    url: '/cart/to-order.html',
                    data: {
                        params: params
                    }*/
                    method: 'POST',
                    url: '/cart/to-order.html',
                    data: JSON.stringify(params),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8"
                }).done(function (res) {
                    if (res.error === 0) {
                        //跳转结算页
                        var page = '/index';
                        if (weeklyGoodsNum > 0) {
                            page = '/weekly-buy';
                            activity = 'weeklyBuy';
                        }
                        if (weeklyAloneSkuNum > 0) {
                            //仅购买吐司商品
                            page = '/exchange';
                            activity = 'exchange';
                        }
                        window.location = '/order' + page + '.html?buyId=' + res.data.buyId + '&activity=' + activity;
                    } else {
                        $.alert(res.msg);
                    }
                }).fail(function () {
                    $.alert('提交失败，请重试');
                }).always(function () {
                    self.fetching = false;
                });
            },
            //编辑购物车后设置购物车信息
            setData: function (res) {
                this.buyList = res.buy_list;
                this.itemCount = res.count;
                this.totalPrice = res.totalPrice;
                this.discountsPrice = res.discountsPrice;
            },
            //购买熊抱吐司加价购商品
            buyWeeklyGoods: function (uid) {
                var self = this,
                    sku_id = parseInt(uid) || parseInt(self.currentWeeklyGoods.uid),
                    itemInfo = this.getItemInfo(sku_id),
                    amount = itemInfo.amount;
                if (amount > 0) {
                    $.alert('熊抱吐司加价购商品只能选择1种且数量不能大于1', {
                        confirmText: '我知道了'
                    });
                    return false;
                }
                amount += 1;
                self.createData(sku_id, {amount: amount, checked: itemInfo.checked}, {
                    success: function () {
                        $.alert('加入购物车成功', {
                            autoClose: true,
                            confirmFn: function () {
                                $.removeDialog();
                                $('html, body').animate({scrollTop: 0}, 300);
                            }
                        });
                    }
                });
            },

            //获取熊抱吐司加价购商品
            getWeeklyGoods: function (isSingle) {
                var arr = [];
                this.weeklyGoodsList.forEach(function (item) {
                    if (isSingle) {
                        if (item.childSpecs && item.childSpecs.length < 2) {
                            arr.push(item);
                        }
                    } else {
                        if (item.childSpecs && item.childSpecs.length > 1) {
                            arr.push(item);
                        }
                    }
                });
                return arr;
            }
        },
        computed: {
            //商品列表，计算小计金额
            goodsList: function () {
                var specialDinnerware = this.specialDinnerware,
                    showBirthdayCardList = this.showBirthdayCardList,
                    weeklyAloneSku = self.weeklyAloneSku,
                    weeklyGoodsIds = this.weeklyGoodsList.map(function (item) {
                        return parseInt(item.uid);
                    });
                return this.buyList.map(function (item) {
                    //假如用户已经登录并且没有心享卡权限时，心享价设为0
                    if (customerInfo.privilege && !customerInfo.privilege.has_pass_card) {
                        item.passcard_price = 0;
                    }
                    item.isShowBirthdayCard = $.inArray(item.sku_id, showBirthdayCardList) !== -1;
                    for (var key in specialDinnerware) {
                        if (specialDinnerware.hasOwnProperty(key)) {
                            if (parseInt(key) === item.sku_id) {
                                item.specialDinnerware = specialDinnerware[key];
                            }
                        }
                    }
                    //吐司加价购数量仅为1
                    item.notAdd = $.inArray(item.sku_id, weeklyGoodsIds) !== -1;
                    //单独购买的吐司数量仅为1
                    if (!item.notAdd) {
                        item.notAdd = $.inArray(item.sku_id, weeklyAloneSku) !== -1;
                    }
                    //加价购商品根据后台配置读取最大数量
                    if (!item.notAdd && item.preferentialNum > 0) {
                        item.notAdd = item.amount >= item.preferentialNum;
                    }

                    //商品优惠信息区分普通优惠和升磅优惠
                    var cartSkuPromotionList = item.cartSkuPromotionList || [],
                        cartPromotionList = [],
                        upgradePriceInfo = {};
                    cartSkuPromotionList.forEach(function (promotionItem) {
                        if (promotionItem.selected) {
                            cartPromotionList.push(promotionItem);
                        }
                        if (promotionItem.type === 'UPGRADE_POUNDS') {
                            upgradePriceInfo = promotionItem;
                        }
                    });
                    item.cartPromotionList = cartPromotionList;
                    item.upgradePriceInfo = upgradePriceInfo;

                    return item;
                });
            },
            //是否选中全部
            isCheckAll: function () {
                return this.goodsList.every(function (item) {
                    return item.checked === 1;
                });
            },
            //选中的商品数量
            selectedItemCount: function () {
                var count = 0;
                this.goodsList.forEach(function (item) {
                    if (item.checked) {
                        count += item.amount;
                    }
                });
                return count;
            },
            //仅可单独购买商品的id
            aloneIds: function () {
                var newArr = this.goodsList.filter(function (item) {
                    return item.alone;
                });
                return newArr.map(function (item) {
                    return item.sku_id;
                });
            },
            //熊抱吐司加价购商品列表
            weeklyGoodsList: function () {
                var weeklyGoods = this.weeklyGoods;
                var arr = [];
                for (var key in weeklyGoods) {
                    if (weeklyGoods.hasOwnProperty(key)) {
                        arr.push(weeklyGoods[key]);
                    }
                }
                return arr;
            },
            //吐司单品
            singleWeeklyGoodsList: function () {
                return this.getWeeklyGoods(true);
            },
            //吐司礼包
            notSingleWeeklyGoodsList: function () {
                return this.getWeeklyGoods();
            },
            //当前熊抱吐司加价购商品
            currentWeeklyGoods: function () {
                return this.notSingleWeeklyGoodsList[this.weeklyIndex] || {};
            }
        },
        watch: {
            itemCount: function (val) {
                if (val > 0) {
                    $('.main_cart').addClass('has_content');
                } else {
                    $('.main_cart').removeClass('has_content');
                }
            },
            isShowSingleWeeklyGoods: function (val) {
                if (val === true) {
                    this.$nextTick(function () {
                        new Swiper('.single_list .swiper-container', {
                            slidesPerView: 'auto',
                            slidesPerColumn: 1,
                            spaceBetween: 0,
                            slidesPerGroup: 5,
                            navigation: {
                                nextEl: '.single_list .swiper-button-next',
                                prevEl: '.single_list .swiper-button-prev'
                            }
                        });
                    });
                }
            }
        },
        filters: {
            //拼接购物车商品主图
            mainPic: function (img) {
                return GlobalConfig.imageRoot + '/' + img;
            },
            //价格
            salePrice: function (price) {
                price = price > 0 ? price : 0;
                return parseFloat(utils.currency(price));
            }
        }
    });
    //点击购买弹出购买框
    $(document).on('click', '.buy_btn', function () {
        var itemId = $(this).parents('li').attr('data-id');
        cartObj.updateCartNum(itemId, 1, undefined, undefined, undefined, {
            success: function () {
                $.alert('加入购物车成功', {
                    autoClose: true,
                    confirmFn: function () {
                        $.removeDialog();
                        $('html, body').animate({scrollTop: 0}, 300);
                    }
                });
            }
        });
    });
});
//价格优先级 销售价 > 积分价格 > 心享价 > 加价购 > 市场价 最多两个