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
                <img class="navbar-brand" src="..\.\pics\陆门实验室logo_副本.png" href="#maim.jsp"style="padding:0;height:50px;">
            </div>
            <div class="collapse navbar-collapse  navbar-right" id="top-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="main.jsp">&nbsp&nbsp首页&nbsp&nbsp</a></li>
                    <li class="active"><a href="search.jsp">&nbsp高级搜索&nbsp</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">&nbsp事件汇总&nbsp<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#" >&nbsp新闻&nbsp</a></li>
                            <li><a href="#" >&nbsp公告&nbsp</a></li>
                            <li class="divider"></li>
                            <li><a href="#" >&nbsp季报/年报&nbsp</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
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
    var CompanyID = null;
    $(function(){
        //var Result_Obj;
        //getSearchResult();
        var oTable=new TableInit();
        oTable.initTable();
        <%--function getSearchResult(){ --%>
        <%--console.info(searchObj);--%>
        <%--$.ajax({--%>
        <%--type:'post',--%>
        <%--url:'${pageContext.request.contextPath}/notice/select.do',--%>
        <%--data:{searchObj:JSON.stringify(searchObj)},--%>
        <%--cache:false,--%>
        <%--dataType:'text',--%>
        <%--success:function(rtn){--%>
        <%--Result_Obj=(JSON.parse(rtn)).notice;--%>
        <%--console.info(Result_Obj);--%>
        <%--$('#tb_searchResult').bootstrapTable('load',Result_Obj);--%>
        <%--//console.info(ResultObj.rows);--%>
        <%--}//end of success function--%>
        <%--});//end of ajax--%>
        <%--} --%>


    });
    var TableInit = function(){
        var oTableInit = new Object();
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
                search: true,//是否显示右上角的搜索框
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
                                CompanyID=row.n_code;
                                showCompanyInfo();
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
                                CompanyID=row.n_code;
                                showCompanyInfo();
                                //console.info(CompanyID);
                            }
                        }
                    },
                    {
                        title:"公告摘要",
                        field:"n_title",
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
                page: params.offset+1,  //页码
                searchObj:searchObjPost
            };
            //console.info(params);
            //console.info(temp);
            return temp;
        };
        return oTableInit;
    }

    //传递公司ID
    function showCompanyInfo(){
        conpany_url="CompanyInfo.jsp?CompanyID="+encodeURI(encodeURI(CompanyID));//拼接url
        window.location.href=conpany_url;
        console.info(CompanyID);
    }
</script>