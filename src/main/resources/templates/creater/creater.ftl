<div class="easyui-panel" title="文件上传" style="width:98%;padding:30px 60px;">
    <form id="fileUploadFm" method="post" action="/test/fileUpload"
          enctype="multipart/form-data">
        <div style="margin-bottom:20px">
            <input class="easyui-filebox" name="file" label="文件"
                   data-options="prompt:'选择文件'" style="width:100%"/>
        </div>
        <div>
            <input type="button" href="#" onclick="fileUpload.submitForm()" class="easyui-linkbutton"
                   style="width:10%; height: 30px;"
                   value="上传"/>
        </div>
    </form>
</div>

<div style="margin: 10px 0px;"></div>
<div class="easyui-panel" title="一键代码生成" style="width:98%;padding:30px 60px;">
    <form id="createrAllFm" method="post">
        <div style="margin-bottom:20px">
            <label for="packageName" class="textbox-label">包名:</label>
            <input class="easyui-textbox" name="packageName" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="tableName" class="textbox-label">表名:</label>
            <input class="easyui-textbox" name="tableName" style="width: 50%"
                   data-options="required:true">
        </div>
    <#--<div style="margin-bottom:20px">-->
    <#--<label for="isFtl" class="textbox-label">生成前端:</label>-->
    <#--<input name="isFtl" class="easyui-switchbutton" checked>-->
    <#--</div>-->
    </form>
    <div style="padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrAllFm.submitForm()"
           style="width:80px">生成</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrAllFm.clearForm()"
           style="width:80px">重置</a>
    </div>
</div>

<div style="margin: 10px 0px;"></div>
<div class="easyui-panel" title="Mybatis代码生成" style="width:98%;padding:30px 60px;">
    <form id="createrMybatisFm" method="post">
        <div style="margin-bottom:20px">
            <label for="packageName" class="textbox-label">包名:</label>
            <input class="easyui-textbox" name="packageName" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="tableName" class="textbox-label">表名:</label>
            <input class="easyui-textbox" name="tableName" style="width: 50%"
                   data-options="required:true">
        </div>
    <#--<div style="margin-bottom:20px">-->
    <#--<label for="isFtl" class="textbox-label">生成前端:</label>-->
    <#--<input name="isFtl" class="easyui-switchbutton" checked>-->
    <#--</div>-->
    </form>
    <div style="padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrMybatisFm.submitForm()"
           style="width:80px">生成</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrMybatisFm.clearForm()"
           style="width:80px">重置</a>
    </div>
</div>

<div style="margin: 10px 0px;"></div>
<div class="easyui-panel" title="服务生成" style="width:98%;padding:30px 60px;">
    <form id="createrServiceFm" method="post">
        <div style="margin-bottom:20px">
            <label for="packageName" class="textbox-label">包名:</label>
            <input class="easyui-textbox" name="packageName" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="tableName" class="textbox-label">表名:</label>
            <input class="easyui-textbox" name="tableName" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="result" class="textbox-label">结果:</label>
            <input class="easyui-textbox" multiline="true" id="result" name="result" style="width: 50%;height:200px">
        </div>
    <#--<div style="margin-bottom:20px">-->
    <#--<label for="isFtl" class="textbox-label">生成前端:</label>-->
    <#--<input name="isFtl" class="easyui-switchbutton" checked>-->
    <#--</div>-->
    </form>
    <div style="padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrServiceFm.submitForm()"
           style="width:80px">生成</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrServiceFm.clearForm()"
           style="width:80px">重置</a>
    </div>
</div>

<div style="margin: 10px 0px;"></div>
<div class="easyui-panel" title="接口生成" style="width:98%;padding:30px 60px;">
    <form id="createrApiFm" method="post">
        <div style="margin-bottom:20px">
            <label for="packageName" class="textbox-label">包名:</label>
            <input class="easyui-textbox" name="packageName" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="tableName" class="textbox-label">表名:</label>
            <input class="easyui-textbox" name="tableName" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="result" class="textbox-label">结果:</label>
            <input class="easyui-textbox" multiline="true" id="result" name="result" style="width: 50%;height:200px">
        </div>
    <#--<div style="margin-bottom:20px">-->
    <#--<label for="isFtl" class="textbox-label">生成前端:</label>-->
    <#--<input name="isFtl" class="easyui-switchbutton" checked>-->
    <#--</div>-->
    </form>
    <div style="padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrApiFm.submitForm()"
           style="width:80px">生成</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrApiFm.clearForm()"
           style="width:80px">重置</a>
    </div>
