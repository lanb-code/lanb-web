<table id="codeTypeManagerDg" style="width:98%;height:100%"></table>
<div id="codeTypeManagerToolbar" style="padding: 5px;"><a href="javascript:void(0)" class="easyui-linkbutton"
                                                          iconCls="icon-add" plain="true"
                                                          onclick="codeTypeManager.new()">新增</a> <a
        href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
        onclick="codeTypeManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton"
                                                   iconCls="icon-remove" plain="true"
                                                   onclick="codeTypeManager.destroy()">删除</a></div>
<div id="codeTypeManagerDlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#codeTypeManagerDlgButtons'">
    <form id="codeTypeManagerFm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div hidden style="margin-bottom:10px"><input name="codeTypeId" class="easyui-textbox" label="代码类型ID:"
                                                      style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="codeTypeName" class="easyui-textbox" label="代码类型名:"
                                               style="width:100%"></div>
    </form>
</div>
<div id="codeTypeManagerDlgButtons"><a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                       onclick="codeTypeManager.save()" style="width:90px">保存</a> <a
        href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
        onclick="javascript:$('#codeTypeManagerDlg').dialog('close')" style="width:90px">取消</a></div>
<script type="text/javascript"> var codeTypeManager = datagrid({
    menuName: 'codeTypeManager',
    menuTitle: '代码类别设置',
    pk: 'codeTypeId',
    columns: [[{field: 'codeTypeId', title: '代码类型ID', width: 50, hidden: true,}, {
        field: 'codeTypeName',
        title: '代码类型名',
        width: 50,
    },]],
    api: {save: '/codeType/save', delete: '/codeType/delete', update: '/codeType/update', query: '/codeType/query'}
});
$(function () {
    codeTypeManager.initTable();
}); </script>