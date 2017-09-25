




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    .searchItem{
        font-size: 18px;
        color:#fff;
        -webkit-box-sizing: border-box;
        box-sizing: border-box; 
        margin: 60px 100px;
        display:flex;
        display:-webkit-flex; /* Safari */
        flex-flow:row;/*决定是按行排列还是按行排列*/
        align-items:center;
        text-align:center;  
        justify-content:space-around;
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
    <div class="container" >
        <div style="padding:120px 50px;text-align:center;font-size: 50px;">IRLab 金融事件智能搜索</div>
        <div style="padding:30px 120px 10px ;">
            <form role="form">
                    <div class="input-group input-group-lg">
                    <!-- <span class="input-group-btn">
				        <button type="button" class="btn btn-default ">搜索类别</button>
				        <button type="button" class="btn btn-default dropdown-toogle" data-toggle="dropdown"><span class="caret"></span></button>
				        <ul class="dropdown-menu">
					        <li><a>类别1</a></li>
					        <li><a>类别2</a></li>
					        <li><a>类别3</a></li>
				        </ul>
			        </span> -->
                    <input type="text" id="ipSearch" class="form-control" placeholder="请输入想要搜索的信息">
                    <span class="input-group-btn">
                    <button id="btSearch" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>&nbsp搜&nbsp索&nbsp</button>
                    </span>
                    </div>
            </form>
        </div>
    
        <div class="searchItem">
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">人事任免</button></div>
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">关联交易</button></div>
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">投资事件</button></div>
        </div> 
        <div class="searchItem">
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">诉讼事件</button></div>
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">异常事件</button></div>
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">重大事件</button></div>
        </div>
        <div class="searchItem">
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">购置事件</button></div>
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">定向事件</button></div>
            <div class="col-lg-4"><button type="button" class="btn btn-default btn-lg btnItem">同意挂牌</button></div>
        </div> 
        </div> 
</body>
</html>
<script>
    $(function(){
        $('#btSearch').click(function(){
            searchObj=$('#ipSearch').val();
            searchFinEvent();
            //console.info(searchObj);
        });//end of btSearch

        $('#search').click(function(){
            searchObj=$('#topSearch').val();
            searchFinEvent();
            //console.info(searchObj);
        });//end of btSearch

        $('.btnItem').click(function(){
            searchObj=$(this).html();
            searchFinEvent();
            //console.info(searchObj);
        });
    });
</script>