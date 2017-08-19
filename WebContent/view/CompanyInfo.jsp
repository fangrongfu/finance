<%--
  Created by IntelliJ IDEA.
  User: uestc
  Date: 2017/8/18
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8";>
    <title>金融事件智能分类</title>
    <link rel="stylesheet" href="..\css\bootstrap.min.css">
    <script src="..\js\jquery.min.js"></script>
    <script src="..\js\bootstrap.min.js"></script>
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
                <img class="navbar-brand" src="..\pics\陆门实验室logo_副本.png" href="#maim.html"style="padding:0;height:50px;">
            </div>
            <div class="collapse navbar-collapse  navbar-right" id="top-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="main.html">&nbsp&nbsp首页&nbsp&nbsp</a></li>
                    <li class="active"><a href="search.html">&nbsp高级搜索&nbsp</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">&nbsp事件汇总&nbsp<b class="caret"></b></a>
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
<div class="container" style="padding:120px 50px;">
    <div class="panel panel-default">
        <div class="panel-body">
            <h2 id="companyName"></h2>
            <p id="describe"></p>
            <a class="divider" style="width: 100%"></a>
            <ul class="nav nav-pills nav-left">
                <li class="active"><a data-toggle="pill" href="#tab1">企业概况</a></li>
                <li><a data-toggle="pill" href="#tab2">公司公告</a></li>
                <li><a data-toggle="pill" href="#tab2">公司新闻</a></li>
            </ul>
        </div>
    </div>
    <div class="tab-content" style="margin: 10px">
        <div id="tab1" class="tab-pane fade in active">
            <h3>首页</h3>
            <p>这几天真的热</p>
        </div>
        <div id="tab2" class="tab-pane fade">
            <h3>第一页</h3>
            <p>尤其是六楼顶层</p>
        </div>
        <div id="tab3" class="tab-pane fade">
            <h3>第二页</h3>
            <p>简直不敢出去</p>
        </div>
    </div>
</div>

</body>
<script>
    var showCompanyID=decodeURI(GetQueryString("CompanyID"));
    var companyInfo=null;
    $(function(){
        initInfo();
        //alert(showCompanyID);
        companyInfo=searchCompanyInfo();
    });
    function initInfo() {
        $('#companyName').attr('value',"公司名称("+showCompanyID+')');
        $('#describe').attr('value',"这里是公司描述");
    }
    function searchCompanyInfo() {
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/notice/selectDetail.do',
            data:showCompanyID,
            success:function (rtn) {
                if(rtn.Success){
                    return rtn.Info;
                }
                else{
                    alert(rtn.Msg);
                    return;
                }
            }
        });
    }
</script>
