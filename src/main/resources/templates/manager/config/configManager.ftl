<table id="configManagerDg" style="width:98%;height:100%"></table> <div id="configManagerToolbar" style="padding: 5px;"> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="configManager.new()">新增</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="configManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="configManager.destroy()">删除</a> </div> <div id="configManagerDlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#configManagerDlgButtons'"> <form id="configManagerFm" method="post" novalidate style="margin:0;padding:20px 50px"> <div hidden style="margin-bottom:10px"> <input name="configId" class="easyui-textbox" label="配置ID:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="configName" class="easyui-textbox" label="配置名:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="configValue" class="easyui-textbox" label="配置值:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="sortNo" class="easyui-textbox" label="排序:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="createDate" class="easyui-datetimebox" label="创建时间:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="remark" class="easyui-textbox" label="备注:" style="width:100%"> </div> </form> </div> <div id="configManagerDlgButtons"> <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="configManager.save()" style="width:90px">保存</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#configManagerDlg').dialog('close')" style="width:90px">取消</a> </div> <script type="text/javascript"> var configManager = datagrid({ menuName: 'configManager', menuTitle: '系统设置', pk: 'configId', columns: [[ { field: 'configId', title: '配置ID', width: 50, hidden: true, }, { field: 'configName', title: '配置名', width: 50, }, { field: 'configValue', title: '配置值', width: 50, }, { field: 'sortNo', title: '排序', width: 50, }, { field: 'createDate', title: '创建时间', width: 50, formatter: dateFormatter, }, { field: 'remark', title: '备注', width: 50, }, ]], api: { save: '/config/save', delete: '/config/delete', update: '/config/update', query: '/config/query' } }); $(function () { configManager.initTable(); }); </script>