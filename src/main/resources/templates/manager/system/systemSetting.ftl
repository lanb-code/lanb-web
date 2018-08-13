<table id="systemSettingDg" style="width:98%;height:100%"></table>
<div id="systemSettingToolbar" style="padding: 5px;"><a href="javascript:void(0)" class="easyui-linkbutton"
                                                        iconCls="icon-add" plain="true"
                                                        onclick="systemSetting.new()">新增</a> <a
        href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
        onclick="systemSetting.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton"
                                                 iconCls="icon-remove" plain="true"
                                                 onclick="systemSetting.destroy()">删除</a></div>
<div id="systemSettingDlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#systemSettingDlgButtons'">
    <form id="systemSettingFm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div hidden style="margin-bottom:10px"><input name="systemId" class="easyui-textbox" label="系统ID:"
                                                      style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="systemName" class="easyui-textbox" label="系统名称:"
                                               style="width:100%"></div>
        <div style="margin-bottom:10px"><input name="lastDate" class="easyui-datetimebox" label="更新时间:"
                                               style="width:100%"></div>
    </form>
</div>
<div id="systemSettingDlgButtons"><a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                     onclick="systemSetting.save()" style="width:90px">保存</a> <a
        href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
        onclick="javascript:$('#systemSettingDlg').dialog('close')" style="width:90px">取消</a></div>
<script type="text/javascript"> var systemSetting = datagrid({
    menuName: 'systemSetting',
    menuTitle: '系统设置',
    pk: 'systemId',
    columns: [[{field: 'systemId', title: '系统ID', width: 50, hidden: true,}, {
        field: 'systemName',
        title: '系统名称',
        width: 50,
    }, {field: 'lastDate', title: '更新时间', width: 50, formatter: dateFormatter,},]],
    api: {save: '/system/save', delete: '/system/delete', update: '/system/update', query: '/system/query'}
});
$(function () {
    systemSetting.initTable();
}); </script>