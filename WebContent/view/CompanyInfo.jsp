<%--
  Created by IntelliJ IDEA.
  User: uestc
  Date: 2017/8/18
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8";>
    <title>金融事件智能分类</title>
    <link rel="stylesheet" href="..\css\bootstrap.min.css">
    <link rel="stylesheet" href="..\css\bootstrap-table.min.css">
    <link rel="stylesheet" href="..\css\bootstrap-datetimepicker.min.css">
    <script src="..\js\jquery.min.js"></script>
    <script src="..\js\bootstrap.min.js"></script>
    <script src="..\js\bootstrap-table.min.js"></script>
    <script src="..\js\bootstrap-table-zh-CN.min.js"></script>
    <script src="..\js\moment-with-locales.js"></script>
    <script src="..\js\bootstrap-datetimepicker.min.js"></script>
    <script src="..\js\bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="..\js\main.js"></script>
    <style>
        html, body {
            position: relative;
            height: 100%;
        }
        body {
            background: #fff;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color:#000;
            margin: 0;
            padding: 0;
        }
        .newsTitle{
            padding:5px 0 4px 0;
            vertical-align:top;
            text-align:left;
            padding-bottom:0;
        }
        .newsDigest{
            padding:5px 0 4px 0;
            padding-top:0;
        }
        .newsFooter{
            padding:5px 0 4px 0;
            padding-top:0;
        }
    </style>
</head>
<body>
<div style="filter:alpha(opacity=20)">
    <!-- 导航栏 -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#top-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img class="navbar-brand" src="../pics/IRLablogo.png" href="#maim.html"style="padding:0;height:50px;">
            </div>
            <div class="collapse navbar-collapse  navbar-right" id="top-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="main.jsp">&nbsp&nbsp首页&nbsp&nbsp</a></li>
                    <li><a href="search.jsp">&nbsp高级搜索&nbsp</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">&nbsp事件汇总&nbsp<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="newsInfo.jsp" >&nbsp新闻&nbsp</a></li>
                            <li><a href="noticeInfo.jsp" >&nbsp公告&nbsp</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input id="topSearch" type="text" class="form-control" placeholder="Search">
                    </div>
                    <input type="text" value="解决bootstrap与AJAX异步提交表单的冲突" hidden />
                    <button type="button" id="search" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>搜索</button>
                </form>
            </div>
        </div>
    </nav>
    <!-- end of 导航栏 -->
