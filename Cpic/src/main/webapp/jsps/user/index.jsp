<%--
  Created by IntelliJ IDEA.
  User: m1761
  Date: 2019/8/28
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>统计层</title>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <link href="/js/nav.css" type="text/css" rel="stylesheet">
    <link href="/js/ft_nav.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/imageUp/css/imageUpload.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/imageUp/css/index.css">
    <link rel="stylesheet" href="/zTree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="/bootstrap/datepicker/css/bootstrap-datetimepicker.css">
    <script type="text/javascript" src="/imageUp/js/jquery.SuperSlide.js"></script>
    <script type="text/javascript" src="/ztree/js/jquery.ztree.all.min.js"></script>
    <script  type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
    <script  type="text/javascript" src="/js/index.js"></script>
    <script  type="text/javascript" src="/bootstrap/js/bootstrap-table.min.js"></script>
    <script  type="text/javascript" src="/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="/common/dataFormater.js" type="text/javascript"></script>
    <script  type="text/javascript" src="/bootstrap/datepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="/imageUp/js/uploadImg26.js"></script>
    <script  type="text/javascript" src="/bootstrap/datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <style type="text/css">
        body{background-color: #1AA4CA }
        form,ul,li,ol,dl,dt,dd,p,i,h1,h2,h3,h4,h5,h6{ margin:0; padding:0}
        ul,li{ list-style:none}  img{ border:0}  .dp{ display:block}
        .tc{ text-align:center}  .fl{ float:left} .fr{ float:right}
        .clear{clear:both;}   .clearfix:after{content:"."; display:block; visibility:hidden; height:0; clear:both}
        .main-page{margin:0 auto;width:1200px}
        .main-page .left{ padding-right: 25px; border-right: 1px #fff solid; margin-top:50px}
        .main-page .left, .main-page .right{float:left;}
        .main-page .nav-back{height:300px;}
        .main-page .nav{position:relative;margin-top:-300px;width:132px;text-align:center;font-size:18px;font-family:"微软雅黑";color:#fff;}
        .main-page .nav div{height:47px;line-height:47px; margin-bottom: 8px; border-radius: 2px; cursor: pointer;}
        .main-page .nav div.on{background:#3091f2; }
        .main-page .right{width:987px;height:800px;margin-left:1px;}
        .main-page .content{position:relative; width:987px; height:800px; overflow:hidden;}
        .main-page .content .con-ggh{ width:987px; height:800px;}
        .con-ggh ul{ padding-top:20px; display:block}
        .con-ggh ul li{ padding-top:20px; margin-right:20px; float:left}
        .list-pic{ background-color: rgba(255,255,255,0.3); padding: 19px; width: 110px; height: 110px; border: 1px solid #b9babe;}
        .list-pic img{ width:110px; height:110px; display:block}
        .con-ggh .item-name{ padding:20px 0; height: 20px; width: 150px; font-size: 16px; text-align: center; color: #fff; line-height: 20px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
        .b-intro{ margin-top:20px}
        .b-intro span{ font-size:24px; margin-bottom:12px; color:#fff}
        .b-intro p{ width:545px; height:45px; line-height:24px; overflow:hidden; color:#fff; font-size:14px}
        .ck-m{ width:123px; height:36px; line-height:36px; border:1px #fff solid; margin-top:25px}
        .zcinfo{ width:550px; margin-top:50px}
        .ptpic-dl,.ptpic-dl img{ width:354px; height:690px}
        .ptpic-dl{ margin-top:20px}
        .form-control12 {
            float:right;
            display: block;
            width: 150px;
            height: 25px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-control12:focus {
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
        }
        select{
            width:auto;
            height:24px;
            line-height:24px;
            text-align:center;
            text-align-last: center;
        }
        .header
        {
            width: 99%;
            height: 43px;
            background: #0e74b4;
            line-height: 40px;
        }
    </style>
</head>
<body>
<div class="header">
    <center>
        <span style="color: white; font-size: 20px">太平洋酒会</span>

        <span style="color: white; margin-left: 900px" >欢迎${tbUser.name}登录  <a href="/tbUser/loginOut" style="color: white">退出</a></span>
    </center>
</div>
<div class="main-page">
    <div class="left">
        <div class="nav-back"></div>
        <input type="hidden" id="userlevel" value="${tbUser.userlevel}">
        <div class="nav">
            <div id="chakan" style="display: none" class="on">查看数据</div>
            <div id="jigou" style="display: none">机构管理</div>
            <div id="yonghu" style="display: none" onclick="bootstrapDestory()">用户管理</div>
            <div id="yubao" style="display: none">预报数据</div>
            <div id="shangbao" style="display: none">上报数据</div>
        </div>
    </div>
    <div class="right">
        <div class="content">
            <div class="con-ggh">
                <div class="zcinfo fl" style="height: 590px;width: 1100px;margin-top: 200px;">
                    <div class="col-sm-9">
                        <div id="myTabs" style="height: 100px;width: 250px;margin-left: 50px;margin-top: 80px;">
                            <ul class="nav nav-tabs" style="width: 250px;border-bottom:0px solid #ddd">
                                <li style="margin-right: 0px;"><a href="#home" aria-controls="home" data-toggle="tab" aria-expanded="false">详细列表信息</a>
                                <li><a href="#profile" aria-controls="profile" data-toggle="tab" aria-expanded="true">曲线图</a>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane active" style="height: 400px;" id="home">
                                <div style="margin-bottom: 20px;width: 850px;" >
                                    <div  class="col-md-12 column">
                                        <div  class= "col-md-4 column">
                                            <label class="control-label" style="color: white;font-size:15px;margin-top: 3px;">开始时间:&nbsp;&nbsp;</label>
                                            <input class="form-control12"  id="startTime">
                                        </div>
                                        <div class= "col-md-4 column">
                                            <label class="control-label" style="color: white;font-size:15px;margin-top: 3px;">结束时间:</label>
                                            <input class="form-control12"  id="endTime">
                                        </div>
                                        <div>
                                            <input type="button" onclick="refreshtable()" class="btn btn-primary" style="line-height: 10px;height: 25px;" value="查询"/>
                                        </div>
                                    </div>
                                </div>
                                <div  style="color:white;width: 680px;float: left;margin-left: 50px;margin-top: 20px;height: 150px;">
                                    <table id="tab3" style="background: #ffffff">
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="profile">
                                <div style="margin-bottom: 20px;width: 850px;margin-top: 50px;" >
                                    <div  class="col-md-12 column">
                                                <span style="background-color: white">曲线图</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="con-ggh" id="jigou2" >
                <div class="zcinfo fl"  style="height: 700px;width: 1100px;margin-top: 1px;">
                    <div >
                        <div class="zTreeDemoBackground"  style="margin-top: 20px;">
                            <ul id="treeDemo" class="ztree"  style="height: 370px;"></ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="con-ggh" id="yonghu2" >
                <div class="zcinfo fl"  style="height: 700px;width: 1100px;margin-top: 1px;">
                    <div>
                        <div class="zTreeDemoBackground left" >
                            <ul id="treeDemo2" class="ztree" style="height: 370px;"></ul>
                        </div>
                    </div>
                    <div  style="color:white;width: 600px;float: left;margin-left: 50px;margin-top: 50px;height: 200px;">
                       <table id="tab" style="background: #ffffff">
                        </table>
                        <button onclick="addtbUser()">add</button>
                    </div>
                </div>
            </div>
            <div class="con-ggh" id="yubao2">
                <div class="zcinfo fl">
                    <form class="form-horizontal" id="subPlan"  style="width:500px;height: 460px;">
                        <div class="form-group row">
                            <label  class="col-sm-2 control-label " style="width:130px">计划名称:</label>
                            <div class="col-sm-5">
                                <input style="width: 180px;" type="text" class="form-control" name="planName">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label  class="col-sm-2 control-label " style="width:130px">计划召开桌数:</label>
                            <div class="col-sm-5">
                                <input style="width: 180px;" type="text" class="form-control" name="planTables">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label  class="col-sm-2 control-label " style="width:130px">开始时间:</label>
                            <div class="col-sm-5">
                                <input style="width: 180px;" type="text" class="form-control" id="planStarttime" name="planStarttime">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label  class="col-sm-2 control-label " style="width:130px">结束时间:</label>
                            <div class="col-sm-5">
                                <input style="width: 180px;" type="text" class="form-control" id="planEndtime" name="planEndtime">
                            </div>
                        </div>
                        <div class="form-group row" style="margin-left: 55px;">
                            <p class="btn btn-default" style="width: 100px;" onclick="resetplan()">reset</p>
                            <p class="btn btn-primary" style="width: 150px;"  onclick="subPlan()">Send message</p>
                        </div>
                    </form>
                </div>
            </div>
            <div class="con-ggh" id="shangbao2" >
                <div class="zcinfo fl" style="height: 700px;width: 1100px;margin-top: 1px;">
                    <div id="showplan" style="color:white;width: 600px;float: left;margin-left: 50px;margin-top: 5px;height: 400px;">
                        <table id="tab2" style="background: #ffffff">
                        </table>
                    </div>
                    <div id="subshangbao" style="display: none;margin-top: 20px;">
                        <form class="form-horizontal" id="shangbaoshiji"  style="width:500px;height: 460px;">
                            <div class="form-group row">
                                <label  class="col-sm-2 control-label " style="width:130px">活动名称:</label>
                                <div class="col-sm-5">
                                    <label  class="col-sm-2 control-label" id="planName" style="width:80px"></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 control-label " style="width:130px">实际桌数:</label>
                                <div class="col-sm-5">
                                    <input style="width: 180px;" type="text" class="form-control" name="tables">
                                    <input type="hidden" id="plantables" name="planTables">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 control-label " style="width:130px">新客户:</label>
                                <div class="col-sm-5">
                                    <input style="width: 180px;" type="text" class="form-control" name="newCustomer">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 control-label " style="width:130px">老客户:</label>
                                <div class="col-sm-5">
                                    <input style="width: 180px;" type="text" class="form-control" name="oldCustomer">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 control-label " style="width:130px">意向客户:</label>
                                <div class="col-sm-5">
                                    <input style="width: 180px;" type="text" class="form-control" name="intentionalCustomer">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 control-label " style="width:130px">保费:</label>
                                <div class="col-sm-5">
                                    <input style="width: 180px;" type="text" class="form-control" name="predictedPremium">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-sm-2 control-label " style="width:130px">活动时间:</label>
                                <div class="col-sm-5">
                                    <input style="width: 180px;" type="text" class="form-control" id="executionTime" name="executionTime">
                                    <input type="hidden" name="id" id="planid">
                                    <input type="hidden" name="aid" id="asdsa" value="${tbUser.aid}">
                                </div>
                            </div>
                            <div class="modal-footer"  >
                                <div class="form-group row" style="margin-left: 10px;">
                                    <p class="btn btn-default" style="width: 100px;" onclick="cancel()">cancel</p>
                                    <p class="btn btn-primary" style="width: 150px;" onclick="subshangbao()">Send message</p>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="aftershangbao" style="display: none;margin-top: 30px;">
                        <div class="bmsc_nr_input">
                            <div style="width: 100%;position: relative;">
                                <form id="upBox">
                                    <div id="inputBox" style="background-color: white"><input name="files" type="file" title="请选择图片" id="file" multiple accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片</div>
                                    <div id="imgBox"></div>
                                    <a id="btn">上传</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>


<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#ffffff">
    <p>本系统由太平洋保险所有</p>
</div>
<div class="modal fade" aria-labelledby="myModalLabel"  id="insertUserModal"  style=" height:700px;left: 52%; top: 55%; transform: translate(-50%,-50%); min-width:80%; right: inherit;" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 320px;width: 550px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                </button>
                <h3>修改来源信息</h3>
            </div>
            <div class="modal-body"  >
                <form class="form-horizontal" id="insertTbUser"  style="width:500px;height: 460px;">
                    <div class="form-group row">
                        <label  class="col-sm-2 control-label " style="width:130px">用户名称:</label>
                        <div class="col-sm-5">
                            <input style="width: 180px;" type="text" class="form-control" name="name">
                            <input type="hidden" id="useraid">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-2 control-label " style="width:130px">code描述:</label>
                        <div class="col-sm-5">
                            <input style="width: 180px;" type="text" class="form-control" name="codename">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-2 control-label " style="width:130px">密码:</label>
                        <div class="col-sm-5">
                            <input style="width: 180px;" type="text" class="form-control" name="password">
                        </div>
                    </div>
                    <div class="modal-footer"  >
                        <div class="form-group row" style="margin-left: 10px;">
                            <button class="btn btn-default" style="width: 100px;" data-dismiss="modal">close</button>
                            <button class="btn btn-primary" style="width: 150px;" onclick="subTbUser()">Send message</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" aria-labelledby="myModalLabel"  id="insertAddress"  style=" height:700px;left: 52%; top: 55%; transform: translate(-50%,-50%); min-width:80%; right: inherit;" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 320px;width: 550px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                </button>
                <h3>添加地址信息</h3>
            </div>
            <div class="modal-body"  >
                <form class="form-horizontal" id="Address"  style="width:500px;height: 460px;">
                    <input type="hidden" id="treeId" name="pId">
                    <input type="hidden" id="level" name="level">
                    <div class="form-group row">
                        <label  class="col-sm-2 control-label " style="width:130px">父节点:</label>
                        <div class="col-sm-5">
                            <label  class="control-label " id="Parentname"></label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-2 control-label " style="width:130px">名称:</label>
                        <div class="col-sm-5">
                            <input style="width: 180px;" type="text" class="form-control" id="addressname" name="name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-2 control-label " style="width:130px">编码:</label>
                        <div class="col-sm-5">
                            <input style="width: 180px;" type="text" class="form-control" id="addressCode" name="code">
                        </div>
                    </div>
                    <div class="modal-footer"  >
                        <div class="form-group row" style="margin-left: 10px;">
                            <input type="button" class="btn btn-default" style="width: 100px;" data-dismiss="modal" value="close">
                            <input class="btn btn-primary" style="width: 150px;" type="button" onclick="subAddress()" value="Send message">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //启用插件设置相应的参数
    imgUpload({
        inputId:'file',//input框的id
        imgBox:'file',//图片容器id
        buttonId:'btn',//提交按钮id
        upUrl:'/tbUser/uploadFiles',
        data:'files',//type="file"控件的name名
        formId:'upBox',//form表单的id
        num:'10',
        inputId:'file', //input框id
        imgBox:'imgBox', //图片容器id
        buttonId:'btn', //提交按钮id
        upUrl:'/tbUser/uploadFiles',  //提交地址
        data:'files', //type="file"控件的name名
        formId:"upBox",//form表单的id
        num:"10"//上传个数
    })
</script>
<script>
    $(function(){

        var dom = document.getElementById("profile");
        var myChart = echarts.init(dom);//初始化echarts

        $.ajax({
            //几个参数需要注意一下
            type: "post",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url:"${pageContext.request.contextPath }/tbUser/showEcharts",//url
            data:{},
            processData:false,
            contentType:false,
            success: function (data) {
                if(data){
                    var planName=new Array();
                    var Impotence;
                    var planTables=new Array();
                    $(data).each(function(index,d){
                        planName[index]=d.deptName;
                        planTables[index]={value:d.money,name:d.deptName};
                    })
                      ption = {
                        title : {text: '河北省活动统计饼状图', x:'center'},
                        tooltip : {trigger: 'item',formatter: "{a} <br/>{b} : {c} ({d}%)"},
                        legend: {orient: 'vertical',left: 'left',data: planName},
                        series : [{name: '地区名称',type: 'pie',radius : '50%',center: ['50%', '50%'],data: planTables,
                            itemStyle: {emphasis: {shadowBlur: 10,shadowOffsetX: 0,shadowColor: 'rgba(0, 0, 0, 0.5)'}}}]
                    };
                }

                myChart.setOption(option, true);

            },
            error : function() {

                alert("失败！！！");
            }
        });
    })
</script>
