<#--数据表格-->
<table id="menuSettingDg" style="width:98%;height:100%"></table>
<#--工具栏-->
<div id="menuSettingToolbar" style="padding: 5px;">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true"
       onclick="menuSetting.new()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="menuSetting.edit()">编辑</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
       onclick="menuSetting.destroy()">删除</a>
</div>
<#--弹窗页面-->
<div id="menuSettingDlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#menuSettingDlgButtons'">
<#--编辑表单-->
    <form id="menuSettingFm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div hidden style="margin-bottom:10px">
            <input name="menuId" class="easyui-textbox" label="菜单ID:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="menuName" class="easyui-textbox" required="true" label="菜单名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <select name="parentMenuId" class="easyui-combotree"
                    data-options="
                    url: '/menu/getSubMenuList',
                    valueField: 'id',
                    textField: 'text'"
                    id="parentMenuId" label="父菜单ID:"
                    style="width:100%">
            </select>
        </div>
        <div style="margin-bottom:10px">
            <input name="menuUrl" class="easyui-textbox" label="菜单地址:"
                   style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="sort" class="easyui-textbox" label="排序:"
                   style="width:100%">
        </div>
    </form>
</div>
<#--操作按钮-->
<div id="menuSettingDlgButtons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="menuSetting.save()"
       style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#menuSettingDlg').dialog('close')" style="width:90px">取消</a>
</div>

<script type="text/javascript">
    <#--当前页面对象,防止冲突-->
    var menuSetting = {
        initTable: function () {
            var self = this;
        <#--树表格-->
            $('#menuSettingDg').treegrid({
                url: "/menu/getSubMenuTreeGrid1",
                toolbar: "#menuSettingToolbar",
            <#--pagination: true,&lt;#&ndash;是否分页&ndash;&gt;-->
                rownumbers: true,<#--是否显示行号-->
                fitColumns: true,
                singleSelect: true,<#--是否单选-->
                title: "菜单设置",
                idField: 'menuId',
                treeField: 'menuName',
                columns: [[
                    {field: 'menuId', title: '菜单ID', width: 50, hidden: true},
                    {field: 'menuName', title: '菜单名', width: 50},
                    {field: 'parentMenuId', title: '父菜单ID', width: 50, hidden: true},
                    {field: 'menuUrl', title: '菜单地址', width: 50},
                    {field: 'sort', title: '排序', width: 50}
                ]],
                onDblClickRow: function (index, row) {<#--双击事件-->
                    self.edit();
                }
            });
        },

    <#--新增-->
        new: function () {
            var row = $('#menuSettingDg').datagrid('getSelected');
            $('#menuSettingDlg').dialog('open').dialog('center').dialog('setTitle', '菜单新增');
            $('#menuSettingFm').form('clear');
            if (row) {
                $('#menuSettingFm').form('load', {
                    parentMenuId: row.menuId
                });
            }
            menuSetting.url = '/menu/saveMenu';
        },

    <#--编辑-->
        edit: function () {
            var row = $('#menuSettingDg').datagrid('getSelected');
            if (row) {
                $('#menuSettingDlg').dialog('open').dialog('center').dialog('setTitle', '菜单编辑');
                $('#menuSettingFm').form('load', row);
                menuSetting.url = '/menu/editMenu';
            }
        },

    <#--保存-->
        save: function () {
            $('#menuSettingFm').form('submit', {
                url: menuSetting.url,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (result) {
                    var result = eval('(' + result + ')');
                    if (result.errorMsg) {
                        $.messager.show({
                            title: '错误',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#menuSettingDlg').dialog('close');
                        $('#menuSettingDg').treegrid('reload');
                        $.messager.show({
                            title: '信息',
                            msg: "操作成功"
                        });
                    }
                }
            });
        },

    <#--删除-->
        destroy: function () {
            var row = $('#menuSettingDg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('Confirm', '确认要删除该项?', function (r) {
                    if (r) {
                        $.post('/menu/destroyMenu', {menuId: row.menuId}, function (result) {
                            if (result.success) {
                                $('#menuSettingDg').treegrid('reload');
                                $.messager.show({
                                    title: '信息',
                                    msg: "操作成功"
                                });
                            } else {
                                $.messager.show({
                                    title: '错误',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        }
    };

    $(function () {
        menuSetting.initTable();
    });


</script>