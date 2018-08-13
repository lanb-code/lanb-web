<table id="userManagerDg" style="width:98%;height:100%"></table>
<div id="userManagerToolbar" style="padding: 5px;"><a href="javascript:void(0)" class="easyui-linkbutton"
                                                      iconCls="icon-add" plain="true" onclick="userManager.new()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="userManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove"
                                              plain="true" onclick="userManager.destroy()">删除</a></div>
<div id="userManagerDlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#userManagerDlgButtons'">
    <form id="userManagerFm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div hidden style="margin-bottom:10px"><input name="userId" class="easyui-textbox" label="用户ID:"
                                                      style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="userName" class="easyui-textbox" label="用户名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px"><input name="password" class="easyui-textbox" label="密码:" style="width:100%">
        </div>
        <div style="margin-bottom:10px"><input name="createDate" class="easyui-datetimebox" label="创建时间:"
                                               style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="lastDate" class="easyui-datetimebox" label="最后修改:"
                                               style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="tryCount" class="easyui-textbox" label="尝试登录次数:"
                                               style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="enable" class="easyui-textbox" label="是否可用:"
                                               style="width:100%"></div>
    </form>
</div>
<div id="userManagerDlgButtons"><a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                   onclick="userManager.save()" style="width:90px">保存</a> <a href="javascript:void(0)"
                                                                                             class="easyui-linkbutton"
                                                                                             iconCls="icon-cancel"
                                                                                             onclick="javascript:$('#userManagerDlg').dialog('close')"
                                                                                             style="width:90px">取消</a>
</div>
<script type="text/javascript"> var userManager = datagrid({
    menuName: 'userManager',
    menuTitle: '会员管理',
    pk: 'userId',
    columns: [[{field: 'userId', title: '用户ID', width: 50, hidden: true,}, {
        field: 'userName',
        title: '用户名',
        width: 50,
    }, {field: 'password', title: '密码', width: 50,}, {
        field: 'createDate',
        title: '创建时间',
        width: 50,
        formatter: dateFormatter,
    }, {field: 'lastDate', title: '最后修改', width: 50, formatter: dateFormatter,}, {
        field: 'tryCount',
        title: '尝试登录次数',
        width: 50,
    }, {field: 'enable', title: '是否可用', width: 50}]],
    api: {save: '/user/save', delete: '/user/delete', update: '/user/update', query: '/user/query'}
});
$(function () {
    userManager.initTable();
}); </script>