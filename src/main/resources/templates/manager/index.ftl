<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/scanner.css">
    <link rel="stylesheet" type="text/css" href="/css/easyui-reset.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/metro/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="//at.alicdn.com/t/font_727264_jwj3iwudb1.css">
    <script type="text/javascript" src="/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/Datagrid.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div id="content" class="easyui-layout" style="height: 100%;">
    <div data-options="region:'north'" style="height:42px;">
        <h1 class="logo"><a href="#"><i class="iconfont icon-saomiao"></i>&nbsp;LanbWeb</a></h1>
        <div class="toolbar">
            <span><a href="#"><i class="iconfont icon-yonghu"></i>&nbsp;${Session.userName!"暂无用户"}</a></span>
            <span><a href="#" onclick="logout()"><i class="iconfont icon-tuichu"></i>&nbsp;退出</a></span>
        </div>
    </div>
    <div data-options="region:'south',split:true" style="height:50px;"></div>
    <div data-options="region:'west',split:true" class="sc-left-menu">
        <div id="sc-accordion" class="easyui-accordion" style="width:100%;">
        </div>
    <#--<div id="sc-sidemenu" style="width: 98%;"></div>-->
    </div>
    <div data-options="region:'center'" style="width: 100%;">
        <div id="sc-tabs" class="easyui-tabs" fit="true" border="false" plain="true">
            <div title="主页" data-options="selected:true">
                <div style="display: flex; justify-content: space-between; height: 20%">
                    <div class="easyui-panel" title="快捷方式"
                         style="width: 70%;height:100%;padding:18px; display: flex; justify-content: space-around;">
                        <a href="#" onclick="openTab('代码生成器', '/creater')" class="easyui-linkbutton">代码生成器</a>
                        <a href="#" class="easyui-linkbutton">用户配置</a>
                        <a href="#" class="easyui-linkbutton">角色管理</a>
                        <a href="#" class="easyui-linkbutton">查看日志</a>
                        <a href="#" class="easyui-linkbutton">系统设置</a>
                    </div>
                    <div class="easyui-panel" title="版本信息"
                         style="width: 28%;height:100%;padding:10px;">
                        <p style="padding: 5px;">当前版本&nbsp;v1.0</p>
                        <p style="padding: 5px;">基于框架&nbsp;easyui</p>
                    </div>
                </div>

                <div style="display: flex; justify-content: space-between; margin-top: 10px; height: 73%">
                    <div class="easyui-panel" title="用户监控"
                         style="width: 70%;height:100%;padding:10px;">
                        <h1 style="text-align: center; margin-top: 20%;">当前暂无在线用户</h1>
                    </div>
                    <table class="easyui-datagrid" title="消息推送" lines="true" data-options="url: '/msg/query'"
                        style="width: 28%;height:100%;padding:10px;">
                        <thead>
                        <tr>
                            <th data-options="field:'msgId', hidden: true">消息ID</th>
                            <th data-options="field:'msgTitle',width:'50%'">消息标题</th>
                            <th data-options="field:'createTime',width:'50%'">创建时间</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="mm" class="easyui-menu" style="width:120px;">
    <div name="1">关闭</div>
    <div name="2">关闭其他</div>
    <div name="3">关闭所有</div>
    <div name="4">刷新</div>

</div>

<script>
    var index = {
    <#--初始化菜单-->
        initMenu: function () {
            /* $.ajax({
                 url: '/menu/getSubMenuList',
                 dataType: 'json',
                 success: function (data) {
                     $('#sc-sidemenu').sidemenu({
                         data: data
                     })
                 }
             })*/
            $.ajax({
                url: '/menu/getSubMenuList',
                success: function (data) {
                    $.each(data, function (index, object) {
                        var parentId = object.id;
                        var children = object.children;
                        var title = object.text;
                        $('#sc-accordion').accordion('add', {
                            title: title,
                            content: '<ul id="' + parentId + '"></ul>',
                            selected: false
                        });
                        $('#' + parentId).tree({
                            data: children,
                            onClick: function (node) {
                                var menuUrl = node.attributes.menuUrl;
                                if (menuUrl == '')
                                    return;
                                var title = node.text;
                                if ($('#sc-tabs').tabs('exists', title)) {
                                    $('#sc-tabs').tabs('select', title);
                                } else {
                                    $('#sc-tabs').tabs('add', {
                                        title: title,
                                        href: menuUrl,
                                        closable: true
                                    });
                                }
                            }
                        });

                    });
                }
            });
        },

    <#--初始化选项卡-->
        initTabs: function () {
            $('#sc-tabs').tabs({
                        onContextMenu: function (e, title, index) {
                            e.preventDefault();
                            if (index > 0) {
                                $('#mm').menu('show', {
                                    left: e.pageX,
                                    top: e.pageY
                                }).data("tabTitle", title);
                            }
                        }
                    }
            );
        },

    <#--初始化右键菜单-->
        initRightKeyMenu: function () {
            var self = this;
            $("#mm").menu({
                onClick: function (item) {
                    self.tabMenu(this, item.name);
                }
            });
        },

    <#--重置高度宽度-->
        redraw: function () {
            var win_width = $("#content").width();
            $('#content').layout('panel', 'west').panel('resize', {width: win_width / 6});
            $('#content').layout('panel', 'center').panel('resize', {width: win_width / 1});
            $('#content').layout('resize');
        },

    <#--Tabs事件-->
        tabMenu: function (menu, type) {
            type = parseInt(type)
            var curTabTitle = $(menu).data("tabTitle");
            switch (type) {
                case 1:
                    $('#sc-tabs').tabs('close', curTabTitle);
                    break;
                case 3:
                    this.closeAll();
                    break;
                case 4:
                    var currentTab = $('#sc-tabs').tabs('getTab', curTabTitle);
                    var href = currentTab.panel('options').href;
                    currentTab.panel('refresh', href);
                    break;
                case 2:
                    this.closeOther(curTabTitle);
                    break;
            }
        },

    <#--关闭所有-->
        closeAll: function () {
            $(".tabs li").each(function (index, obj) {
                //获取所有可关闭的选项卡
                var tab = $(".tabs-closable", this).text();
                $(".easyui-tabs").tabs('close', tab);
            });
        },

        closeOther: function (curTabTitle) {
            $(".tabs li").each(function (index, obj) {
                //获取所有可关闭的选项卡
                var tab = $(".tabs-closable", this).text();
                if (curTabTitle !== tab) {
                    $(".easyui-tabs").tabs('close', tab);
                }
            });
        }
    }

    function logout() {
        $.ajax({
            url: '/user/logout',
            dataType: 'json',
            success: function (res) {
                /*if(res.success) {
                    window.location.href = '/user/login';
                }*/
            }
        })
    }

    $(function () {
        index.initMenu();
        index.initTabs();
        index.initRightKeyMenu();
        window.onresize = function () {
            setTimeout(index.redraw, 300);
        };
    });

    function openTab(title, menuUrl) {
        if (menuUrl == '')
            return;
        if ($('#sc-tabs').tabs('exists', title)) {
            $('#sc-tabs').tabs('select', title);
        } else {
            $('#sc-tabs').tabs('add', {
                title: title,
                href: menuUrl,
                closable: true
            });
        }
    }


</script>
</body>
</html>