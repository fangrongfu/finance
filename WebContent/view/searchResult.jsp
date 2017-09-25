<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>金融事件智能分类</title>
    <link rel="stylesheet" href="..\css\bootstrap-table.min.css">
    <link rel="stylesheet" href="..\css\bootstrap.min.css">
    <script src="..\js\jquery.min.js"></script>
    <script src="..\js\bootstrap.min.js"></script>
    <script src="..\js\bootstrap-table.min.js"></script>
    <script src="..\js\bootstrap-table-zh-CN.min.js"></script>
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
                <img class="navbar-brand" src="..\pics\IRLablogo.png" href="#maim.jsp"style="padding:0;height:50px;">
            </div>
            <div class="collapse navbar-collapse  navbar-right" id="top-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="main.jsp">&nbsp&nbsp首页&nbsp&nbsp</a></li>
                    <li class="active"><a href="search.jsp">&nbsp高级搜索&nbsp</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">&nbsp事件汇总&nbsp<b class="caret"></b></a>
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
<div class="container" style="padding:50px">
    <table id="tb_searchResult">
    </table>
</div>
</body>
<script>
    var searchObjPost=decodeURI(GetQueryString("searchObj"));
    $(function(){
        $('#search').click(function(){
            // 输入的内容传递给后台，并跳转到检索结果界面
            searchObj=$('#topSearch').val();
            searchFinEvent();
        });
        var oTable=new TableInit();
        oTable.initTable();
        $("body").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $('#search').click();
            }
        });
    });
    var TableInit = function(){
        var oTableInit = {};
        oTableInit.initTable=function(){
            $('#tb_searchResult').bootstrapTable({
                method:'post',
                contentType: 'application/x-www-form-urlencoded',
                fit:true,
                fitColumns:true,
                striped: true,
                //toolbar: '#toolbar',
                rownumbers: true,
                pagination: true,
                //dataType:"json",
                queryParams:oTableInit.queryParams,
                sidePagination: "server", //服务端处理分页
                pageNumber:1,      //初始化加载第一页，默认第一页
                pageSize: 10,      //每页的记录行数（*）
                pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
                queryParamsType:'limit', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
                url:'${pageContext.request.contextPath}/notice/select.do',
                //idField:"n_code",
                showColumns:true,
                showRefresh: true,
                showToggle:true,
                //search: true,//是否显示右上角的搜索框
                columns:[
                    {
                        title:"公司名称",
                        field:"n_name",
                        //sortable:true,
                        order:"desc",
                        formatter:function(value,row,index){
                            var operation='<a href="javascript:;" class="label label-primary showCompany">'+value+'</a>';
                            return operation;
                        },
                        events:{
                            'click .showCompany':function(e,value,row,index){
                                //点击该行，显示该企业或者该企业对应的事件
                                showCompanyInfo(row.n_code);
                                //console.info(CompanyID);
                            }
                        }
                    },
                    {
                        title:"股票代码",
                        field:"n_code",
                        //sortable:true,
                        order:"desc",
                        formatter:function(value,row,index){
                            var operation='<a href="javascript:;" class="label label-info showCompany">'+value+'</a>';
                            return operation;
                        },
                        events:{
                            'click .showCompany':function(e,value,row,index){
                                //点击该行，显示该企业或者该企业对应的事件
                                showCompanyInfo(row.n_code);
                            }
                        }
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
        };
        //自定义查询参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                rows: params.limit,   //页面大小
                page: (params.offset/params.limit)+1,  //页码
                searchObj:searchObjPost
                //keyword:params.search,//搜索
                //sortOrder: params.order,//排序
                //sortName:params.sort//排序字段
            };
            //console.info(params);
            //console.info(temp);
            return temp;
        };
        return oTableInit;
    };
    //传递公司ID
    function showCompanyInfo(CompanyID){
        var company_url="CompanyInfo.jsp?CompanyID="+encodeURI(encodeURI(CompanyID));//拼接url
        window.location.href=company_url;
        //console.info(CompanyID);
    }
</script>