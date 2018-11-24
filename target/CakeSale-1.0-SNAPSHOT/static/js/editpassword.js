var editVue = null;

$(function () {
    editVue = new Vue({
        el: '#editPassword',
        data: {
            isSet: true,
            formData: {
                oldPwd: '',
                newPwd: '',
                confirmPwd: ''
            },
            errorMessage: {
                oldPwd: '',
                newPwd: '',
                confirmPwd: ''
            }
        },
        created: function () {
            this.isSet = usercenter.defaultPwd === 0 ? false : true;
        },
        methods: {
            blur: function (e) {
                var val = e.target.value.trim(), id = e.target.dataset.id;
                if (val) {
                    this.errorMessage[id] = '';
                }
            },
            editPwd: function (param) {
                var self = this;
                loading.show();
                $.ajax({
                    url: '/customer/change-password.html',
                    data: {
                        params: param
                    }
                }).done(function (res) {
                    if (res.error === 0) {
                        if (!self.isSet) {
                            $.toast('修改成功');
                        } else {
                            $.toast('设置成功');
                        }
                        setTimeout(function () {
                            location.href = '/customer/index.html';
                        }, 3000);
                    } else {
                        $.toast(res.msg);
                    }
                }).always(function () {
                    loading.hide();
                });
            },
            check: function () {
                var oldPwd = this.formData.oldPwd,
                    newPwd = this.formData.newPwd,
                    confirmPwd = this.formData.confirmPwd;
                if (!this.isSet) {
                    if (!oldPwd) {
                        this.errorMessage.oldPwd = '*旧密码不能为空';
                        return false;
                    }
                    if (!utils.checkPassword(oldPwd)) {
                        this.errorMessage.oldPwd = '*密码只能是6-20位英文、数字及“_”、“-”组成';
                        return false;
                    }
                }
                if (!newPwd) {
                    this.errorMessage.newPwd = '*密码不能为空';
                    return false;
                }
                if (!utils.checkPassword(newPwd)) {
                    this.errorMessage.newPwd = '*密码只能是6-20位英文、数字及“_”、“-”组成';
                    return false;
                }
                if (!confirmPwd) {
                    this.errorMessage.confirmPwd = '*请确认密码';
                    return false;
                }
                if (!utils.checkPassword(confirmPwd)) {
                    this.errorMessage.confirmPwd = '*密码只能是6-20位英文、数字及“_”、“-”组成';
                    return false;
                }
                if (newPwd !== confirmPwd) {
                    this.errorMessage.confirmPwd = '*密码不一致,请重新输入';
                    return false;
                }
                if (!this.isSet && newPwd === oldPwd) {
                    this.errorMessage.newPwd = '*新密码与旧密码不能一致';
                    return false;
                }
                return true;
            },
            submit: function () {
                var oldPwd = this.formData.oldPwd,
                    newPwd = this.formData.newPwd,
                    confirmPwd = this.formData.confirmPwd;
                var params = null;
                if (!this.isSet) {
                    params = {
                        oldPwd: oldPwd,
                        newPwd: newPwd,
                        sureNewPwd: confirmPwd
                    };
                } else {
                    params = {
                        newPwd: newPwd,
                        sureNewPwd: confirmPwd
                    };
                }
                if (this.check() && params) {
                    this.editPwd(params);
                }
            }
        }
    });
});