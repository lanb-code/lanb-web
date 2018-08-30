<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/scanner.css">
    <link rel="stylesheet" type="text/css" href="/css/easyui-reset.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/metro/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="//at.alicdn.com/t/font_727264_jwj3iwudb1.css">
    <script type="text/javascript" src="/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/md5.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<style>
    /*body > .panel-htop {*/
    /*margin-left: 30% !important;*/
    /*}*/

    body #login-box {
        margin: 150px auto !important;
    }

</style>

<div id="login-box" class="easyui-panel" style="width:400px;padding:40px 40px">
    <h2>登录</h2>
    <div style="margin:20px 0;"></div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" id="userName" name="userName" value="admin" prompt="Username" iconWidth="28"
               style="width:100%;height:34px;padding:10px;">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-passwordbox" id="password" name="password" value="admin" prompt="Password" iconWidth="28"
               style="width:100%;height:34px;padding:10px">
    </div>

    <div style="margin-bottom:20px">
        <a id="loginBtn" class="easyui-linkbutton" style="width:80px">登录</a>
    </div>

</div>

<script>

    $(function () {

        $($('#login-box').parent('div')[0]).css('margin-left', '35%');

        $(document).keyup(function (event) {
            if (event.keyCode == 13) {
                $("#loginBtn").trigger("click");
            }
        });

        $('#loginBtn').click(function () {
            $.ajax({
                url: '/user/loginCheck',
                type: 'post',
                data: {
                    'userName': $('#userName').val(),
                    'password': MD5($('#password').val())
                },
                dataType: 'json',
                success: function (result) {
                    if (result.success) {
                        window.location.href = '/';
                    } else {
                        $.messager.alert('error', result.msg, 'error');
                    }
                }
            })
        })

        $("#loginBtn").trigger("click");
    })

</script>

</body>
</html>