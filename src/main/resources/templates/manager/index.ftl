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
            <span><a href="#"><i class="iconfont icon-yonghu"></i>&nbsp;用户</a></span>
            <span><a href="#" onclick="window.location.href = '/user/login';"><i class="iconfont icon-tuichu"></i>&nbsp;退出</a></span>
        </div>
    </div>
    <div data-options="region:'south',split:true" style="height:50px;"></div>
    <div data-options="region:'west',split:true" class="sc-left-menu">
        <div id="sc-accordion" class="easyui-accordion" style="width:100%;">
        </div>
    </div>
    <div data-options="region:'center'" style="width: 100%;">
        <div id="sc-tabs" class="easyui-tabs" fit="true" border="false" plain="true">
            <div title="主页" data-options="selected:true">
            </div>
        </div>
    </div>
</div>

<div id="mm" class="easyui-menu" style="width:120px;">
    <div name="1">关闭</div>
    <div name="2">关闭所有</div>
    <div name="3">刷新</div>
</div>

<script>
    var index = {
    <#--初始化菜单-->
        initMenu: function () {
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
                                        closable: true,
//                                        closed: true,
//                                        cache: true
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
                case 2:
                    this.closeAll();
                    break;
                case 3:
                    var currentTab = $('#sc-tabs').tabs('getTab', curTabTitle);
                    var href = currentTab.panel('options').href;
                    currentTab.panel('refresh', href);
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
        }
    }

    $(function () {
        index.initMenu();
        index.initTabs();
        index.initRightKeyMenu();
        window.onresize = function () {
            setTimeout(index.redraw, 300);
        };
    });


</script>
</body>
</html>