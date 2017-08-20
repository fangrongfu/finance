<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>金融事件分类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/swiper.min.css">
	<script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/swiper.jquery.min.js"></script>
    <script src="../js/swiper.min.js"></script>
    <script src="..\js\main.js"></script>
    <style>
    html, body {
        position: relative;
        height: 100%;
    }
    body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color:#000;
        margin: 0;
        padding: 0;
    }
    .swiper-container {
        width: 100%;
        height: 100%;
        background: #000;
        padding:50px;
    }
    .swiper-slide {
        font-size: 18px;
        color:#fff;
        -webkit-box-sizing: border-box;
        box-sizing: border-box; 
        padding: 40px 60px;
        display:flex;
        display:-webkit-flex; /* Safari */
        flex-flow:column;
        align-items:center;
        text-align:center;  
        justify-content:center;   
    }
    .parallax-bg {
        position: absolute;
        left: 0;
        top: 0;
        width: 130%;
        height: 100%;
        -webkit-background-size: cover;
        background-size: cover;
        background-position: center;
    }
    .swiper-slide .title {
        font-size: 50px;
        font-weight: 300;
    }
    .swiper-slide .subtitle {
        font-size: 30px;        
    }
    .swiper-slide .text {
        font-size: 18px;
        max-width: 760px;
        line-height: 1.3;
    }
    
    </style>
</head>
<body>
    <div style="filter:alpha(opacity=20)">
        <!-- 导航栏 -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
                        <li class="active"><a href="main.jsp">&nbsp&nbsp首页&nbsp&nbsp</a></li>
				        <li><a href="search.jsp">&nbsp高级搜索&nbsp</a></li>
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
					    <input id="topSearch" type="text" class="form-control" placeholder="Search">
				        </div>
                        <input type="text" value="解决bootstrap与AJAX异步提交表单的冲突" hidden />
					    <button type="button" id="search" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>搜索</button>
			        </form>
                </div>
            </div>
        </nav>
    </div>
<!-- end-导航栏 -->
<!-- 主要功能轮播 -->
    <div class="swiper-container" >
        <div class="parallax-bg" style="background-image:url(.././pics/wallpaper-2979955.png)" data-swiper-parallax="-23%"></div>
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="title" data-swiper-parallax="-100">金融事件智能分类</div>
                <div class="subtitle" data-swiper-parallax="-200">&nbsp</div>
                <div class="text" data-swiper-parallax="-300">
                    <p>聚合金融事件大数据，构建出金融事件高效分类器，智能化分类助您快速高效定位准确金融信息</p>
                    <a class="btn btn-primary btn-lg" href="#" role="button">&nbsp直达分类界面&nbsp</a>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="title" data-swiper-parallax="-100">语义智能搜索</div>
                <div class="subtitle" data-swiper-parallax="-200">&nbsp</div>
                <div class="text" data-swiper-parallax="-300">
                    <p>这里是功能描述。这里是功能描述。这里是功能描述。这里是功能描述。这里是功能描述。这里是功能描述。</p>
                    <a class="btn btn-primary btn-lg" href="search.jsp" role="button">&nbsp直达检索界面&nbsp</a>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="title" data-swiper-parallax="-100">功能3</div>
                <div class="subtitle" data-swiper-parallax="-200">Subtitle</div>
                <div class="text" data-swiper-parallax="-300">
                    <p>这里是功能描述。这里是功能描述。这里是功能描述。这里是功能描述。这里是功能描述。这里是功能描述。</p>
                    <a class="btn btn-primary btn-lg" href="#" role="button">&nbsp直达功能界面&nbsp</a>
                </div>
            </div>
        </div>
        <!-- 添加分页 -->
        <div class="swiper-pagination swiper-pagination-white"></div>
        <!-- 添加滑动 -->
        <div class="swiper-button-prev swiper-button-white"></div>
        <div class="swiper-button-next swiper-button-white"></div>
    </div>
<!-- end-主要功能轮播 -->
<div class="container">
    <div class="row clearfix">
		<div class="col-md-4 column">
			<h2>
				核心功能1
			</h2>
			<p>
				这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述
			</p>
			<p>
				 <a class="btn" href="#">查看详情 »</a>
			</p>
		</div>
		<div class="col-md-4 column">
			<h2>
				核心功能2
			</h2>
			<p>
				这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述
			</p>
			<p>
				 <a class="btn" href="#">查看详情 »</a>
			</p>
		</div>
		<div class="col-md-4 column">
			<h2>
				核心功能3
			</h2>
			<p>
				这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述。这里是核心功能描述
			</p>
			<p>
				 <a class="btn" href="#">查看详情 »</a>
			</p>
		</div>
	</div>
</div>
</body>
</html>

<script>
    $(function(){
    // 初始化swiper
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        slidesPerView:'auto',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        centeredSlides:true,
        parallax: true,
        speed: 600,
    });
    $('#search').click(function(){
        // 输入的内容传递给后台，并跳转到检索结果界面
        searchObj=$('#topSearch').val();
        searchFinEvent();
    });
    $("body").keydown(function() {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#search').click();
        }
    });
    })
</script>
