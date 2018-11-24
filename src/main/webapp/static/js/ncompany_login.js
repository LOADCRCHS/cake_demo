$(document).ready(function() {
    //会员名称验证
    $("#userName").blur(function() {
        var userName = Utils.trim($(this).val());
        if (Utils.isEmpty(userName))
            $("#userName_error").addClass("note").text("请输入用户名称");
        else if(userName.length > 50)
            $("#userName_error").addClass("note").text('用户名称不能超过50个字符');
        else
            $("#userName_error").removeClass("note").text("");
    });

    //检查密码
    $("#pwd").blur(function() {
        var pwd = Utils.trim($(this).val());
        if (Utils.isEmpty(pwd))
            $("#pwd_error").addClass("note").text("请输入密码");
        else
            $("#pwd_error").removeClass("note").text("");
    });

});

//页面提交检查
function doLogin(){
    var error_array = {};
    var userName    = Utils.trim($("#userName").val());
    var pwd         = Utils.trim($("#pwd").val());

    if(userName == "")
        error_array ["#userName_error"] = "请输入用户名称";
    else if(userName.length > 50)
        error_array ["#userName_error"] = "用户名称不能超过50个字符";

    //检查密码
    if (Utils.isEmpty(pwd))
        error_array["#pwd_error"] = "请输入密码";

    error_flg = 0;
    $.each(error_array,function(k,v) {
        $(k).addClass("note").text(v);
        error_flg = 1;
    });

    if(error_flg == 1)
        return false;

    var params={
        userName 	: userName,
        pwd       	: pwd
    };
    xajax_do_req_ncompany_user(params, 1);
}

//登录错误回调函数
function loginCheck(msgID , message){
	$(msgID) . text (message) ;
}
//登录成功处理
function login_succeed(){
	self.location ="/shop/company/company_member_index.php";
}
//登录成功处理new
function newlogin_succeed(){
    self.location ="/shop/ncompany/ncompany_member_index.php";
}