</div>

<div style="margin: 10px 0px;"></div>
<div class="easyui-panel" title="Datagrid生成" style="width:98%;padding:30px 60px;">
    <form id="createrDatagridFm" method="post">
        <div style="margin-bottom:20px">
            <label for="packageName" class="textbox-label">功能名:</label>
            <input class="easyui-textbox" name="menuName" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="tableName" class="textbox-label">功能标题:</label>
            <input class="easyui-textbox" name="menuTitle" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="tableName" class="textbox-label">表名:</label>
            <input class="easyui-textbox" name="tableName" style="width: 50%"
                   data-options="required:true">
        </div>
        <div style="margin-bottom:20px">
            <label for="result" class="textbox-label">结果:</label>
            <input class="easyui-textbox" multiline="true" id="result" name="result" style="width: 50%;height:200px">
        </div>
    </form>
    <div style="padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrDatagridFm.submitForm()"
           style="width:80px">生成</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="createrDatagridFm.clearForm()"
           style="width:80px">重置</a>
    </div>
</div>

<script>
    var fileUpload = {};
    var createrAllFm = {};
    var createrMybatisFm = {};
    var createrServiceFm = {};
    var createrApiFm = {};
    var createrDatagridFm = {};

    fileUpload.submitForm = function () {
        $('#fileUploadFm').form('submit', {
            url: '/test/fileUpload',
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                var obj = JSON.parse(data);
                if (obj.success) {
                    $.messager.show({
                        title: '信息',
                        msg: '上传成功!'
                    });
                } else {
                    $.messager.show({
                        title: '错误',
                        msg: obj.errorMsg
                    })
                }

            }
        })
    }

    createrAllFm.submitForm = function () {
        $('#createrAllFm').form('submit', {
            url: "/creater/createAllString",
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                var obj = JSON.parse(data);
                $.messager.show({
                    title: '信息',
                    msg: obj.msg
                });
            }
        });
    }
    createrAllFm.clearForm = function () {
        $('#createrAllFm').form('clear');
    }


    createrMybatisFm.submitForm = function () {
        $('#createrMybatisFm').form('submit', {
            url: "/creater/createMybatisString",
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                var obj = JSON.parse(data);
                $.messager.show({
                    title: '信息',
                    msg: obj.result
                });
            }
        });
    }
    createrMybatisFm.clearForm = function () {
        $('#createrMybatisFm').form('clear');
    }

    createrServiceFm.submitForm = function () {
        $('#createrServiceFm').form('submit', {
            url: "/creater/createServiceString",
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                var obj = JSON.parse(data);
                $('#createrServiceFm #result').textbox('setText', obj.result);
            }
        });
    }
    createrServiceFm.clearForm = function () {
        $('#createrServiceFm').form('clear');
    }

    createrApiFm.submitForm = function () {
        $('#createrApiFm').form('submit', {
            url: "/creater/createActionString",
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                var obj = JSON.parse(data);
                $('#createrApiFm #result').textbox('setText', obj.result);
            }
        });
    }
    createrApiFm.clearForm = function () {
        $('#createrApiFm').form('clear');
    }


    createrDatagridFm.submitForm = function () {
        $('#createrDatagridFm').form('submit', {
            url: "/creater/createDatagridString",
            onSubmit: function () {
                return $(this).form('validate');
            },
            success: function (data) {
                var obj = JSON.parse(data);
                $('#createrDatagridFm #result').textbox('setText', obj.result);
            }
        });
    }
    createrDatagridFm.clearForm = function () {
        $('#createrDatagridFm').form('clear');
    }

</script>