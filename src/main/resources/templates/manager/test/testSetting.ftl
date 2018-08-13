<table id="testSettingDg" style="width:98%;height:100%"></table>
<div id="testSettingToolbar" style="padding: 5px;"><a href="javascript:void(0)" class="easyui-linkbutton"
                                                      iconCls="icon-add" plain="true" onclick="testSetting.new()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="testSetting.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove"
                                              plain="true" onclick="testSetting.destroy()">删除</a></div>
<div id="testSettingDlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#testSettingDlgButtons'">
    <form id="testSettingFm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div hidden style="margin-bottom:10px"><input name="testId" class="easyui-textbox" label="测试ID:"
                                                      style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="testName" class="easyui-textbox" label="测试名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px"><input name="createTime" class="easyui-datetimebox" label="创建时间:"
                                               style="width:100%"></div>
    </form>
</div>
<div id="testSettingDlgButtons"><a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                   onclick="testSetting.save()" style="width:90px">保存</a> <a href="javascript:void(0)"
                                                                                             class="easyui-linkbutton"
                                                                                             iconCls="icon-cancel"
                                                                                             onclick="javascript:$('#testSettingDlg').dialog('close')"
                                                                                             style="width:90px">取消</a>
</div>
<script type="text/javascript"> var testSetting = datagrid({
    menuName: 'testSetting',
    menuTitle: '测试设置',
    pk: 'testId',
    columns: [[{field: 'testId', title: '测试ID', width: 50, hidden: true}, {
        field: 'testName',
        title: '测试名',
        width: 50
    }, {field: 'createTime', title: '创建时间', width: 50, formatter: dateFormatter}]],
    api: {save: '/test/save', delete: '/test/delete', update: '/test/update', query: '/test/query'}
});
$(function () {
    testSetting.initTable();
}); </script>