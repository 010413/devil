<%--
  Created by IntelliJ IDEA.
  User: m1761
  Date: 2019/8/28
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登入系统</title>
    <script  type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <style>


        .form-control2 {
            float:right;
            display: block;
            width: 200px;
            height: 40px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        }
        .form-control2:focus {
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
        }
        .spans{
            text-align:center;
            margin:0px 80px;
            height:30px;
            width:200px;
            font-size: 17px;
            font-family:"华文仿宋",Georgia, "Times New Roman", Times, serif;
        }
        .p{
            margin-left: 20px;
            text-align:center;
            margin:0px 80px;
            height:30px;
            width:350px;
            font-size: 17px;
            font-family:"华文仿宋",Georgia, "Times New Roman", Times, serif;
        }
        label{
            font-family:"华文仿宋",Georgia, "Times New Roman", Times, serif;
        }
    </style>
</head>
<body>
<div  style="background-image: url('login/bgs.jpg');width:100%;height:100%;background-repeat: no-repeat">
    <div style="background-image:url(login/bgs.jpg);background-size:100% 100%;width:100%;height:100%;background-repeat: no-repeat">
        <div style="margin-top:300px;margin-right:150px;float:right;background:#FBFEFE;width: 500px;height:330px">
            <form style="margin-top:20px;" id="formId" class="form-horizontal" role="form" >
                <div class="form-group">
                    <div>
                        <label style="margin-left: 30px;font-size: 35px;" class="col-xs-7 control-label">请登录!</label>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-4 control-label" style="font-size:18px;line-height: 1.5 ">userCode:</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control2" id="userCode" name="userCode" placeholder="请输入userCode">
                    </div>
                </div>
                <div class="spans">
                    <span class="help-block"></span>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" style="font-size:18px;line-height: 1.5 ">密码:</label>
         ·           <div class="col-sm-5">
                        <input type="password" placeholder="请输入密码" class="form-control2" id="password" name="password" >
                    </div>
                </div>
                <div class="spans">
                    <span class="help-block"></span>
                </div>
                <div>
                    <div class="col-sm-offset-2 col-sm-8" style="text-align:center;">
                        <input type="button" style="width: 145px;" class="btn btn-primary" id="sublogin" value="提交">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $("#sublogin").click(function () {
        var codename = $("input[name=codename]");
        var password = $("input[name=password]");
        if (!codename.val()  || !password.val()) {
            alert("未填写完整")
            return false;
        }
        $.ajax({
            url:"/users/login",
            type:"post",
            data:{userCode:userCode.val(),password:password.val()},
            dataType:"json",
            success:function (data) {
                if (data.flag) {
                    location.href = "bodypage.jsp.jsp";
                    // layer.close(index);
                }else{
                    alert(data.error)
                }
            }
        })
    })
    $(function () {
        $("#userCode").blur(function () {
            var userCode = $("input[name=userCode]");
            if (userCode.val()==""){
                isError(userCode,"userCode不可为空");
                return false;
            }
            isOk(userCode,"");
        })
    })
    $(function () {
        $("#password").blur(function () {
            var password = $("input[name=password]");
            if (!password.val()){
                isError(password,"密码不可为空");
                return false;
            }
            isOk(password,"");
        })
    })

    //成功校验
    function isOk(obj,text){
        obj.parent().parent().removeClass("has-error");
        obj.parent().parent().addClass("has-success");
        obj.parent().parent().next().children(":first").html(text);
    }
    //失败校验
    function isError(obj,text){
        obj.parent().parent().removeClass("has-success");
        obj.parent().parent().addClass("has-error");
        obj.parent().parent().next().children(":first").html(text);
    }
</script>

