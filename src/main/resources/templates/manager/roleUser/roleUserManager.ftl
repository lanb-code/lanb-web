<table id="roleUserManagerDg" style="width:98%;height:100%"></table>
<div id="roleUserManagerToolbar" style="padding: 5px;"><a href="javascript:void(0)" class="easyui-linkbutton"
                                                          iconCls="icon-add" plain="true"
                                                          onclick="roleUserManager.new()">新增</a> <a
        href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
        onclick="roleUserManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton"
                                                   iconCls="icon-remove" plain="true"
                                                   onclick="roleUserManager.destroy()">删除</a></div>
<div id="roleUserManagerDlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#roleUserManagerDlgButtons'">
    <form id="roleUserManagerFm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div hidden style="margin-bottom:10px"><input name="roleUserId" class="easyui-textbox" label="角色用户ID:"
                                                      style="width:100%"></div>
        <div style="margin-bottom:10px">
            <select name="roleId" class="easyui-combobox"
                    data-options="
                    url: '/role/query',
                    valueField: 'roleId',
                    textField: 'roleName'"
                    label="角色ID:"
                    style="width:100%">
            </select>
        </div>
        <div style="margin-bottom:10px">
            <select name="userId" class="easyui-combobox"
                    data-options="
                    url: '/user/query',
                    valueField: 'userId',
                    textField: 'userName'"
                    label="用户ID:"
                    style="width:100%">
            </select>
        </div>
        <div style="margin-bottom:10px"><input name="createTime" class="easyui-datetimebox" label="创建时间:"
                                               style="width:100%"></div>
    </form>
</div>
<div id="roleUserManagerDlgButtons"><a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                       onclick="roleUserManager.save()" style="width:90px">保存</a> <a
        href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
        onclick="javascript:$('#roleUserManagerDlg').dialog('close')" style="width:90px">取消</a></div>
<script type="text/javascript"> var roleUserManager = datagrid({
    menuName: 'roleUserManager',
    menuTitle: '用户角色管理',
    pk: 'roleUserId',
    columns: [[{field: 'roleUserId', title: '角色用户ID', width: 50, hidden: true,}, {
        field: 'roleId',
        title: '角色ID',
        width: 50,
    }, {field: 'userId', title: '用户ID', width: 50,}, {
        field: 'createTime',
        title: '创建时间',
        width: 50,
        formatter: dateFormatter,
    },]],
    api: {save: '/roleUser/save', delete: '/roleUser/delete', update: '/roleUser/update', query: '/roleUser/query'}
});
$(function () {
    roleUserManager.initTable();
}); </script>