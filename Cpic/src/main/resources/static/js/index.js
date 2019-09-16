function resetplan(){
    $("#subPlan")[0].reset();
}
function cancel() {
    $("#subshangbao").css("display","none")
    $("#showplan").css("display","block")
}
function subPlan(){
    var formData = new FormData($("#subPlan")[0]);
    $.ajax({
        type:"post",
        url:"/tbUser/subPlan",
        data:formData,
        processData: false,
        contentType: false,
        dataType:"json",
        success:function(data){
            if (data==1) {
                alert("添加成功!")
                $("#subPlan")[0].reset();
                $("#tab2").bootstrapTable("refresh")
            }else{
                alert("添加失败!")
            }
        }
    })
}
$(function () {
    if ($("#userlevel").val()==0){
        $("#chakan").css("display","block");
        $("#jigou").css("display","block");
        $("#jigou2").css("display","block");
        $("#yonghu").css("display","block");
        $("#yonghu2").css("display","block");
    }
    if ($("#userlevel").val()==1){
        $("#chakan").css("display","block");
        $("#yubao").css("display","block");
        $("#shangbao").css("display","block");
    }
    if ($("#userlevel").val()==2){
        $("#chakan").css("display","block");
        $("#yubao").css("display","block");
        $("#shangbao").css("display","block");
    }
})
$(function () {
    $(".main-page .nav div").mouseenter(function () {
        var $this = $(this);
        var index = $this.index();
    }).mouseleave(function () {
        var $this = $(this);
        var index = $this.index();
    }).click(function () {
            var $this = $(this);
            var index = $this.index();
            var l = -(index * 800);
            $(".main-page .nav div").removeClass("on");
            $(".main-page .nav div").eq(index).addClass("on");
            $(".main-page .content .con-ggh:eq(0)").stop().animate({ "margin-top": l }, 500);
    });
    $.ajax({
        url:"/tbUser/findUsers",
        type:"post",
        dataType:"json",
        success:function(data) {
            for (var i = 0; i < data.length; i++) {
                $("#userId").append("<option value="+data[i].id+">"+data[i].name+"</option>");
            }
        }
    });
});
var setting = {
    view: {//配置显示视图
        addHoverDom: addHoverDom,//鼠标移入显示图标
        removeHoverDom: removeHoverDom,//鼠标移出隐藏图标
        selectedMulti: false,//是否可以选中多个节点
        showLine: false,//显示连接线
        showIcon: showIconForTree//showIconForTree 展示图标
    },
    callback: {
        onRename: onRename,
        onClick: onClick,
        beforeRemove:zTreeBeforeRemove
    },
    edit: {//可以编辑
        enable: true,
    },data:{//设置显示数据
        simpleData:{
            enable:true,
            idKey:"id",//节点唯一标识
            pIdKey:"pId",//父节点的唯一标识
            rootPId:0//根节点属性对应的值
        }
    },async:{//设置异步加载
        enable:true,//使用异步加载
        url:"/tbUser/findAllAddress",//访问路径
        autoParam:["id","name","pId"]
    }
}
var str ='';
function zTreeBeforeRemove(treeId,treeNode,str){
    //此处treeNode为当前节点
    var str ='';
    str = getAllChildrenNodes(treeNode,str);
    //加上被选择节点逗号
    str = str + ',' + treeNode.id;
    //去掉最前面的逗号
    var ids = str.substring(1,str.length);
    //得到所有节点ID的数组
    var idsArray = ids.split(',');
    if (treeNode.pId == 0) {
        alert("根节点不能删除!");
        return false;
    }else{
        deleteNodeByChildren(treeNode);
    }
}
function deleteNodeByChildren(treeNode){
    $.ajax({
        type:"post",
        url:"/tbUser/deletAddress",
        data:{id:treeNode.id},
        //traditional:true,ajax传输数组的时候必须写这个
        success:function(data){
            if (data==0) {
                alert("删除失败!");
            }else{
                alert("删除成功!");
            }
        }
    })
}
//运用递归，获取所有子节点
function getAllChildrenNodes(treeNode,result){
    if (treeNode.isParent) {//判断是否为父节点，往下找
        var childrenNodes = treeNode.children;//获取该节点子节点
        if (childrenNodes) {
            for (var i = 0; i < childrenNodes.length; i++) {
                result += ',' + childrenNodes[i].id;
                result = getAllChildrenNodes(childrenNodes[i]);
            }
        }
    }
    return result;
}
function removeHoverDom(treeId,treeNode){
    $("#addBtn_"+treeNode.tId).unbind().remove();
}
//鼠标移入展示视图
var newCount = 1;

