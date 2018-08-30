<table id="roleManagerDg" style="width:98%;height:100%"></table>
<div id="roleManagerToolbar" style="padding: 5px;"><a href="javascript:void(0)" class="easyui-linkbutton"
                                                      iconCls="icon-add" plain="true" onclick="roleManager.new()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="roleManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove"
                                              plain="true" onclick="roleManager.destroy()">删除</a></div>
<div id="roleManagerDlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#roleManagerDlgButtons'">
    <form id="roleManagerFm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div hidden style="margin-bottom:10px"><input name="roleId" class="easyui-textbox" label="角色ID:"
                                                      style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="roleName" class="easyui-textbox" label="角色名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px"><input name="options" class="easyui-textbox" label="角色配置项:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <select name="parentRoleId" class="easyui-combobox"
                    data-options="
                    url: '/role/query',
                    valueField: 'roleId',
                    textField: 'roleName'"
                    label="父角色ID:"
                    style="width:100%">
            </select>
        </div>
        <div style="margin-bottom:10px"><input name="sort" class="easyui-textbox" label="排序:" style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="createTime" class="easyui-datetimebox" label="创建时间:"
                                               style="width:100%"></div>
    </form>
</div>
<div id="roleManagerDlgButtons"><a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                   onclick="roleManager.save()" style="width:90px">保存</a> <a href="javascript:void(0)"
                                                                                             class="easyui-linkbutton"
                                                                                             iconCls="icon-cancel"
                                                                                             onclick="javascript:$('#roleManagerDlg').dialog('close')"
                                                                                             style="width:90px">取消</a>
</div>
<script type="text/javascript"> var roleManager = datagrid({
    menuName: 'roleManager',
    menuTitle: '角色设置',
    pk: 'roleId',
    columns: [[{field: 'roleId', title: '角色ID', width: 50, hidden: true,}, {
        field: 'roleName',
        title: '角色名',
        width: 50,
    }, {field: 'options', title: '角色配置项', width: 50,}, {
        field: 'parentRoleId',
        title: '父角色ID',
        width: 50,
    }, {field: 'sort', title: '排序', width: 50,}, {
        field: 'createTime',
        title: '创建时间',
        width: 50,
        formatter: dateFormatter,
    },]],
    api: {save: '/role/save', delete: '/role/delete', update: '/role/update', query: '/role/query'}
});
$(function () {
    roleManager.initTable();
}); </script>