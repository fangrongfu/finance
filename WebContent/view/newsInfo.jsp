<%--
  Created by IntelliJ IDEA.
  User: uestc
  Date: 2017/8/23
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>金融事件分类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
    <link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-table.min.js"></script>
    <script src="../js/bootstrap-table-zh-CN.min.js"></script>
    <script src="../js/moment-with-locales.js"></script>
    <script src="../js/bootstrap-datetimepicker.min.js"></script>
    <script src="../js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../js/main.js"></script>
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
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            display:-webkit-flex; /* Safari */
            flex-direction:row;/*决定是按行排列还是按行排列*/
            text-align:center;
            justify-content:space-around;
        }
        .listItem{
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            display:-webkit-flex; /* Safari */
            flex-direction:row;/*决定是按行排列还是按行排列*/
            text-align:left;
            justify-content:flex-start;

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
                <img class="navbar-brand" src="../pics/IRLablogo.png" href="#maim.jsp"style="padding:0;height:50px;">
            </div>
            <div class="collapse navbar-collapse  navbar-right" id="top-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="main.jsp">&nbsp&nbsp首页&nbsp&nbsp</a></li>
                    <li><a href="search.jsp">&nbsp高级搜索&nbsp</a></li>
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
</div>
<!-- end-导航栏 -->
<div class="container" style="padding: 50px;">
    <h4>近期新闻</h4>
    <div class="searchItem">
        <div class="col-xs-6 listItem">
            <label>选择日期：</label>
            <div class="input-group date" style="width:70%;" id='datePicker'>
                <input type="text" class="form-control" >
                <span class="input-group-addon">
                        <i class="glyphicon glyphicon-calendar"></i>
                    </span>
            </div>
        </div>
        <div class="col-xs-6 listItem">
            <label>相关企业：</label>
                <input type="text" id="searchCompany" style="width: 70%;" class="form-control"placeholder="请输入企业名称/简称">
                <span class="input-group-btn">
                    <button id="btSearch" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>搜索</button>
                </span>
        </div>
    </div>
    <table id="tb_searchNewsResult">
    </table>
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
</html>

<script>
    $(function(){
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
        initDatetimes();
        initNewsTb("all","all");
        $('#btSearch').click(function () {
            var searchCompany=$('#searchCompany').val();
            var opt={
                url:'${pageContext.request.contextPath}/journalism/select.do',
                silent:true,
                query:{
                    companyName: searchCompany == "" ? "all" : searchCompany,
                    date: ($('#datePicker').data().date) == null ? "all" : $('#datePicker').data().date
                }
            };
            $("#tb_searchNewsResult").bootstrapTable('refresh', opt);
        });
    });

    function initDatetimes() {
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

    //新闻采用表格嵌套表格的展示方法
    function initNewsTb(ID,name) {
        $('#tb_searchNewsResult').bootstrapTable({
            method:'post',
            contentType: 'application/x-www-form-urlencoded',
            fit:true,
            fitColumns:true,
            striped: true,
            rownumbers: true,
            pagination: true,
            //showRefresh:true,
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
//                $('.modal-title').empty();
//                $('.modal-body').empty();
//                $('.modal-title').append(row.j_title);
//                $('.modal-body').append(row.j_content);
//                $('.modal').modal('show');
                window.open(row.j_url);
            },
            locale:"zh-CN"
        });//表格参数初始化
    }
</script>