function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
        + "' title='add node' onfocus='this.blur();'></span>";
    sObj.after(addStr);
    var btn = $("#addBtn_"+treeNode.tId);
    if (btn) btn.bind("click", function(){
        addNodes(treeId,treeNode);
    });
};
function onRename(e, treeId, treeNode, isCancel) {
    $.ajax({
        url : "/tbUser/updataAddress",
        type : "post",
        data : {id:treeNode.id,name:treeNode.name},
        dataType : "json",
        success:function(data){
            if(data){
                alert("修改成功");
                $.fn.zTree.init($("#treeDemo"), setting);
            }else{
                alert("修改失败");
            }
        }
    });
}
function addNodes(treeId,treeNode){
    $("#treeId").val(treeNode.id)
    $("#level").val(treeNode.level)
    $("#Parentname").text(treeNode.name);
    $("#Address")[0].reset();
    $("#insertAddress").modal("show");
}
function addtbUser(){
    var aid = $("#useraid").val()
    if (aid) {
        $("#insertUserModal").modal("show");
    }else{
        alert("请选择一个机构!")
        return ;
    }
}
function subAddress(){
    var formData = new FormData($("#Address")[0]);
    $.ajax({
        type:"post",
        url:"/tbUser/subAddress",
        data:formData,
        processData: false,
        contentType: false,
        dataType:"json",
        success:function(data){
            if (data) {
                alert("添加成功!")
                $("#insertAddress").modal("hide");
                rezTree();//成功以后刷新
            }else{
                alert("添加失败!")
            }
        }
    })
}
function subshangbao() {
    var formData = new FormData($("#shangbaoshiji")[0]);
    var planTables = $("#plantables").val()
    formData.append("planTables","planTables")
    var aid = $("#asdsa").val()
    formData.append("aid","aid")
    $.ajax({
        type:"post",
        url:"/tbUser/insertReal",
        data:formData,
        processData: false,
        contentType: false,
        dataType:"json",
        success:function(data){
            if (data!=0) {
                alert("成功上报!")
                $("#subshangbao").css("display","none")
                $("#aftershangbao").css("display","block")
            }else{
                alert("上报失败!请联系后台客服!")
            }
        }
    })
}
function subTbUser() {
    var aid = $("#useraid").val()
    var formData = new FormData($("#insertTbUser")[0]);
    formData.append("aid",aid);
    $.ajax({
        type:"post",
        url:"/tbUser/insertUser",
        data:formData,
        processData: false,
        contentType: false,
        dataType:"json",
        success:function(data){
            if (data!=0) {
                alert("添加成功!")
                rezTree();//成功以后刷新
            }else{
                alert("添加失败,用户已存在!")
            }
        }
    })
}