</div>
<div class="container" style="padding:100px 50px;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 id="companyName" class="panel-tittle"></h4>
        </div>
        <div class="panel-body">
            <h4 id="comDescribe"></h4>
            <ul class="nav nav-pills nav-left" >
                <li class="active"><a data-toggle="pill" href="#tab1">&nbsp企业概况&nbsp</a></li>
                <li><a data-toggle="pill" href="#tab2">&nbsp公司公告&nbsp</a></li>
                <li><a data-toggle="pill" href="#tab3">&nbsp一季度报告&nbsp</a></li>
                <li><a data-toggle="pill" href="#tab4">&nbsp中期报告&nbsp</a></li>
                <li><a data-toggle="pill" href="#tab5">&nbsp三季度报告&nbsp</a></li>
                <li><a data-toggle="pill" href="#tab6">&nbsp年度报告&nbsp</a></li>
                <li><a data-toggle="pill" href="#tab7">&nbsp公司新闻&nbsp</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="tab-content" style="margin: 10px">
            <div id="tab1" class="tab-pane fade in active">
                <h4 style="margin: 10px">概况</h4>
                <ul style="margin: 10px" class="list-group">
                    <li id="fullName" class="list-group-item"><strong>企业全称：</strong></li>
                    <li id="nameEn" class="list-group-item"><strong>英文名称：</strong></li>
                    <li id="listMarket" class="list-group-item"><strong>上市市场：</strong></li>
                    <li id="listDate" class="list-group-item"><strong>上市日期：</strong></li>
                    <li id="issuePrice" class="list-group-item"><strong>发行价格：</strong></li>
                    <li id="leadUnderWriter" class="list-group-item"><strong>主承销商：</strong></li>
                    <li id="establishDate" class="list-group-item"><strong>成立日期：</strong></li>
                    <li id="registCapital" class="list-group-item"><strong>注册资本：</strong></li>
                    <li id="organizationType" class="list-group-item"><strong>机构类型：</strong></li>
                    <li id="organizationForm" class="list-group-item"><strong>组织形式：</strong></li>
                    <li id="boardSecretary" class="list-group-item"><strong>董秘：</strong></li>
                    <li id="secretaryCall" class="list-group-item"><strong>董秘电话：</strong></li>
                    <li id="secretaryFax" class="list-group-item"><strong>董秘传真：</strong></li>
                    <li id="secretaryEmail" class="list-group-item"><strong>董秘邮箱：</strong></li>
                    <li id="companyTell" class="list-group-item"><strong>公司电话：</strong></li>
                    <li id="companyFax" class="list-group-item"><strong>公司传真：</strong></li>
                    <li id="companyEmail" class="list-group-item"><strong>公司邮箱：</strong></li>
                    <li id="companyWeb" class="list-group-item"><strong>公司网址：</strong></li>
                    <li id="companyPostCode" class="list-group-item"><strong>邮政编码：</strong></li>
                    <li id="informationDisclosure" class="list-group-item"><strong>信息披露：</strong></li>
                    <li id="securitiesHistory" class="list-group-item"><strong>证券简称更名历史：</strong></li>
                    <li id="registAddress" class="list-group-item"><strong>注册地址：</strong></li>
                    <li id="officeAddress" class="list-group-item"><strong>办公地址：</strong></li>
                    <li id="scope" class="list-group-item"><strong>经营范围：</strong></li>
                </ul>
            </div>
            <div id="tab2" class="tab-pane fade">
                <h4 style="margin: 10px">近期公告</h4>
                <table id="tb_Notice">
                </table>
            </div>
            <div id="tab3" class="tab-pane fade">
                <h4 style="margin: 10px">一季度</h4>
                <table id="tb_Reports1">
                </table>
            </div>
            <div id="tab4" class="tab-pane fade">
                <h4 style="margin: 10px">中期</h4>
                <table id="tb_Reports2">
                </table>
            </div>
            <div id="tab5" class="tab-pane fade">
                <h4 style="margin: 10px">三季度</h4>
                <table id="tb_Reports3">
                </table>
            </div>
            <div id="tab6" class="tab-pane fade">
                <h4 style="margin: 10px">年度</h4>
                <table id="tb_Reports4">
                </table>
            </div>
            <div id="tab7" class="tab-pane fade">
                <h4 style="margin: 10px">近期新闻</h4>
                <div  class="row">
                    <div class="col-sm-4">
                        <div style="padding:0px 10px" class="form-group">
                            <label for="">选择日期：</label>
                            <div class="input-group date" id='datePicker'>
                                <input type="text" class="form-control">
                                <span class="input-group-addon">
                                    <i class="glyphicon glyphicon-calendar"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <table id="tb_News">
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="newsModal" tabindex="-1" role="dialog" aria-labelledby="newsModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="newsModalLabel"></h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
<script>
    var showCompanyID=decodeURI(GetQueryString("CompanyID"));
    $(function(){
        Datetimes();
        $('#search').click(function(){
            // 输入的内容传递给后台，并跳转到检索结果界面
            searchObj=$('#topSearch').val();
            searchFinEvent();
        });
        searchCompanyInfo();

        $("body").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $('#search').click();
            }
        });
    });
    function Datetimes() {
        $('#datePicker').datetimepicker({
            language: 'zh-CN',//显示中文
            format:"yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            locale: moment.locale('zh-cn'),
            minView:2,
            initialDate: new Date(),
            autoclose: true,//选中自动关闭
            todayBtn: true,//显示今日按钮
            todayHighlight:true
        });
    }

    function initInfo(companyInfo) {
        $('#companyName').html("<strong>"+companyInfo.n_name+"</strong>("+companyInfo.n_code+")");
        $('#comDescribe').html("<small>"+companyInfo.c_company_profile+"</small>");
        $('#fullName').append(companyInfo.c_full_name);
        $('#nameEn').append(companyInfo.c_English_name);
        $('#listMarket').append(companyInfo.c_listed_market);
        $('#listDate').append(companyInfo.c_listing_date);
        $('#issuePrice').append(companyInfo.c_issue_price);
        $('#leadUnderWriter').append(companyInfo.c_lead_underwriter);
        $('#establishDate').append(companyInfo.c_establishment_date);
        $('#registCapital').append(companyInfo.c_registered_capital);
        $('#organizationType').append(companyInfo.c_organization_type);
        $('#organizationForm').append(companyInfo.c_organization_form);
        $('#boardSecretary').append(companyInfo.c_board_secretary);
        $('#secretaryCall').append(companyInfo.c_secretary_call);
        $('#secretaryFax').append(companyInfo.c_secretary_fax);
        $('#secretaryEmail').append(companyInfo.c_secretary_email);
        $('#companyTell').append(companyInfo.c_company_phone);
        $('#companyFax').append(companyInfo.c_company_fax);
        $('#companyEmail').append(companyInfo.c_company_email);
        $('#companyWeb').append(companyInfo.c_company_website);
        $('#companyPostCode').append(companyInfo.c_company_maibox);
        $('#informationDisclosure').append('<a href="'+companyInfo.c_information_disclosure_website+'">'+companyInfo.c_information_disclosure_website+'</a>');
        $('#securitiesHistory').append(companyInfo.c_securities_history);
        $('#registAddress').append(companyInfo.c_registered_address);
        $('#officeAddress').append(companyInfo.c_office_address);
        $('#scope').append(companyInfo.c_management_scope);
    }
    function searchCompanyInfo() {
        var getCompanyName="";
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/company/select.do',
            data:{N_code:showCompanyID},
            success:function (rtn) {
                if(rtn!=null){
                    initInfo(rtn);
                    getCompanyName = rtn.n_name;
                    initNoticeTb(showCompanyID);
                    intiReportTab(showCompanyID);
                    initNewsTb(showCompanyID,getCompanyName);
                }
                else{
                    alert('暂未获取到相关数据');
                }
            }
        });
    }

    function initNoticeTb(ID) {
        $('#tb_Notice').bootstrapTable({
            method:'post',
            contentType: 'application/x-www-form-urlencoded',
            fit:true,
            fitColumns:true,
            striped: true,
            rownumbers: true,
            pagination: true,
            //dataType:"json",
            queryParams: function (params) {
                var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    rows: params.limit,   //页面大小
                    page: (params.offset/params.limit)+1,  //页码
                    searchObj:ID
                };
                return temp;
            },
            sidePagination: "server", //服务端处理分页
            pageNumber:1,      //初始化加载第一页，默认第一页
            pageSize: 10,      //每页的记录行数（*）
            pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
            queryParamsType:'limit', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
            // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
            url:'${pageContext.request.contextPath}/notice/select.do',
            showToggle:true,
            columns:[
                {
                    title:"公司名称",
                    field:"n_name",
                    //sortable:true,
                    order:"desc"
                },
                {
                    title:"股票代码",
                    field:"n_code",
                    //sortable:true,
                    order:"desc"
                },
                {
                    title:"公告类型",
                    field:"n_event",
                },
                {
                    title:"公告摘要",
                    field:"n_title",
                },
                {
                    title:"发布时间",
                    field:"n_time",
                    width:90
                },
                {
                    title:"公告详情",
                    field:"n_url",
                    formatter:function(value,row,index){
                        var operation='<a href="javascript:;" class="detail label label-success">查看详情</a>';
                        return operation;
                    },
                    events:{
                        'click .detail':function(e,value,row,index){
                            urlLink=row.n_url;
                            window.open(urlLink);
                        }
                    }
                }
            ],
            locale:"zh-CN"
        });//表格参数初始化
    }
    //新闻采用表格嵌套表格的展示方法
    function initNewsTb(ID,name) {
        $('#tb_News').bootstrapTable({
            method:'post',
            contentType: 'application/x-www-form-urlencoded',
            fit:true,
            fitColumns:true,
            striped: true,
            rownumbers: true,
            pagination: true,
            showRefresh:true,
            //dataType:"json",
            queryParams: function (params) {
                var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    rows: params.limit,   //页面大小
                    page: (params.offset/params.limit)+1,  //页码
                    showCompanyID:ID,
                    companyName:name==null?"all":name,
                    date:($('#datePicker').data().date)==null?"all":$('#datePicker').data().date
                };
                return temp;
            },
            sidePagination: "server", //服务端处理分页
            pageNumber:1,      //初始化加载第一页，默认第一页
            pageSize: 10,      //每页的记录行数（*）
            pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
            queryParamsType:'limit', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
            // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
            url:'${pageContext.request.contextPath}/journalism/select.do',
            showToggle:true,
            columns:[
                {
                    title:"新闻详情",
                    field:"journalism",
                    formatter:function(value,row,index){
                        var operation='<table cellpadding="0" cellspacing="0" border="0" style="border:none; margin:0 auto; width:100%"><tbody>';
                            operation=operation+'<tr>';
                                operation=operation+'<td class="newsTitle" colspan="2" valign="top" align="left"><h4>'+row.j_title+'</h4>';
                                operation=operation+'</td>';
                            operation=operation+'</tr>';
                            operation=operation+'<tr>';
                                operation=operation+'<td class="newsDigest" colspan="2"><h5><small>'+row.j_digest+'</small></h5>';
                                operation=operation+'</td>';
                            operation=operation+'</tr>';
                            operation=operation+'<tr>';
                                operation=operation+'<td class="newsFooter"><span>'+row.j_industry+'</span><span>&nbsp &nbsp'+row.j_time+'</span>';
                                operation=operation+'</td>';
                            operation=operation+'</tr>';
                            operation=operation+'<tr>    ';
                            operation=operation+'</tr>';
                        operation=operation+'</tbody></table>';
                        return operation;
                    }
                }
            ],
            onClickRow:function(row,$element){
//                $('.modal-title').replaceWith(row.j_title);
//                $('.modal-body').replaceWith(row.j_content);
//                $('.modal').modal('show');
                window.open(row.j_url);
            },
            locale:"zh-CN"
        });//表格参数初始化
    }
    
    function intiReportTab(ID) {
        var reportLabel=["一季度报告","中期报告","三季度报告","年度报告"];
        $.each([1,2,3,4],function (i,n) {
            $('#tb_Reports'+n).bootstrapTable({
                method:'post',
                contentType: 'application/x-www-form-urlencoded',
                fit:true,
                fitColumns:true,
                striped: true,
                rownumbers: true,
                pagination: true,
                //dataType:"json",
                queryParams: function (params) {
                    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                        rows: params.limit,   //页面大小
                        page: (params.offset/params.limit)+1,  //页码
                        n_code:ID,
                        n_event:reportLabel[n-1]
                    };
                    return temp;
                },
                sidePagination: "server", //服务端处理分页
                pageNumber:1,      //初始化加载第一页，默认第一页
                pageSize: 10,      //每页的记录行数（*）
                pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
                queryParamsType:'limit', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
                url:'${pageContext.request.contextPath}/notice/selectDetail.do',
                showToggle:true,
                columns:[
                    {
                        title:"公司名称",
                        field:"n_name",
                        //sortable:true,
                        order:"desc"
                    },
                    {
                        title:"股票代码",
                        field:"n_code",
                        //sortable:true,
                        order:"desc"
                    },
                    {
                        title:"公告摘要",
                        field:"n_title",
                    },
                    {
                        title:"发布时间",
                        field:"n_time",
                        width:90
                    },
                    {
                        title:"公告详情",
                        field:"n_url",
                        formatter:function(value,row,index){
                            var operation='<a href="javascript:;" class="detail label label-success">查看详情</a>';
                            return operation;
                        },
                        events:{
                            'click .detail':function(e,value,row,index){
                                urlLink=row.n_url;
                                window.open(urlLink);
                            }
                        }
                    }
                ],
                locale:"zh-CN"
            });//表格参数初始化
        })

    }
</script>
