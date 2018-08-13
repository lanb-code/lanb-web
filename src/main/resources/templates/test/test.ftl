<table id="clientMgr1Dg" style="width:90%;height:400px"></table>
<div id="clientMgr1Toolbar" style="padding: 5px;">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="clientMgr1.new()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="clientMgr1.edit()">编辑</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="clientMgr1.destroy()">删除</a>
</div>
<div id="clientMgr1Dlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#clientMgr1DlgButtons'">
    <form id="clientMgr1Fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <div hidden style="margin-bottom:10px">
            <input name="clientId" class="easyui-textbox" label="客户ID:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="clientName" class="easyui-textbox" label="客户名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="createDate" class="easyui-datetimebox" label="创建时间:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="lastDate" class="easyui-datetimebox" label="最后修改:" style="width:100%">
        </div>
    </form>
</div>
<div id="clientMgr1DlgButtons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="clientMgr1.save()" style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#clientMgr1Dlg').dialog('close')"
       style="width:90px">取消</a>
</div>
<script type="text/javascript"> var clientMgr1 = {
    initTable: function () {
        var self = this;
        $('#clientMgr1Dg').datagrid({
            url: "/client/queryPage",
            toolbar: "#clientMgr1Toolbar",
            pagination: true,
            rownumbers: true,
            fitColumns: true,
            singleSelect: true,
            title: "客户管理",
            border: true,
            columns: [[{field: 'clientId', title: '客户ID', width: 50, hidden: true,}, {
                field: 'clientName',
                title: '客户名',
                width: 50,
            }, {field: 'createDate', title: '创建时间', width: 50, formatter: dateFormatter,}, {
                field: 'lastDate',
                title: '最后修改',
                width: 50,
                formatter: dateFormatter,
            },]],
            onDblClickRow: function (index, row) {
                self.edit();
            }
        });
    }, new: function () {
        var row = $('#clientMgr1Dg').datagrid('getSelected');
        $('#clientMgr1Dlg').dialog('open').dialog('center').dialog('setTitle', '客户管理新增');
        $('#clientMgr1Fm').form('clear');
        clientMgr1.url = '/client/save';
    }, edit: function () {
        var row = $('#clientMgr1Dg').datagrid('getSelected');
        if (row) {
            $('#clientMgr1Dlg').dialog('open').dialog('center').dialog('setTitle', '客户管理编辑');
            $('#clientMgr1Fm').form('load', row);
            clientMgr1.url = '/client/update';
        }
    }, save: function () {
        $('#clientMgr1Fm').form('submit', {
            url: clientMgr1.url, onSubmit: function () {
                return $(this).form('validate');
            }, success: function (result) {
                var result = eval('(' + result + ')');
                if (result.errorMsg) {
                    $.messager.show({title: '错误', msg: result.errorMsg});
                } else {
                    $('#clientMgr1Dlg').dialog('close');
                    $('#clientMgr1Dg').datagrid('reload');
                    $.messager.show({title: '信息', msg: "操作成功"});
                }
            }
        });
    }, destroy: function () {
        var row = $('#clientMgr1Dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', '确认要删除该项?', function (r) {
                if (r) {
                    $.post('/client/delete', {clientId: row.clientId}, function (result) {
                        if (result.success) {
                            $('#clientMgr1Dg').datagrid('reload');
                            $.messager.show({title: '信息', msg: "操作成功"});
                        } else {
                            $.messager.show({title: '错误', msg: result.errorMsg});
                        }
                    }, 'json');
                }
            });
        }
    }
};
$(function () {
    clientMgr1.initTable();
}); </script>