function bootstrapDestory(){
    $("#tab").bootstrapTable('destroy');
}
function onClick(event, treeId, treeNode) {
    $("#useraid").val(treeNode.id)
    var id = treeNode.id;
    $("#tab").bootstrapTable('destroy');
    $("#tab").bootstrapTable({
        url:"/tbUser/findAddressUsers",
        method:'post',//提交方式
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
        striped:true,
        pageNumber:1,
        pageSize:5,
        pagination:true,//开启分页
        sidePagination:"client",//分页方式 'client'为客户端分页
        cache:false,//是否使用缓存
        queryParams:function(param){
            return {
                id:id
            };
        },
        columns:[
            {
                formatter :function (value,row,index){
                    return  index+1;
                }
            },{
                field:'name',
                title:'名称'
            },{
                field:'codename',
                title:'code信息'
            },{
                field:'userlevel',
                title:'级别'
            } ,{
                title:'操作',
                formatter :function (value,row,index){
                    return  "<a href='javascript:deleUser("+row.id+")'>删除</a>";
                }
            }
        ]
    });
}
function subActual(planTables,id,planName){
    $("#plantables").val(planTables);
    $("#planName").text(planName)
    $("#planid").val(id)
    $("#showplan").css("display","none")
    $("#subshangbao").css("display","block")
}
function refreshtable() {
    var opt={
        query:{
            startTime:$("#startTime").val(),
            endTime:$("#endTime").val()
        }
    }
    $("#tab3").bootstrapTable("refresh",opt)
}
$(function(){
    $("#tab2").bootstrapTable({
        url:"/tbUser/findPlans",
        method:'post',//提交方式
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
        striped:true,
        pageNumber:1,
        pageSize:6,
        pagination:true,//开启分页
        sidePagination:"client",//分页方式 'client'为客户端分页
        cache:false,//是否使用缓存
        columns:[
            {
                formatter :function (value,row,index){
                    return  index+1;
                }
            },{
                field:'planName',
                title:'计划名称'
            },{
                field:'planTables',
                title:'计划桌数'
            },{
                field:'planStarttime',
                title:'开始时间'
            } ,{
                field:'planEndtime',
                title:'结束时间'
            } ,{
                title:'操作',
                formatter :function (value,row,index){
                    return  "<a href=\"javascript:subActual("+row.planTables+","+row.id+",'"+row.planName+"')\">上报实际数据</a>";
                }
            }
        ]
    });
    var currentTime = new Date();
    var startTime = currentTime.setHours(currentTime.getHours()-8);
    var endTime = currentTime.setHours(currentTime.getHours());
    $("#startTime").val(formatDateBoxFull(startTime));
    $("#endTime").val(formatDateBoxFull(endTime));
    $("#planStarttime").val(formatDateBoxFull(startTime+8));
    $("#planEndtime").val(formatDateBoxFull(endTime+16));
    $("#executionTime").val(formatDateBoxFull(endTime));
    $("#executionTime").datetimepicker({
        format: "yyyy-mm-dd HH:ii:ss",
        minView: 1,
        autoclose: true,
        todayBtn: true,
        language: "zh-CN"
    });
    $("#planStarttime").datetimepicker({
        format: "yyyy-mm-dd HH:ii:ss",
        minView: 1,
        autoclose: true,
        todayBtn: true,
        language: "zh-CN"
    });
    $("#planEndtime").datetimepicker({
        format:"yyyy-mm-dd HH:ii:ss",
        minView:1,
        autoclose:true,
        todayBtn:true,
        language:"zh-CN"
    });
    $("#startTime").datetimepicker({
        format: "yyyy-mm-dd HH:ii:ss",
        minView: 1,
        autoclose: true,
        todayBtn: true,
        language: "zh-CN"
    });
    $("#endTime").datetimepicker({
        format:"yyyy-mm-dd HH:ii:ss",
        minView:1,
        autoclose:true,
        todayBtn:true,
        language:"zh-CN"
    });
    $("#tab3").bootstrapTable({
        url:"/tbUser/findData",
        method:'post',//提交方式
        contentType:"application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
        striped:true,
        pageNumber:1,
        pageSize:5,
        pagination:true,//开启分页
        sidePagination:"client",//分页方式 'client'为客户端分页
        cache:false,//是否使用缓存
        queryParams:function(params){//query请求参数
            params["startTime"] = formatDateBoxFull(startTime);
            params["endTime"] =formatDateBoxFull(endTime);
            return params;
        },
        columns:[
            {
                formatter :function (value,row,index){
                    return  index+1;
                }
            },{
                field:'name',
                title:'机构名称',
            },{
                field:'planTables',
                title:'计划召开桌数',
            },{
                field:'tables',
                title:'实际召开桌数',
            } ,{
                field:'implementationRate',
                title:'执行率(%)',
            } ,{
                field:'newCustomer',
                title:'新客户',
            }  ,{
                field:'newCustomer',
                title:'老客户',
            } ,{
                field:'intentionalCustomer',
                title:'意向客户',
            }  ,{
                field:'predictedPremium',
                title:'预估保费(万元)',
            }
        ]
    });
    rezTree();//初始化节点
});
function rezTree(){
    $.fn.zTree.init($("#treeDemo"),setting);//初始化节点
    $.fn.zTree.init($("#treeDemo2"),setting);//初始化节点
}
function showIconForTree(treeId, treeNode) {
    return ((0==treeNode.pId || 1==treeNode.pId)?true:false);
};