var vueObj = new Vue({
    el: '#invoiceContent',
    data: {
        invoiceList: [],   // 发票列表
        invoiceContentList: [], // 发票内容选择列表
        isShowEditInvoice: false,
        isAdd: true,
        invoice: {
            invoiceType: 1,  // 发票类型，1 普通发票 2 电子发票
            invoiceTitle: 1, // 发票抬头  1 个人 2 企业
        },
        personalInvoice: {
            invoiceContent: '', // 发票内容
            invoiceName: '',  // 发票抬头
            taxNumber: ''  // 纳税人识别号
        },
        companyInvoice: {
            invoiceContent: '', // 发票内容
            invoiceName: '',  // 发票抬头
            taxNumber: ''  // 纳税人识别号
        },
        queryParams: {
            currentPage: 1,  // 当前页数
            pageSize: 10   // 每页条数
        },
        total: 0,    // 总数
        pageCount: 0,  // 总页数
    },
    mounted: function () {
        this.getInvoiceList(1);
        this.invoiceContentList = invoiceContentList;
    },
    methods: {
        pageInt: function () {
            var self = this;
            // 分页
            $('.paging_wrap').pagination({
                totalData: self.total,
                showData: self.queryParams.pageSize,
                coping: true,
                prevContent: '上一页',
                nextContent: '下一页',
                pageCount: self.pageCount,
                callback: function (api) {
                    self.queryParams.currentPage = api.getCurrent();
                    self.getInvoiceList();
                    $('html,body').animate({scrollTop: 0}, 500);
                }
            });
        },
        getInvoiceList: function (flg) {
            var self = this;
            loading.show();
            $.ajax({
                url: '/customer/get-invoice.html',
                data: {
                    params: self.queryParams
                }
            }).done(function (res) {
                if (res.error === 0) {
                    self.invoiceList = res.data.list || [];
                    if (self.invoiceContentList && self.invoiceContentList.length) {
                        self.invoiceContentList.forEach(function (item) {
                            self.invoiceList.forEach(function (item1) {
                                if (item1.invoiceContent === item.itemId) {
                                    item1.invoiceContentName = item.itemName;
                                }
                            });
                        });
                    }
                    if (self.invoiceList.length) {
                        self.invoiceList = self.invoiceList.filter(function(item){
                            return parseInt(item.invoiceType) !== 2;
                        });
                    }
                    self.total = self.invoiceList.length || 0;
                    self.pageCount = self.total / self.queryParams.pageSize;
                    if (flg) {
                        self.pageInt();
                    }
                } else {
                    $.toast(res.msg);
                }
            }).always(function () {
                loading.hide();
            });
        },
        checkSaveInfo: function (data) {
            if (!data.invoiceName) {
                if (data.invoiceTitle === 1) {
                    $.toast('请输入“个人”或姓名');
                } else {
                    $.toast('请输入公司名称');
                }
                return false;
            }
            if (!data.invoiceContent) {
                $.toast('请选择发票内容');
                return false;
            }
            if (data.taxNumber) {
                if (!/^[0-9a-zA-Z]{15,20}$/g.test(data.taxNumber)) {
                    $.toast('纳税人识别号格式不正确');
                    return false;
                }
            }
            return true;
        },
        //保存发票
        saveInvoice: function () {
            var self = this, baseinfo = {
                invoiceType: this.invoice.invoiceType,
                invoiceTitle: this.invoice.invoiceTitle
            }, params = {};
            if (this.invoice.invoiceTitle === 1) {
                if (self.isAdd) {
                    params = $.extend(baseinfo, this.personalInvoice);
                } else {
                    params = $.extend(baseinfo, this.personalInvoice, {invoiceId: this.invoice.invoiceid});
                }
            } else {
                if (self.isAdd) {
                    params = $.extend(baseinfo, this.companyInvoice);
                } else {
                    params = $.extend(baseinfo, this.companyInvoice, {invoiceId: this.invoice.invoiceid});
                }
            }
            if (this.checkSaveInfo(params)) {
                loading.show();
                $.ajax({
                    url: self.isAdd ? '/customer/add-invoice.html' : '/customer/update-invoice.html',
                    data: {
                        params: params
                    }
                }).done(function (res) {
                    if (res.error === 0) {
                        self.getInvoiceList();
                        self.resetInvoiceDetail();
                    } else {
                        $.toast(res.msg);
                    }
                }).always(function () {
                    loading.hide();
                });
            }
        },
        //删除发票
        deleteInvoice: function (id) {
            var self = this;
            $.confirm('发票信息删除后将不可恢复，确认删除吗？', function () {
                loading.show();
                $.ajax({
                    url: '/customer/del-invoice.html',
                    data: {
                        params: {
                            invoiceId: id
                        }
                    }
                }).done(function (res) {
                    if (res.error === 0) {
                        self.getInvoiceList();
                        $.removeDialog();
                    } else {
                        $.toast(res.msg);
                    }
                }).always(function () {
                    loading.hide();
                });
            });
        },
        // 编辑发票
        editInvoice: function (id) {
            this.resetInvoiceDetail();
            this.isShowEditInvoice = true;
            this.isAdd = true;
            if (id) {
                this.isAdd = false;
                var invoiceDetail = this.invoiceList.filter(function (item) {
                    return item.invoiceid === parseInt(id);
                });
                var info = {
                    invoiceid: id
                };
                if (invoiceDetail.length) {
                    invoiceDetail = invoiceDetail[0];
                    info = $.extend(info, {
                        invoiceType: invoiceDetail.invoiceType,
                        invoiceTitle: invoiceDetail.invoiceTitle
                    });
                    if (invoiceDetail.invoiceTitle === 1) {
                        this.resetCompany();
                        // 个人发票
                        this.personalInvoice = {
                            invoiceContent: invoiceDetail.invoiceContent,
                            invoiceName: invoiceDetail.invoiceName
                        }
                    } else {
                        this.resetPersonal();
                        this.companyInvoice = {
                            invoiceContent: invoiceDetail.invoiceContent,
                            invoiceName: invoiceDetail.invoiceName,
                            taxNumber: invoiceDetail.taxNumber
                        }
                    }
                }
                this.invoice = $.extend(this.invoice, info);
            }
        },
        // 重置正在编辑的发票信息
        resetInvoiceDetail: function () {
            this.isShowEditInvoice = false;
            this.invoice = {
                invoiceType: 1,
                invoiceTitle: 1,
            };
            this.resetPersonal();
            this.resetCompany();
        },
        // 重置个人发票编辑信息
        resetPersonal: function () {
            this.personalInvoice = {
                invoiceContent: '', // 发票内容
                invoiceName: '',  // 发票抬头
                taxNumber: ''  // 纳税人识别号
            }
        },
        // 重置企业发票编辑信息
        resetCompany: function () {
            this.companyInvoice = {
                invoiceContent: '', // 发票内容
                invoiceName: '',  // 发票抬头
                taxNumber: ''  // 纳税人识别号
            }
        }
    }
});
